-- Copyright (C) 2022  Intel Corporation. All rights reserved.
-- Your use of Intel Corporation's design tools, logic functions 
-- and other software and tools, and any partner logic 
-- functions, and any output files from any of the foregoing 
-- (including device programming or simulation files), and any 
-- associated documentation or information are expressly subject 
-- to the terms and conditions of the Intel Program License 
-- Subscription Agreement, the Intel Quartus Prime License Agreement,
-- the Intel FPGA IP License Agreement, or other applicable license
-- agreement, including, without limitation, that your use is for
-- the sole purpose of programming logic devices manufactured by
-- Intel and sold by Intel or its authorized distributors.  Please
-- refer to the applicable agreement for further details, at
-- https://fpgasoftware.intel.com/eula.

-- VENDOR "Altera"
-- PROGRAM "Quartus Prime"
-- VERSION "Version 22.1std.0 Build 915 10/25/2022 SC Lite Edition"

-- DATE "12/18/2022 15:56:49"

-- 
-- Device: Altera EP4CE6E22C8 Package TQFP144
-- 

-- 
-- This VHDL file should be used for ModelSim (VHDL) only
-- 

LIBRARY CYCLONEIVE;
LIBRARY IEEE;
USE CYCLONEIVE.CYCLONEIVE_COMPONENTS.ALL;
USE IEEE.STD_LOGIC_1164.ALL;

ENTITY 	hard_block IS
    PORT (
	devoe : IN std_logic;
	devclrn : IN std_logic;
	devpor : IN std_logic
	);
END hard_block;

-- Design Ports Information
-- ~ALTERA_ASDO_DATA1~	=>  Location: PIN_6,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- ~ALTERA_FLASH_nCE_nCSO~	=>  Location: PIN_8,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- ~ALTERA_DCLK~	=>  Location: PIN_12,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- ~ALTERA_DATA0~	=>  Location: PIN_13,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- ~ALTERA_nCEO~	=>  Location: PIN_101,	 I/O Standard: 2.5 V,	 Current Strength: 8mA


ARCHITECTURE structure OF hard_block IS
SIGNAL gnd : std_logic := '0';
SIGNAL vcc : std_logic := '1';
SIGNAL unknown : std_logic := 'X';
SIGNAL ww_devoe : std_logic;
SIGNAL ww_devclrn : std_logic;
SIGNAL ww_devpor : std_logic;
SIGNAL \~ALTERA_ASDO_DATA1~~padout\ : std_logic;
SIGNAL \~ALTERA_FLASH_nCE_nCSO~~padout\ : std_logic;
SIGNAL \~ALTERA_DATA0~~padout\ : std_logic;
SIGNAL \~ALTERA_ASDO_DATA1~~ibuf_o\ : std_logic;
SIGNAL \~ALTERA_FLASH_nCE_nCSO~~ibuf_o\ : std_logic;
SIGNAL \~ALTERA_DATA0~~ibuf_o\ : std_logic;

BEGIN

ww_devoe <= devoe;
ww_devclrn <= devclrn;
ww_devpor <= devpor;
END structure;


LIBRARY ALTERA;
LIBRARY CYCLONEIVE;
LIBRARY IEEE;
USE ALTERA.ALTERA_PRIMITIVES_COMPONENTS.ALL;
USE CYCLONEIVE.CYCLONEIVE_COMPONENTS.ALL;
USE IEEE.STD_LOGIC_1164.ALL;

ENTITY 	Sandbox IS
    PORT (
	in_clk_50mhz : IN std_logic;
	in_keys : IN std_logic_vector(3 DOWNTO 0);
	out_leds : BUFFER std_logic_vector(3 DOWNTO 0);
	out_7seg : BUFFER std_logic_vector(7 DOWNTO 0);
	out_7segDigitSelect : BUFFER std_logic_vector(3 DOWNTO 0);
	out_buzzer : BUFFER std_logic
	);
END Sandbox;

-- Design Ports Information
-- in_keys[0]	=>  Location: PIN_88,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- in_keys[1]	=>  Location: PIN_89,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- in_keys[2]	=>  Location: PIN_90,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- in_keys[3]	=>  Location: PIN_91,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- out_leds[0]	=>  Location: PIN_87,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- out_leds[1]	=>  Location: PIN_86,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- out_leds[2]	=>  Location: PIN_85,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- out_leds[3]	=>  Location: PIN_84,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- out_7seg[0]	=>  Location: PIN_128,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- out_7seg[1]	=>  Location: PIN_121,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- out_7seg[2]	=>  Location: PIN_125,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- out_7seg[3]	=>  Location: PIN_129,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- out_7seg[4]	=>  Location: PIN_132,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- out_7seg[5]	=>  Location: PIN_126,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- out_7seg[6]	=>  Location: PIN_124,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- out_7seg[7]	=>  Location: PIN_127,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- out_7segDigitSelect[0]	=>  Location: PIN_133,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- out_7segDigitSelect[1]	=>  Location: PIN_135,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- out_7segDigitSelect[2]	=>  Location: PIN_136,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- out_7segDigitSelect[3]	=>  Location: PIN_137,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- out_buzzer	=>  Location: PIN_110,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- in_clk_50mhz	=>  Location: PIN_23,	 I/O Standard: 2.5 V,	 Current Strength: Default


