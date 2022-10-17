----------------------------------------------------------------------------------------------------
--					©2022 - 2032 Siavash Taher Parvar All Rights Reserved.
--
--				Project Name: DisplayDriver
--		  @Brief Description: HD44780 Driver
--				 File Status:	PRILIMINARY
--						(DRAFT , PRILIMINARY, CHECKED, RELEASED)
--	File Name:	HD44780_Drv.vhd
--	Version:		01
--	Revision:	00
--	Date:			10/01/2022
--	Company:		Mend0z0
--	Client:		------------
--	License:		Private License (Contact for more info.)
--	-------------------------------- Project Description -------------------------------------------
--	@Detailed Description: 
--
--
--	-------------------------------- File Description ----------------------------------------------
--	@Detailed Description:
--
--
--
--	---------------------------------  Processor Info ----------------------------------------------
--	FPGA:									EP4CE22F17C6N
--	RAM Size:							608256	Bits
--	Num of IO:							153
--	Num of LABs/CLBs:					1395
--	Num of Logic Elements/Cells:	22320
--	-----------------------------------  Case Style  -----------------------------------------------
--	 = camelCase			 = g_camelCase
--	 = SCREAMIN_SNAKE_CASE
--	 = PascalCase				 = _lower_case
--	 = lower_case				 = camelCase
--	 = lower_case				 = SNAKE_CASE
--	 = p_camelCase
--	----------------------------------- Contact Info -----------------------------------------------
--	Author:	Siavash Taher Parvar
--	Email:  	s.taherparvar@gmail.com
--	Github:	github.com/mend0z0
----------------------------------------------------------------------------------------------------

-----------------------------------------------------------------------------------------------------
----------------------------         PIN LOOKUP TABLE         --------------------------------------
-----------------------------------------------------------------------------------------------------
-- LED 1	--> A13 - DIFFIO_T22n
-- LED 2 --> B13 - DIFFIO_T22p/DQ5T
-- LED 3 --> A11 - DIFFIO_T20n/DQ5T
-- LED 4 --> D1  - DIFFIO_L4N
-- LED 5 --> F3  - IO/VREFB1N0
-- LED 6 --> B1  - DQS2L/CQ3L,CDPCLK0
-- LED 7 --> L3  - IO/VREFB2N0

-- KEY 0 --> J15 - DIFFIO_R9p/DEV_CLRn
-- KEY 1 --> E1  - CLK1/DIFFCLK_0n

-- SW	 0 --> M1  - CLK3/DIFFCLK_1n
-- SW	 1 --> T8  - CLK14/DIFFCLK_6n
--	SW	 2 --> B9  - CLK9/DIFFCLK_5p
-- SW	 3 --> M15 - CLK6/DIFFCLK_3p

-----------------------------------------------------------------------------------------------------
----------------------------       LIBRARIES DECLARATION       --------------------------------------
-----------------------------------------------------------------------------------------------------
library ieee;
use ieee.std_logic_1164.all;

-----------------------------------------------------------------------------------------------------
------------------------------      ENTITY DECLARATION       ----------------------------------------
-----------------------------------------------------------------------------------------------------
entity HD44780_Drv is 
	port (
				pinDB:		OUT		STD_LOGIC_VECTOR(7 downto 0)	:= "00000000";
				pinE:			OUT		STD_LOGIC							:= '0';
				pinRS:		OUT		STD_LOGIC							:= '0';
				pinRW:		OUT		STD_LOGIC							:= '0';
				inputData:	INOUT		STD_LOGIC_VECTOR(7 downto 0)	:= "00000000"
	);
end HD44780_Drv;

-----------------------------------------------------------------------------------------------------
----------------------------      ARCHITECTURE DECLARATION     --------------------------------------
-----------------------------------------------------------------------------------------------------
architecture bhv of HD44780_Drv is
	constant CLR_DIS				:	integer	:= "00000001";	--	Clears entire display and sets DDRAM address 0 in address counter.
	constant	RET_HOME				:	integer	:= "00000011";	--	Sets DDRAM address 0 in address counter. Also returns display from being shifted to original position. DDRAM contents remain unchanged.
	constant	ENTRY_MOD_SET		:	integer	:= "00000111";	--	Sets cursor move direction and specifies display shift. These operations are performed during data write and read.
	constant DIS_ON_OFF			:	integer	:= "00001110";	--	Sets entire display (D) on/off, cursor on/off (C), and blinking of cursor position character (B).
	constant CURSOR_DIS_SHIFT	:	integer	:= "00010100";	--	Moves cursor and shifts display without changing DDRAM contents. 
	constant FUNC_SET				:	integer	:= "00111000";	--	Sets interface data length (DL), number of display lines(N), and character font (F).
	constant SET_CGRAM_ADDR		:	integer	:= "01000000";	--	Sets CGRAM address. CGRAM data is sent and received after this setting.
	constant SET_DDRAM_ADDR		:	integer	:= "10000000";	--	Sets DDRAM address. DDRAM data is sent and received after this setting.
	constant READ_BUSY_FLAG		:	integer	:= "10000000";	--	 Reads busy flag (BF) indicating internal operation is being performed and reads address counter contents.
end bhv;

--------------------------   (C)SIAVASH TAHER PARVAR ALL RIGHTS RESERVED   ------------------------
------------------------------------     END OF THE FILE      -------------------------------------