
## Clock signal
#Bank = 35, Pin name = IO_L12P_T1_MRCC_35,					Sch name = CLK100MHZ
set_property PACKAGE_PIN E3 [get_ports clk]
set_property IOSTANDARD LVCMOS33 [get_ports clk]
create_clock -name clk -period 10.000 [get_ports clk]

## SMSC Ethernet PHY
#Bank = 16, Pin name = IO_L11P_T1_SRCC_16,					Sch name = ETH_MDC
set_property PACKAGE_PIN C9 [get_ports PhyMdc]
set_property IOSTANDARD LVCMOS33 [get_ports PhyMdc]
#Bank = 16, Pin name = IO_L14N_T2_SRCC_16,					Sch name = ETH_MDIO
set_property PACKAGE_PIN A9 [get_ports PhyMdio]
set_property IOSTANDARD LVCMOS33 [get_ports PhyMdio]
#Bank = 35, Pin name = IO_L10P_T1_AD15P_35,					Sch name = ETH_RSTN
set_property PACKAGE_PIN B3 [get_ports PhyRstn]
set_property IOSTANDARD LVCMOS33 [get_ports PhyRstn]
#Bank = 16, Pin name = IO_L6N_T0_VREF_16,					Sch name = ETH_CRSDV
set_property PACKAGE_PIN D9 [get_ports PhyCrs]
set_property IOSTANDARD LVCMOS33 [get_ports PhyCrs]
#Bank = 16, Pin name = IO_L13N_T2_MRCC_16,					Sch name = ETH_RXERR
set_property PACKAGE_PIN C10 [get_ports PhyRxEr]
set_property IOSTANDARD LVCMOS33 [get_ports PhyRxEr]
#Bank = 16, Pin name = IO_L19N_T3_VREF_16,					Sch name = ETH_RXD0
set_property PACKAGE_PIN D10 [get_ports {PhyRxd[0]}]
set_property IOSTANDARD LVCMOS33 [get_ports {PhyRxd[0]}]
#Bank = 16, Pin name = IO_L13P_T2_MRCC_16,					Sch name = ETH_RXD1
set_property PACKAGE_PIN C11 [get_ports {PhyRxd[1]}]
set_property IOSTANDARD LVCMOS33 [get_ports {PhyRxd[1]}]
#Bank = 16, Pin name = IO_L11N_T1_SRCC_16,					Sch name = ETH_TXEN
set_property PACKAGE_PIN B9 [get_ports PhyTxEn]
set_property IOSTANDARD LVCMOS33 [get_ports PhyTxEn]
#Bank = 16, Pin name = IO_L14P_T2_SRCC_16,					Sch name = ETH_TXD0
set_property PACKAGE_PIN A10 [get_ports {PhyTxd[0]}]
set_property IOSTANDARD LVCMOS33 [get_ports {PhyTxd[0]}]
#Bank = 16, Pin name = IO_L12N_T1_MRCC_16,					Sch name = ETH_TXD1
set_property PACKAGE_PIN A8 [get_ports {PhyTxd[1]}]
set_property IOSTANDARD LVCMOS33 [get_ports {PhyTxd[1]}]
#Bank = 35, Pin name = IO_L11P_T1_SRCC_35,					Sch name = ETH_REFCLK
set_property PACKAGE_PIN D5 [get_ports PhyClk50Mhz]
set_property IOSTANDARD LVCMOS33 [get_ports PhyClk50Mhz]
#NET "PhyIntn"			LOC = "B8"	| IOSTANDARD = "LVCMOS33";		#Bank = 16, Pin name = IO_L12P_T1_MRCC_16,					Sch name = ETH_INTN

