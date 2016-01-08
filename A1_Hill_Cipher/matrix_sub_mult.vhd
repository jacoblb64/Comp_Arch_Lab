library ieee;
use ieee.std_logic_1164.all; -- allows use of the std_logic_vector type
use ieee.std_logic_arith.all;
use ieee.std_logic_unsigned.all;

library lpm;
use lpm.lpm_components.all;

entity matrix_sub_mult is
	port(		p1, p2, p3,
				k1x, k2x, k3x		: in 	std_logic_vector(3 downto 0);

				clk					: in std_logic;

				cx						: out std_logic_vector(3 downto 0)
	);
	
end matrix_sub_mult;

architecture struct of matrix_sub_mult is

	signal p1r, p2r, p3r			: std_logic_vector(3 downto 0);
	signal cxr, addr, mult1r,
			 mult2r, mult3r		: std_logic_vector(7 downto 0);

begin


	lpm_mult_1 : lpm_mult
		GENERIC MAP (
			lpm_widtha => 4,
			lpm_widthb => 4,
			lpm_type => "LPM_MULT",
			lpm_widthp => 8
			)
		PORT MAP (
			dataa => p1r,
			datab => k1x,
			clock => clk,
			result => mult1r
			);

	lpm_mult_2 : lpm_mult
		GENERIC MAP (
			lpm_widtha => 4,
			lpm_widthb => 4,
			lpm_type => "LPM_MULT",
			lpm_widthp => 8
			)
		PORT MAP (
			dataa => p2r,
			datab => k2x,
			clock => clk,
			result => mult2r
			);

	lpm_mult_3 : lpm_mult
		GENERIC MAP (
			lpm_widtha => 4,
			lpm_widthb => 4,
			lpm_type => "LPM_MULT",
			lpm_widthp => 8
			)
		PORT MAP (
			dataa => p3r,
			datab => k3x,
			clock => clk,
			result => mult3r
			);
			

	lpm_add_1 : lpm_add_sub
		GENERIC MAP (
			lpm_width => 4,
			lpm_direction => "ADD",
			lpm_representation => "UNSIGNED",
			lpm_type => "LPM_ADD_SUB"
			)
		PORT MAP (
			dataa => mult1r,
			datab => mult2r,
			clock => clk,
			result => addr
			);

	lpm_add_2 : lpm_add_sub
		GENERIC MAP (
			lpm_width => 4,
			lpm_direction => "ADD",
			lpm_representation => "UNSIGNED",
			lpm_type => "LPM_ADD_SUB"
			)
		PORT MAP (
			dataa => addr,
			datab => mult3r,
			clock => clk,
			result => cxr
			);
			

	lpm_ff_p1 : lpm_ff
		GENERIC MAP (
			lpm_width => 4,
			lpm_fftype => "DFF"
			)
		PORT MAP (
			data => p1,
			clock => clk,
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

	lpm_ff_cx : lpm_ff
		GENERIC MAP (
			lpm_width => 4,
			lpm_fftype => "DFF"
			)
		PORT MAP (
			data => cxr (3 downto 0),
			clock => clk,
			q => cx
			);

end struct;