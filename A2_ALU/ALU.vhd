library ieee;
use ieee.std_logic_1164.all; -- allows use of the std_logic_vector type
--use ieee.std_logic_arith.all;
--use ieee.std_logic_unsigned.all;
use ieee.numeric_std.all;

entity ALU is
	generic (
		-- width of all data lines
		data_width		:		integer := 16
	) ;
	port (
		-- instructs ALU on which operation to be performed
		opcode			:	in unsigned(3 downto 0);

		-- first and second input operands
		data0, data1	:	in	signed(data_width-1 downto 0)

		-- reset and clock lines
		reset, clock	:	in	std_logic;

		-- result of operation
		data_out			:	out signed(data_width-1 downto 0);

		-- status information from last operation
		status			:	out unsigned(3 downto 0)
	) ;
end entity ; -- ALU

architecture arch of ALU is



begin



end architecture ; -- arch