ARCHITECTURE structure OF Sandbox IS
SIGNAL gnd : std_logic := '0';
SIGNAL vcc : std_logic := '1';
SIGNAL unknown : std_logic := 'X';
SIGNAL devoe : std_logic := '1';
SIGNAL devclrn : std_logic := '1';
SIGNAL devpor : std_logic := '1';
SIGNAL ww_devoe : std_logic;
SIGNAL ww_devclrn : std_logic;
SIGNAL ww_devpor : std_logic;
SIGNAL ww_in_clk_50mhz : std_logic;
SIGNAL ww_in_keys : std_logic_vector(3 DOWNTO 0);
SIGNAL ww_out_leds : std_logic_vector(3 DOWNTO 0);
SIGNAL ww_out_7seg : std_logic_vector(7 DOWNTO 0);
SIGNAL ww_out_7segDigitSelect : std_logic_vector(3 DOWNTO 0);
SIGNAL ww_out_buzzer : std_logic;
SIGNAL \in_clk_50mhz~inputclkctrl_INCLK_bus\ : std_logic_vector(3 DOWNTO 0);
SIGNAL \in_keys[0]~input_o\ : std_logic;
SIGNAL \in_keys[1]~input_o\ : std_logic;
SIGNAL \in_keys[2]~input_o\ : std_logic;
SIGNAL \in_keys[3]~input_o\ : std_logic;
SIGNAL \out_leds[0]~output_o\ : std_logic;
SIGNAL \out_leds[1]~output_o\ : std_logic;
SIGNAL \out_leds[2]~output_o\ : std_logic;
SIGNAL \out_leds[3]~output_o\ : std_logic;
SIGNAL \out_7seg[0]~output_o\ : std_logic;
SIGNAL \out_7seg[1]~output_o\ : std_logic;
SIGNAL \out_7seg[2]~output_o\ : std_logic;
SIGNAL \out_7seg[3]~output_o\ : std_logic;
SIGNAL \out_7seg[4]~output_o\ : std_logic;
SIGNAL \out_7seg[5]~output_o\ : std_logic;
SIGNAL \out_7seg[6]~output_o\ : std_logic;
SIGNAL \out_7seg[7]~output_o\ : std_logic;
SIGNAL \out_7segDigitSelect[0]~output_o\ : std_logic;
SIGNAL \out_7segDigitSelect[1]~output_o\ : std_logic;
SIGNAL \out_7segDigitSelect[2]~output_o\ : std_logic;
SIGNAL \out_7segDigitSelect[3]~output_o\ : std_logic;
SIGNAL \out_buzzer~output_o\ : std_logic;
SIGNAL \in_clk_50mhz~input_o\ : std_logic;
SIGNAL \in_clk_50mhz~inputclkctrl_outclk\ : std_logic;
SIGNAL \clk_counter[0]~72_combout\ : std_logic;
SIGNAL \clk_counter[1]~24_combout\ : std_logic;
SIGNAL \clk_counter[1]~25\ : std_logic;
SIGNAL \clk_counter[2]~26_combout\ : std_logic;
SIGNAL \clk_counter[2]~27\ : std_logic;
SIGNAL \clk_counter[3]~28_combout\ : std_logic;
SIGNAL \clk_counter[3]~29\ : std_logic;
SIGNAL \clk_counter[4]~30_combout\ : std_logic;
SIGNAL \clk_counter[4]~31\ : std_logic;
SIGNAL \clk_counter[5]~32_combout\ : std_logic;
SIGNAL \clk_counter[5]~33\ : std_logic;
SIGNAL \clk_counter[6]~34_combout\ : std_logic;
SIGNAL \clk_counter[6]~35\ : std_logic;
SIGNAL \clk_counter[7]~36_combout\ : std_logic;
SIGNAL \clk_counter[7]~37\ : std_logic;
SIGNAL \clk_counter[8]~38_combout\ : std_logic;
SIGNAL \clk_counter[8]~39\ : std_logic;
SIGNAL \clk_counter[9]~40_combout\ : std_logic;
SIGNAL \clk_counter[9]~41\ : std_logic;
SIGNAL \clk_counter[10]~42_combout\ : std_logic;
SIGNAL \clk_counter[10]~43\ : std_logic;
SIGNAL \clk_counter[11]~44_combout\ : std_logic;
SIGNAL \clk_counter[11]~45\ : std_logic;
SIGNAL \clk_counter[12]~46_combout\ : std_logic;
SIGNAL \clk_counter[12]~47\ : std_logic;
SIGNAL \clk_counter[13]~48_combout\ : std_logic;
SIGNAL \clk_counter[13]~49\ : std_logic;
SIGNAL \clk_counter[14]~50_combout\ : std_logic;
SIGNAL \clk_counter[14]~51\ : std_logic;
SIGNAL \clk_counter[15]~52_combout\ : std_logic;
SIGNAL \clk_counter[15]~53\ : std_logic;
SIGNAL \clk_counter[16]~54_combout\ : std_logic;
SIGNAL \clk_counter[16]~55\ : std_logic;
SIGNAL \clk_counter[17]~56_combout\ : std_logic;
SIGNAL \clk_counter[17]~57\ : std_logic;
SIGNAL \clk_counter[18]~58_combout\ : std_logic;
SIGNAL \clk_counter[18]~59\ : std_logic;
SIGNAL \clk_counter[19]~60_combout\ : std_logic;
SIGNAL \clk_counter[19]~61\ : std_logic;
SIGNAL \clk_counter[20]~62_combout\ : std_logic;
SIGNAL \clk_counter[20]~63\ : std_logic;
SIGNAL \clk_counter[21]~64_combout\ : std_logic;
SIGNAL \clk_counter[21]~65\ : std_logic;
SIGNAL \clk_counter[22]~66_combout\ : std_logic;
SIGNAL \clk_counter[22]~67\ : std_logic;
SIGNAL \clk_counter[23]~68_combout\ : std_logic;
SIGNAL \clk_counter[23]~69\ : std_logic;
SIGNAL \clk_counter[24]~70_combout\ : std_logic;
SIGNAL \helper~0_combout\ : std_logic;
SIGNAL \helper~q\ : std_logic;
SIGNAL clk_counter : std_logic_vector(24 DOWNTO 0);

