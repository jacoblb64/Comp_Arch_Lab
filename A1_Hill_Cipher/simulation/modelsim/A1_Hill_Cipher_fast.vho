-- Copyright (C) 1991-2013 Altera Corporation
-- Your use of Altera Corporation's design tools, logic functions 
-- and other software and tools, and its AMPP partner logic 
-- functions, and any output files from any of the foregoing 
-- (including device programming or simulation files), and any 
-- associated documentation or information are expressly subject 
-- to the terms and conditions of the Altera Program License 
-- Subscription Agreement, Altera MegaCore Function License 
-- Agreement, or other applicable license agreement, including, 
-- without limitation, that your use is for the sole purpose of 
-- programming logic devices manufactured by Altera and sold by 
-- Altera or its authorized distributors.  Please refer to the 
-- applicable agreement for further details.

-- VENDOR "Altera"
-- PROGRAM "Quartus II 64-Bit"
-- VERSION "Version 13.0.1 Build 232 06/12/2013 Service Pack 1 SJ Full Version"

-- DATE "01/12/2016 11:33:13"

-- 
-- Device: Altera EP2C5T144C6 Package TQFP144
-- 

-- 
-- This VHDL file should be used for ModelSim (VHDL) only
-- 

LIBRARY CYCLONEII;
LIBRARY IEEE;
USE CYCLONEII.CYCLONEII_COMPONENTS.ALL;
USE IEEE.STD_LOGIC_1164.ALL;

ENTITY 	matrix_sub_mult IS
    PORT (
	p1 : IN std_logic_vector(3 DOWNTO 0);
	p2 : IN std_logic_vector(3 DOWNTO 0);
	p3 : IN std_logic_vector(3 DOWNTO 0);
	k1x : IN std_logic_vector(3 DOWNTO 0);
	k2x : IN std_logic_vector(3 DOWNTO 0);
	k3x : IN std_logic_vector(3 DOWNTO 0);
	clk : IN std_logic;
	cx : OUT std_logic_vector(3 DOWNTO 0)
	);
END matrix_sub_mult;

-- Design Ports Information
-- cx[0]	=>  Location: PIN_47,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
-- cx[1]	=>  Location: PIN_41,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
-- cx[2]	=>  Location: PIN_44,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
-- cx[3]	=>  Location: PIN_51,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
-- clk	=>  Location: PIN_17,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
-- k3x[1]	=>  Location: PIN_27,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
-- k1x[1]	=>  Location: PIN_18,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
-- k2x[1]	=>  Location: PIN_21,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
-- k3x[2]	=>  Location: PIN_22,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
-- k3x[3]	=>  Location: PIN_26,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
-- k1x[2]	=>  Location: PIN_60,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
-- k1x[3]	=>  Location: PIN_57,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
-- k2x[2]	=>  Location: PIN_43,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
-- k2x[3]	=>  Location: PIN_40,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
-- k3x[0]	=>  Location: PIN_24,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
-- k1x[0]	=>  Location: PIN_53,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
-- k2x[0]	=>  Location: PIN_30,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
-- p3[0]	=>  Location: PIN_28,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
-- p1[0]	=>  Location: PIN_55,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
-- p2[0]	=>  Location: PIN_48,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
-- p3[1]	=>  Location: PIN_25,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
-- p1[1]	=>  Location: PIN_58,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
-- p2[1]	=>  Location: PIN_52,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
-- p3[2]	=>  Location: PIN_31,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
-- p1[2]	=>  Location: PIN_59,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
-- p2[2]	=>  Location: PIN_45,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
-- p3[3]	=>  Location: PIN_32,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
-- p1[3]	=>  Location: PIN_63,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
-- p2[3]	=>  Location: PIN_42,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default


ARCHITECTURE structure OF matrix_sub_mult IS
SIGNAL gnd : std_logic := '0';
SIGNAL vcc : std_logic := '1';
SIGNAL unknown : std_logic := 'X';
SIGNAL devoe : std_logic := '1';
SIGNAL devclrn : std_logic := '1';
SIGNAL devpor : std_logic := '1';
SIGNAL ww_devoe : std_logic;
SIGNAL ww_devclrn : std_logic;
SIGNAL ww_devpor : std_logic;
SIGNAL ww_p1 : std_logic_vector(3 DOWNTO 0);
SIGNAL ww_p2 : std_logic_vector(3 DOWNTO 0);
SIGNAL ww_p3 : std_logic_vector(3 DOWNTO 0);
SIGNAL ww_k1x : std_logic_vector(3 DOWNTO 0);
SIGNAL ww_k2x : std_logic_vector(3 DOWNTO 0);
SIGNAL ww_k3x : std_logic_vector(3 DOWNTO 0);
SIGNAL ww_clk : std_logic;
SIGNAL ww_cx : std_logic_vector(3 DOWNTO 0);
SIGNAL \clk~clkctrl_INCLK_bus\ : std_logic_vector(3 DOWNTO 0);
SIGNAL \lpm_mult_1|auto_generated|op_3~0_combout\ : std_logic;
SIGNAL \lpm_add_1|auto_generated|op_1~0_combout\ : std_logic;
SIGNAL \lpm_mult_3|auto_generated|op_3~2_combout\ : std_logic;
SIGNAL \lpm_mult_2|auto_generated|op_3~2_combout\ : std_logic;
SIGNAL \lpm_mult_3|auto_generated|op_3~5\ : std_logic;
SIGNAL \lpm_mult_2|auto_generated|op_3~4_combout\ : std_logic;
SIGNAL \lpm_add_1|auto_generated|op_1~4_combout\ : std_logic;
SIGNAL \lpm_mult_3|auto_generated|op_3~6_combout\ : std_logic;
SIGNAL \lpm_mult_3|auto_generated|op_1~0_combout\ : std_logic;
SIGNAL \lpm_mult_3|auto_generated|cs1a[1]~0_combout\ : std_logic;
SIGNAL \lpm_mult_3|auto_generated|op_1~1_combout\ : std_logic;
SIGNAL \lpm_mult_3|auto_generated|cs2a[1]~0_combout\ : std_logic;
SIGNAL \lpm_mult_1|auto_generated|cs2a[1]~0_combout\ : std_logic;
SIGNAL \clk~combout\ : std_logic;
SIGNAL \clk~clkctrl_outclk\ : std_logic;
SIGNAL \lpm_mult_3|auto_generated|op_3~0_combout\ : std_logic;
SIGNAL \lpm_ff_cx|dffs[0]~4_combout\ : std_logic;
SIGNAL \lpm_ff_p1|dffs[1]~feeder_combout\ : std_logic;
SIGNAL \lpm_mult_1|auto_generated|op_3~1\ : std_logic;
SIGNAL \lpm_mult_1|auto_generated|op_3~2_combout\ : std_logic;
SIGNAL \lpm_mult_2|auto_generated|op_3~0_combout\ : std_logic;
SIGNAL \lpm_add_1|auto_generated|op_1~1\ : std_logic;
SIGNAL \lpm_add_1|auto_generated|op_1~2_combout\ : std_logic;
SIGNAL \lpm_ff_cx|dffs[0]~5\ : std_logic;
SIGNAL \lpm_ff_cx|dffs[1]~6_combout\ : std_logic;
SIGNAL \lpm_mult_3|auto_generated|op_3~1\ : std_logic;
SIGNAL \lpm_mult_3|auto_generated|op_3~3\ : std_logic;
SIGNAL \lpm_mult_3|auto_generated|op_3~4_combout\ : std_logic;
SIGNAL \lpm_ff_cx|dffs[1]~7\ : std_logic;
SIGNAL \lpm_ff_cx|dffs[2]~8_combout\ : std_logic;
SIGNAL \lpm_mult_2|auto_generated|cs2a[1]~0_combout\ : std_logic;
SIGNAL \lpm_ff_p2|dffs[1]~feeder_combout\ : std_logic;
SIGNAL \lpm_mult_2|auto_generated|cs1a[1]~0_combout\ : std_logic;
SIGNAL \lpm_mult_2|auto_generated|op_1~1_combout\ : std_logic;
SIGNAL \lpm_mult_2|auto_generated|op_1~0_combout\ : std_logic;
SIGNAL \lpm_mult_2|auto_generated|op_3~1\ : std_logic;
SIGNAL \lpm_mult_2|auto_generated|op_3~3\ : std_logic;
SIGNAL \lpm_mult_2|auto_generated|op_3~5\ : std_logic;
SIGNAL \lpm_mult_2|auto_generated|op_3~6_combout\ : std_logic;
SIGNAL \lpm_mult_1|auto_generated|cs1a[1]~0_combout\ : std_logic;
SIGNAL \lpm_mult_1|auto_generated|op_1~1_combout\ : std_logic;
SIGNAL \lpm_mult_1|auto_generated|op_1~0_combout\ : std_logic;
SIGNAL \lpm_mult_1|auto_generated|op_3~3\ : std_logic;
SIGNAL \lpm_mult_1|auto_generated|op_3~5\ : std_logic;
SIGNAL \lpm_mult_1|auto_generated|op_3~6_combout\ : std_logic;
SIGNAL \lpm_mult_1|auto_generated|op_3~4_combout\ : std_logic;
SIGNAL \lpm_add_1|auto_generated|op_1~3\ : std_logic;
SIGNAL \lpm_add_1|auto_generated|op_1~5\ : std_logic;
SIGNAL \lpm_add_1|auto_generated|op_1~6_combout\ : std_logic;
SIGNAL \lpm_ff_cx|dffs[2]~9\ : std_logic;
SIGNAL \lpm_ff_cx|dffs[3]~10_combout\ : std_logic;
SIGNAL \lpm_mult_3|auto_generated|le4a\ : std_logic_vector(5 DOWNTO 0);
SIGNAL \lpm_mult_3|auto_generated|le3a\ : std_logic_vector(5 DOWNTO 0);
SIGNAL \lpm_ff_p2|dffs\ : std_logic_vector(3 DOWNTO 0);
SIGNAL \lpm_ff_p3|dffs\ : std_logic_vector(3 DOWNTO 0);
SIGNAL \lpm_ff_cx|dffs\ : std_logic_vector(3 DOWNTO 0);
SIGNAL \lpm_mult_1|auto_generated|le4a\ : std_logic_vector(5 DOWNTO 0);
SIGNAL \lpm_mult_1|auto_generated|le3a\ : std_logic_vector(5 DOWNTO 0);
SIGNAL \lpm_ff_p1|dffs\ : std_logic_vector(3 DOWNTO 0);
SIGNAL \p3~combout\ : std_logic_vector(3 DOWNTO 0);
SIGNAL \p2~combout\ : std_logic_vector(3 DOWNTO 0);
SIGNAL \p1~combout\ : std_logic_vector(3 DOWNTO 0);
SIGNAL \k3x~combout\ : std_logic_vector(3 DOWNTO 0);
SIGNAL \k2x~combout\ : std_logic_vector(3 DOWNTO 0);
SIGNAL \k1x~combout\ : std_logic_vector(3 DOWNTO 0);
SIGNAL \lpm_mult_2|auto_generated|le4a\ : std_logic_vector(5 DOWNTO 0);
SIGNAL \lpm_mult_2|auto_generated|le3a\ : std_logic_vector(5 DOWNTO 0);

