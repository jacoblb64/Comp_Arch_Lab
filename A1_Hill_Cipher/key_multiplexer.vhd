-- Author			: Jacob Barnett
-- Creation Date	: 18/1/2015
-- Last Revision	: 24/1/2015

-- Key Multiplexer
-- This is a simple supporting module to choose between two keys based on a
-- select line. In this case, the two choices are the encryption and
-- decryption keys. The select line chooses whether the operation to be peformed
-- is encrypting or decrypting.

library ieee;
use ieee.std_logic_1164.all; -- allows use of the std_logic_vector type
use ieee.std_logic_arith.all;
use ieee.std_logic_unsigned.all;

entity key_multiplexer is
  port (		-- encrypt key
  				ek11, ek12, ek13,
				ek21, ek22, ek23,
				ek31, ek32, ek33,

				-- decrypt key
				dk11, dk12, dk13,
				dk21, dk22, dk23,
				dk31, dk32, dk33		: in	std_logic_vector(3 downto 0);

				-- encryption or decryption select line
				encrypt,

				-- system clock
				clk						: in	std_logic;

				-- output key
				ok11, ok12, ok13,
				ok21, ok22, ok23,
				ok31, ok32, ok33		: out	std_logic_vector(3 downto 0)
  ) ;
end entity ; -- key_multiplexer

architecture arch of key_multiplexer is

begin

	mux : process(clk) begin
		if(rising_edge(clk)) then

			case encrypt is
				when '1' => -- output is encrypt key
					ok11	<=		ek11;
					ok12	<=		ek12;
					ok13	<=		ek13;
					ok21	<=		ek21;
					ok22	<=		ek22;
					ok23	<=		ek23;
					ok31	<=		ek31;
					ok32	<=		ek32;
					ok33	<=		ek33;
				when '0' => -- output is decrypt key
					ok11	<=		dk11;
					ok12	<=		dk12;
					ok13	<=		dk13;
					ok21	<=		dk21;
					ok22	<=		dk22;
					ok23	<=		dk23;
					ok31	<=		dk31;
					ok32	<=		dk32;
					ok33	<=		dk33;	
			end case;
		end if;
	end process;

end architecture ; -- arch