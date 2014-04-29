
 
## Pmod Header JA
#NET "JA<0>"			LOC = "B13"	| IOSTANDARD = "LVCMOS33";		#Bank = 15, Pin name = IO_L1N_T0_AD0N_15,					Sch name = JA1
#NET "JA<1>"			LOC = "F14"	| IOSTANDARD = "LVCMOS33";		#Bank = 15, Pin name = IO_L5N_T0_AD9N_15,					Sch name = JA2
#NET "JA<2>"			LOC = "D17"	| IOSTANDARD = "LVCMOS33";		#Bank = 15, Pin name = IO_L16N_T2_A27_15,					Sch name = JA3
#NET "JA<3>"			LOC = "E17"	| IOSTANDARD = "LVCMOS33";		#Bank = 15, Pin name = IO_L16P_T2_A28_15,					Sch name = JA4
#NET "JA<4>"			LOC = "G13"	| IOSTANDARD = "LVCMOS33";		#Bank = 15, Pin name = IO_0_15,								Sch name = JA7
#NET "JA<5>"			LOC = "C17"	| IOSTANDARD = "LVCMOS33";		#Bank = 15, Pin name = IO_L20N_T3_A19_15,					Sch name = JA8
#NET "JA<6>"			LOC = "D18"	| IOSTANDARD = "LVCMOS33";		#Bank = 15, Pin name = IO_L21N_T3_A17_15,					Sch name = JA9
#NET "JA<7>"			LOC = "E18"	| IOSTANDARD = "LVCMOS33";		#Bank = 15, Pin name = IO_L21P_T3_DQS_15,					Sch name = JA10

## Pmod Header JB
#NET "JB<0>"			LOC = "G14"	| IOSTANDARD = "LVCMOS33";		#Bank = 15, Pin name = IO_L15N_T2_DQS_ADV_B_15,				Sch name = JB1
#NET "JB<1>"			LOC = "P15"	| IOSTANDARD = "LVCMOS33";		#Bank = 14, Pin name = IO_L13P_T2_MRCC_14,					Sch name = JB2
#NET "JB<2>"			LOC = "V11"	| IOSTANDARD = "LVCMOS33";		#Bank = 14, Pin name = IO_L21N_T3_DQS_A06_D22_14,			Sch name = JB3
#NET "JB<3>"			LOC = "V15"	| IOSTANDARD = "LVCMOS33";		#Bank = CONFIG, Pin name = IO_L16P_T2_CSI_B_14,				Sch name = JB4
#NET "JB<4>"			LOC = "K16"	| IOSTANDARD = "LVCMOS33";		#Bank = 15, Pin name = IO_25_15,							Sch name = JB7
#NET "JB<5>"			LOC = "R16"	| IOSTANDARD = "LVCMOS33";		#Bank = CONFIG, Pin name = IO_L15P_T2_DQS_RWR_B_14,			Sch name = JB8
#NET "JB<6>"			LOC = "T9"  | IOSTANDARD = "LVCMOS33";		#Bank = 14, Pin name = IO_L24P_T3_A01_D17_14,				Sch name = JB9
#NET "JB<7>"			LOC = "U11"	| IOSTANDARD = "LVCMOS33";		#Bank = 14, Pin name = IO_L19N_T3_A09_D25_VREF_14,			Sch name = JB10 
 
## Pmod Header JC
##Bank = 35, Pin name = IO_L21P_T3_DQS_35,					Sch name = JC4
set_property PACKAGE_PIN J4 [get_ports  uart_rxd1]					
	set_property IOSTANDARD LVCMOS33 [get_ports  uart_rxd1]
##Bank = 35, Pin name = IO_L23N_T3_35,						Sch name = JC7
set_property PACKAGE_PIN K1 [get_ports uart_txd1]					
	set_property IOSTANDARD LVCMOS33 [get_ports uart_txd1]
#NET "JC<2>"			LOC = "J3"	| IOSTANDARD = "LVCMOS33";		#Bank = 35, Pin name = IO_L22P_T3_35,						Sch name = JC3
#NET "JC<3>"			LOC = "J4"	| IOSTANDARD = "LVCMOS33";		#Bank = 35, Pin name = IO_L21P_T3_DQS_35,					Sch name = JC4
#NET "JC<4>"			LOC = "K1"	| IOSTANDARD = "LVCMOS33";		#Bank = 35, Pin name = IO_L23N_T3_35,						Sch name = JC7
#NET "JC<5>"			LOC = "E6"	| IOSTANDARD = "LVCMOS33";		#Bank = 35, Pin name = IO_L5P_T0_AD13P_35,					Sch name = JC8
#NET "JC<6>"			LOC = "J2"	| IOSTANDARD = "LVCMOS33";		#Bank = 35, Pin name = IO_L22N_T3_35,						Sch name = JC9
#NET "JC<7>"			LOC = "G6"	| IOSTANDARD = "LVCMOS33";		#Bank = 35, Pin name = IO_L19P_T3_35,						Sch name = JC10
 