COMPONENT hard_block
    PORT (
	devoe : IN std_logic;
	devclrn : IN std_logic;
	devpor : IN std_logic);
END COMPONENT;

BEGIN

ww_in_clk_50mhz <= in_clk_50mhz;
ww_in_keys <= in_keys;
out_leds <= ww_out_leds;
out_7seg <= ww_out_7seg;
out_7segDigitSelect <= ww_out_7segDigitSelect;
out_buzzer <= ww_out_buzzer;
ww_devoe <= devoe;
ww_devclrn <= devclrn;
ww_devpor <= devpor;

\in_clk_50mhz~inputclkctrl_INCLK_bus\ <= (vcc & vcc & vcc & \in_clk_50mhz~input_o\);
auto_generated_inst : hard_block
PORT MAP (
	devoe => ww_devoe,
	devclrn => ww_devclrn,
	devpor => ww_devpor);

-- Location: IOOBUF_X34_Y10_N9
\out_leds[0]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \helper~q\,
	devoe => ww_devoe,
	o => \out_leds[0]~output_o\);

-- Location: IOOBUF_X34_Y9_N2
\out_leds[1]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => VCC,
	devoe => ww_devoe,
	o => \out_leds[1]~output_o\);

-- Location: IOOBUF_X34_Y9_N9
\out_leds[2]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => VCC,
	devoe => ww_devoe,
	o => \out_leds[2]~output_o\);

-- Location: IOOBUF_X34_Y9_N16
\out_leds[3]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => VCC,
	devoe => ww_devoe,
	o => \out_leds[3]~output_o\);

-- Location: IOOBUF_X16_Y24_N16
\out_7seg[0]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => VCC,
	devoe => ww_devoe,
	o => \out_7seg[0]~output_o\);

-- Location: IOOBUF_X23_Y24_N16
\out_7seg[1]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => VCC,
	devoe => ww_devoe,
	o => \out_7seg[1]~output_o\);

-- Location: IOOBUF_X18_Y24_N23
\out_7seg[2]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => VCC,
	devoe => ww_devoe,
	o => \out_7seg[2]~output_o\);

-- Location: IOOBUF_X16_Y24_N23
\out_7seg[3]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => VCC,
	devoe => ww_devoe,
	o => \out_7seg[3]~output_o\);

-- Location: IOOBUF_X13_Y24_N16
\out_7seg[4]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => VCC,
	devoe => ww_devoe,
	o => \out_7seg[4]~output_o\);

-- Location: IOOBUF_X16_Y24_N2
\out_7seg[5]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => VCC,
	devoe => ww_devoe,
	o => \out_7seg[5]~output_o\);

-- Location: IOOBUF_X18_Y24_N16
\out_7seg[6]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => VCC,
	devoe => ww_devoe,
	o => \out_7seg[6]~output_o\);

-- Location: IOOBUF_X16_Y24_N9
\out_7seg[7]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => VCC,
	devoe => ww_devoe,
	o => \out_7seg[7]~output_o\);

-- Location: IOOBUF_X13_Y24_N23
\out_7segDigitSelect[0]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => VCC,
	devoe => ww_devoe,
	o => \out_7segDigitSelect[0]~output_o\);

