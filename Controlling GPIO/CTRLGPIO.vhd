----------------------------------------------------------------------------------------------------
--					©2022 - 2032 Siavash Taher Parvar All Rights Reserved.
--
--				Project Name: CTRLGPIO
--		  @Brief Description: Simple control on GPIOs
--				 File Status:	CHECKED
--						(DRAFT , PRILIMINARY, CHECKED, RELEASED)
--	File Name:	CTRLGPIO.vhd
--	Version:		01
--	Revision:	00
--	Date:			09/25/2022
--	Company:		Mend0z0
--	Client:		------------
--	License:		Private License (Contact for more info.)
--	-------------------------------- Project Description -------------------------------------------
--	@Detailed Description: In this project we just want to control GPIOs and turning on/off the output
--	LED regarding the KEY_0 status. Each time the KEY_0 is pressed the LED will toggle.
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
entity CTRLGPIO is 
	port (
				KEY_0 : IN 		STD_LOGIC;
				LED_0	: INOUT	STD_LOGIC
	);
end CTRLGPIO;

-----------------------------------------------------------------------------------------------------
----------------------------      ARCHITECTURE DECLARATION     --------------------------------------
-----------------------------------------------------------------------------------------------------
architecture bhv of CTRLGPIO is
	begin
		process( KEY_0 )
			begin
				if KEY_0'event and KEY_0 = '1' then
					LED_0 <= LED_0 XOR '1';
				end if;
		end process;
end bhv;

--------------------------   (C)SIAVASH TAHER PARVAR ALL RIGHTS RESERVED   ------------------------
------------------------------------     END OF THE FILE      -------------------------------------