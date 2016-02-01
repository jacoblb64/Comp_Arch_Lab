-- Author			: Jacob Barnett
-- Creation Date	: 10/1/2015
-- Last Revision	: 24/1/2015

-- Key Loader (Behavioral Implementation)
-- This module takes in and stores an encryption key into the cipher to be used
-- for future encryption and decryption until a new key is loaded

-- In an effor to minimize input pins, the key is loaded in one column at a
-- time.

-- The loading process then lasts for three cycles and is triggered by setting
-- load_key to high.

library ieee;
use ieee.std_logic_1164.all; -- allows use of the std_logic_vector type
use ieee.std_logic_arith.all;
use ieee.std_logic_unsigned.all;
use ieee.numeric_std.all;

entity key_loader is
	port(		p1, p2, p3		: in 	std_logic_vector(3 downto 0);
	
				load_key, clk	: in 	std_logic;
				
				k11, k12, k13,
				k21, k22, k23,
				k31, k32, k33	: out std_logic_vector(3 downto 0)
	);
	
end key_loader;

architecture behv of key_loader is

	-- state of the loading FSM
	signal load_fsm_state	: integer range 0 to 3 := 0;

begin

	-- finite state machine that deals with loading the key in
	load_fsm : process(clk, load_key) begin
		if(rising_edge(clk) AND load_key='1') then

			case load_fsm_state is
				when 0 => -- load first column
					k11 <= p1;
					k21 <= p2;
					k31 <= p3;
					load_fsm_state <= 1;
				when 1 => -- load second column
					k12 <= p1;
					k22 <= p2;
					k32 <= p3;
					load_fsm_state <= 2;
				when 2 => -- load third column
					k13 <= p1;
					k23 <= p2;
					k33 <= p3;
					load_fsm_state <= 3;
				when 3 => -- return to idle
					load_fsm_state <= 0;
			end case;
		
		elsif (rising_edge(clk) AND load_key='0') then
		
			load_fsm_state <= 0; -- continue at idle as long as load_key is low
			
		end if;
	end process;
	

end behv;