## Pmod Header JD
#NET "JD<0>"			LOC = "H4"	| IOSTANDARD = "LVCMOS33";		#Bank = 35, Pin name = IO_L21N_T2_DQS_35,					Sch name = JD1
set_property PACKAGE_PIN H4 [get_ports {gpio[0]}]
set_property IOSTANDARD LVCMOS33 [get_ports {gpio[0]}]

#NET "JD<1>"			LOC = "H1"	| IOSTANDARD = "LVCMOS33";		#Bank = 35, Pin name = IO_L17P_T2_35,						Sch name = JD2
set_property PACKAGE_PIN H1 [get_ports {gpio[1]}]
set_property IOSTANDARD LVCMOS33 [get_ports {gpio[1]}]

#NET "JD<2>"			LOC = "G1"	| IOSTANDARD = "LVCMOS33";		#Bank = 35, Pin name = IO_L17N_T2_35,						Sch name = JD3
set_property PACKAGE_PIN G1 [get_ports {gpio[2]}]
set_property IOSTANDARD LVCMOS33 [get_ports {gpio[2]}]

#NET "JD<3>"			LOC = "G3"	| IOSTANDARD = "LVCMOS33";		#Bank = 35, Pin name = IO_L20N_T3_35,						Sch name = JD4
set_property PACKAGE_PIN G3 [get_ports {gpio[3]}]
set_property IOSTANDARD LVCMOS33 [get_ports {gpio[3]}]

#NET "JD<4>"			LOC = "H2"	| IOSTANDARD = "LVCMOS33";		#Bank = 35, Pin name = IO_L15P_T2_DQS_35,					Sch name = JD7
set_property PACKAGE_PIN H2 [get_ports {gpio[4]}]
set_property IOSTANDARD LVCMOS33 [get_ports {gpio[4]}]

#NET "JD<5>"			LOC = "G4"	| IOSTANDARD = "LVCMOS33";		#Bank = 35, Pin name = IO_L20P_T3_35,						Sch name = JD8
set_property PACKAGE_PIN G4 [get_ports {gpio[5]}]
set_property IOSTANDARD LVCMOS33 [get_ports {gpio[5]}]

#NET "JD<6>"			LOC = "G2"	| IOSTANDARD = "LVCMOS33";		#Bank = 35, Pin name = IO_L15N_T2_DQS_35,					Sch name = JD9
set_property PACKAGE_PIN G2 [get_ports {gpio[6]}]
set_property IOSTANDARD LVCMOS33 [get_ports {gpio[6]}]

#NET "JD<7>"			LOC = "F3"	| IOSTANDARD = "LVCMOS33";		#Bank = 35, Pin name = IO_L13N_T2_MRCC_35,					Sch name = JD10
set_property PACKAGE_PIN F3 [get_ports {gpio[7]}]
set_property IOSTANDARD LVCMOS33 [get_ports {gpio[7]}]
 
## Pmod Header JXADC
#NET "JXADC<0>"			LOC = "A13"	| IOSTANDARD = "LVCMOS33";		#Bank = 15, Pin name = IO_L9P_T1_DQS_AD3P_15,				Sch name = XADC1_P -> XA1_P
#NET "JXADC<1>"			LOC = "A15"	| IOSTANDARD = "LVCMOS33";		#Bank = 15, Pin name = IO_L8P_T1_AD10P_15,					Sch name = XADC2_P -> XA2_P
#NET "JXADC<2>"			LOC = "B16"	| IOSTANDARD = "LVCMOS33";		#Bank = 15, Pin name = IO_L7P_T1_AD2P_15,					Sch name = XADC3_P -> XA3_P
#NET "JXADC<3>"			LOC = "B18"	| IOSTANDARD = "LVCMOS33";		#Bank = 15, Pin name = IO_L10P_T1_AD11P_15,					Sch name = XADC4_P -> XA4_P
#NET "JXADC<4>"			LOC = "A14"	| IOSTANDARD = "LVCMOS33";		#Bank = 15, Pin name = IO_L9N_T1_DQS_AD3N_15,				Sch name = XADC1_N -> XA1_N
#NET "JXADC<5>"			LOC = "A16"	| IOSTANDARD = "LVCMOS33";		#Bank = 15, Pin name = IO_L8N_T1_AD10N_15,					Sch name = XADC2_N -> XA2_N
#NET "JXADC<6>"			LOC = "B17"	| IOSTANDARD = "LVCMOS33";		#Bank = 15, Pin name = IO_L7N_T1_AD2N_15,					Sch name = XADC3_N -> XA3_N 
#NET "JXADC<7>"			LOC = "A18"	| IOSTANDARD = "LVCMOS33";		#Bank = 15, Pin name = IO_L10N_T1_AD11N_15,					Sch name = XADC4_N -> XA4_N
