
## VGA Connector
#NET "vgaRed<0>"		LOC = "A3"	| IOSTANDARD = "LVCMOS33";		#Bank = 35, Pin name = IO_L8N_T1_AD14N_35,					Sch name = VGA_R0
#NET "vgaRed<1>"		LOC = "B4"	| IOSTANDARD = "LVCMOS33";		#Bank = 35, Pin name = IO_L7N_T1_AD6N_35,					Sch name = VGA_R1
#NET "vgaRed<2>"		LOC = "C5"	| IOSTANDARD = "LVCMOS33";		#Bank = 35, Pin name = IO_L1N_T0_AD4N_35,					Sch name = VGA_R2
#NET "vgaRed<3>"		LOC = "A4"	| IOSTANDARD = "LVCMOS33";		#Bank = 35, Pin name = IO_L8P_T1_AD14P_35,					Sch name = VGA_R3
#NET "vgaBlue<0>"		LOC = "B7"	| IOSTANDARD = "LVCMOS33";		#Bank = 35, Pin name = IO_L2P_T0_AD12P_35,					Sch name = VGA_B0
#NET "vgaBlue<1>"		LOC = "C7"	| IOSTANDARD = "LVCMOS33";		#Bank = 35, Pin name = IO_L4N_T0_35,						Sch name = VGA_B1
#NET "vgaBlue<2>"		LOC = "D7"	| IOSTANDARD = "LVCMOS33";		#Bank = 35, Pin name = IO_L6N_T0_VREF_35,					Sch name = VGA_B2
#NET "vgaBlue<3>"		LOC = "D8"	| IOSTANDARD = "LVCMOS33";		#Bank = 35, Pin name = IO_L4P_T0_35,						Sch name = VGA_B3
#NET "vgaGreen<0>"		LOC = "C6"	| IOSTANDARD = "LVCMOS33";		#Bank = 35, Pin name = IO_L1P_T0_AD4P_35,					Sch name = VGA_G0
#NET "vgaGreen<1>"		LOC = "A5"	| IOSTANDARD = "LVCMOS33";		#Bank = 35, Pin name = IO_L3N_T0_DQS_AD5N_35,				Sch name = VGA_G1
#NET "vgaGreen<2>"		LOC = "B6"	| IOSTANDARD = "LVCMOS33";		#Bank = 35, Pin name = IO_L2N_T0_AD12N_35,					Sch name = VGA_G2
#NET "vgaGreen<3>"		LOC = "A6"	| IOSTANDARD = "LVCMOS33";		#Bank = 35, Pin name = IO_L3P_T0_DQS_AD5P_35,				Sch name = VGA_G3
#NET "Hsync"			LOC = "B11"	| IOSTANDARD = "LVCMOS33";		#Bank = 15, Pin name = IO_L4P_T0_15,						Sch name = VGA_HS
#NET "Vsync"			LOC = "B12"	| IOSTANDARD = "LVCMOS33";		#Bank = 15, Pin name = IO_L3N_T0_DQS_AD1N_15,				Sch name = VGA_BVS

## Micro SD Connector
#NET "sdReset"			LOC = "E2"  | IOSTANDARD = "LVCMOS33";		#Bank = 35, Pin name = IO_L14P_T2_SRCC_35,					Sch name = SD_RESET
#NET "sdCD"				LOC = "A1"  | IOSTANDARD = "LVCMOS33";		#Bank = 35, Pin name = IO_L9N_T1_DQS_AD7N_35,				Sch name = SD_CD
#NET "sdSCK"			LOC = "B1"  | IOSTANDARD = "LVCMOS33";		#Bank = 35, Pin name = IO_L9P_T1_DQS_AD7P_35,				Sch name = SD_SCK
#NET "sdCmd"			LOC = "C1"  | IOSTANDARD = "LVCMOS33";		#Bank = 35, Pin name = IO_L16N_T2_35,						Sch name = SD_CMD
#NET "sdData<0>"		LOC = "C2"  | IOSTANDARD = "LVCMOS33";		#Bank = 35, Pin name = IO_L16P_T2_35,							Sch name = SD_DAT0
#NET "sdData<1>" 		LOC = "E1"  | IOSTANDARD = "LVCMOS33";		#Bank = 35, Pin name = IO_L18N_T2_35,						Sch name = SD_DAT1
#NET "sdData<2>"		LOC = "F1"  | IOSTANDARD = "LVCMOS33";		#Bank = 35, Pin name = IO_L18P_T2_35,						Sch name = SD_DAT2
#NET "sdData<3>"		LOC = "D2"  | IOSTANDARD = "LVCMOS33";		#Bank = 35, Pin name = IO_L14N_T2_SRCC_35,					Sch name = SD_DAT3

