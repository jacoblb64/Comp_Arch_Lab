----------------------------------------------------------------------
-- Author			: Jacob Barnett
-- Creation Date	: 30/01/2015
-- Last Revision	: 

-- ALU (Arithmetic Logic Unit)

-- Op code table:
	-- Arithmetic Operations
	-- addition						|	0000
	-- subtraction					|	0001
	
	-- Boolean Operations
	-- not							|	0010
	-- and 							|	0011
	-- nand 							|	0100
	-- or								|	0101
	-- nor							|	0110
	-- xor							|	0111
	-- xnor							|	1000
	
	-- Shifting Operations
	-- arithmetic shift left	|	1001
	-- arithmeticshift right	|	1010
	-- logical shift left		|	1011
	-- logical shift right		|	1100

----------------------------------------------------------------------

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
		data0, data1	:	in	signed(data_width-1 downto 0);

		-- reset and clock lines
		reset, clock	:	in	std_logic;

		-- result of operation
		data_out			:	out signed(data_width-1 downto 0);

		-- status information from last operation
		status			:	out unsigned(3 downto 0)
	) ;
end entity ; -- ALU

architecture arch of ALU is

-- Constant Declarations

	-- Arithmetic Operations
	constant ADD_OP	:	unsigned(3 downto 0) := "0000";
	constant SUB_OP	:	unsigned(3 downto 0) := "0001";

	-- Boolean Operations
	constant NOT_OP	:	unsigned(3 downto 0) := "0010";
	constant AND_OP	:	unsigned(3 downto 0) := "0011";
	constant NAND_OP	:	unsigned(3 downto 0) := "0100";
	constant OR_OP		:	unsigned(3 downto 0) := "0101";
	constant NOR_OP	:	unsigned(3 downto 0) := "0110";
	constant XOR_OP	:	unsigned(3 downto 0) := "0111";
	constant XNOR_OP	:	unsigned(3 downto 0) := "1000";

	-- Shifting Operations
	constant SLA_OP	:	unsigned(3 downto 0) := "1001";
	constant SRA_OP	:	unsigned(3 downto 0) := "1010";
	constant SLL_OP	:	unsigned(3 downto 0) := "1011";
	constant SRL_OP	:	unsigned(3 downto 0) := "1100";


-- Internal signals for latching
	signal opcode_r,
			 status_r	:	unsigned(3 downto 0);

	signal input_a,
			 input_b,
			 result		: signed(data_width-1 downto 0);

begin

-- Latching Values

	latch : process( clock )
	begin
		if (rising_edge(clock)) then

			opcode_r	 <= opcode;
			input_a	 <= data0;
			input_b	 <= data1;

			data_out	 <= result;
			status	 <= status_r;

		end if ;
	end process ; -- latch


-- Main Process Block

	operation : process( reset, clock, opcode_r )
	begin
		if (reset = '1') then

			result <= to_signed(0, data_width);
			status_r <= to_unsigned(0, 4);

		elsif (rising_edge(clock)) then
			-- Output the opcode onto the status register
			status_r <= opcode_r;

			case( opcode_r ) is
			-- Arithmetic Operations
				when ADD_OP 	=>
					result	<=	input_a + input_b;
				
				when SUB_OP 	=>
					result	<= input_a - input_b;

			-- Boolean Operations
				when NOT_OP 	=>
					result	<= NOT input_a;

				when AND_OP 	=>
					result	<= input_a AND input_b;

				when NAND_OP 	=>
					result	<= input_a NAND input_b;

				when OR_OP	 	=>
					result	<= input_a OR input_b;

				when NOR_OP 	=>
					result	<= input_a NOR input_b;

				when XOR_OP 	=>
					result	<= input_a XOR input_b;

				when XNOR_OP 	=>
					result	<= input_a XNOR input_b;

			-- Shifting Operations
				when SLA_OP 	=>
					result	<= shift_left(
										input_a,
										to_integer(unsigned(input_b))
									);

				when SRA_OP 	=>
					result	<= shift_right(
										input_a,
										to_integer(unsigned(input_b))
									);

				when SLL_OP 	=>
					result	<= signed( shift_left(
										unsigned(input_a),
										to_integer(unsigned(input_b))
									) );

				when SRL_OP 	=>
					result	<= signed( shift_right(
										unsigned(input_a),
										to_integer(unsigned(input_b))
									) );

			-- Undefined Operation
				when others =>
					result <= to_signed(0, data_width);
					status_r <= to_unsigned(0, 4);

			end case ;

		end if ;
		
	end process ; -- operation

end architecture ; -- arch