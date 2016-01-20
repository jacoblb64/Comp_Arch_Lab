library ieee;
use ieee.std_logic_1164.all; -- allows use of the std_logic_vector type
use ieee.std_logic_arith.all;
use ieee.std_logic_unsigned.all;
use ieee.numeric_std.all;

library lpm;
use lpm.lpm_components.all;

entity key_inverter is
	port(		ek11, ek12, ek13,
				ek21, ek22, ek23,
				ek31, ek32, ek33		:	in		std_logic_vector(3 downto 0);

				clk						:	in 	std_logic;

				dk11, dk12, dk13,
				dk21, dk22, dk23,
				dk31, dk32, dk33		:	out	std_logic_vector(3 downto 0)
	);

end key_inverter;

architecture struct of key_inverter is

				-- for pipelining, proper registered values
	signal 	cof11, cof12, cof13,
				cof21, cof22, cof23,
				cof31, cof32, cof33,

				adj11, adj12, adj13,
				adj21, adj22, adj23,
				adj31, adj32, adj33

				det,						:			std_logic_vector(3 downto 0);

				-- for computation
	signal 	cof11r, cof12r, cof13r,
				cof21r, cof22r, cof23r,
				cof31r, cof32r, cof33r,

				adj11r, adj12r, adj13r,
				adj21r, adj22r, adj23r,
				adj31r, adj32r, adj33r

				dk11r, dk12r, dk13r,
				dk21r, dk22r, dk23r,
				dk31r, dk32r, dk33r

				detr,						:			std_logic_vector(7 downto 0);

	signal	det_inv, det_invr		:			std_logic_vector(3 downto 0);

begin

-- first step: compute the cofactors of the key matrix

	cof11r <= (ek22 * ek33) - (ek23 * ek32);
	cof12r <= (ek23 * ek31) - (ek21 * ek33);
	cof13r <= (ek21 * ek32) - (ek22 * ek31);
	cof21r <= (ek13 * ek32) - (ek12 * ek33);
	cof22r <= (ek11 * ek33) - (ek13 * ek31);
	cof23r <= (ek12 * ek31) - (ek11 * ek32);
	cof31r <= (ek12 * ek23) - (ek22 * ek13);
	cof32r <= (ek13 * ek21) - (ek11 * ek23);
	cof33r <= (ek11 * ek22) - (ek12 * ek21);


-- second step: compute the adjoint matrix of the key

	adj11r <= cof11;
	adj12r <= cof21;
	adj13r <= cof31;
	adj21r <= cof12;
	adj22r <= cof22;
	adj23r <= cof32;
	adj31r <= cof13;
	adj32r <= cof23;
	adj33r <= cof33;


-- third step: compute the determinant of the key matrix

	detr <= (k11 * cof11) + (k12 * cof12) + (k13 * cof13);


-- fourth step: compute the multiplicative inverse

	mult_inverse_lookup : lpm_rom
		GENERIC MAP (
				lpm_widthad				=> 	4,
				lpm_numwords			=> 	16,
				lpm_outdata				=> 	"UNREGISTERED",
				lpm_address_control 	=> 	"REGISTERED",
				lpm_file 				=> 	"mult_inv_16.mif",
				lpm_widthad 			=> 	4
			)
		PORT MAP (
				inclock 					=> 	clk,
				address 					=> 	det(3 downto 0),
				q 							=> 	det_invr
			);

-- final step:	compute final decryption key

	dk11r <= adj11 * det_inv;
	dk12r <= adj12 * det_inv;
	dk13r <= adj13 * det_inv;
	dk21r <= adj21 * det_inv;
	dk22r <= adj22 * det_inv;
	dk23r <= adj23 * det_inv;
	dk31r <= adj31 * det_inv;
	dk32r <= adj32 * det_inv;
	dk33r <= adj33 * det_inv;


-- update signals on each rising edge to allow for pipelining

	update : process(clk) begin
		if(rising_edge(clk)) then

			-- from 1: cofactor matrix
			cof11 	<=		cof11r(3 downto 0);
			cof12 	<=		cof12r(3 downto 0);
			cof13 	<=		cof13r(3 downto 0);
			cof21 	<=		cof21r(3 downto 0);
			cof22 	<=		cof22r(3 downto 0);
			cof23 	<=		cof23r(3 downto 0);
			cof31 	<=		cof31r(3 downto 0);
			cof32 	<=		cof32r(3 downto 0);
			cof33 	<=		cof33r(3 downto 0);

			-- from 2: adjoint matrix
			adj11 	<=		adj11r(3 downto 0);
			adj12 	<=		adj12r(3 downto 0);
			adj13 	<=		adj13r(3 downto 0);
			adj21 	<=		adj21r(3 downto 0);
			adj22 	<=		adj22r(3 downto 0);
			adj23 	<=		adj23r(3 downto 0);
			adj31 	<=		adj31r(3 downto 0);
			adj32 	<=		adj32r(3 downto 0);
			adj33 	<=		adj33r(3 downto 0);

			-- from 3: determinant
			det 		<=		detr(3 downto 0);

			-- from 4: inverse determinant
			det_inv 	<=		det_invr;

			-- output final decrypted matrix
			dk11 		<=		dk11r(3 downto 0);
			dk12 		<=		dk12r(3 downto 0);
			dk13 		<=		dk13r(3 downto 0);
			dk21 		<=		dk21r(3 downto 0);
			dk22 		<=		dk22r(3 downto 0);
			dk23 		<=		dk23r(3 downto 0);
			dk31 		<=		dk31r(3 downto 0);
			dk32 		<=		dk32r(3 downto 0);
			dk33 		<=		dk33r(3 downto 0);
		end if;
	end process;

end architecture ; -- struct