-- Location: IOOBUF_X11_Y24_N16
\out_7segDigitSelect[1]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => VCC,
	devoe => ww_devoe,
	o => \out_7segDigitSelect[1]~output_o\);

-- Location: IOOBUF_X9_Y24_N9
\out_7segDigitSelect[2]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => VCC,
	devoe => ww_devoe,
	o => \out_7segDigitSelect[2]~output_o\);

-- Location: IOOBUF_X7_Y24_N2
\out_7segDigitSelect[3]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => VCC,
	devoe => ww_devoe,
	o => \out_7segDigitSelect[3]~output_o\);

-- Location: IOOBUF_X30_Y24_N2
\out_buzzer~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => GND,
	devoe => ww_devoe,
	o => \out_buzzer~output_o\);

-- Location: IOIBUF_X0_Y11_N8
\in_clk_50mhz~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_in_clk_50mhz,
	o => \in_clk_50mhz~input_o\);

-- Location: CLKCTRL_G2
\in_clk_50mhz~inputclkctrl\ : cycloneive_clkctrl
-- pragma translate_off
GENERIC MAP (
	clock_type => "global clock",
	ena_register_mode => "none")
-- pragma translate_on
PORT MAP (
	inclk => \in_clk_50mhz~inputclkctrl_INCLK_bus\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	outclk => \in_clk_50mhz~inputclkctrl_outclk\);

-- Location: LCCOMB_X33_Y11_N4
\clk_counter[0]~72\ : cycloneive_lcell_comb
-- Equation(s):
-- \clk_counter[0]~72_combout\ = !clk_counter(0)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000111100001111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => clk_counter(0),
	combout => \clk_counter[0]~72_combout\);

-- Location: FF_X33_Y11_N5
\clk_counter[0]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \in_clk_50mhz~inputclkctrl_outclk\,
	d => \clk_counter[0]~72_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => clk_counter(0));

-- Location: LCCOMB_X33_Y11_N8
\clk_counter[1]~24\ : cycloneive_lcell_comb
-- Equation(s):
-- \clk_counter[1]~24_combout\ = (clk_counter(1) & (clk_counter(0) $ (VCC))) # (!clk_counter(1) & (clk_counter(0) & VCC))
-- \clk_counter[1]~25\ = CARRY((clk_counter(1) & clk_counter(0)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0110011010001000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => clk_counter(1),
	datab => clk_counter(0),
	datad => VCC,
	combout => \clk_counter[1]~24_combout\,
	cout => \clk_counter[1]~25\);

-- Location: FF_X33_Y11_N9
\clk_counter[1]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \in_clk_50mhz~inputclkctrl_outclk\,
	d => \clk_counter[1]~24_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => clk_counter(1));

-- Location: LCCOMB_X33_Y11_N10
\clk_counter[2]~26\ : cycloneive_lcell_comb
-- Equation(s):
-- \clk_counter[2]~26_combout\ = (clk_counter(2) & (!\clk_counter[1]~25\)) # (!clk_counter(2) & ((\clk_counter[1]~25\) # (GND)))
-- \clk_counter[2]~27\ = CARRY((!\clk_counter[1]~25\) # (!clk_counter(2)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101101001011111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => clk_counter(2),
	datad => VCC,
	cin => \clk_counter[1]~25\,
	combout => \clk_counter[2]~26_combout\,
	cout => \clk_counter[2]~27\);

-- Location: FF_X33_Y11_N11
\clk_counter[2]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \in_clk_50mhz~inputclkctrl_outclk\,
	d => \clk_counter[2]~26_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => clk_counter(2));

-- Location: LCCOMB_X33_Y11_N12
\clk_counter[3]~28\ : cycloneive_lcell_comb
-- Equation(s):
-- \clk_counter[3]~28_combout\ = (clk_counter(3) & (\clk_counter[2]~27\ $ (GND))) # (!clk_counter(3) & (!\clk_counter[2]~27\ & VCC))
-- \clk_counter[3]~29\ = CARRY((clk_counter(3) & !\clk_counter[2]~27\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010010100001010",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => clk_counter(3),
	datad => VCC,
	cin => \clk_counter[2]~27\,
	combout => \clk_counter[3]~28_combout\,
	cout => \clk_counter[3]~29\);

-- Location: FF_X33_Y11_N13
\clk_counter[3]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \in_clk_50mhz~inputclkctrl_outclk\,
	d => \clk_counter[3]~28_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => clk_counter(3));

-- Location: LCCOMB_X33_Y11_N14
\clk_counter[4]~30\ : cycloneive_lcell_comb
-- Equation(s):
-- \clk_counter[4]~30_combout\ = (clk_counter(4) & (!\clk_counter[3]~29\)) # (!clk_counter(4) & ((\clk_counter[3]~29\) # (GND)))
-- \clk_counter[4]~31\ = CARRY((!\clk_counter[3]~29\) # (!clk_counter(4)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011110000111111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => clk_counter(4),
	datad => VCC,
	cin => \clk_counter[3]~29\,
	combout => \clk_counter[4]~30_combout\,
	cout => \clk_counter[4]~31\);

