----------------------------------------------------------------------
-- Author			: Jacob Barnett
-- Creation Date	: 30/01/2015
-- Last Revision	: 

-- ALU (Arithmetic Logic Unit)
-- Performs  all basic arithmetic and logical operations.

-- Op code table:
	-- Arithmetic Operations
	-- addition						|	0000
	-- subtraction					|	0001
	
	-- Boolean Operations
	-- not							|	1000
	-- and 							|	1001
	-- nand 							|	1010
	-- or								|	1011
	-- nor							|	1100
	-- xor							|	1101
	-- xnor							|	1110
	
	-- Shifting Operations
	-- arithmetic shift left	|	0100
	-- arithmeticshift right	|	0101
	-- logical shift left		|	0110
	-- logical shift right		|	0111

-- Status code bits (in order from MSB to LSB):
-- CZNOP
	-- Carry-out
	-- Zero
	-- Negative
	-- Overflow
	-- Parity

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
		status			:	out unsigned(4 downto 0)
	) ;
end entity ; -- ALU

architecture arch of ALU is

-- Constant Declarations

	-- Arithmetic Operations
	constant ADD_OP	:	unsigned(3 downto 0) := "0000";
	constant SUB_OP	:	unsigned(3 downto 0) := "0001";

	-- Boolean Operations
	constant NOT_OP	:	unsigned(3 downto 0) := "1000";
	constant AND_OP	:	unsigned(3 downto 0) := "1001";
	constant NAND_OP	:	unsigned(3 downto 0) := "1010";
	constant OR_OP		:	unsigned(3 downto 0) := "1011";
	constant NOR_OP	:	unsigned(3 downto 0) := "1100";
	constant XOR_OP	:	unsigned(3 downto 0) := "1101";
	constant XNOR_OP	:	unsigned(3 downto 0) := "1110";

	-- Shifting Operations
	constant SLA_OP	:	unsigned(3 downto 0) := "0100";
	constant SRA_OP	:	unsigned(3 downto 0) := "0101";
	constant SLL_OP	:	unsigned(3 downto 0) := "0110";
	constant SRL_OP	:	unsigned(3 downto 0) := "0111";


-- Internal signals for latching
	signal opcode_r	:	unsigned(3 downto 0);

	signal status_r 	:	unsigned(4 downto 0);

	signal input_a,
			 input_b,
			 result		: signed(data_width downto 0);
			 
	signal temp			: unsigned(data_width downto 0);
	
begin

-- Latching Values

	latch : process( clock )
	begin
		if (rising_edge(clock)) then

			opcode_r	 <= opcode;
			input_a	 <= resize(data0, data_width+1);
			input_b	 <= resize(data1, data_width+1);

			data_out	 <= resize(result, data_width);
			status	 <= status_r;

		end if ;
	end process ; -- latch


-- Main Process Block

	operation : process( reset, clock, opcode_r )
	begin
		if (reset = '1') then

			result <= to_signed(0, data_width+1);
			status_r <= to_unsigned(0, 5);

		elsif (rising_edge(clock)) then

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
					result <= to_signed(0, data_width+1);
					status_r <= to_unsigned(0, 5);

			end case ;

		-- Assigning status bits based on operation category
			if (opcode_r(3) = '0') then -- arithmetic or boolean
				if (opcode_r(2) = '0') then -- arithmetic

					--if (opcode_r then
						
					--end if ;
					
				
				else -- shifting

					status_r(4) <= result(data_width);
				end if ;

			else -- boolean

			end if ;

			-- if all the bits are zero, set the zero flag
			if (to_integer(result) = 0) then
				status_r(3) <= '1';
			end if ;


		end if ;
		
	end process ; -- operation


		-- determine parity
		temp(0) <= result(0);
		gen : for i in 1 to data_width generate
			temp(i) <= temp(i-1) XOR result(0);
		end generate ; -- parity
		status_r(0) <= temp(data_width);

end architecture ; -- arch