BEGIN

ww_p1 <= p1;
ww_p2 <= p2;
ww_p3 <= p3;
ww_k1x <= k1x;
ww_k2x <= k2x;
ww_k3x <= k3x;
ww_clk <= clk;
cx <= ww_cx;
ww_devoe <= devoe;
ww_devclrn <= devclrn;
ww_devpor <= devpor;

\clk~clkctrl_INCLK_bus\ <= (gnd & gnd & gnd & \clk~combout\);

-- Location: LCCOMB_X7_Y1_N24
\lpm_mult_1|auto_generated|op_3~0\ : cycloneii_lcell_comb
-- Equation(s):
-- \lpm_mult_1|auto_generated|op_3~0_combout\ = (\k1x~combout\(1) & (\lpm_mult_1|auto_generated|le3a\(0) $ (VCC))) # (!\k1x~combout\(1) & (\lpm_mult_1|auto_generated|le3a\(0) & VCC))
-- \lpm_mult_1|auto_generated|op_3~1\ = CARRY((\k1x~combout\(1) & \lpm_mult_1|auto_generated|le3a\(0)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0110011010001000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \k1x~combout\(1),
	datab => \lpm_mult_1|auto_generated|le3a\(0),
	datad => VCC,
	combout => \lpm_mult_1|auto_generated|op_3~0_combout\,
	cout => \lpm_mult_1|auto_generated|op_3~1\);

-- Location: LCCOMB_X7_Y1_N16
\lpm_add_1|auto_generated|op_1~0\ : cycloneii_lcell_comb
-- Equation(s):
-- \lpm_add_1|auto_generated|op_1~0_combout\ = (\lpm_mult_1|auto_generated|op_3~0_combout\ & (\lpm_mult_2|auto_generated|op_3~0_combout\ $ (VCC))) # (!\lpm_mult_1|auto_generated|op_3~0_combout\ & (\lpm_mult_2|auto_generated|op_3~0_combout\ & VCC))
-- \lpm_add_1|auto_generated|op_1~1\ = CARRY((\lpm_mult_1|auto_generated|op_3~0_combout\ & \lpm_mult_2|auto_generated|op_3~0_combout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0110011010001000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \lpm_mult_1|auto_generated|op_3~0_combout\,
	datab => \lpm_mult_2|auto_generated|op_3~0_combout\,
	datad => VCC,
	combout => \lpm_add_1|auto_generated|op_1~0_combout\,
	cout => \lpm_add_1|auto_generated|op_1~1\);

-- Location: LCCOMB_X3_Y1_N8
\lpm_mult_3|auto_generated|op_3~2\ : cycloneii_lcell_comb
-- Equation(s):
-- \lpm_mult_3|auto_generated|op_3~2_combout\ = (\lpm_mult_3|auto_generated|le3a\(1) & (!\lpm_mult_3|auto_generated|op_3~1\)) # (!\lpm_mult_3|auto_generated|le3a\(1) & ((\lpm_mult_3|auto_generated|op_3~1\) # (GND)))
-- \lpm_mult_3|auto_generated|op_3~3\ = CARRY((!\lpm_mult_3|auto_generated|op_3~1\) # (!\lpm_mult_3|auto_generated|le3a\(1)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101101001011111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \lpm_mult_3|auto_generated|le3a\(1),
	datad => VCC,
	cin => \lpm_mult_3|auto_generated|op_3~1\,
	combout => \lpm_mult_3|auto_generated|op_3~2_combout\,
	cout => \lpm_mult_3|auto_generated|op_3~3\);

-- Location: LCCOMB_X7_Y1_N10
\lpm_mult_2|auto_generated|op_3~2\ : cycloneii_lcell_comb
-- Equation(s):
-- \lpm_mult_2|auto_generated|op_3~2_combout\ = (\lpm_mult_2|auto_generated|le3a\(1) & (!\lpm_mult_2|auto_generated|op_3~1\)) # (!\lpm_mult_2|auto_generated|le3a\(1) & ((\lpm_mult_2|auto_generated|op_3~1\) # (GND)))
-- \lpm_mult_2|auto_generated|op_3~3\ = CARRY((!\lpm_mult_2|auto_generated|op_3~1\) # (!\lpm_mult_2|auto_generated|le3a\(1)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011110000111111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \lpm_mult_2|auto_generated|le3a\(1),
	datad => VCC,
	cin => \lpm_mult_2|auto_generated|op_3~1\,
	combout => \lpm_mult_2|auto_generated|op_3~2_combout\,
	cout => \lpm_mult_2|auto_generated|op_3~3\);

-- Location: LCCOMB_X3_Y1_N10
\lpm_mult_3|auto_generated|op_3~4\ : cycloneii_lcell_comb
-- Equation(s):
-- \lpm_mult_3|auto_generated|op_3~4_combout\ = ((\lpm_mult_3|auto_generated|op_1~0_combout\ $ (\lpm_mult_3|auto_generated|le4a\(0) $ (!\lpm_mult_3|auto_generated|op_3~3\)))) # (GND)
-- \lpm_mult_3|auto_generated|op_3~5\ = CARRY((\lpm_mult_3|auto_generated|op_1~0_combout\ & ((\lpm_mult_3|auto_generated|le4a\(0)) # (!\lpm_mult_3|auto_generated|op_3~3\))) # (!\lpm_mult_3|auto_generated|op_1~0_combout\ & (\lpm_mult_3|auto_generated|le4a\(0) 
-- & !\lpm_mult_3|auto_generated|op_3~3\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0110100110001110",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \lpm_mult_3|auto_generated|op_1~0_combout\,
	datab => \lpm_mult_3|auto_generated|le4a\(0),
	datad => VCC,
	cin => \lpm_mult_3|auto_generated|op_3~3\,
	combout => \lpm_mult_3|auto_generated|op_3~4_combout\,
	cout => \lpm_mult_3|auto_generated|op_3~5\);

-- Location: LCCOMB_X7_Y1_N12
\lpm_mult_2|auto_generated|op_3~4\ : cycloneii_lcell_comb
-- Equation(s):
-- \lpm_mult_2|auto_generated|op_3~4_combout\ = ((\lpm_mult_2|auto_generated|le4a\(0) $ (\lpm_mult_2|auto_generated|op_1~0_combout\ $ (!\lpm_mult_2|auto_generated|op_3~3\)))) # (GND)
-- \lpm_mult_2|auto_generated|op_3~5\ = CARRY((\lpm_mult_2|auto_generated|le4a\(0) & ((\lpm_mult_2|auto_generated|op_1~0_combout\) # (!\lpm_mult_2|auto_generated|op_3~3\))) # (!\lpm_mult_2|auto_generated|le4a\(0) & (\lpm_mult_2|auto_generated|op_1~0_combout\ 
-- & !\lpm_mult_2|auto_generated|op_3~3\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0110100110001110",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \lpm_mult_2|auto_generated|le4a\(0),
	datab => \lpm_mult_2|auto_generated|op_1~0_combout\,
	datad => VCC,
	cin => \lpm_mult_2|auto_generated|op_3~3\,
	combout => \lpm_mult_2|auto_generated|op_3~4_combout\,
	cout => \lpm_mult_2|auto_generated|op_3~5\);

-- Location: LCCOMB_X7_Y1_N20
\lpm_add_1|auto_generated|op_1~4\ : cycloneii_lcell_comb
-- Equation(s):
-- \lpm_add_1|auto_generated|op_1~4_combout\ = ((\lpm_mult_2|auto_generated|op_3~4_combout\ $ (\lpm_mult_1|auto_generated|op_3~4_combout\ $ (!\lpm_add_1|auto_generated|op_1~3\)))) # (GND)
-- \lpm_add_1|auto_generated|op_1~5\ = CARRY((\lpm_mult_2|auto_generated|op_3~4_combout\ & ((\lpm_mult_1|auto_generated|op_3~4_combout\) # (!\lpm_add_1|auto_generated|op_1~3\))) # (!\lpm_mult_2|auto_generated|op_3~4_combout\ & 
-- (\lpm_mult_1|auto_generated|op_3~4_combout\ & !\lpm_add_1|auto_generated|op_1~3\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0110100110001110",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \lpm_mult_2|auto_generated|op_3~4_combout\,
	datab => \lpm_mult_1|auto_generated|op_3~4_combout\,
	datad => VCC,
	cin => \lpm_add_1|auto_generated|op_1~3\,
	combout => \lpm_add_1|auto_generated|op_1~4_combout\,
	cout => \lpm_add_1|auto_generated|op_1~5\);

-- Location: LCCOMB_X3_Y1_N12
\lpm_mult_3|auto_generated|op_3~6\ : cycloneii_lcell_comb
-- Equation(s):
-- \lpm_mult_3|auto_generated|op_3~6_combout\ = \lpm_mult_3|auto_generated|op_1~1_combout\ $ (\lpm_mult_3|auto_generated|op_3~5\ $ (\lpm_mult_3|auto_generated|le4a\(1)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100001100111100",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \lpm_mult_3|auto_generated|op_1~1_combout\,
	datad => \lpm_mult_3|auto_generated|le4a\(1),
	cin => \lpm_mult_3|auto_generated|op_3~5\,
	combout => \lpm_mult_3|auto_generated|op_3~6_combout\);

-- Location: LCCOMB_X3_Y1_N24
\lpm_mult_3|auto_generated|op_1~0\ : cycloneii_lcell_comb
-- Equation(s):
-- \lpm_mult_3|auto_generated|op_1~0_combout\ = \k3x~combout\(3) $ (\lpm_mult_3|auto_generated|le3a\(2) $ (((\k3x~combout\(1) & \k3x~combout\(2)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1000011101111000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \k3x~combout\(1),
	datab => \k3x~combout\(2),
	datac => \k3x~combout\(3),
	datad => \lpm_mult_3|auto_generated|le3a\(2),
	combout => \lpm_mult_3|auto_generated|op_1~0_combout\);

-- Location: LCCOMB_X3_Y1_N14
\lpm_mult_3|auto_generated|cs1a[1]~0\ : cycloneii_lcell_comb
-- Equation(s):
-- \lpm_mult_3|auto_generated|cs1a[1]~0_combout\ = \k3x~combout\(3) $ (((\k3x~combout\(1) & \k3x~combout\(2))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0110011010101010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \k3x~combout\(3),
	datab => \k3x~combout\(1),
	datad => \k3x~combout\(2),
	combout => \lpm_mult_3|auto_generated|cs1a[1]~0_combout\);

-- Location: LCCOMB_X3_Y1_N4
\lpm_mult_3|auto_generated|op_1~1\ : cycloneii_lcell_comb
-- Equation(s):
-- \lpm_mult_3|auto_generated|op_1~1_combout\ = \lpm_mult_3|auto_generated|le3a\(3) $ (((\lpm_mult_3|auto_generated|cs1a[1]~0_combout\ & \lpm_mult_3|auto_generated|le3a\(2))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0111011110001000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \lpm_mult_3|auto_generated|cs1a[1]~0_combout\,
	datab => \lpm_mult_3|auto_generated|le3a\(2),
	datad => \lpm_mult_3|auto_generated|le3a\(3),
	combout => \lpm_mult_3|auto_generated|op_1~1_combout\);

-- Location: LCCOMB_X3_Y1_N20
\lpm_mult_3|auto_generated|le3a[0]\ : cycloneii_lcell_comb
-- Equation(s):
-- \lpm_mult_3|auto_generated|le3a\(0) = LCELL(\k3x~combout\(1) $ (((\k3x~combout\(0) & \lpm_ff_p3|dffs\(0)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0110011011001100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \k3x~combout\(0),
	datab => \k3x~combout\(1),
	datad => \lpm_ff_p3|dffs\(0),
	combout => \lpm_mult_3|auto_generated|le3a\(0));

-- Location: LCCOMB_X6_Y1_N14
\lpm_mult_2|auto_generated|le3a[0]\ : cycloneii_lcell_comb
-- Equation(s):
-- \lpm_mult_2|auto_generated|le3a\(0) = LCELL(\k2x~combout\(1) $ (((\k2x~combout\(0) & \lpm_ff_p2|dffs\(0)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0110011010101010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \k2x~combout\(1),
	datab => \k2x~combout\(0),
	datad => \lpm_ff_p2|dffs\(0),
	combout => \lpm_mult_2|auto_generated|le3a\(0));

-- Location: LCFF_X3_Y1_N27
\lpm_ff_p3|dffs[1]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \clk~clkctrl_outclk\,
	sdata => \p3~combout\(1),
	sload => VCC,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \lpm_ff_p3|dffs\(1));

-- Location: LCCOMB_X3_Y1_N16
\lpm_mult_3|auto_generated|le3a[1]\ : cycloneii_lcell_comb
-- Equation(s):
-- \lpm_mult_3|auto_generated|le3a\(1) = LCELL((\k3x~combout\(0) & ((\k3x~combout\(1) $ (\lpm_ff_p3|dffs\(1))))) # (!\k3x~combout\(0) & (!\lpm_ff_p3|dffs\(0) & (\k3x~combout\(1)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0001101010110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \k3x~combout\(0),
	datab => \lpm_ff_p3|dffs\(0),
	datac => \k3x~combout\(1),
	datad => \lpm_ff_p3|dffs\(1),
	combout => \lpm_mult_3|auto_generated|le3a\(1));

-- Location: LCFF_X3_Y1_N15
\lpm_ff_p3|dffs[2]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \clk~clkctrl_outclk\,
	sdata => \p3~combout\(2),
	sload => VCC,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \lpm_ff_p3|dffs\(2));

-- Location: LCCOMB_X3_Y1_N18
\lpm_mult_3|auto_generated|le3a[2]\ : cycloneii_lcell_comb
-- Equation(s):
-- \lpm_mult_3|auto_generated|le3a\(2) = LCELL((\k3x~combout\(0) & (\k3x~combout\(1) $ ((\lpm_ff_p3|dffs\(2))))) # (!\k3x~combout\(0) & (\k3x~combout\(1) & ((!\lpm_ff_p3|dffs\(1))))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0010100001101100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \k3x~combout\(0),
	datab => \k3x~combout\(1),
	datac => \lpm_ff_p3|dffs\(2),
	datad => \lpm_ff_p3|dffs\(1),
	combout => \lpm_mult_3|auto_generated|le3a\(2));

-- Location: LCCOMB_X8_Y1_N16
\lpm_mult_1|auto_generated|le4a[0]\ : cycloneii_lcell_comb
-- Equation(s):
-- \lpm_mult_1|auto_generated|le4a\(0) = LCELL(\k1x~combout\(3) $ (((\k1x~combout\(2) & ((\k1x~combout\(1)) # (\lpm_ff_p1|dffs\(0)))) # (!\k1x~combout\(2) & (\k1x~combout\(1) & \lpm_ff_p1|dffs\(0))))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0001111001111000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \k1x~combout\(2),
	datab => \k1x~combout\(1),
	datac => \k1x~combout\(3),
	datad => \lpm_ff_p1|dffs\(0),
	combout => \lpm_mult_1|auto_generated|le4a\(0));

-- Location: LCCOMB_X6_Y1_N0
\lpm_mult_2|auto_generated|le4a[0]\ : cycloneii_lcell_comb
-- Equation(s):
-- \lpm_mult_2|auto_generated|le4a\(0) = LCELL(\k2x~combout\(3) $ (((\k2x~combout\(1) & ((\k2x~combout\(2)) # (\lpm_ff_p2|dffs\(0)))) # (!\k2x~combout\(1) & (\k2x~combout\(2) & \lpm_ff_p2|dffs\(0))))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0001011111101000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \k2x~combout\(1),
	datab => \k2x~combout\(2),
	datac => \lpm_ff_p2|dffs\(0),
	datad => \k2x~combout\(3),
	combout => \lpm_mult_2|auto_generated|le4a\(0));

-- Location: LCFF_X3_Y1_N31
\lpm_ff_p3|dffs[3]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \clk~clkctrl_outclk\,
	sdata => \p3~combout\(3),
	sload => VCC,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \lpm_ff_p3|dffs\(3));

-- Location: LCCOMB_X3_Y1_N30
\lpm_mult_3|auto_generated|le3a[3]\ : cycloneii_lcell_comb
-- Equation(s):
-- \lpm_mult_3|auto_generated|le3a\(3) = LCELL((\k3x~combout\(0) & ((\lpm_ff_p3|dffs\(3) $ (\k3x~combout\(1))))) # (!\k3x~combout\(0) & (!\lpm_ff_p3|dffs\(2) & ((\k3x~combout\(1))))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0001101110100000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \k3x~combout\(0),
	datab => \lpm_ff_p3|dffs\(2),
	datac => \lpm_ff_p3|dffs\(3),
	datad => \k3x~combout\(1),
	combout => \lpm_mult_3|auto_generated|le3a\(3));

-- Location: LCCOMB_X3_Y1_N22
\lpm_mult_3|auto_generated|cs2a[1]~0\ : cycloneii_lcell_comb
-- Equation(s):
-- \lpm_mult_3|auto_generated|cs2a[1]~0_combout\ = \k3x~combout\(1) $ (\k3x~combout\(2))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011001111001100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \k3x~combout\(1),
	datad => \k3x~combout\(2),
	combout => \lpm_mult_3|auto_generated|cs2a[1]~0_combout\);

-- Location: LCCOMB_X3_Y1_N26
\lpm_mult_3|auto_generated|le4a[1]\ : cycloneii_lcell_comb
-- Equation(s):
-- \lpm_mult_3|auto_generated|le4a\(1) = LCELL((\lpm_mult_3|auto_generated|cs2a[1]~0_combout\ & (\lpm_mult_3|auto_generated|cs1a[1]~0_combout\ $ ((\lpm_ff_p3|dffs\(1))))) # (!\lpm_mult_3|auto_generated|cs2a[1]~0_combout\ & 
-- (\lpm_mult_3|auto_generated|cs1a[1]~0_combout\ & ((!\lpm_ff_p3|dffs\(0))))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0100100001101010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \lpm_mult_3|auto_generated|cs1a[1]~0_combout\,
	datab => \lpm_mult_3|auto_generated|cs2a[1]~0_combout\,
	datac => \lpm_ff_p3|dffs\(1),
	datad => \lpm_ff_p3|dffs\(0),
	combout => \lpm_mult_3|auto_generated|le4a\(1));

-- Location: LCCOMB_X8_Y1_N4
\lpm_mult_1|auto_generated|cs2a[1]~0\ : cycloneii_lcell_comb
-- Equation(s):
-- \lpm_mult_1|auto_generated|cs2a[1]~0_combout\ = \k1x~combout\(1) $ (\k1x~combout\(2))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011001111001100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \k1x~combout\(1),
	datad => \k1x~combout\(2),
	combout => \lpm_mult_1|auto_generated|cs2a[1]~0_combout\);

-- Location: PIN_24,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
\k3x[0]~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "input",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => GND,
	padio => ww_k3x(0),
	combout => \k3x~combout\(0));

-- Location: PIN_53,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
\k1x[0]~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "input",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => GND,
	padio => ww_k1x(0),
	combout => \k1x~combout\(0));

-- Location: PIN_25,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
\p3[1]~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "input",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => GND,
	padio => ww_p3(1),
	combout => \p3~combout\(1));

-- Location: PIN_31,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
\p3[2]~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "input",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => GND,
	padio => ww_p3(2),
	combout => \p3~combout\(2));

-- Location: PIN_32,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
\p3[3]~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "input",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => GND,
	padio => ww_p3(3),
	combout => \p3~combout\(3));

-- Location: PIN_17,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
\clk~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "input",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => GND,
	padio => ww_clk,
	combout => \clk~combout\);

-- Location: CLKCTRL_G2
\clk~clkctrl\ : cycloneii_clkctrl
-- pragma translate_off
GENERIC MAP (
	clock_type => "global clock",
	ena_register_mode => "none")
-- pragma translate_on
PORT MAP (
	inclk => \clk~clkctrl_INCLK_bus\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	outclk => \clk~clkctrl_outclk\);

-- Location: PIN_27,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
\k3x[1]~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "input",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => GND,
	padio => ww_k3x(1),
	combout => \k3x~combout\(1));

-- Location: LCCOMB_X3_Y1_N6
\lpm_mult_3|auto_generated|op_3~0\ : cycloneii_lcell_comb
-- Equation(s):
-- \lpm_mult_3|auto_generated|op_3~0_combout\ = (\lpm_mult_3|auto_generated|le3a\(0) & (\k3x~combout\(1) $ (VCC))) # (!\lpm_mult_3|auto_generated|le3a\(0) & (\k3x~combout\(1) & VCC))
-- \lpm_mult_3|auto_generated|op_3~1\ = CARRY((\lpm_mult_3|auto_generated|le3a\(0) & \k3x~combout\(1)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0110011010001000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \lpm_mult_3|auto_generated|le3a\(0),
	datab => \k3x~combout\(1),
	datad => VCC,
	combout => \lpm_mult_3|auto_generated|op_3~0_combout\,
	cout => \lpm_mult_3|auto_generated|op_3~1\);

-- Location: LCCOMB_X7_Y1_N0
\lpm_ff_cx|dffs[0]~4\ : cycloneii_lcell_comb
-- Equation(s):
-- \lpm_ff_cx|dffs[0]~4_combout\ = (\lpm_add_1|auto_generated|op_1~0_combout\ & (\lpm_mult_3|auto_generated|op_3~0_combout\ $ (VCC))) # (!\lpm_add_1|auto_generated|op_1~0_combout\ & (\lpm_mult_3|auto_generated|op_3~0_combout\ & VCC))
-- \lpm_ff_cx|dffs[0]~5\ = CARRY((\lpm_add_1|auto_generated|op_1~0_combout\ & \lpm_mult_3|auto_generated|op_3~0_combout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0110011010001000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \lpm_add_1|auto_generated|op_1~0_combout\,
	datab => \lpm_mult_3|auto_generated|op_3~0_combout\,
	datad => VCC,
	combout => \lpm_ff_cx|dffs[0]~4_combout\,
	cout => \lpm_ff_cx|dffs[0]~5\);

-- Location: LCFF_X7_Y1_N1
\lpm_ff_cx|dffs[0]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \clk~clkctrl_outclk\,
	datain => \lpm_ff_cx|dffs[0]~4_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \lpm_ff_cx|dffs\(0));

-- Location: PIN_55,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
\p1[0]~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "input",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => GND,
	padio => ww_p1(0),
	combout => \p1~combout\(0));

-- Location: LCFF_X8_Y1_N27
\lpm_ff_p1|dffs[0]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \clk~clkctrl_outclk\,
	sdata => \p1~combout\(0),
	sload => VCC,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \lpm_ff_p1|dffs\(0));

-- Location: PIN_18,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
\k1x[1]~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "input",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => GND,
	padio => ww_k1x(1),
	combout => \k1x~combout\(1));

-- Location: PIN_58,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
\p1[1]~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "input",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => GND,
	padio => ww_p1(1),
	combout => \p1~combout\(1));

-- Location: LCCOMB_X8_Y1_N28
\lpm_ff_p1|dffs[1]~feeder\ : cycloneii_lcell_comb
-- Equation(s):
-- \lpm_ff_p1|dffs[1]~feeder_combout\ = \p1~combout\(1)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datad => \p1~combout\(1),
	combout => \lpm_ff_p1|dffs[1]~feeder_combout\);

-- Location: LCFF_X8_Y1_N29
\lpm_ff_p1|dffs[1]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \clk~clkctrl_outclk\,
	datain => \lpm_ff_p1|dffs[1]~feeder_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \lpm_ff_p1|dffs\(1));

-- Location: LCCOMB_X8_Y1_N18
\lpm_mult_1|auto_generated|le3a[1]\ : cycloneii_lcell_comb
-- Equation(s):
-- \lpm_mult_1|auto_generated|le3a\(1) = LCELL((\k1x~combout\(0) & ((\k1x~combout\(1) $ (\lpm_ff_p1|dffs\(1))))) # (!\k1x~combout\(0) & (!\lpm_ff_p1|dffs\(0) & (\k1x~combout\(1)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0001101010110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \k1x~combout\(0),
	datab => \lpm_ff_p1|dffs\(0),
	datac => \k1x~combout\(1),
	datad => \lpm_ff_p1|dffs\(1),
	combout => \lpm_mult_1|auto_generated|le3a\(1));

-- Location: LCCOMB_X8_Y1_N10
\lpm_mult_1|auto_generated|le3a[0]\ : cycloneii_lcell_comb
-- Equation(s):
-- \lpm_mult_1|auto_generated|le3a\(0) = LCELL(\k1x~combout\(1) $ (((\k1x~combout\(0) & \lpm_ff_p1|dffs\(0)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0110011011001100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \k1x~combout\(0),
	datab => \k1x~combout\(1),
	datad => \lpm_ff_p1|dffs\(0),
	combout => \lpm_mult_1|auto_generated|le3a\(0));

-- Location: LCCOMB_X7_Y1_N26
\lpm_mult_1|auto_generated|op_3~2\ : cycloneii_lcell_comb
-- Equation(s):
-- \lpm_mult_1|auto_generated|op_3~2_combout\ = (\lpm_mult_1|auto_generated|le3a\(1) & (!\lpm_mult_1|auto_generated|op_3~1\)) # (!\lpm_mult_1|auto_generated|le3a\(1) & ((\lpm_mult_1|auto_generated|op_3~1\) # (GND)))
-- \lpm_mult_1|auto_generated|op_3~3\ = CARRY((!\lpm_mult_1|auto_generated|op_3~1\) # (!\lpm_mult_1|auto_generated|le3a\(1)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011110000111111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \lpm_mult_1|auto_generated|le3a\(1),
	datad => VCC,
	cin => \lpm_mult_1|auto_generated|op_3~1\,
	combout => \lpm_mult_1|auto_generated|op_3~2_combout\,
	cout => \lpm_mult_1|auto_generated|op_3~3\);

-- Location: PIN_21,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
\k2x[1]~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "input",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => GND,
	padio => ww_k2x(1),
	combout => \k2x~combout\(1));

-- Location: LCCOMB_X7_Y1_N8
\lpm_mult_2|auto_generated|op_3~0\ : cycloneii_lcell_comb
-- Equation(s):
-- \lpm_mult_2|auto_generated|op_3~0_combout\ = (\lpm_mult_2|auto_generated|le3a\(0) & (\k2x~combout\(1) $ (VCC))) # (!\lpm_mult_2|auto_generated|le3a\(0) & (\k2x~combout\(1) & VCC))
-- \lpm_mult_2|auto_generated|op_3~1\ = CARRY((\lpm_mult_2|auto_generated|le3a\(0) & \k2x~combout\(1)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0110011010001000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \lpm_mult_2|auto_generated|le3a\(0),
	datab => \k2x~combout\(1),
	datad => VCC,
	combout => \lpm_mult_2|auto_generated|op_3~0_combout\,
	cout => \lpm_mult_2|auto_generated|op_3~1\);

-- Location: LCCOMB_X7_Y1_N18
\lpm_add_1|auto_generated|op_1~2\ : cycloneii_lcell_comb
-- Equation(s):
-- \lpm_add_1|auto_generated|op_1~2_combout\ = (\lpm_mult_2|auto_generated|op_3~2_combout\ & ((\lpm_mult_1|auto_generated|op_3~2_combout\ & (\lpm_add_1|auto_generated|op_1~1\ & VCC)) # (!\lpm_mult_1|auto_generated|op_3~2_combout\ & 
-- (!\lpm_add_1|auto_generated|op_1~1\)))) # (!\lpm_mult_2|auto_generated|op_3~2_combout\ & ((\lpm_mult_1|auto_generated|op_3~2_combout\ & (!\lpm_add_1|auto_generated|op_1~1\)) # (!\lpm_mult_1|auto_generated|op_3~2_combout\ & 
-- ((\lpm_add_1|auto_generated|op_1~1\) # (GND)))))
-- \lpm_add_1|auto_generated|op_1~3\ = CARRY((\lpm_mult_2|auto_generated|op_3~2_combout\ & (!\lpm_mult_1|auto_generated|op_3~2_combout\ & !\lpm_add_1|auto_generated|op_1~1\)) # (!\lpm_mult_2|auto_generated|op_3~2_combout\ & 
-- ((!\lpm_add_1|auto_generated|op_1~1\) # (!\lpm_mult_1|auto_generated|op_3~2_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1001011000010111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \lpm_mult_2|auto_generated|op_3~2_combout\,
	datab => \lpm_mult_1|auto_generated|op_3~2_combout\,
	datad => VCC,
	cin => \lpm_add_1|auto_generated|op_1~1\,
	combout => \lpm_add_1|auto_generated|op_1~2_combout\,
	cout => \lpm_add_1|auto_generated|op_1~3\);

-- Location: LCCOMB_X7_Y1_N2
\lpm_ff_cx|dffs[1]~6\ : cycloneii_lcell_comb
-- Equation(s):
-- \lpm_ff_cx|dffs[1]~6_combout\ = (\lpm_mult_3|auto_generated|op_3~2_combout\ & ((\lpm_add_1|auto_generated|op_1~2_combout\ & (\lpm_ff_cx|dffs[0]~5\ & VCC)) # (!\lpm_add_1|auto_generated|op_1~2_combout\ & (!\lpm_ff_cx|dffs[0]~5\)))) # 
-- (!\lpm_mult_3|auto_generated|op_3~2_combout\ & ((\lpm_add_1|auto_generated|op_1~2_combout\ & (!\lpm_ff_cx|dffs[0]~5\)) # (!\lpm_add_1|auto_generated|op_1~2_combout\ & ((\lpm_ff_cx|dffs[0]~5\) # (GND)))))
-- \lpm_ff_cx|dffs[1]~7\ = CARRY((\lpm_mult_3|auto_generated|op_3~2_combout\ & (!\lpm_add_1|auto_generated|op_1~2_combout\ & !\lpm_ff_cx|dffs[0]~5\)) # (!\lpm_mult_3|auto_generated|op_3~2_combout\ & ((!\lpm_ff_cx|dffs[0]~5\) # 
-- (!\lpm_add_1|auto_generated|op_1~2_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1001011000010111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \lpm_mult_3|auto_generated|op_3~2_combout\,
	datab => \lpm_add_1|auto_generated|op_1~2_combout\,
	datad => VCC,
	cin => \lpm_ff_cx|dffs[0]~5\,
	combout => \lpm_ff_cx|dffs[1]~6_combout\,
	cout => \lpm_ff_cx|dffs[1]~7\);

-- Location: LCFF_X7_Y1_N3
\lpm_ff_cx|dffs[1]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \clk~clkctrl_outclk\,
	datain => \lpm_ff_cx|dffs[1]~6_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \lpm_ff_cx|dffs\(1));

-- Location: PIN_22,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
\k3x[2]~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "input",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => GND,
	padio => ww_k3x(2),
	combout => \k3x~combout\(2));

-- Location: PIN_26,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
\k3x[3]~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "input",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => GND,
	padio => ww_k3x(3),
	combout => \k3x~combout\(3));

-- Location: PIN_28,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
\p3[0]~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "input",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => GND,
	padio => ww_p3(0),
	combout => \p3~combout\(0));

-- Location: LCFF_X3_Y1_N23
\lpm_ff_p3|dffs[0]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \clk~clkctrl_outclk\,
	sdata => \p3~combout\(0),
	sload => VCC,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \lpm_ff_p3|dffs\(0));

-- Location: LCCOMB_X3_Y1_N28
\lpm_mult_3|auto_generated|le4a[0]\ : cycloneii_lcell_comb
-- Equation(s):
-- \lpm_mult_3|auto_generated|le4a\(0) = LCELL(\k3x~combout\(3) $ (((\k3x~combout\(1) & ((\k3x~combout\(2)) # (\lpm_ff_p3|dffs\(0)))) # (!\k3x~combout\(1) & (\k3x~combout\(2) & \lpm_ff_p3|dffs\(0))))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0001111001111000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \k3x~combout\(1),
	datab => \k3x~combout\(2),
	datac => \k3x~combout\(3),
	datad => \lpm_ff_p3|dffs\(0),
	combout => \lpm_mult_3|auto_generated|le4a\(0));

-- Location: LCCOMB_X7_Y1_N4
\lpm_ff_cx|dffs[2]~8\ : cycloneii_lcell_comb
-- Equation(s):
-- \lpm_ff_cx|dffs[2]~8_combout\ = ((\lpm_add_1|auto_generated|op_1~4_combout\ $ (\lpm_mult_3|auto_generated|op_3~4_combout\ $ (!\lpm_ff_cx|dffs[1]~7\)))) # (GND)
-- \lpm_ff_cx|dffs[2]~9\ = CARRY((\lpm_add_1|auto_generated|op_1~4_combout\ & ((\lpm_mult_3|auto_generated|op_3~4_combout\) # (!\lpm_ff_cx|dffs[1]~7\))) # (!\lpm_add_1|auto_generated|op_1~4_combout\ & (\lpm_mult_3|auto_generated|op_3~4_combout\ & 
-- !\lpm_ff_cx|dffs[1]~7\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0110100110001110",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \lpm_add_1|auto_generated|op_1~4_combout\,
	datab => \lpm_mult_3|auto_generated|op_3~4_combout\,
	datad => VCC,
	cin => \lpm_ff_cx|dffs[1]~7\,
	combout => \lpm_ff_cx|dffs[2]~8_combout\,
	cout => \lpm_ff_cx|dffs[2]~9\);

-- Location: LCFF_X7_Y1_N5
\lpm_ff_cx|dffs[2]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \clk~clkctrl_outclk\,
	datain => \lpm_ff_cx|dffs[2]~8_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \lpm_ff_cx|dffs\(2));

-- Location: PIN_48,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
\p2[0]~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "input",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => GND,
	padio => ww_p2(0),
	combout => \p2~combout\(0));

-- Location: LCFF_X6_Y1_N31
\lpm_ff_p2|dffs[0]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \clk~clkctrl_outclk\,
	sdata => \p2~combout\(0),
	sload => VCC,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \lpm_ff_p2|dffs\(0));

-- Location: PIN_43,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
\k2x[2]~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "input",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => GND,
	padio => ww_k2x(2),
	combout => \k2x~combout\(2));

-- Location: LCCOMB_X6_Y1_N20
\lpm_mult_2|auto_generated|cs2a[1]~0\ : cycloneii_lcell_comb
-- Equation(s):
-- \lpm_mult_2|auto_generated|cs2a[1]~0_combout\ = \k2x~combout\(1) $ (\k2x~combout\(2))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101010110101010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \k2x~combout\(1),
	datad => \k2x~combout\(2),
	combout => \lpm_mult_2|auto_generated|cs2a[1]~0_combout\);

-- Location: PIN_52,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
\p2[1]~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "input",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => GND,
	padio => ww_p2(1),
	combout => \p2~combout\(1));

-- Location: LCCOMB_X6_Y1_N12
\lpm_ff_p2|dffs[1]~feeder\ : cycloneii_lcell_comb
-- Equation(s):
-- \lpm_ff_p2|dffs[1]~feeder_combout\ = \p2~combout\(1)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datad => \p2~combout\(1),
	combout => \lpm_ff_p2|dffs[1]~feeder_combout\);

-- Location: LCFF_X6_Y1_N13
\lpm_ff_p2|dffs[1]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \clk~clkctrl_outclk\,
	datain => \lpm_ff_p2|dffs[1]~feeder_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \lpm_ff_p2|dffs\(1));

-- Location: LCCOMB_X6_Y1_N16
\lpm_mult_2|auto_generated|le4a[1]\ : cycloneii_lcell_comb
-- Equation(s):
-- \lpm_mult_2|auto_generated|le4a\(1) = LCELL((\lpm_mult_2|auto_generated|cs2a[1]~0_combout\ & (\lpm_mult_2|auto_generated|cs1a[1]~0_combout\ $ (((\lpm_ff_p2|dffs\(1)))))) # (!\lpm_mult_2|auto_generated|cs2a[1]~0_combout\ & 
-- (\lpm_mult_2|auto_generated|cs1a[1]~0_combout\ & (!\lpm_ff_p2|dffs\(0)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101001010100010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \lpm_mult_2|auto_generated|cs1a[1]~0_combout\,
	datab => \lpm_ff_p2|dffs\(0),
	datac => \lpm_mult_2|auto_generated|cs2a[1]~0_combout\,
	datad => \lpm_ff_p2|dffs\(1),
	combout => \lpm_mult_2|auto_generated|le4a\(1));

-- Location: PIN_30,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
\k2x[0]~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "input",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => GND,
	padio => ww_k2x(0),
	combout => \k2x~combout\(0));

-- Location: PIN_42,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
\p2[3]~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "input",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => GND,
	padio => ww_p2(3),
	combout => \p2~combout\(3));

-- Location: LCFF_X6_Y1_N19
\lpm_ff_p2|dffs[3]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \clk~clkctrl_outclk\,
	sdata => \p2~combout\(3),
	sload => VCC,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \lpm_ff_p2|dffs\(3));

-- Location: LCCOMB_X6_Y1_N18
\lpm_mult_2|auto_generated|le3a[3]\ : cycloneii_lcell_comb
-- Equation(s):
-- \lpm_mult_2|auto_generated|le3a\(3) = LCELL((\k2x~combout\(0) & ((\lpm_ff_p2|dffs\(3) $ (\k2x~combout\(1))))) # (!\k2x~combout\(0) & (!\lpm_ff_p2|dffs\(2) & ((\k2x~combout\(1))))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0001110111000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \lpm_ff_p2|dffs\(2),
	datab => \k2x~combout\(0),
	datac => \lpm_ff_p2|dffs\(3),
	datad => \k2x~combout\(1),
	combout => \lpm_mult_2|auto_generated|le3a\(3));

-- Location: LCCOMB_X6_Y1_N30
\lpm_mult_2|auto_generated|cs1a[1]~0\ : cycloneii_lcell_comb
-- Equation(s):
-- \lpm_mult_2|auto_generated|cs1a[1]~0_combout\ = \k2x~combout\(3) $ (((\k2x~combout\(2) & \k2x~combout\(1))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0110011010101010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \k2x~combout\(3),
	datab => \k2x~combout\(2),
	datad => \k2x~combout\(1),
	combout => \lpm_mult_2|auto_generated|cs1a[1]~0_combout\);

-- Location: PIN_45,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
\p2[2]~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "input",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => GND,
	padio => ww_p2(2),
	combout => \p2~combout\(2));

-- Location: LCFF_X6_Y1_N21
\lpm_ff_p2|dffs[2]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \clk~clkctrl_outclk\,
	sdata => \p2~combout\(2),
	sload => VCC,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \lpm_ff_p2|dffs\(2));

-- Location: LCCOMB_X6_Y1_N26
\lpm_mult_2|auto_generated|le3a[2]\ : cycloneii_lcell_comb
-- Equation(s):
-- \lpm_mult_2|auto_generated|le3a\(2) = LCELL((\k2x~combout\(0) & (\k2x~combout\(1) $ ((\lpm_ff_p2|dffs\(2))))) # (!\k2x~combout\(0) & (\k2x~combout\(1) & ((!\lpm_ff_p2|dffs\(1))))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0100100001101010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \k2x~combout\(1),
	datab => \k2x~combout\(0),
	datac => \lpm_ff_p2|dffs\(2),
	datad => \lpm_ff_p2|dffs\(1),
	combout => \lpm_mult_2|auto_generated|le3a\(2));

-- Location: LCCOMB_X6_Y1_N24
\lpm_mult_2|auto_generated|op_1~1\ : cycloneii_lcell_comb
-- Equation(s):
-- \lpm_mult_2|auto_generated|op_1~1_combout\ = \lpm_mult_2|auto_generated|le3a\(3) $ (((\lpm_mult_2|auto_generated|cs1a[1]~0_combout\ & \lpm_mult_2|auto_generated|le3a\(2))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011110011001100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \lpm_mult_2|auto_generated|le3a\(3),
	datac => \lpm_mult_2|auto_generated|cs1a[1]~0_combout\,
	datad => \lpm_mult_2|auto_generated|le3a\(2),
	combout => \lpm_mult_2|auto_generated|op_1~1_combout\);

-- Location: PIN_40,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
\k2x[3]~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "input",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => GND,
	padio => ww_k2x(3),
	combout => \k2x~combout\(3));

-- Location: LCCOMB_X6_Y1_N28
\lpm_mult_2|auto_generated|op_1~0\ : cycloneii_lcell_comb
-- Equation(s):
-- \lpm_mult_2|auto_generated|op_1~0_combout\ = \k2x~combout\(3) $ (\lpm_mult_2|auto_generated|le3a\(2) $ (((\k2x~combout\(1) & \k2x~combout\(2)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1000011101111000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \k2x~combout\(1),
	datab => \k2x~combout\(2),
	datac => \k2x~combout\(3),
	datad => \lpm_mult_2|auto_generated|le3a\(2),
	combout => \lpm_mult_2|auto_generated|op_1~0_combout\);

-- Location: LCCOMB_X6_Y1_N22
\lpm_mult_2|auto_generated|le3a[1]\ : cycloneii_lcell_comb
-- Equation(s):
-- \lpm_mult_2|auto_generated|le3a\(1) = LCELL((\k2x~combout\(0) & (\k2x~combout\(1) $ (((\lpm_ff_p2|dffs\(1)))))) # (!\k2x~combout\(0) & (\k2x~combout\(1) & (!\lpm_ff_p2|dffs\(0)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0100011010001010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \k2x~combout\(1),
	datab => \k2x~combout\(0),
	datac => \lpm_ff_p2|dffs\(0),
	datad => \lpm_ff_p2|dffs\(1),
	combout => \lpm_mult_2|auto_generated|le3a\(1));

-- Location: LCCOMB_X7_Y1_N14
\lpm_mult_2|auto_generated|op_3~6\ : cycloneii_lcell_comb
-- Equation(s):
-- \lpm_mult_2|auto_generated|op_3~6_combout\ = \lpm_mult_2|auto_generated|le4a\(1) $ (\lpm_mult_2|auto_generated|op_3~5\ $ (\lpm_mult_2|auto_generated|op_1~1_combout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100001100111100",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \lpm_mult_2|auto_generated|le4a\(1),
	datad => \lpm_mult_2|auto_generated|op_1~1_combout\,
	cin => \lpm_mult_2|auto_generated|op_3~5\,
	combout => \lpm_mult_2|auto_generated|op_3~6_combout\);

-- Location: PIN_60,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
\k1x[2]~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "input",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => GND,
	padio => ww_k1x(2),
	combout => \k1x~combout\(2));

-- Location: LCCOMB_X8_Y1_N26
\lpm_mult_1|auto_generated|cs1a[1]~0\ : cycloneii_lcell_comb
-- Equation(s):
-- \lpm_mult_1|auto_generated|cs1a[1]~0_combout\ = \k1x~combout\(3) $ (((\k1x~combout\(1) & \k1x~combout\(2))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0110011010101010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \k1x~combout\(3),
	datab => \k1x~combout\(1),
	datad => \k1x~combout\(2),
	combout => \lpm_mult_1|auto_generated|cs1a[1]~0_combout\);

-- Location: LCCOMB_X8_Y1_N20
\lpm_mult_1|auto_generated|le4a[1]\ : cycloneii_lcell_comb
-- Equation(s):
-- \lpm_mult_1|auto_generated|le4a\(1) = LCELL((\lpm_mult_1|auto_generated|cs2a[1]~0_combout\ & (\lpm_mult_1|auto_generated|cs1a[1]~0_combout\ $ (((\lpm_ff_p1|dffs\(1)))))) # (!\lpm_mult_1|auto_generated|cs2a[1]~0_combout\ & 
-- (\lpm_mult_1|auto_generated|cs1a[1]~0_combout\ & (!\lpm_ff_p1|dffs\(0)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0010011010001100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \lpm_mult_1|auto_generated|cs2a[1]~0_combout\,
	datab => \lpm_mult_1|auto_generated|cs1a[1]~0_combout\,
	datac => \lpm_ff_p1|dffs\(0),
	datad => \lpm_ff_p1|dffs\(1),
	combout => \lpm_mult_1|auto_generated|le4a\(1));

-- Location: PIN_59,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
\p1[2]~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "input",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => GND,
	padio => ww_p1(2),
	combout => \p1~combout\(2));

-- Location: LCFF_X8_Y1_N5
\lpm_ff_p1|dffs[2]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \clk~clkctrl_outclk\,
	sdata => \p1~combout\(2),
	sload => VCC,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \lpm_ff_p1|dffs\(2));

-- Location: PIN_63,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
\p1[3]~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "input",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => GND,
	padio => ww_p1(3),
	combout => \p1~combout\(3));

-- Location: LCFF_X8_Y1_N23
\lpm_ff_p1|dffs[3]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \clk~clkctrl_outclk\,
	sdata => \p1~combout\(3),
	sload => VCC,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \lpm_ff_p1|dffs\(3));

-- Location: LCCOMB_X8_Y1_N22
\lpm_mult_1|auto_generated|le3a[3]\ : cycloneii_lcell_comb
-- Equation(s):
-- \lpm_mult_1|auto_generated|le3a\(3) = LCELL((\k1x~combout\(0) & ((\lpm_ff_p1|dffs\(3) $ (\k1x~combout\(1))))) # (!\k1x~combout\(0) & (!\lpm_ff_p1|dffs\(2) & ((\k1x~combout\(1))))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0001101110100000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \k1x~combout\(0),
	datab => \lpm_ff_p1|dffs\(2),
	datac => \lpm_ff_p1|dffs\(3),
	datad => \k1x~combout\(1),
	combout => \lpm_mult_1|auto_generated|le3a\(3));

-- Location: LCCOMB_X8_Y1_N30
\lpm_mult_1|auto_generated|le3a[2]\ : cycloneii_lcell_comb
-- Equation(s):
-- \lpm_mult_1|auto_generated|le3a\(2) = LCELL((\k1x~combout\(0) & (\k1x~combout\(1) $ ((\lpm_ff_p1|dffs\(2))))) # (!\k1x~combout\(0) & (\k1x~combout\(1) & ((!\lpm_ff_p1|dffs\(1))))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0010100001101100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \k1x~combout\(0),
	datab => \k1x~combout\(1),
	datac => \lpm_ff_p1|dffs\(2),
	datad => \lpm_ff_p1|dffs\(1),
	combout => \lpm_mult_1|auto_generated|le3a\(2));

-- Location: LCCOMB_X8_Y1_N24
\lpm_mult_1|auto_generated|op_1~1\ : cycloneii_lcell_comb
-- Equation(s):
-- \lpm_mult_1|auto_generated|op_1~1_combout\ = \lpm_mult_1|auto_generated|le3a\(3) $ (((\lpm_mult_1|auto_generated|cs1a[1]~0_combout\ & \lpm_mult_1|auto_generated|le3a\(2))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0110011011001100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \lpm_mult_1|auto_generated|cs1a[1]~0_combout\,
	datab => \lpm_mult_1|auto_generated|le3a\(3),
	datad => \lpm_mult_1|auto_generated|le3a\(2),
	combout => \lpm_mult_1|auto_generated|op_1~1_combout\);

-- Location: PIN_57,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
\k1x[3]~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "input",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => GND,
	padio => ww_k1x(3),
	combout => \k1x~combout\(3));

-- Location: LCCOMB_X8_Y1_N12
\lpm_mult_1|auto_generated|op_1~0\ : cycloneii_lcell_comb
-- Equation(s):
-- \lpm_mult_1|auto_generated|op_1~0_combout\ = \k1x~combout\(3) $ (\lpm_mult_1|auto_generated|le3a\(2) $ (((\k1x~combout\(2) & \k1x~combout\(1)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1000011101111000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \k1x~combout\(2),
	datab => \k1x~combout\(1),
	datac => \k1x~combout\(3),
	datad => \lpm_mult_1|auto_generated|le3a\(2),
	combout => \lpm_mult_1|auto_generated|op_1~0_combout\);

-- Location: LCCOMB_X7_Y1_N28
\lpm_mult_1|auto_generated|op_3~4\ : cycloneii_lcell_comb
-- Equation(s):
-- \lpm_mult_1|auto_generated|op_3~4_combout\ = ((\lpm_mult_1|auto_generated|le4a\(0) $ (\lpm_mult_1|auto_generated|op_1~0_combout\ $ (!\lpm_mult_1|auto_generated|op_3~3\)))) # (GND)
-- \lpm_mult_1|auto_generated|op_3~5\ = CARRY((\lpm_mult_1|auto_generated|le4a\(0) & ((\lpm_mult_1|auto_generated|op_1~0_combout\) # (!\lpm_mult_1|auto_generated|op_3~3\))) # (!\lpm_mult_1|auto_generated|le4a\(0) & (\lpm_mult_1|auto_generated|op_1~0_combout\ 
-- & !\lpm_mult_1|auto_generated|op_3~3\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0110100110001110",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \lpm_mult_1|auto_generated|le4a\(0),
	datab => \lpm_mult_1|auto_generated|op_1~0_combout\,
	datad => VCC,
	cin => \lpm_mult_1|auto_generated|op_3~3\,
	combout => \lpm_mult_1|auto_generated|op_3~4_combout\,
	cout => \lpm_mult_1|auto_generated|op_3~5\);

-- Location: LCCOMB_X7_Y1_N30
\lpm_mult_1|auto_generated|op_3~6\ : cycloneii_lcell_comb
-- Equation(s):
-- \lpm_mult_1|auto_generated|op_3~6_combout\ = \lpm_mult_1|auto_generated|le4a\(1) $ (\lpm_mult_1|auto_generated|op_3~5\ $ (\lpm_mult_1|auto_generated|op_1~1_combout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100001100111100",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \lpm_mult_1|auto_generated|le4a\(1),
	datad => \lpm_mult_1|auto_generated|op_1~1_combout\,
	cin => \lpm_mult_1|auto_generated|op_3~5\,
	combout => \lpm_mult_1|auto_generated|op_3~6_combout\);

-- Location: LCCOMB_X7_Y1_N22
\lpm_add_1|auto_generated|op_1~6\ : cycloneii_lcell_comb
-- Equation(s):
-- \lpm_add_1|auto_generated|op_1~6_combout\ = \lpm_mult_2|auto_generated|op_3~6_combout\ $ (\lpm_add_1|auto_generated|op_1~5\ $ (\lpm_mult_1|auto_generated|op_3~6_combout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100001100111100",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \lpm_mult_2|auto_generated|op_3~6_combout\,
	datad => \lpm_mult_1|auto_generated|op_3~6_combout\,
	cin => \lpm_add_1|auto_generated|op_1~5\,
	combout => \lpm_add_1|auto_generated|op_1~6_combout\);

-- Location: LCCOMB_X7_Y1_N6
\lpm_ff_cx|dffs[3]~10\ : cycloneii_lcell_comb
-- Equation(s):
-- \lpm_ff_cx|dffs[3]~10_combout\ = \lpm_mult_3|auto_generated|op_3~6_combout\ $ (\lpm_ff_cx|dffs[2]~9\ $ (\lpm_add_1|auto_generated|op_1~6_combout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010010101011010",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \lpm_mult_3|auto_generated|op_3~6_combout\,
	datad => \lpm_add_1|auto_generated|op_1~6_combout\,
	cin => \lpm_ff_cx|dffs[2]~9\,
	combout => \lpm_ff_cx|dffs[3]~10_combout\);

-- Location: LCFF_X7_Y1_N7
\lpm_ff_cx|dffs[3]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \clk~clkctrl_outclk\,
	datain => \lpm_ff_cx|dffs[3]~10_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \lpm_ff_cx|dffs\(3));

-- Location: PIN_47,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
\cx[0]~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "output",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	datain => \lpm_ff_cx|dffs\(0),
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => VCC,
	padio => ww_cx(0));

-- Location: PIN_41,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
\cx[1]~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "output",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	datain => \lpm_ff_cx|dffs\(1),
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => VCC,
	padio => ww_cx(1));

-- Location: PIN_44,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
\cx[2]~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "output",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	datain => \lpm_ff_cx|dffs\(2),
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => VCC,
	padio => ww_cx(2));

-- Location: PIN_51,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
\cx[3]~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "output",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	datain => \lpm_ff_cx|dffs\(3),
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => VCC,
	padio => ww_cx(3));
END structure;