-- Location: FF_X33_Y11_N15
\clk_counter[4]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \in_clk_50mhz~inputclkctrl_outclk\,
	d => \clk_counter[4]~30_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => clk_counter(4));

-- Location: LCCOMB_X33_Y11_N16
\clk_counter[5]~32\ : cycloneive_lcell_comb
-- Equation(s):
-- \clk_counter[5]~32_combout\ = (clk_counter(5) & (\clk_counter[4]~31\ $ (GND))) # (!clk_counter(5) & (!\clk_counter[4]~31\ & VCC))
-- \clk_counter[5]~33\ = CARRY((clk_counter(5) & !\clk_counter[4]~31\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100001100001100",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => clk_counter(5),
	datad => VCC,
	cin => \clk_counter[4]~31\,
	combout => \clk_counter[5]~32_combout\,
	cout => \clk_counter[5]~33\);

-- Location: FF_X33_Y11_N17
\clk_counter[5]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \in_clk_50mhz~inputclkctrl_outclk\,
	d => \clk_counter[5]~32_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => clk_counter(5));

-- Location: LCCOMB_X33_Y11_N18
\clk_counter[6]~34\ : cycloneive_lcell_comb
-- Equation(s):
-- \clk_counter[6]~34_combout\ = (clk_counter(6) & (!\clk_counter[5]~33\)) # (!clk_counter(6) & ((\clk_counter[5]~33\) # (GND)))
-- \clk_counter[6]~35\ = CARRY((!\clk_counter[5]~33\) # (!clk_counter(6)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011110000111111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => clk_counter(6),
	datad => VCC,
	cin => \clk_counter[5]~33\,
	combout => \clk_counter[6]~34_combout\,
	cout => \clk_counter[6]~35\);

-- Location: FF_X33_Y11_N19
\clk_counter[6]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \in_clk_50mhz~inputclkctrl_outclk\,
	d => \clk_counter[6]~34_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => clk_counter(6));

-- Location: LCCOMB_X33_Y11_N20
\clk_counter[7]~36\ : cycloneive_lcell_comb
-- Equation(s):
-- \clk_counter[7]~36_combout\ = (clk_counter(7) & (\clk_counter[6]~35\ $ (GND))) # (!clk_counter(7) & (!\clk_counter[6]~35\ & VCC))
-- \clk_counter[7]~37\ = CARRY((clk_counter(7) & !\clk_counter[6]~35\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100001100001100",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => clk_counter(7),
	datad => VCC,
	cin => \clk_counter[6]~35\,
	combout => \clk_counter[7]~36_combout\,
	cout => \clk_counter[7]~37\);

-- Location: FF_X33_Y11_N21
\clk_counter[7]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \in_clk_50mhz~inputclkctrl_outclk\,
	d => \clk_counter[7]~36_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => clk_counter(7));

-- Location: LCCOMB_X33_Y11_N22
\clk_counter[8]~38\ : cycloneive_lcell_comb
-- Equation(s):
-- \clk_counter[8]~38_combout\ = (clk_counter(8) & (!\clk_counter[7]~37\)) # (!clk_counter(8) & ((\clk_counter[7]~37\) # (GND)))
-- \clk_counter[8]~39\ = CARRY((!\clk_counter[7]~37\) # (!clk_counter(8)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101101001011111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => clk_counter(8),
	datad => VCC,
	cin => \clk_counter[7]~37\,
	combout => \clk_counter[8]~38_combout\,
	cout => \clk_counter[8]~39\);

-- Location: FF_X33_Y11_N23
\clk_counter[8]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \in_clk_50mhz~inputclkctrl_outclk\,
	d => \clk_counter[8]~38_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => clk_counter(8));

-- Location: LCCOMB_X33_Y11_N24
\clk_counter[9]~40\ : cycloneive_lcell_comb
-- Equation(s):
-- \clk_counter[9]~40_combout\ = (clk_counter(9) & (\clk_counter[8]~39\ $ (GND))) # (!clk_counter(9) & (!\clk_counter[8]~39\ & VCC))
-- \clk_counter[9]~41\ = CARRY((clk_counter(9) & !\clk_counter[8]~39\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100001100001100",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => clk_counter(9),
	datad => VCC,
	cin => \clk_counter[8]~39\,
	combout => \clk_counter[9]~40_combout\,
	cout => \clk_counter[9]~41\);

-- Location: FF_X33_Y11_N25
\clk_counter[9]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \in_clk_50mhz~inputclkctrl_outclk\,
	d => \clk_counter[9]~40_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => clk_counter(9));

