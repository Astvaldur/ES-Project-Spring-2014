
## Buttons
set_property PACKAGE_PIN C12 [get_ports btnCpuResetn]
set_property IOSTANDARD LVCMOS33 [get_ports btnCpuResetn]

#GPIO buttons
set_property PACKAGE_PIN T16 [get_ports {gpio[0]}]
set_property IOSTANDARD LVCMOS33 [get_ports {gpio[0]}]

set_property PACKAGE_PIN R10 [get_ports {gpio[1]}]
set_property IOSTANDARD LVCMOS33 [get_ports {gpio[1]}]

set_property PACKAGE_PIN F15 [get_ports {gpio[2]}]
set_property IOSTANDARD LVCMOS33 [get_ports {gpio[2]}]

set_property PACKAGE_PIN V10 [get_ports {gpio[3]}]
set_property IOSTANDARD LVCMOS33 [get_ports {gpio[3]}]

set_property PACKAGE_PIN E16 [get_ports {gpio[4]}]
set_property IOSTANDARD LVCMOS33 [get_ports {gpio[4]}]

#RGB LED 1
set_property PACKAGE_PIN K6 [get_ports {gpio[5]}]
set_property IOSTANDARD LVCMOS33 [get_ports {gpio[5]}]

set_property PACKAGE_PIN H6 [get_ports {gpio[6]}]
set_property IOSTANDARD LVCMOS33 [get_ports {gpio[6]}]

set_property PACKAGE_PIN L16 [get_ports {gpio[7]}]
set_property IOSTANDARD LVCMOS33 [get_ports {gpio[7]}]


## Switches
#Bank = 34, Pin name = IO_L21P_T3_DQS_34,					Sch name = SW0
set_property PACKAGE_PIN U9 [get_ports {gpio[8]}]
set_property IOSTANDARD LVCMOS33 [get_ports {gpio[8]}]
#Bank = 34, Pin name = IO_25_34,							Sch name = SW1
set_property PACKAGE_PIN U8 [get_ports {gpio[9]}]
set_property IOSTANDARD LVCMOS33 [get_ports {gpio[9]}]
#Bank = 34, Pin name = IO_L23P_T3_34,						Sch name = SW2
set_property PACKAGE_PIN R7 [get_ports {gpio[10]}]
set_property IOSTANDARD LVCMOS33 [get_ports {gpio[10]}]
#Bank = 34, Pin name = IO_L19P_T3_34,						Sch name = SW3
set_property PACKAGE_PIN R6 [get_ports {gpio[11]}]
set_property IOSTANDARD LVCMOS33 [get_ports {gpio[11]}]
#Bank = 34, Pin name = IO_L19N_T3_VREF_34,					Sch name = SW4
set_property PACKAGE_PIN R5 [get_ports {gpio[12]}]
set_property IOSTANDARD LVCMOS33 [get_ports {gpio[12]}]
#Bank = 34, Pin name = IO_L20P_T3_34,						Sch name = SW5
set_property PACKAGE_PIN V7 [get_ports {gpio[13]}]
set_property IOSTANDARD LVCMOS33 [get_ports {gpio[13]}]
#Bank = 34, Pin name = IO_L20N_T3_34,						Sch name = SW6
set_property PACKAGE_PIN V6 [get_ports {gpio[14]}]
set_property IOSTANDARD LVCMOS33 [get_ports {gpio[14]}]
#Bank = 34, Pin name = IO_L10P_T1_34,						Sch name = SW7
set_property PACKAGE_PIN V5 [get_ports {gpio[15]}]
set_property IOSTANDARD LVCMOS33 [get_ports {gpio[15]}]
#Bank = 34, Pin name = IO_L8P_T1-34,						Sch name = SW8
set_property PACKAGE_PIN U4 [get_ports {gpio[16]}]
set_property IOSTANDARD LVCMOS33 [get_ports {gpio[16]}]
#Bank = 34, Pin name = IO_L9N_T1_DQS_34,					Sch name = SW9
set_property PACKAGE_PIN V2 [get_ports {gpio[17]}]
set_property IOSTANDARD LVCMOS33 [get_ports {gpio[17]}]
#Bank = 34, Pin name = IO_L9P_T1_DQS_34,					Sch name = SW10
set_property PACKAGE_PIN U2 [get_ports {gpio[18]}]
set_property IOSTANDARD LVCMOS33 [get_ports {gpio[18]}]
#Bank = 34, Pin name = IO_L11N_T1_MRCC_34,					Sch name = SW11
set_property PACKAGE_PIN T3 [get_ports {gpio[19]}]
set_property IOSTANDARD LVCMOS33 [get_ports {gpio[19]}]
#Bank = 34, Pin name = IO_L17N_T2_34,						Sch name = SW12
set_property PACKAGE_PIN T1 [get_ports {gpio[20]}]
set_property IOSTANDARD LVCMOS33 [get_ports {gpio[20]}]
#Bank = 34, Pin name = IO_L11P_T1_SRCC_34,					Sch name = SW13
set_property PACKAGE_PIN R3 [get_ports {gpio[21]}]
set_property IOSTANDARD LVCMOS33 [get_ports {gpio[21]}]
#Bank = 34, Pin name = IO_L14N_T2_SRCC_34,					Sch name = SW14
set_property PACKAGE_PIN P3 [get_ports {gpio[22]}]
set_property IOSTANDARD LVCMOS33 [get_ports {gpio[22]}]
#Bank = 34, Pin name = IO_L14P_T2_SRCC_34,					Sch name = SW15
set_property PACKAGE_PIN P4 [get_ports {gpio[23]}]
set_property IOSTANDARD LVCMOS33 [get_ports {gpio[23]}]
 
