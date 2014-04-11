
## PWM Audio Amplifier
#NET "ampPWM"			LOC = "A11"	| IOSTANDARD = "LVCMOS33";		#Bank = 15, Pin name = IO_L4N_T0_15,						Sch name = AUD_PWM
#NET "ampSD"			LOC = "D12"	| IOSTANDARD = "LVCMOS33";		#Bank = 15, Pin name = IO_L6P_T0_15,						Sch name = AUD_SD
set_property PACKAGE_PIN A11 [get_ports ampPWM]
set_property IOSTANDARD LVCMOS33 [get_ports ampPWM]

set_property PACKAGE_PIN D12 [get_ports ampSD]
set_property IOSTANDARD LVCMOS33 [get_ports ampSD]

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