-- Location: LCCOMB_X33_Y11_N26
\clk_counter[10]~42\ : cycloneive_lcell_comb
-- Equation(s):
-- \clk_counter[10]~42_combout\ = (clk_counter(10) & (!\clk_counter[9]~41\)) # (!clk_counter(10) & ((\clk_counter[9]~41\) # (GND)))
-- \clk_counter[10]~43\ = CARRY((!\clk_counter[9]~41\) # (!clk_counter(10)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101101001011111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => clk_counter(10),
	datad => VCC,
	cin => \clk_counter[9]~41\,
	combout => \clk_counter[10]~42_combout\,
	cout => \clk_counter[10]~43\);

-- Location: FF_X33_Y11_N27
\clk_counter[10]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \in_clk_50mhz~inputclkctrl_outclk\,
	d => \clk_counter[10]~42_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => clk_counter(10));

-- Location: LCCOMB_X33_Y11_N28
\clk_counter[11]~44\ : cycloneive_lcell_comb
-- Equation(s):
-- \clk_counter[11]~44_combout\ = (clk_counter(11) & (\clk_counter[10]~43\ $ (GND))) # (!clk_counter(11) & (!\clk_counter[10]~43\ & VCC))
-- \clk_counter[11]~45\ = CARRY((clk_counter(11) & !\clk_counter[10]~43\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100001100001100",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => clk_counter(11),
	datad => VCC,
	cin => \clk_counter[10]~43\,
	combout => \clk_counter[11]~44_combout\,
	cout => \clk_counter[11]~45\);

-- Location: FF_X33_Y11_N29
\clk_counter[11]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \in_clk_50mhz~inputclkctrl_outclk\,
	d => \clk_counter[11]~44_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => clk_counter(11));

-- Location: LCCOMB_X33_Y11_N30
\clk_counter[12]~46\ : cycloneive_lcell_comb
-- Equation(s):
-- \clk_counter[12]~46_combout\ = (clk_counter(12) & (!\clk_counter[11]~45\)) # (!clk_counter(12) & ((\clk_counter[11]~45\) # (GND)))
-- \clk_counter[12]~47\ = CARRY((!\clk_counter[11]~45\) # (!clk_counter(12)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101101001011111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => clk_counter(12),
	datad => VCC,
	cin => \clk_counter[11]~45\,
	combout => \clk_counter[12]~46_combout\,
	cout => \clk_counter[12]~47\);

-- Location: FF_X33_Y11_N31
\clk_counter[12]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \in_clk_50mhz~inputclkctrl_outclk\,
	d => \clk_counter[12]~46_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => clk_counter(12));

-- Location: LCCOMB_X33_Y10_N0
\clk_counter[13]~48\ : cycloneive_lcell_comb
-- Equation(s):
-- \clk_counter[13]~48_combout\ = (clk_counter(13) & (\clk_counter[12]~47\ $ (GND))) # (!clk_counter(13) & (!\clk_counter[12]~47\ & VCC))
-- \clk_counter[13]~49\ = CARRY((clk_counter(13) & !\clk_counter[12]~47\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100001100001100",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => clk_counter(13),
	datad => VCC,
	cin => \clk_counter[12]~47\,
	combout => \clk_counter[13]~48_combout\,
	cout => \clk_counter[13]~49\);

-- Location: FF_X33_Y10_N1
\clk_counter[13]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \in_clk_50mhz~inputclkctrl_outclk\,
	d => \clk_counter[13]~48_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => clk_counter(13));

-- Location: LCCOMB_X33_Y10_N2
\clk_counter[14]~50\ : cycloneive_lcell_comb
-- Equation(s):
-- \clk_counter[14]~50_combout\ = (clk_counter(14) & (!\clk_counter[13]~49\)) # (!clk_counter(14) & ((\clk_counter[13]~49\) # (GND)))
-- \clk_counter[14]~51\ = CARRY((!\clk_counter[13]~49\) # (!clk_counter(14)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011110000111111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => clk_counter(14),
	datad => VCC,
	cin => \clk_counter[13]~49\,
	combout => \clk_counter[14]~50_combout\,
	cout => \clk_counter[14]~51\);

-- Location: FF_X33_Y10_N3
\clk_counter[14]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \in_clk_50mhz~inputclkctrl_outclk\,
	d => \clk_counter[14]~50_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => clk_counter(14));

-- Location: LCCOMB_X33_Y10_N4
\clk_counter[15]~52\ : cycloneive_lcell_comb
-- Equation(s):
-- \clk_counter[15]~52_combout\ = (clk_counter(15) & (\clk_counter[14]~51\ $ (GND))) # (!clk_counter(15) & (!\clk_counter[14]~51\ & VCC))
-- \clk_counter[15]~53\ = CARRY((clk_counter(15) & !\clk_counter[14]~51\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100001100001100",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => clk_counter(15),
	datad => VCC,
	cin => \clk_counter[14]~51\,
	combout => \clk_counter[15]~52_combout\,
	cout => \clk_counter[15]~53\);

-- Location: FF_X33_Y10_N5
\clk_counter[15]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \in_clk_50mhz~inputclkctrl_outclk\,
	d => \clk_counter[15]~52_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => clk_counter(15));

