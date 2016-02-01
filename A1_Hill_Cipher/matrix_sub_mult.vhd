-- Author			: Jacob Barnett
-- Creation Date	: 08/1/2015
-- Last Revision	: 24/1/2015

-- Matrix Multiplier Sub-Operation
-- This is a supporting module for use in the Matrix Multiplier (Structural
-- Implementation). This operation encapsulates one calculation of the output.

library ieee;
use ieee.std_logic_1164.all; -- allows use of the std_logic_vector type
use ieee.std_logic_arith.all;
use ieee.std_logic_unsigned.all;

library lpm;
use lpm.lpm_components.all;

entity matrix_sub_mult is
	port(		p1, p2, p3,
				k1x, k2x, k3x		: in 	std_logic_vector(3 downto 0);

				cx						: out std_logic_vector(3 downto 0)
	);
	
end matrix_sub_mult;

architecture struct of matrix_sub_mult is

	-- intermediary signals connecting the various components
	signal cxr, addr, mult1r,
			 mult2r, mult3r		: std_logic_vector(7 downto 0);

begin

	-- three multiplications
	lpm_mult_1 : lpm_mult
		GENERIC MAP (
			lpm_widtha => 4,
			lpm_widthb => 4,
			lpm_type => "LPM_MULT",
			lpm_widthp => 8
			)
		PORT MAP (
			dataa => p1,
			datab => k1x,
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
			dataa => p2,
			datab => k2x,
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
			dataa => p3,
			datab => k3x,
			result => mult3r
			);
			
	-- two additions to add the three parts together
	-- follows transitivity: (a + b) + c = a + b + c
	lpm_add_1 : lpm_add_sub
		GENERIC MAP (
			lpm_width => 8,
			lpm_direction => "ADD",
			lpm_representation => "UNSIGNED",
			lpm_type => "LPM_ADD_SUB"
			)
		PORT MAP (
			dataa => mult1r,
			datab => mult2r,
			result => addr
			);

	lpm_add_2 : lpm_add_sub
		GENERIC MAP (
			lpm_width => 8,
			lpm_direction => "ADD",
			lpm_representation => "UNSIGNED",
			lpm_type => "LPM_ADD_SUB"
			)
		PORT MAP (
			dataa => addr,
			datab => mult3r,
			result => cxr
			);
			
	-- truncate and write to output
	cx <= cxr(3 downto 0);
		

end struct;