## Cellular RAM
#Bank = 14, Pin name = IO_L14N_T2_SRCC_14,					Sch name = CRAM_CLK
set_property PACKAGE_PIN T15 [get_ports RamClk]
set_property IOSTANDARD LVCMOS33 [get_ports RamClk]
#Bank = 14, Pin name = IO_L23P_T3_A03_D19_14,				Sch name = CRAM_ADVN
set_property PACKAGE_PIN T13 [get_ports RamAdv]
set_property IOSTANDARD LVCMOS33 [get_ports RamAdv]
#Bank = 14, Pin name = IO_L4P_T0_D04_14,					Sch name = CRAM_CEN
set_property PACKAGE_PIN L18 [get_ports RamCE]
set_property IOSTANDARD LVCMOS33 [get_ports RamCE]
#Bank = 15, Pin name = IO_L19P_T3_A22_15,					Sch name = CRAM_CRE
set_property PACKAGE_PIN J14 [get_ports RamCRE]
set_property IOSTANDARD LVCMOS33 [get_ports RamCRE]
#Bank = 15, Pin name = IO_L15P_T2_DQS_15,					Sch name = CRAM_OEN
set_property PACKAGE_PIN H14 [get_ports RamOE]
set_property IOSTANDARD LVCMOS33 [get_ports RamOE]
#Bank = 14, Pin name = IO_0_14,								Sch name = CRAM_WEN
set_property PACKAGE_PIN R11 [get_ports RamWE]
set_property IOSTANDARD LVCMOS33 [get_ports RamWE]
#Bank = 15, Pin name = IO_L24N_T3_RS0_15,					Sch name = CRAM_LBN
set_property PACKAGE_PIN J15 [get_ports RamLB]
set_property IOSTANDARD LVCMOS33 [get_ports RamLB]
#Bank = 15, Pin name = IO_L17N_T2_A25_15,					Sch name = CRAM_UBN
set_property PACKAGE_PIN J13 [get_ports RamUB]
set_property IOSTANDARD LVCMOS33 [get_ports RamUB]
#NET "RamWait"			LOC = "T14"	| IOSTANDARD = "LVCMOS33";		#Bank = 14, Pin name = IO_L14P_T2_SRCC_14,					Sch name = CRAM_WAIT

#Bank = 14, Pin name = IO_L5P_T0_DQ06_14,					Sch name = CRAM_DQ0
set_property PACKAGE_PIN R12 [get_ports {data[0]}]
set_property IOSTANDARD LVCMOS33 [get_ports {data[0]}]
#Bank = 14, Pin name = IO_L19P_T3_A10_D26_14,				Sch name = CRAM_DQ1
set_property PACKAGE_PIN T11 [get_ports {data[1]}]
set_property IOSTANDARD LVCMOS33 [get_ports {data[1]}]
#Bank = 14, Pin name = IO_L20P_T3_A08)D24_14,				Sch name = CRAM_DQ2
set_property PACKAGE_PIN U12 [get_ports {data[2]}]
set_property IOSTANDARD LVCMOS33 [get_ports {data[2]}]
#Bank = 14, Pin name = IO_L5N_T0_D07_14,					Sch name = CRAM_DQ3
set_property PACKAGE_PIN R13 [get_ports {data[3]}]
set_property IOSTANDARD LVCMOS33 [get_ports {data[3]}]
#Bank = 14, Pin name = IO_L17N_T2_A13_D29_14,				Sch name = CRAM_DQ4
set_property PACKAGE_PIN U18 [get_ports {data[4]}]
set_property IOSTANDARD LVCMOS33 [get_ports {data[4]}]
#Bank = 14, Pin name = IO_L12N_T1_MRCC_14,					Sch name = CRAM_DQ5
set_property PACKAGE_PIN R17 [get_ports {data[5]}]
set_property IOSTANDARD LVCMOS33 [get_ports {data[5]}]
#Bank = 14, Pin name = IO_L7N_T1_D10_14,					Sch name = CRAM_DQ6
set_property PACKAGE_PIN T18 [get_ports {data[6]}]
set_property IOSTANDARD LVCMOS33 [get_ports {data[6]}]
#Bank = 14, Pin name = IO_L7P_T1_D09_14,					Sch name = CRAM_DQ7
set_property PACKAGE_PIN R18 [get_ports {data[7]}]
set_property IOSTANDARD LVCMOS33 [get_ports {data[7]}]
#Bank = 15, Pin name = IO_L22N_T3_A16_15,					Sch name = CRAM_DQ8
set_property PACKAGE_PIN F18 [get_ports {data[8]}]
set_property IOSTANDARD LVCMOS33 [get_ports {data[8]}]
#Bank = 15, Pin name = IO_L22P_T3_A17_15,					Sch name = CRAM_DQ9
set_property PACKAGE_PIN G18 [get_ports {data[9]}]
set_property IOSTANDARD LVCMOS33 [get_ports {data[9]}]
#Bank = 15, Pin name = IO_IO_L18N_T2_A23_15,				Sch name = CRAM_DQ10
set_property PACKAGE_PIN G17 [get_ports {data[10]}]
set_property IOSTANDARD LVCMOS33 [get_ports {data[10]}]
#Bank = 14, Pin name = IO_L4N_T0_D05_14,					Sch name = CRAM_DQ11
set_property PACKAGE_PIN M18 [get_ports {data[11]}]
set_property IOSTANDARD LVCMOS33 [get_ports {data[11]}]
#Bank = 14, Pin name = IO_L10N_T1_D15_14,					Sch name = CRAM_DQ12
set_property PACKAGE_PIN M17 [get_ports {data[12]}]
set_property IOSTANDARD LVCMOS33 [get_ports {data[12]}]
#Bank = 14, Pin name = IO_L9N_T1_DQS_D13_14,				Sch name = CRAM_DQ13
set_property PACKAGE_PIN P18 [get_ports {data[13]}]
set_property IOSTANDARD LVCMOS33 [get_ports {data[13]}]
#Bank = 14, Pin name = IO_L9P_T1_DQS_14,					Sch name = CRAM_DQ14
set_property PACKAGE_PIN N17 [get_ports {data[14]}]
set_property IOSTANDARD LVCMOS33 [get_ports {data[14]}]
#Bank = 14, Pin name = IO_L12P_T1_MRCC_14,					Sch name = CRAM_DQ15
set_property PACKAGE_PIN P17 [get_ports {data[15]}]
set_property IOSTANDARD LVCMOS33 [get_ports {data[15]}]