-- Location: LCCOMB_X33_Y10_N6
\clk_counter[16]~54\ : cycloneive_lcell_comb
-- Equation(s):
-- \clk_counter[16]~54_combout\ = (clk_counter(16) & (!\clk_counter[15]~53\)) # (!clk_counter(16) & ((\clk_counter[15]~53\) # (GND)))
-- \clk_counter[16]~55\ = CARRY((!\clk_counter[15]~53\) # (!clk_counter(16)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101101001011111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => clk_counter(16),
	datad => VCC,
	cin => \clk_counter[15]~53\,
	combout => \clk_counter[16]~54_combout\,
	cout => \clk_counter[16]~55\);

-- Location: FF_X33_Y10_N7
\clk_counter[16]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \in_clk_50mhz~inputclkctrl_outclk\,
	d => \clk_counter[16]~54_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => clk_counter(16));

-- Location: LCCOMB_X33_Y10_N8
\clk_counter[17]~56\ : cycloneive_lcell_comb
-- Equation(s):
-- \clk_counter[17]~56_combout\ = (clk_counter(17) & (\clk_counter[16]~55\ $ (GND))) # (!clk_counter(17) & (!\clk_counter[16]~55\ & VCC))
-- \clk_counter[17]~57\ = CARRY((clk_counter(17) & !\clk_counter[16]~55\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100001100001100",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => clk_counter(17),
	datad => VCC,
	cin => \clk_counter[16]~55\,
	combout => \clk_counter[17]~56_combout\,
	cout => \clk_counter[17]~57\);

-- Location: FF_X33_Y10_N9
\clk_counter[17]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \in_clk_50mhz~inputclkctrl_outclk\,
	d => \clk_counter[17]~56_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => clk_counter(17));

-- Location: LCCOMB_X33_Y10_N10
\clk_counter[18]~58\ : cycloneive_lcell_comb
-- Equation(s):
-- \clk_counter[18]~58_combout\ = (clk_counter(18) & (!\clk_counter[17]~57\)) # (!clk_counter(18) & ((\clk_counter[17]~57\) # (GND)))
-- \clk_counter[18]~59\ = CARRY((!\clk_counter[17]~57\) # (!clk_counter(18)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101101001011111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => clk_counter(18),
	datad => VCC,
	cin => \clk_counter[17]~57\,
	combout => \clk_counter[18]~58_combout\,
	cout => \clk_counter[18]~59\);

-- Location: FF_X33_Y10_N11
\clk_counter[18]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \in_clk_50mhz~inputclkctrl_outclk\,
	d => \clk_counter[18]~58_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => clk_counter(18));

-- Location: LCCOMB_X33_Y10_N12
\clk_counter[19]~60\ : cycloneive_lcell_comb
-- Equation(s):
-- \clk_counter[19]~60_combout\ = (clk_counter(19) & (\clk_counter[18]~59\ $ (GND))) # (!clk_counter(19) & (!\clk_counter[18]~59\ & VCC))
-- \clk_counter[19]~61\ = CARRY((clk_counter(19) & !\clk_counter[18]~59\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010010100001010",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => clk_counter(19),
	datad => VCC,
	cin => \clk_counter[18]~59\,
	combout => \clk_counter[19]~60_combout\,
	cout => \clk_counter[19]~61\);

-- Location: FF_X33_Y10_N13
\clk_counter[19]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \in_clk_50mhz~inputclkctrl_outclk\,
	d => \clk_counter[19]~60_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => clk_counter(19));

-- Location: LCCOMB_X33_Y10_N14
\clk_counter[20]~62\ : cycloneive_lcell_comb
-- Equation(s):
-- \clk_counter[20]~62_combout\ = (clk_counter(20) & (!\clk_counter[19]~61\)) # (!clk_counter(20) & ((\clk_counter[19]~61\) # (GND)))
-- \clk_counter[20]~63\ = CARRY((!\clk_counter[19]~61\) # (!clk_counter(20)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011110000111111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => clk_counter(20),
	datad => VCC,
	cin => \clk_counter[19]~61\,
	combout => \clk_counter[20]~62_combout\,
	cout => \clk_counter[20]~63\);

-- Location: FF_X33_Y10_N15
\clk_counter[20]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \in_clk_50mhz~inputclkctrl_outclk\,
	d => \clk_counter[20]~62_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => clk_counter(20));

-- Location: LCCOMB_X33_Y10_N16
\clk_counter[21]~64\ : cycloneive_lcell_comb
-- Equation(s):
-- \clk_counter[21]~64_combout\ = (clk_counter(21) & (\clk_counter[20]~63\ $ (GND))) # (!clk_counter(21) & (!\clk_counter[20]~63\ & VCC))
-- \clk_counter[21]~65\ = CARRY((clk_counter(21) & !\clk_counter[20]~63\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100001100001100",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => clk_counter(21),
	datad => VCC,
	cin => \clk_counter[20]~63\,
	combout => \clk_counter[21]~64_combout\,
	cout => \clk_counter[21]~65\);

-- Location: FF_X33_Y10_N17
\clk_counter[21]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \in_clk_50mhz~inputclkctrl_outclk\,
	d => \clk_counter[21]~64_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => clk_counter(21));

