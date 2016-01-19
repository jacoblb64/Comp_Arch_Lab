library ieee;
use ieee.std_logic_1164.all; -- allows use of the std_logic_vector type
use ieee.std_logic_arith.all;
use ieee.std_logic_unsigned.all;

library lpm;
use lpm.lpm_components.all;

entity hill_cipher is
  port (	p1, p2, p3		: in	std_logic_vector(3 downto 0);
  			
  			clk, load_key,
  			encrypt			: in	std_logic;

  			c1, c2, c3		: out	std_logic_vector(3 downto 0)
  ) ;
end entity ; -- hill_cipher

architecture arch of hill_cipher is

	-- key loader
	component key_loader is
		port(		p1, p2, p3		: in 	std_logic_vector(3 downto 0);
		
					load_key, clk	: in 	std_logic;
					
					k11, k12, k13,
					k21, k22, k23,
					k31, k32, k33	: out std_logic_vector(3 downto 0)
		);		
	end component;

	-- key inverter
	component key_inverter is

	end component;

	-- multiplexer for keys
	component key_multiplexer is
	   port (		ek11, ek12, ek13,
					ek21, ek22, ek23,
					ek31, ek32, ek33,

					dk11, dk12, dk13,
					dk21, dk22, dk23,
					dk31, dk32, dk33,		: in	std_logic_vector(3 downto 0);

					encrypt, clk			: in	std_logic;

					ok11, ok12, ok13,
					ok21, ok22, ok23,
					ok31, ok32, ok33,		: out	std_logic_vector(3 downto 0)
	   );
	end component;

	-- matrix multiplier
	component matrix_multiplier is
		port(		p1, p2, p3,
					k11, k12, k13,
					k21, k22, k23,
					k31, k32, k33		: in 	std_logic_vector(3 downto 0);

					clk					: in std_logic;

					c1, c2, c3			: out std_logic_vector(3 downto 0)
		);	
	end component;

	signal 	encryptr				: std_logic;
	signal 	ek11, ek12, ek13,
				ek21, ek22, ek23,
				ek31, ek32, ek33,

				dk11, dk12, dk13,
				dk21, dk22, dk23,
				dk31, dk32, dk33,

				sk11, sk12, sk13,
				sk21, sk22, sk23,
				sk31, sk32, sk33,	: std_logic_vector(3 downto 0);

begin

	-- store the encrypt signal into a register
	mux_reg : process(clk) begin
		if(rising_edge(clk)) then

			encryptr <= encrypt;

		end if;
	end process;

	-- load key
	load_key : key_loader
		port map(
			p1			=>		p1,
			p2			=>		p2,
			p3			=>		p3,

			load_key	=>		load_key,
			clk		=>		clk,

			k11		=>		ek11,
			k12		=>		ek12,
			k13		=>		ek13,
			k21		=>		ek21,
			k22		=>		ek22,
			k23		=>		ek23,
			k31		=>		ek31,
			k32		=>		ek32,
			k33		=>		ek33
		);

	-- key inverter
	invert_key : key_inverter
		port map(
			ek11		=>		ek11,
			ek12		=>		ek12,
			ek13		=>		ek13,
			ek21		=>		ek21,
			ek22		=>		ek22,
			ek23		=>		ek23,
			ek31		=>		ek31,
			ek32		=>		ek32,
			ek33		=>		ek33,

			clk		=>		clk,

			dk11		=>		dk11,
			dk12		=>		dk12,
			dk13		=>		dk13,
			dk21		=>		dk21,
			dk22		=>		dk22,
			dk23		=>		dk23,
			dk31		=>		dk31,
			dk32		=>		dk32,
			dk33		=>		dk33
		);

	-- multiplex
	key_mult : key_multiplexer
		port map(
			ek11		=>		ek11,
			ek12		=>		ek12,
			ek13		=>		ek13,
			ek21		=>		ek21,
			ek22		=>		ek22,
			ek23		=>		ek23,
			ek31		=>		ek31,
			ek32		=>		ek32,
			ek33		=>		ek33,

			clk		=>		clk,

			dk11		=>		dk11,
			dk12		=>		dk12,
			dk13		=>		dk13,
			dk21		=>		dk21,
			dk22		=>		dk22,
			dk23		=>		dk23,
			dk31		=>		dk31,
			dk32		=>		dk32,
			dk33		=>		dk33,

			ok11		=>		sk11,
			ok12		=>		sk12,
			ok13		=>		sk13,
			ok21		=>		sk21,
			ok22		=>		sk22,
			ok23		=>		sk23,
			ok31		=>		sk31,
			ok32		=>		sk32,
			ok33		=>		sk33
		);

	-- multiply
	m_mult : matrix_multiplier
		port map(
			p1			=>		p1,
			p2			=>		p2,
			p3			=>		p3,

			k11		=>		sk11,
			k12		=>		sk12,
			k13		=>		sk13,
			k21		=>		sk21,
			k22		=>		sk22,
			k23		=>		sk23,
			k31		=>		sk31,
			k32		=>		sk32,
			k33		=>		sk33,

			clk		=>		clk,

			c1			=>		c1,
			c2			=>		c2,
			c3			=>		c3
		);

end architecture ; -- arch