## Accelerometer
#NET "aclMISO"			LOC = "D13"	| IOSTANDARD = "LVCMOS33";		#Bank = 15, Pin name = IO_L6N_T0_VREF_15,					Sch name = ACL_MISO
#NET "aclMOSI"			LOC = "B14"	| IOSTANDARD = "LVCMOS33";		#Bank = 15, Pin name = IO_L2N_T0_AD8N_15,					Sch name = ACL_MOSI
#NET "aclSCK"			LOC = "D15"	| IOSTANDARD = "LVCMOS33";		#Bank = 15, Pin name = IO_L12P_T1_MRCC_15,					Sch name = ACL_SCLK
#NET "aclSS"			LOC = "C15"	| IOSTANDARD = "LVCMOS33";		#Bank = 15, Pin name = IO_L12N_T1_MRCC_15,					Sch name = ACL_CSN
#NET "aclInt1"			LOC = "C16"	| IOSTANDARD = "LVCMOS33";		#Bank = 15, Pin name = IO_L20P_T3_A20_15,					Sch name = ACL_INT1
#NET "aclInt2"			LOC = "E15"	| IOSTANDARD = "LVCMOS33";		#Bank = 15, Pin name = IO_L11P_T1_SRCC_15,					Sch name = ACL_INT2

## Temperature Sensor
#NET "tmpSCL"			LOC = "F16"	| IOSTANDARD = "LVCMOS33";		#Bank = 15, Pin name = IO_L14N_T2_SRCC_15,					Sch name = TMP_SCL
#NET "tmpSDA"			LOC = "G16"	| IOSTANDARD = "LVCMOS33";		#Bank = 15, Pin name = IO_L13N_T2_MRCC_15,					Sch name = TMP_SDA
#NET "tmpInt"			LOC = "D14"	| IOSTANDARD = "LVCMOS33";		#Bank = 15, Pin name = IO_L1P_T0_AD0P_15,					Sch name = TMP_INT
#NET "tmpCT"			LOC = "C14"	| IOSTANDARD = "LVCMOS33";		#Bank = 15, Pin name = IO_L1N_T0_AD0N_15,					Sch name = TMP_CT

## Omnidirectional Microphone
#NET "micClk"			LOC = "J5"	| IOSTANDARD = "LVCMOS33";		#Bank = 35, Pin name = IO_25_35,								Sch name = M_CLK
#NET "micData"			LOC = "H5"	| IOSTANDARD = "LVCMOS33";		#Bank = 35, Pin name = IO_L24N_T3_35,						Sch name = M_DATA
#NET "micLRSel"			LOC = "F5"	| IOSTANDARD = "LVCMOS33";		#Bank = 35, Pin name = IO_0_35,								Sch name = M_LRSEL


## USB HID (PS/2)
#NET "PS2Clk"			LOC = "F4"	| PULLUP | IOSTANDARD = "LVCMOS33";		#Bank = 35, Pin name = IO_L13P_T2_MRCC_35,					Sch name = PS2_CLK
#NET "PS2Data"			LOC = "B2"	| PULLUP | IOSTANDARD = "LVCMOS33";		#Bank = 35, Pin name = IO_L10N_T1_AD15N_35,					Sch name = PS2_DATA


## Quad SPI Flash
#NET "QspiSCK"			LOC = "E9"	| IOSTANDARD = "LVCMOS33";		#Bank = CONFIG, Pin name = CCLK_0,							Sch name = QSPI_SCK
#NET "QspiDB<0>"			LOC = "K17"	| IOSTANDARD = "LVCMOS33";		#Bank = CONFIG, Pin name = IO_L1P_T0_D00_MOSI_14,			Sch name = QSPI_DQ0
#NET "QspiDB<1>"			LOC = "K18"	| IOSTANDARD = "LVCMOS33";		#Bank = CONFIG, Pin name = IO_L1N_T0_D01_DIN_14,			Sch name = QSPI_DQ1
#NET "QspiDB<2>"			LOC = "L14"	| IOSTANDARD = "LVCMOS33";		#Bank = CONFIG, Pin name = IO_L20_T0_D02_14,				Sch name = QSPI_DQ2
#NET "QspiDB<3>"			LOC = "M14"	| IOSTANDARD = "LVCMOS33";		#Bank = CONFIG, Pin name = IO_L2P_T0_D03_14,				Sch name = QSPI_DQ3
#NET "QspiCSn"			LOC = "L13"	| IOSTANDARD = "LVCMOS33";		#Bank = CONFIG, Pin name = IO_L15N_T2_DQS_DOUT_CSO_B_14,	Sch name = QSPI_CSN

