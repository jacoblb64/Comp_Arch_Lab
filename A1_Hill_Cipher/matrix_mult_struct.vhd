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
				k31, k32, k33			: in 	std_logic_vector(3 downto 0);

				clk						: in std_logic;

				c1, c2, c3				: out std_logic_vector(3 downto 0)
	);
	
end matrix_mult_struct;

architecture struct of matrix_mult_struct is

	component matrix_sub_mult is
		port(		p1, p2, p3,
					k1x, k2x, k3x		: in 	std_logic_vector(3 downto 0);

					cx						: out std_logic_vector(3 downto 0)
		);
	end component;
	
	signal p1r, p2r, p3r 			: std_logic_vector(3 downto 0);
	signal c1r, c2r, c3r 			: std_logic_vector(3 downto 0); 

begin

	col1 : matrix_sub_mult
		port map(
			p1		=>		p1r,
			p2		=>		p2r,
			p3		=>		p3r,
			
			k1x	=>		k11,
			k2x	=>		k21,
			k3x	=>		k31,
						
			cx		=>		c1r
		);

	col2 : matrix_sub_mult
		port map(
			p1		=>		p1r,
			p2		=>		p2r,
			p3		=>		p3r,
			
			k1x	=>		k12,
			k2x	=>		k22,
			k3x	=>		k32,
						
			cx		=>		c2r
		);

	col3 : matrix_sub_mult
		port map(
			p1		=>		p1r,
			p2		=>		p2r,
			p3		=>		p3r,
			
			k1x	=>		k13,
			k2x	=>		k23,
			k3x	=>		k33,
						
			cx		=>		c3r
		);
		
	
	lpm_ff_p1 : lpm_ff
		GENERIC MAP (
			lpm_width => 4,
			lpm_fftype => "DFF"
			)
		PORT MAP (
			data => p1,
			clock  => clk,
			q => p1r
			);
						
	lpm_ff_p2 : lpm_ff
		GENERIC MAP (
			lpm_width => 4,
			lpm_fftype => "DFF"
			)
		PORT MAP (
			data => p2,
			clock => clk,
			q => p2r
			);

	lpm_ff_p3 : lpm_ff
		GENERIC MAP (
			lpm_width => 4,
			lpm_fftype => "DFF"
			)
		PORT MAP (
			data => p3,
			clock => clk,
			q => p3r
			);


	lpm_ff_c1 : lpm_ff
		GENERIC MAP (
			lpm_width => 4,
			lpm_fftype => "DFF"
			)
		PORT MAP (
			data => c1r (3 downto 0),
			clock => clk,
			q => c1
			);

	lpm_ff_c2 : lpm_ff
		GENERIC MAP (
			lpm_width => 4,
			lpm_fftype => "DFF"
			)
		PORT MAP (
			data => c2r (3 downto 0),
			clock => clk,
			q => c2
			);

	lpm_ff_c3 : lpm_ff
		GENERIC MAP (
			lpm_width => 4,
			lpm_fftype => "DFF"
			)
		PORT MAP (
			data => c3r (3 downto 0),
			clock => clk,
			q => c3
			);

end struct;