#Bank = 15, Pin name = IO_L23N_T3_FWE_B_15,					Sch name = CRAM_A0
set_property PACKAGE_PIN J18 [get_ports {address[0]}]
set_property IOSTANDARD LVCMOS33 [get_ports {address[0]}]
#Bank = 15, Pin name = IO_L18P_T2_A24_15,					Sch name = CRAM_A1
set_property PACKAGE_PIN H17 [get_ports {address[1]}]
set_property IOSTANDARD LVCMOS33 [get_ports {address[1]}]
#Bank = 15, Pin name = IO_L19N_T3_A21_VREF_15,				Sch name = CRAM_A2
set_property PACKAGE_PIN H15 [get_ports {address[2]}]
set_property IOSTANDARD LVCMOS33 [get_ports {address[2]}]
#Bank = 15, Pin name = IO_L23P_T3_FOE_B_15,					Sch name = CRAM_A3
set_property PACKAGE_PIN J17 [get_ports {address[3]}]
set_property IOSTANDARD LVCMOS33 [get_ports {address[3]}]
#Bank = 15, Pin name = IO_L13P_T2_MRCC_15,					Sch name = CRAM_A4
set_property PACKAGE_PIN H16 [get_ports {address[4]}]
set_property IOSTANDARD LVCMOS33 [get_ports {address[4]}]
#Bank = 15, Pin name = IO_L24P_T3_RS1_15,					Sch name = CRAM_A5
set_property PACKAGE_PIN K15 [get_ports {address[5]}]
set_property IOSTANDARD LVCMOS33 [get_ports {address[5]}]
#Bank = 15, Pin name = IO_L17P_T2_A26_15,					Sch name = CRAM_A6
set_property PACKAGE_PIN K13 [get_ports {address[6]}]
set_property IOSTANDARD LVCMOS33 [get_ports {address[6]}]
#Bank = 14, Pin name = IO_L11P_T1_SRCC_14,					Sch name = CRAM_A7
set_property PACKAGE_PIN N15 [get_ports {address[7]}]
set_property IOSTANDARD LVCMOS33 [get_ports {address[7]}]
#Bank = 14, Pin name = IO_L16N_T2_SRCC-14,					Sch name = CRAM_A8
set_property PACKAGE_PIN V16 [get_ports {address[8]}]
set_property IOSTANDARD LVCMOS33 [get_ports {address[8]}]
#Bank = 14, Pin name = IO_L22P_T3_A05_D21_14,				Sch name = CRAM_A9
set_property PACKAGE_PIN U14 [get_ports {address[9]}]
set_property IOSTANDARD LVCMOS33 [get_ports {address[9]}]
#Bank = 14, Pin name = IO_L22N_T3_A04_D20_14,				Sch name = CRAM_A10
set_property PACKAGE_PIN V14 [get_ports {address[10]}]
set_property IOSTANDARD LVCMOS33 [get_ports {address[10]}]
#Bank = 14, Pin name = IO_L20N_T3_A07_D23_14,				Sch name = CRAM_A11
set_property PACKAGE_PIN V12 [get_ports {address[11]}]
set_property IOSTANDARD LVCMOS33 [get_ports {address[11]}]
#Bank = 14, Pin name = IO_L8N_T1_D12_14,					Sch name = CRAM_A12
set_property PACKAGE_PIN P14 [get_ports {address[12]}]
set_property IOSTANDARD LVCMOS33 [get_ports {address[12]}]
#Bank = 14, Pin name = IO_L18P_T2_A12_D28_14,				Sch name = CRAM_A13
set_property PACKAGE_PIN U16 [get_ports {address[13]}]
set_property IOSTANDARD LVCMOS33 [get_ports {address[13]}]
#Bank = 14, Pin name = IO_L13N_T2_MRCC_14,					Sch name = CRAM_A14
set_property PACKAGE_PIN R15 [get_ports {address[14]}]
set_property IOSTANDARD LVCMOS33 [get_ports {address[14]}]
#Bank = 14, Pin name = IO_L8P_T1_D11_14,					Sch name = CRAM_A15
set_property PACKAGE_PIN N14 [get_ports {address[15]}]
set_property IOSTANDARD LVCMOS33 [get_ports {address[15]}]
#Bank = 14, Pin name = IO_L11N_T1_SRCC_14,					Sch name = CRAM_A16
set_property PACKAGE_PIN N16 [get_ports {address[16]}]
set_property IOSTANDARD LVCMOS33 [get_ports {address[16]}]
#Bank = 14, Pin name = IO_L6N_T0_D08_VREF_14,				Sch name = CRAM_A17
set_property PACKAGE_PIN M13 [get_ports {address[17]}]
set_property IOSTANDARD LVCMOS33 [get_ports {address[17]}]
#Bank = 14, Pin name = IO_L18N_T2_A11_D27_14,				Sch name = CRAM_A18
set_property PACKAGE_PIN V17 [get_ports {address[18]}]
set_property IOSTANDARD LVCMOS33 [get_ports {address[18]}]
#Bank = 14, Pin name = IO_L17P_T2_A14_D30_14,				Sch name = CRAM_A19
set_property PACKAGE_PIN U17 [get_ports {address[19]}]
set_property IOSTANDARD LVCMOS33 [get_ports {address[19]}]
#Bank = 14, Pin name = IO_L24N_T3_A00_D16_14,				Sch name = CRAM_A20
set_property PACKAGE_PIN T10 [get_ports {address[20]}]
set_property IOSTANDARD LVCMOS33 [get_ports {address[20]}]
#Bank = 14, Pin name = IO_L10P_T1_D14_14,					Sch name = CRAM_A21
set_property PACKAGE_PIN M16 [get_ports {address[21]}]
set_property IOSTANDARD LVCMOS33 [get_ports {address[21]}]
#Bank = 14, Pin name = IO_L23N_T3_A02_D18_14,				Sch name = CRAM_A22
set_property PACKAGE_PIN U13 [get_ports {address[22]}]
set_property IOSTANDARD LVCMOS33 [get_ports {address[22]}]
