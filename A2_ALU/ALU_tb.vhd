----------------------------------------------------------------------
-- Author			: Jacob Barnett
-- Creation Date	: 01/02/2015
-- Last Revision	: 

-- ALU Testbench
-- Used for testing the proper operation of the ALU

----------------------------------------------------------------------


library ieee;
use ieee.std_logic_1164.all; -- allows use of the std_logic_vector type
--use ieee.std_logic_arith.all;
--use ieee.std_logic_unsigned.all;
use ieee.numeric_std.all;

entity ALU_tb is
end entity ; -- ALU_tb

architecture arch of ALU_tb is
	
	component ALU is
		generic (
			-- width of all data lines
			data_width		:		integer := 16
		) ;
		port (
			-- instructs ALU on which operation to be performed
			opcode			:	in unsigned(3 downto 0);

			-- first and second input operands
			data0, data1	:	in	signed(data_width-1 downto 0);

			-- reset and clock lines
			reset, clock	:	in	std_logic;

			-- result of operation
			data_out			:	out signed(data_width-1 downto 0);

			-- status information from last operation
			status			:	out unsigned(3 downto 0)
		) ;
	end component ; -- ALU

	-- define I/O signals
	signal	clock,
				reset			: std_logic := '0';

	signal 	data0,
				data1,
				data_out		: signed(15 downto 0);

	signal 	opcode,
				status		: unsigned(3 downto 0);

	constant clk_period	: time := 10 ns;

begin

-- instantate unit under test
	uut : ALU
		generic map (
			data_width => 16
		)
		port map (
			clock		=>		clock,
			reset		=>		reset,
			data0		=>		data0,
			data1		=>		data1,
			data_out =>		data_out,
			opcode 	=>		opcode,
			status 	=>		status
		) ;


-- toggle the clock
	clock_toggle : process
	begin
		clock <= NOT clock;
		wait for clk_period / 2;	
	end process ; -- clock_toggle


-- add testing stimulus
	stimulus : process
	begin
		
	-- test reset signal
		report "reset high";
		reset <= '1';
		wait for 2*clk_period;
		assert (data_out = to_signed(0, 16))
			report "error resetting"
			severity ERROR;

		report "reset low";
		reset <= '0';
		wait for 2*clk_period;
		assert (data_out = to_signed(0, 16))
			report "error resetting"
			severity ERROR;

	-- test addition functionality
		report "test add 1 + 1 = 2";
		data0 <= x"0001";
		data1 <= x"0001";
		opcode <= "0000";
		wait for 4*clk_period;
		assert (data_out = x"0002")
			report "error adding"
			severity ERROR;

		report "test add 16 + 1 = 17";
		data0 <= x"0010";
		data1 <= x"0001";
		opcode <= "0000";
		wait for 4*clk_period;		
		assert (data_out = x"0011")
			report "error adding"
			severity ERROR;

		report "test add large";
		data0 <= x"0765";
		data1 <= x"0234";
		opcode <= "0000";
		wait for 4*clk_period;		
		assert (data_out = x"0999")
			report "error adding"
			severity ERROR;

	-- test and functionality
		report "test and 5 & A = 1";
		data0 <= x"0005";
		data1 <= x"000B";
		opcode <= "0011";
		wait for 4*clk_period;
		assert (data_out = x"0001")
			report "error anding"
			severity ERROR;

		report "test add x & 1 = x";
		data0 <= x"57CD";
		data1 <= x"FFFF";
		opcode <= "0011";
		wait for 4*clk_period;		
		assert (data_out = x"57CD")
			report "error anding"
			severity ERROR;

		report "test add x & 0 = 0";
		data0 <= x"0765";
		data1 <= x"0000";
		opcode <= "0011";
		wait for 4*clk_period;		
		assert (data_out = x"0000")
			report "error anding"
			severity ERROR;

	-- test shift left logical functionality
		report "test and 5 << 2 = 14";
		data0 <= x"0005";
		data1 <= x"0002";
		opcode <= "1011";
		wait for 4*clk_period;
		assert (data_out = x"0014")
			report "error shifting left logical"
			severity ERROR;

		report "test add 23 << 4 = 230";
		data0 <= x"0023";
		data1 <= x"0004";
		opcode <= "1011";
		wait for 4*clk_period;		
		assert (data_out = x"0230")
			report "error shifting left logical"
			severity ERROR;

		report "test add x & 16 = 0";
		data0 <= x"0765";
		data1 <= x"0010";
		opcode <= "1011";
		wait for 4*clk_period;		
		assert (data_out = x"0000")
			report "error shifting left logical"
			severity ERROR;


	-- perform no further tests until end of stimulus
		wait;

	end process ; -- stimulus


end architecture ; -- arch