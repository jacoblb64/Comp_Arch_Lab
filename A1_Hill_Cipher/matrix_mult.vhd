-- Author			: Jacob Barnett
-- Creation Date	: 07/1/2015
-- Last Revision	: 24/1/2015

-- Matrix Multiplier (Behavioral Implementation)
-- This module performs matrix multiplication with a 1x3 matrix and a 3x3 matrix

-- The 1x3 matrix, or input vector is latched as it is an external input to the
-- system. On the other hand, the 3x3 key matrix is assumed to be consistent as
-- it is internal to the overall system.

-- No modifications to the initial specification were made.

library ieee;
use ieee.std_logic_1164.all; -- allows use of the std_logic_vector type
use ieee.std_logic_arith.all;
use ieee.std_logic_unsigned.all;

entity matrix_mult is
	port(		p1, p2, p3,
				k11, k12, k13,
				k21, k22, k23,
				k31, k32, k33		: in 	std_logic_vector(3 downto 0);

				clk					: in std_logic;

				c1, c2, c3			: out std_logic_vector(3 downto 0)
	);
	
end matrix_mult;

architecture behv of matrix_mult is

	-- p and c registers, to be latched
	signal p1r, p2r, p3r : std_logic_vector(3 downto 0);
	signal c1r, c2r, c3r : std_logic_vector(7 downto 0); 
	
begin
	
	-- latch values on the rising edge of the clock
	latch : process(clk) begin
		if(rising_edge(clk)) then
			p1r <= p1;
			p2r <= p2;
			p3r <= p3;
			
			c1 <= c1r(3 downto 0);
			c2 <= c2r(3 downto 0);
			c3 <= c3r(3 downto 0);
		end if;
	end process;
	
	-- calculate outputs one operation at a time
	c1r  <= (p1r * k11) + (p2r * k21) + (p3r * k31);
	c2r  <= (p1r * k12) + (p2r * k22) + (p3r * k32);
	c3r  <= (p1r * k13) + (p2r * k23) + (p3r * k33);

end behv;