library ieee;
use ieee.std_logic_1164.all; -- allows use of the std_logic_vector type
use ieee.std_logic_arith.all;
use ieee.std_logic_unsigned.all;

library lpm;
use lpm.lpm_components.all;

entity matrix_mult_struct is

	port(		p1, p2, p3,
				k11, k12, k13,
				k21, k22, k23,
				k31, k32, k33		: in 	std_logic_vector(3 downto 0);

				clk					: in std_logic;

				c1, c2, c3			: out std_logic_vector(3 downto 0)
	);
	
end matrix_mult_struct;

architecture struct of matrix_mult_struct is

	component matrix_sub_mult is
		port(		p1, p2, p3,
					k1x, k2x, k3x		: in 	std_logic_vector(3 downto 0);

					clk					: in std_logic;

					cx						: out std_logic_vector(3 downto 0)
		);
	
	end component;
	
	signal p1r, p2r, p3r : std_logic_vector(3 downto 0);
	signal c1r, c2r, c3r : std_logic_vector(3 downto 0); 

begin

	col1 : matrix_sub_mult
		port map(
			p1r	=> 	p1,
			p2r	=>		p2,
			p3r	=>		p3,
			
			k1x	=>		k11,
			k2x	=>		k21,
			k3x	=>		l31,
			
			clk	=>		clk,
			
			cx		=>		c1r
		);

end stuct;