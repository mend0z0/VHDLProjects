-- Copyright (C) 1991-2015 Altera Corporation. All rights reserved.
-- Your use of Altera Corporation's design tools, logic functions 
-- and other software and tools, and its AMPP partner logic 
-- functions, and any output files from any of the foregoing 
-- (including device programming or simulation files), and any 
-- associated documentation or information are expressly subject 
-- to the terms and conditions of the Altera Program License 
-- Subscription Agreement, the Altera Quartus II License Agreement,
-- the Altera MegaCore Function License Agreement, or other 
-- applicable license agreement, including, without limitation, 
-- that your use is for the sole purpose of programming logic 
-- devices manufactured by Altera and sold by Altera or its 
-- authorized distributors.  Please refer to the applicable 
-- agreement for further details.

-- VENDOR "Altera"
-- PROGRAM "Quartus II 64-Bit"
-- VERSION "Version 15.0.0 Build 145 04/22/2015 SJ Web Edition"

-- DATE "09/26/2022 00:40:50"

-- 
-- Device: Altera EP4CE22F17C6 Package FBGA256
-- 

-- 
-- This VHDL file should be used for ModelSim-Altera (VHDL) only
-- 

LIBRARY ALTERA;
LIBRARY CYCLONEIVE;
LIBRARY IEEE;
USE ALTERA.ALTERA_PRIMITIVES_COMPONENTS.ALL;
USE CYCLONEIVE.CYCLONEIVE_COMPONENTS.ALL;
USE IEEE.STD_LOGIC_1164.ALL;

ENTITY 	CTRLGPIO IS
    PORT (
	KEY_0 : IN std_logic;
	LED_0 : INOUT std_logic
	);
END CTRLGPIO;

-- Design Ports Information
-- LED_0	=>  Location: PIN_A13,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- KEY_0	=>  Location: PIN_J15,	 I/O Standard: 2.5 V,	 Current Strength: Default


ARCHITECTURE structure OF CTRLGPIO IS
SIGNAL gnd : std_logic := '0';
SIGNAL vcc : std_logic := '1';
SIGNAL unknown : std_logic := 'X';
SIGNAL devoe : std_logic := '1';
SIGNAL devclrn : std_logic := '1';
SIGNAL devpor : std_logic := '1';
SIGNAL ww_devoe : std_logic;
SIGNAL ww_devclrn : std_logic;
SIGNAL ww_devpor : std_logic;
SIGNAL ww_KEY_0 : std_logic;
SIGNAL \LED_0~input_o\ : std_logic;
SIGNAL \LED_0~output_o\ : std_logic;
SIGNAL \KEY_0~input_o\ : std_logic;
SIGNAL \LED_0~2_combout\ : std_logic;
SIGNAL \LED_0~reg0_q\ : std_logic;

BEGIN

ww_KEY_0 <= KEY_0;
ww_devoe <= devoe;
ww_devclrn <= devclrn;
ww_devpor <= devpor;

-- Location: IOOBUF_X49_Y34_N2
\LED_0~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \LED_0~reg0_q\,
	oe => VCC,
	devoe => ww_devoe,
	o => \LED_0~output_o\);

-- Location: IOIBUF_X53_Y14_N1
\KEY_0~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_KEY_0,
	o => \KEY_0~input_o\);

-- Location: LCCOMB_X52_Y14_N8
\LED_0~2\ : cycloneive_lcell_comb
-- Equation(s):
-- \LED_0~2_combout\ = !\LED_0~reg0_q\

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000111100001111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \LED_0~reg0_q\,
	combout => \LED_0~2_combout\);

-- Location: FF_X52_Y14_N9
\LED_0~reg0\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \KEY_0~input_o\,
	d => \LED_0~2_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \LED_0~reg0_q\);

-- Location: IOIBUF_X49_Y34_N1
\LED_0~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => LED_0,
	o => \LED_0~input_o\);

LED_0 <= \LED_0~output_o\;
END structure;


