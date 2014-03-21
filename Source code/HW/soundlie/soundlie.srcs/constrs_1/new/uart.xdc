
## USB-RS232 Interface
#Bank = 35, Pin name = IO_L7P_T1_AD6P_35,					Sch name = UART_TXD_IN
set_property PACKAGE_PIN C4 [get_ports RsRx]
set_property IOSTANDARD LVCMOS33 [get_ports RsRx]
#Bank = 35, Pin name = IO_L11N_T1_SRCC_35,					Sch name = UART_RXD_OUT
set_property PACKAGE_PIN D4 [get_ports RsTx]
set_property IOSTANDARD LVCMOS33 [get_ports RsTx]
#NET "RsCts"			LOC = "D3"	| IOSTANDARD = "LVCMOS33";		#Bank = 35, Pin name = IO_L12N_T1_MRCC_35,					Sch name = UART_CTS
#NET "RsRts"			LOC = "E5"	| IOSTANDARD = "LVCMOS33";		#Bank = 35, Pin name = IO_L5N_T0_AD13N_35,					Sch name = UART_RTS