#NET "RGB1_Red"			LOC = "K5"	| IOSTANDARD = "LVCMOS33";		#Bank = 34, Pin name = IO_L5P_T0_34,						Sch name = LED16_R
#NET "RGB1_Green"		LOC = "F13"	| IOSTANDARD = "LVCMOS33";		#Bank = 15, Pin name = IO_L5P_T0_AD9P_15,					Sch name = LED16_G
#NET "RGB1_Blue"		LOC = "F6"	| IOSTANDARD = "LVCMOS33";		#Bank = 35, Pin name = IO_L19N_T3_VREF_35,					Sch name = LED16_B
#NET "RGB2_Red"			LOC = "K6"	| IOSTANDARD = "LVCMOS33";		#Bank = 34, Pin name = IO_0_34,								Sch name = LED17_R
#NET "RGB2_Green"		LOC = "H6"	| IOSTANDARD = "LVCMOS33";		#Bank = 35, Pin name = IO_24P_T3_35,						Sch name =  LED17_G
#NET "RGB2_Blue"		LOC = "L16"	| IOSTANDARD = "LVCMOS33";		#Bank = CONFIG, Pin name = IO_L3N_T0_DQS_EMCCLK_14,			Sch name = LED17_B

## 7 segment display
#NET "seg<0>"			LOC = "L3"	| IOSTANDARD = "LVCMOS33";		#Bank = 34, Pin name = IO_L2N_T0_34,						Sch name = CA
#NET "seg<1>"			LOC = "N1"	| IOSTANDARD = "LVCMOS33";		#Bank = 34, Pin name = IO_L3N_T0_DQS_34,					Sch name = CB
#NET "seg<2>"			LOC = "L5"	| IOSTANDARD = "LVCMOS33";		#Bank = 34, Pin name = IO_L6N_T0_VREF_34,					Sch name = CC
#NET "seg<3>"			LOC = "L4"	| IOSTANDARD = "LVCMOS33";		#Bank = 34, Pin name = IO_L5N_T0_34,						Sch name = CD
#NET "seg<4>"			LOC = "K3"	| IOSTANDARD = "LVCMOS33";		#Bank = 34, Pin name = IO_L2P_T0_34,						Sch name = CE
#NET "seg<5>"			LOC = "M2"	| IOSTANDARD = "LVCMOS33";		#Bank = 34, Pin name = IO_L4N_T0_34,						Sch name = CF
#NET "seg<6>"			LOC = "L6"	| IOSTANDARD = "LVCMOS33";		#Bank = 34, Pin name = IO_L6P_T0_34,						Sch name = CG

#NET "dp"				LOC = "M4"	| IOSTANDARD = "LVCMOS33";		#Bank = 34, Pin name = IO_L16P_T2_34,						Sch name = DP

#NET "an<0>"			LOC = "N6"	| IOSTANDARD = "LVCMOS33";		#Bank = 34, Pin name = IO_L18N_T2_34,						Sch name = AN0
#NET "an<1>"			LOC = "M6"	| IOSTANDARD = "LVCMOS33";		#Bank = 34, Pin name = IO_L18P_T2_34,						Sch name = AN1
#NET "an<2>"			LOC = "M3"	| IOSTANDARD = "LVCMOS33";		#Bank = 34, Pin name = IO_L4P_T0_34,						Sch name = AN2
#NET "an<3>"			LOC = "N5"	| IOSTANDARD = "LVCMOS33";		#Bank = 34, Pin name = IO_L13_T2_MRCC_34,					Sch name = AN3
#NET "an<4>"			LOC = "N2"	| IOSTANDARD = "LVCMOS33";		#Bank = 34, Pin name = IO_L3P_T0_DQS_34,					Sch name = AN4
#NET "an<5>"			LOC = "N4"	| IOSTANDARD = "LVCMOS33";		#Bank = 34, Pin name = IO_L16N_T2_34,						Sch name = AN5
#NET "an<6>"			LOC = "L1"	| IOSTANDARD = "LVCMOS33";		#Bank = 34, Pin name = IO_L1P_T0_34,						Sch name = AN6
#NET "an<7>"			LOC = "M1"	| IOSTANDARD = "LVCMOS33";		#Bank = 34, Pin name = IO_L1N_T034,							Sch name = AN7
