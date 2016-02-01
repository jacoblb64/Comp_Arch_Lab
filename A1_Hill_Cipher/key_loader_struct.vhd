-- Author			: Jacob Barnett
-- Creation Date	: 11/2/2015
-- Last Revision	: 24/1/2015

-- Key Loader (Structural Implementation)
-- This is identical in functionality to the behavioral implementation of the
-- key loader. Instead of a behavioral description, the operations are
-- implemented using lpm components.

-- In addition, this version of the key loader loads in a cascading fashion,
-- meaning that the first column is loaded first, and the values shift over
-- accordingly.

library ieee;
use ieee.std_logic_1164.all; -- allows use of the std_logic_vector type
use ieee.std_logic_arith.all;
use ieee.std_logic_unsigned.all;
use ieee.numeric_std.all;

library lpm;
use lpm.lpm_components.all;

entity key_loader_struct is
	port(		p1, p2, p3		: in 	std_logic_vector(3 downto 0);
	
				load_key, clk	: in 	std_logic;
				
				k11, k12, k13,
				k21, k22, k23,
				k31, k32, k33	: out std_logic_vector(3 downto 0)
	);
	
end key_loader_struct;

architecture struct of key_loader_struct is

	-- k registers, to be used when shifting in values
	signal	k11r, k12r, k13r,
				k21r, k22r, k23r,
				k31r, k32r, k33r	: std_logic_vector(3 downto 0);

begin

	-- column 3
	lpm_ff_k13 : lpm_ff
		GENERIC MAP (
			lpm_width => 4,
			lpm_fftype => "DFF"
			)
		PORT MAP (
			data => p1,
			clock => clk,
			enable => load_key,
			q => k13r
			);

	lpm_ff_k23 : lpm_ff
		GENERIC MAP (
			lpm_width => 4,
			lpm_fftype => "DFF"
			)
		PORT MAP (
			data => p2,
			clock => clk,
			enable => load_key,
			q => k23r
			);

	lpm_ff_k33 : lpm_ff
		GENERIC MAP (
			lpm_width => 4,
			lpm_fftype => "DFF"
			)
		PORT MAP (
			data => p3,
			clock => clk,
			enable => load_key,
			q => k33r
			);

	-- column 2
	lpm_ff_k12 : lpm_ff
		GENERIC MAP (
			lpm_width => 4,
			lpm_fftype => "DFF"
			)
		PORT MAP (
			data => k13r,
			clock => clk,
			enable => load_key,
			q => k12r
			);

	lpm_ff_k22 : lpm_ff
		GENERIC MAP (
			lpm_width => 4,
			lpm_fftype => "DFF"
			)
		PORT MAP (
			data => k23r,
			clock => clk,
			enable => load_key,
			q => k22r
			);

	lpm_ff_k32 : lpm_ff
		GENERIC MAP (
			lpm_width => 4,
			lpm_fftype => "DFF"
			)
		PORT MAP (
			data => k33r,
			clock => clk,
			enable => load_key,
			q => k32r
			);

	-- column 1
	lpm_ff_k11 : lpm_ff
		GENERIC MAP (
			lpm_width => 4,
			lpm_fftype => "DFF"
			)
		PORT MAP (
			data => k12r,
			clock => clk,
			enable => load_key,
			q => k11r
			);

	lpm_ff_k21 : lpm_ff
		GENERIC MAP (
			lpm_width => 4,
			lpm_fftype => "DFF"
			)
		PORT MAP (
			data => k22r,
			clock => clk,
			enable => load_key,
			q => k21r
			);

	lpm_ff_k31 : lpm_ff
		GENERIC MAP (
			lpm_width => 4,
			lpm_fftype => "DFF"
			)
		PORT MAP (
			data => k32r,
			clock => clk,
			enable => load_key,
			q => k31r
			);
			
	-- connecting registers to output lines
	k11 <= k11r;
	k12 <= k12r;
	k13 <= k13r;

	k21 <= k21r;
	k22 <= k22r;
	k23 <= k23r;

	k31 <= k31r;
	k32 <= k32r;
	k33 <= k33r;

end struct;