## LEDs
#Bank = 34, Pin name = IO_L24N_T3_34,						Sch name = LED0
set_property PACKAGE_PIN T8 [get_ports {Led[0]}]
set_property IOSTANDARD LVCMOS33 [get_ports {Led[0]}]
#Bank = 34, Pin name = IO_L21N_T3_DQS_34,					Sch name = LED1
set_property PACKAGE_PIN V9 [get_ports {Led[1]}]
set_property IOSTANDARD LVCMOS33 [get_ports {Led[1]}]
#Bank = 34, Pin name = IO_L24P_T3_34,						Sch name = LED2
set_property PACKAGE_PIN R8 [get_ports {Led[2]}]
set_property IOSTANDARD LVCMOS33 [get_ports {Led[2]}]
#Bank = 34, Pin name = IO_L23N_T3_34,						Sch name = LED3
set_property PACKAGE_PIN T6 [get_ports {Led[3]}]
set_property IOSTANDARD LVCMOS33 [get_ports {Led[3]}]
#Bank = 34, Pin name = IO_L12P_T1_MRCC_34,					Sch name = LED4
set_property PACKAGE_PIN T5 [get_ports {Led[4]}]
set_property IOSTANDARD LVCMOS33 [get_ports {Led[4]}]
#Bank = 34, Pin name = IO_L12N_T1_MRCC_34,					Sch	name = LED5
set_property PACKAGE_PIN T4 [get_ports {Led[5]}]
set_property IOSTANDARD LVCMOS33 [get_ports {Led[5]}]
#Bank = 34, Pin name = IO_L22P_T3_34,						Sch name = LED6
set_property PACKAGE_PIN U7 [get_ports {Led[6]}]
set_property IOSTANDARD LVCMOS33 [get_ports {Led[6]}]
#Bank = 34, Pin name = IO_L22N_T3_34,						Sch name = LED7
set_property PACKAGE_PIN U6 [get_ports {Led[7]}]
set_property IOSTANDARD LVCMOS33 [get_ports {Led[7]}]
#Bank = 34, Pin name = IO_L10N_T1_34,						Sch name = LED8
set_property PACKAGE_PIN V4 [get_ports {Led[8]}]
set_property IOSTANDARD LVCMOS33 [get_ports {Led[8]}]
#Bank = 34, Pin name = IO_L8N_T1_34,						Sch name = LED9
set_property PACKAGE_PIN U3 [get_ports {Led[9]}]
set_property IOSTANDARD LVCMOS33 [get_ports {Led[9]}]
#Bank = 34, Pin name = IO_L7N_T1_34,						Sch name = LED10
set_property PACKAGE_PIN V1 [get_ports {Led[10]}]
set_property IOSTANDARD LVCMOS33 [get_ports {Led[10]}]
#Bank = 34, Pin name = IO_L17P_T2_34,						Sch name = LED11
set_property PACKAGE_PIN R1 [get_ports {Led[11]}]
set_property IOSTANDARD LVCMOS33 [get_ports {Led[11]}]
#Bank = 34, Pin name = IO_L13N_T2_MRCC_34,					Sch name = LED12
set_property PACKAGE_PIN P5 [get_ports {Led[12]}]
set_property IOSTANDARD LVCMOS33 [get_ports {Led[12]}]
#Bank = 34, Pin name = IO_L7P_T1_34,						Sch name = LED13
set_property PACKAGE_PIN U1 [get_ports {Led[13]}]
set_property IOSTANDARD LVCMOS33 [get_ports {Led[13]}]
#Bank = 34, Pin name = IO_L15N_T2_DQS_34,					Sch name = LED14
set_property PACKAGE_PIN R2 [get_ports {Led[14]}]
set_property IOSTANDARD LVCMOS33 [get_ports {Led[14]}]
#Bank = 34, Pin name = IO_L15P_T2_DQS_34,					Sch name = LED15
set_property PACKAGE_PIN P2 [get_ports {Led[15]}]
set_property IOSTANDARD LVCMOS33 [get_ports {Led[15]}]