-- Location: LCCOMB_X33_Y10_N18
\clk_counter[22]~66\ : cycloneive_lcell_comb
-- Equation(s):
-- \clk_counter[22]~66_combout\ = (clk_counter(22) & (!\clk_counter[21]~65\)) # (!clk_counter(22) & ((\clk_counter[21]~65\) # (GND)))
-- \clk_counter[22]~67\ = CARRY((!\clk_counter[21]~65\) # (!clk_counter(22)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011110000111111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => clk_counter(22),
	datad => VCC,
	cin => \clk_counter[21]~65\,
	combout => \clk_counter[22]~66_combout\,
	cout => \clk_counter[22]~67\);

-- Location: FF_X33_Y10_N19
\clk_counter[22]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \in_clk_50mhz~inputclkctrl_outclk\,
	d => \clk_counter[22]~66_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => clk_counter(22));

-- Location: LCCOMB_X33_Y10_N20
\clk_counter[23]~68\ : cycloneive_lcell_comb
-- Equation(s):
-- \clk_counter[23]~68_combout\ = (clk_counter(23) & (\clk_counter[22]~67\ $ (GND))) # (!clk_counter(23) & (!\clk_counter[22]~67\ & VCC))
-- \clk_counter[23]~69\ = CARRY((clk_counter(23) & !\clk_counter[22]~67\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100001100001100",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => clk_counter(23),
	datad => VCC,
	cin => \clk_counter[22]~67\,
	combout => \clk_counter[23]~68_combout\,
	cout => \clk_counter[23]~69\);

-- Location: FF_X33_Y10_N21
\clk_counter[23]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \in_clk_50mhz~inputclkctrl_outclk\,
	d => \clk_counter[23]~68_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => clk_counter(23));

-- Location: LCCOMB_X33_Y10_N22
\clk_counter[24]~70\ : cycloneive_lcell_comb
-- Equation(s):
-- \clk_counter[24]~70_combout\ = \clk_counter[23]~69\ $ (clk_counter(24))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000111111110000",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datad => clk_counter(24),
	cin => \clk_counter[23]~69\,
	combout => \clk_counter[24]~70_combout\);

-- Location: FF_X33_Y10_N23
\clk_counter[24]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \in_clk_50mhz~inputclkctrl_outclk\,
	d => \clk_counter[24]~70_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => clk_counter(24));

-- Location: LCCOMB_X33_Y10_N28
\helper~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \helper~0_combout\ = !\helper~q\

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000111100001111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \helper~q\,
	combout => \helper~0_combout\);

-- Location: FF_X33_Y10_N29
helper : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => clk_counter(24),
	d => \helper~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \helper~q\);

-- Location: IOIBUF_X34_Y12_N22
\in_keys[0]~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_in_keys(0),
	o => \in_keys[0]~input_o\);

-- Location: IOIBUF_X34_Y12_N15
\in_keys[1]~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_in_keys(1),
	o => \in_keys[1]~input_o\);

-- Location: IOIBUF_X34_Y12_N8
\in_keys[2]~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_in_keys(2),
	o => \in_keys[2]~input_o\);

-- Location: IOIBUF_X34_Y12_N1
\in_keys[3]~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_in_keys(3),
	o => \in_keys[3]~input_o\);

ww_out_leds(0) <= \out_leds[0]~output_o\;

ww_out_leds(1) <= \out_leds[1]~output_o\;

ww_out_leds(2) <= \out_leds[2]~output_o\;

ww_out_leds(3) <= \out_leds[3]~output_o\;

ww_out_7seg(0) <= \out_7seg[0]~output_o\;

ww_out_7seg(1) <= \out_7seg[1]~output_o\;

ww_out_7seg(2) <= \out_7seg[2]~output_o\;

ww_out_7seg(3) <= \out_7seg[3]~output_o\;

ww_out_7seg(4) <= \out_7seg[4]~output_o\;

ww_out_7seg(5) <= \out_7seg[5]~output_o\;

ww_out_7seg(6) <= \out_7seg[6]~output_o\;

ww_out_7seg(7) <= \out_7seg[7]~output_o\;

ww_out_7segDigitSelect(0) <= \out_7segDigitSelect[0]~output_o\;

ww_out_7segDigitSelect(1) <= \out_7segDigitSelect[1]~output_o\;

ww_out_7segDigitSelect(2) <= \out_7segDigitSelect[2]~output_o\;

ww_out_7segDigitSelect(3) <= \out_7segDigitSelect[3]~output_o\;

ww_out_buzzer <= \out_buzzer~output_o\;
END structure;


