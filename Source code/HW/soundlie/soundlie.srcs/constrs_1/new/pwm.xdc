
## PWM Audio Amplifier
#NET "ampPWM"			LOC = "A11"	| IOSTANDARD = "LVCMOS33";		#Bank = 15, Pin name = IO_L4N_T0_15,						Sch name = AUD_PWM
#NET "ampSD"			LOC = "D12"	| IOSTANDARD = "LVCMOS33";		#Bank = 15, Pin name = IO_L6P_T0_15,						Sch name = AUD_SD
set_property PACKAGE_PIN A11 [get_ports ampPWM]
set_property IOSTANDARD LVCMOS33 [get_ports ampPWM]

set_property PACKAGE_PIN D12 [get_ports ampSD]
set_property IOSTANDARD LVCMOS33 [get_ports ampSD]


##Pmod Header JC
##Bank = 35, Pin name = IO_L23P_T3_35,						Sch name = JC1
 set_property PACKAGE_PIN K2 [get_ports dac_sync]					
	set_property IOSTANDARD LVCMOS33 [get_ports dac_sync]
##Bank = 35, Pin name = IO_L6P_T0_35,						Sch name = JC2
set_property PACKAGE_PIN E7 [get_ports dac_sclk]					
	set_property IOSTANDARD LVCMOS33 [get_ports dac_sclk]
##Bank = 35, Pin name = IO_L22P_T3_35,						Sch name = JC3
set_property PACKAGE_PIN J3 [get_ports dac_DIN]					
	set_property IOSTANDARD LVCMOS33 [get_ports dac_DIN]
	
#set_property PACKAGE_PIN H4 [get_ports ampPWM_jd]
#set_property IOSTANDARD LVCMOS33 [get_ports ampPWM_jd]

#set_property PACKAGE_PIN H1 [get_ports ampSD_jd]
#set_property IOSTANDARD LVCMOS33 [get_ports ampSD_jd]

#PWM
#NET "ampPWM"			LOC = "A11"	| IOSTANDARD = "LVCMOS33";		#Bank = 15, Pin name = IO_L4N_T0_15,						Sch name = AUD_PWM
#set_property PACKAGE_PIN A11 [get_ports ampPWM]
#set_property IOSTANDARD LVCMOS33 [get_ports ampPWM]

#NET "ampSD"			LOC = "D12"	| IOSTANDARD = "LVCMOS33";		#Bank = 15, Pin name = IO_L6P_T0_15,						Sch name = AUD_SD
#set_property PACKAGE_PIN D12 [get_ports ampSD]
#set_property IOSTANDARD LVCMOS33 [get_ports ampSD]
