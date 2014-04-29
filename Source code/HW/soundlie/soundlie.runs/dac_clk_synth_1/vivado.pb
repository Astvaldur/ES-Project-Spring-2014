
[
 Attempting to get a license: %s
78*common2"
Implementation2default:defaultZ17-78
Q
Feature available: %s
81*common2"
Implementation2default:defaultZ17-81
É
+Loading parts and site information from %s
36*device2?
+C:/Xilinx/Vivado/2013.4/data/parts/arch.xml2default:defaultZ21-36
ê
!Parsing RTL primitives file [%s]
14*netlist2U
AC:/Xilinx/Vivado/2013.4/data/parts/xilinx/rtl/prims/rtl_prims.xml2default:defaultZ29-14
ô
*Finished parsing RTL primitives file [%s]
11*netlist2U
AC:/Xilinx/Vivado/2013.4/data/parts/xilinx/rtl/prims/rtl_prims.xml2default:defaultZ29-11
5
Refreshing IP repositories
234*coregenZ19-234
>
"No user IP repositories specified
1154*coregenZ19-1704
s
"Loaded Vivado IP repository '%s'.
1332*coregen23
C:/Xilinx/Vivado/2013.4/data/ip2default:defaultZ19-2313
Å
Command: %s
53*	vivadotcl2Y
Esynth_design -top dac_clk -part xc7a100tcsg324-2 -mode out_of_context2default:defaultZ4-113
/

Starting synthesis...

3*	vivadotclZ4-3
≠
%IP '%s' is locked. Locked reason: %s
1260*coregen2
dac_clk2default:default2M
9Property 'IS_LOCKED' is set to true by the system or user2default:defaultZ19-2162
ñ
@Attempting to get a license for feature '%s' and/or device '%s'
308*common2
	Synthesis2default:default2
xc7a100t2default:defaultZ17-347
Ü
0Got license for feature '%s' and/or device '%s'
310*common2
	Synthesis2default:default2
xc7a100t2default:defaultZ17-349
õ
%s*synth2ã
wStarting RTL Elaboration : Time (s): cpu = 00:00:03 ; elapsed = 00:00:07 . Memory (MB): peak = 242.668 ; gain = 94.246
2default:default
Ó
synthesizing module '%s'638*oasys2
dac_clk2default:default2Å
kz:/DAT096/git/ES-Project-Spring-2014/Source code/HW/soundlie/soundlie.srcs/sources_1/ip/dac_clk/dac_clk.vhd2default:default2
852default:default8@Z8-638
à
Hmodule '%s' declared at '%s:%s' bound to instance '%s' of component '%s'3392*oasys2#
dac_clk_clk_wiz2default:default2á
sz:/DAT096/git/ES-Project-Spring-2014/Source code/HW/soundlie/soundlie.srcs/sources_1/ip/dac_clk/dac_clk_clk_wiz.vhd2default:default2
742default:default2
U02default:default2#
dac_clk_clk_wiz2default:default2Å
kz:/DAT096/git/ES-Project-Spring-2014/Source code/HW/soundlie/soundlie.srcs/sources_1/ip/dac_clk/dac_clk.vhd2default:default2
1022default:default8@Z8-3491
˛
synthesizing module '%s'638*oasys2#
dac_clk_clk_wiz2default:default2â
sz:/DAT096/git/ES-Project-Spring-2014/Source code/HW/soundlie/soundlie.srcs/sources_1/ip/dac_clk/dac_clk_clk_wiz.vhd2default:default2
852default:default8@Z8-638
^
%s*synth2O
;	Parameter CAPACITANCE bound to: DONT_CARE - type: string 
2default:default
[
%s*synth2L
8	Parameter IBUF_DELAY_VALUE bound to: 0 - type: string 
2default:default
U
%s*synth2F
2	Parameter IBUF_LOW_PWR bound to: 1 - type: bool 
2default:default
]
%s*synth2N
:	Parameter IFD_DELAY_VALUE bound to: AUTO - type: string 
2default:default
[
%s*synth2L
8	Parameter IOSTANDARD bound to: DEFAULT - type: string 
2default:default
™
,binding component instance '%s' to cell '%s'113*oasys2 
clkin1_ibufg2default:default2
IBUF2default:default2â
sz:/DAT096/git/ES-Project-Spring-2014/Source code/HW/soundlie/soundlie.srcs/sources_1/ip/dac_clk/dac_clk_clk_wiz.vhd2default:default2
1192default:default8@Z8-113
\
%s*synth2M
9	Parameter BANDWIDTH bound to: OPTIMIZED - type: string 
2default:default
Y
%s*synth2J
6	Parameter CLKFBOUT_MULT bound to: 8 - type: integer 
2default:default
_
%s*synth2P
<	Parameter CLKFBOUT_PHASE bound to: 0.000000 - type: float 
2default:default
_
%s*synth2P
<	Parameter CLKIN1_PERIOD bound to: 10.000000 - type: float 
2default:default
^
%s*synth2O
;	Parameter CLKIN2_PERIOD bound to: 0.000000 - type: float 
2default:default
\
%s*synth2M
9	Parameter CLKOUT0_DIVIDE bound to: 100 - type: integer 
2default:default
c
%s*synth2T
@	Parameter CLKOUT0_DUTY_CYCLE bound to: 0.500000 - type: float 
2default:default
^
%s*synth2O
;	Parameter CLKOUT0_PHASE bound to: 0.000000 - type: float 
2default:default
Z
%s*synth2K
7	Parameter CLKOUT1_DIVIDE bound to: 1 - type: integer 
2default:default
c
%s*synth2T
@	Parameter CLKOUT1_DUTY_CYCLE bound to: 0.500000 - type: float 
2default:default
^
%s*synth2O
;	Parameter CLKOUT1_PHASE bound to: 0.000000 - type: float 
2default:default
Z
%s*synth2K
7	Parameter CLKOUT2_DIVIDE bound to: 1 - type: integer 
2default:default
c
%s*synth2T
@	Parameter CLKOUT2_DUTY_CYCLE bound to: 0.500000 - type: float 
2default:default
^
%s*synth2O
;	Parameter CLKOUT2_PHASE bound to: 0.000000 - type: float 
2default:default
Z
%s*synth2K
7	Parameter CLKOUT3_DIVIDE bound to: 1 - type: integer 
2default:default
c
%s*synth2T
@	Parameter CLKOUT3_DUTY_CYCLE bound to: 0.500000 - type: float 
2default:default
^
%s*synth2O
;	Parameter CLKOUT3_PHASE bound to: 0.000000 - type: float 
2default:default
Z
%s*synth2K
7	Parameter CLKOUT4_DIVIDE bound to: 1 - type: integer 
2default:default
c
%s*synth2T
@	Parameter CLKOUT4_DUTY_CYCLE bound to: 0.500000 - type: float 
2default:default
^
%s*synth2O
;	Parameter CLKOUT4_PHASE bound to: 0.000000 - type: float 
2default:default
Z
%s*synth2K
7	Parameter CLKOUT5_DIVIDE bound to: 1 - type: integer 
2default:default
c
%s*synth2T
@	Parameter CLKOUT5_DUTY_CYCLE bound to: 0.500000 - type: float 
2default:default
^
%s*synth2O
;	Parameter CLKOUT5_PHASE bound to: 0.000000 - type: float 
2default:default
[
%s*synth2L
8	Parameter COMPENSATION bound to: ZHOLD - type: string 
2default:default
Y
%s*synth2J
6	Parameter DIVCLK_DIVIDE bound to: 1 - type: integer 
2default:default
S
%s*synth2D
0	Parameter IS_CLKINSEL_INVERTED bound to: 1'b0 
2default:default
Q
%s*synth2B
.	Parameter IS_PWRDWN_INVERTED bound to: 1'b0 
2default:default
N
%s*synth2?
+	Parameter IS_RST_INVERTED bound to: 1'b0 
2default:default
\
%s*synth2M
9	Parameter REF_JITTER1 bound to: 0.010000 - type: float 
2default:default
\
%s*synth2M
9	Parameter REF_JITTER2 bound to: 0.000000 - type: float 
2default:default
[
%s*synth2L
8	Parameter STARTUP_WAIT bound to: FALSE - type: string 
2default:default
±
,binding component instance '%s' to cell '%s'113*oasys2"
plle2_adv_inst2default:default2
	PLLE2_ADV2default:default2â
sz:/DAT096/git/ES-Project-Spring-2014/Source code/HW/soundlie/soundlie.srcs/sources_1/ip/dac_clk/dac_clk_clk_wiz.vhd2default:default2
1312default:default8@Z8-113
¶
,binding component instance '%s' to cell '%s'113*oasys2
clkf_buf2default:default2
BUFG2default:default2â
sz:/DAT096/git/ES-Project-Spring-2014/Source code/HW/soundlie/soundlie.srcs/sources_1/ip/dac_clk/dac_clk_clk_wiz.vhd2default:default2
1772default:default8@Z8-113
©
,binding component instance '%s' to cell '%s'113*oasys2
clkout1_buf2default:default2
BUFG2default:default2â
sz:/DAT096/git/ES-Project-Spring-2014/Source code/HW/soundlie/soundlie.srcs/sources_1/ip/dac_clk/dac_clk_clk_wiz.vhd2default:default2
1842default:default8@Z8-113
π
%done synthesizing module '%s' (%s#%s)256*oasys2#
dac_clk_clk_wiz2default:default2
12default:default2
12default:default2â
sz:/DAT096/git/ES-Project-Spring-2014/Source code/HW/soundlie/soundlie.srcs/sources_1/ip/dac_clk/dac_clk_clk_wiz.vhd2default:default2
852default:default8@Z8-256
©
%done synthesizing module '%s' (%s#%s)256*oasys2
dac_clk2default:default2
22default:default2
12default:default2Å
kz:/DAT096/git/ES-Project-Spring-2014/Source code/HW/soundlie/soundlie.srcs/sources_1/ip/dac_clk/dac_clk.vhd2default:default2
852default:default8@Z8-256
ú
%s*synth2å
xFinished RTL Elaboration : Time (s): cpu = 00:00:04 ; elapsed = 00:00:08 . Memory (MB): peak = 275.918 ; gain = 127.496
2default:default
;
%s*synth2,

Report Check Netlist: 
2default:default
l
%s*synth2]
I+------+------------------+-------+---------+-------+------------------+
2default:default
l
%s*synth2]
I|      |Item              |Errors |Warnings |Status |Description       |
2default:default
l
%s*synth2]
I+------+------------------+-------+---------+-------+------------------+
2default:default
l
%s*synth2]
I|1     |multi_driven_nets |      0|        0|Passed |Multi driven nets |
2default:default
l
%s*synth2]
I+------+------------------+-------+---------+-------+------------------+
2default:default
\
-Analyzing %s Unisim elements for replacement
17*netlist2
22default:defaultZ29-17
a
2Unisim Transformation completed in %s CPU seconds
28*netlist2
02default:defaultZ29-28
õ
Loading clock regions from %s
13*device2d
PC:/Xilinx/Vivado/2013.4/data\parts/xilinx/artix7/artix7/xc7a100t/ClockRegion.xml2default:defaultZ21-13
ú
Loading clock buffers from %s
11*device2e
QC:/Xilinx/Vivado/2013.4/data\parts/xilinx/artix7/artix7/xc7a100t/ClockBuffers.xml2default:defaultZ21-11
ô
&Loading clock placement rules from %s
318*place2Y
EC:/Xilinx/Vivado/2013.4/data/parts/xilinx/artix7/ClockPlacerRules.xml2default:defaultZ30-318
ó
)Loading package pin functions from %s...
17*device2U
AC:/Xilinx/Vivado/2013.4/data\parts/xilinx/artix7/PinFunctions.xml2default:defaultZ21-17
ò
Loading package from %s
16*device2g
SC:/Xilinx/Vivado/2013.4/data\parts/xilinx/artix7/artix7/xc7a100t/csg324/Package.xml2default:defaultZ21-16
å
Loading io standards from %s
15*device2V
BC:/Xilinx/Vivado/2013.4/data\./parts/xilinx/artix7/IOStandards.xml2default:defaultZ21-15
ò
+Loading device configuration modes from %s
14*device2T
@C:/Xilinx/Vivado/2013.4/data\parts/xilinx/artix7/ConfigModes.xml2default:defaultZ21-14
5

Processing XDC Constraints
244*projectZ1-262
‡
$Parsing XDC File [%s] for cell '%s'
848*designutils2É
oz:/DAT096/git/ES-Project-Spring-2014/Source code/HW/soundlie/soundlie.srcs/sources_1/ip/dac_clk/dac_clk_OOC.xdc2default:default2
U02default:defaultZ20-848
È
-Finished Parsing XDC File [%s] for cell '%s'
847*designutils2É
oz:/DAT096/git/ES-Project-Spring-2014/Source code/HW/soundlie/soundlie.srcs/sources_1/ip/dac_clk/dac_clk_OOC.xdc2default:default2
U02default:defaultZ20-847
€
$Parsing XDC File [%s] for cell '%s'
848*designutils2
kz:/DAT096/git/ES-Project-Spring-2014/Source code/HW/soundlie/soundlie.srcs/sources_1/ip/dac_clk/dac_clk.xdc2default:default2
U02default:defaultZ20-848
‰
-Finished Parsing XDC File [%s] for cell '%s'
847*designutils2
kz:/DAT096/git/ES-Project-Spring-2014/Source code/HW/soundlie/soundlie.srcs/sources_1/ip/dac_clk/dac_clk.xdc2default:default2
U02default:defaultZ20-847
/
Deriving generated clocks
2*timingZ38-2
ˇ
ŸImplementation specific constraints were found while reading constraint file [%s]. These constraints will be ignored for synthesis but will be used in implementation. Impacted constraints are listed in the file [%s].
233*project2
kz:/DAT096/git/ES-Project-Spring-2014/Source code/HW/soundlie/soundlie.srcs/sources_1/ip/dac_clk/dac_clk.xdc2default:default2à
tZ:/DAT096/git/ES-Project-Spring-2014/Source code/HW/soundlie/soundlie.runs/dac_clk_synth_1/.Xil/dac_clk_propImpl.xdc2default:defaultZ1-236
‚
$Parsing XDC File [%s] for cell '%s'
848*designutils2Ö
qz:/DAT096/git/ES-Project-Spring-2014/Source code/HW/soundlie/soundlie.srcs/sources_1/ip/dac_clk/dac_clk_board.xdc2default:default2
U02default:defaultZ20-848
Î
-Finished Parsing XDC File [%s] for cell '%s'
847*designutils2Ö
qz:/DAT096/git/ES-Project-Spring-2014/Source code/HW/soundlie/soundlie.srcs/sources_1/ip/dac_clk/dac_clk_board.xdc2default:default2
U02default:defaultZ20-847
≥
Parsing XDC File [%s]
179*designutils2}
iZ:/DAT096/git/ES-Project-Spring-2014/Source code/HW/soundlie/soundlie.runs/dac_clk_synth_1/dont_touch.xdc2default:defaultZ20-179
º
Finished Parsing XDC File [%s]
178*designutils2}
iZ:/DAT096/git/ES-Project-Spring-2014/Source code/HW/soundlie/soundlie.runs/dac_clk_synth_1/dont_touch.xdc2default:defaultZ20-178
?
&Completed Processing XDC Constraints

245*projectZ1-263
u
!Unisim Transformation Summary:
%s111*project29
%No Unisim elements were transformed.
2default:defaultZ1-111
µ
%s*synth2•
êFinished applying 'set_property' XDC Constraints : Time (s): cpu = 00:00:11 ; elapsed = 00:00:17 . Memory (MB): peak = 481.324 ; gain = 332.902
2default:default
ù
%s*synth2ç
yFinished RTL Optimization : Time (s): cpu = 00:00:11 ; elapsed = 00:00:17 . Memory (MB): peak = 481.324 ; gain = 332.902
2default:default
<
%s*synth2-

Report RTL Partitions: 
2default:default
N
%s*synth2?
++-+--------------+------------+----------+
2default:default
N
%s*synth2?
+| |RTL Partition |Replication |Instances |
2default:default
N
%s*synth2?
++-+--------------+------------+----------+
2default:default
N
%s*synth2?
++-+--------------+------------+----------+
2default:default
z
%s*synth2k
WPart Resources:
DSPs: 240 (col length:80)
BRAMs: 270 (col length: RAMB18 80 RAMB36 40)
2default:default
±
%s*synth2°
åFinished Loading Part and Timing Information : Time (s): cpu = 00:00:18 ; elapsed = 00:00:24 . Memory (MB): peak = 548.730 ; gain = 400.309
2default:default
B
%s*synth23
Detailed RTL Component Info : 
2default:default
F
%s*synth27
#Hierarchical RTL Component report 
2default:default
3
%s*synth2$
Module dac_clk 
2default:default
B
%s*synth23
Detailed RTL Component Info : 
2default:default
;
%s*synth2,
Module dac_clk_clk_wiz 
2default:default
B
%s*synth23
Detailed RTL Component Info : 
2default:default
©
%s*synth2ô
ÑFinished Cross Boundary Optimization : Time (s): cpu = 00:00:18 ; elapsed = 00:00:24 . Memory (MB): peak = 548.730 ; gain = 400.309
2default:default
¢
%s*synth2í
~---------------------------------------------------------------------------------
Start RAM, DSP and Shift Register Reporting
2default:default
u
%s*synth2f
R---------------------------------------------------------------------------------
2default:default
¶
%s*synth2ñ
Å---------------------------------------------------------------------------------
Finished RAM, DSP and Shift Register Reporting
2default:default
u
%s*synth2f
R---------------------------------------------------------------------------------
2default:default
û
%s*synth2é
zFinished Area Optimization : Time (s): cpu = 00:00:18 ; elapsed = 00:00:24 . Memory (MB): peak = 569.742 ; gain = 421.320
2default:default
≠
%s*synth2ù
àFinished Applying XDC Timing Constraints : Time (s): cpu = 00:00:18 ; elapsed = 00:00:24 . Memory (MB): peak = 569.742 ; gain = 421.320
2default:default
†
%s*synth2ê
|Finished Timing Optimization : Time (s): cpu = 00:00:18 ; elapsed = 00:00:24 . Memory (MB): peak = 569.742 ; gain = 421.320
2default:default
ü
%s*synth2è
{Finished Technology Mapping : Time (s): cpu = 00:00:18 ; elapsed = 00:00:24 . Memory (MB): peak = 569.992 ; gain = 421.570
2default:default
D
%s*synth25
!Gated Clock Conversion mode: off
2default:default
ô
%s*synth2â
uFinished IO Insertion : Time (s): cpu = 00:00:18 ; elapsed = 00:00:25 . Memory (MB): peak = 569.992 ; gain = 421.570
2default:default
;
%s*synth2,

Report Check Netlist: 
2default:default
l
%s*synth2]
I+------+------------------+-------+---------+-------+------------------+
2default:default
l
%s*synth2]
I|      |Item              |Errors |Warnings |Status |Description       |
2default:default
l
%s*synth2]
I+------+------------------+-------+---------+-------+------------------+
2default:default
l
%s*synth2]
I|1     |multi_driven_nets |      0|        0|Passed |Multi driven nets |
2default:default
l
%s*synth2]
I+------+------------------+-------+---------+-------+------------------+
2default:default
™
%s*synth2ö
ÖFinished Renaming Generated Instances : Time (s): cpu = 00:00:18 ; elapsed = 00:00:25 . Memory (MB): peak = 569.992 ; gain = 421.570
2default:default
ß
%s*synth2ó
ÇFinished Rebuilding User Hierarchy : Time (s): cpu = 00:00:18 ; elapsed = 00:00:25 . Memory (MB): peak = 569.992 ; gain = 421.570
2default:default
¢
%s*synth2í
~---------------------------------------------------------------------------------
Start RAM, DSP and Shift Register Reporting
2default:default
u
%s*synth2f
R---------------------------------------------------------------------------------
2default:default
¶
%s*synth2ñ
Å---------------------------------------------------------------------------------
Finished RAM, DSP and Shift Register Reporting
2default:default
u
%s*synth2f
R---------------------------------------------------------------------------------
2default:default
8
%s*synth2)

Report BlackBoxes: 
2default:default
A
%s*synth22
+-+--------------+----------+
2default:default
A
%s*synth22
| |BlackBox name |Instances |
2default:default
A
%s*synth22
+-+--------------+----------+
2default:default
A
%s*synth22
+-+--------------+----------+
2default:default
8
%s*synth2)

Report Cell Usage: 
2default:default
@
%s*synth21
+------+------------+------+
2default:default
@
%s*synth21
|      |Cell        |Count |
2default:default
@
%s*synth21
+------+------------+------+
2default:default
@
%s*synth21
|1     |BUFG        |     2|
2default:default
@
%s*synth21
|2     |LUT1        |     1|
2default:default
@
%s*synth21
|3     |PLLE2_ADV_1 |     1|
2default:default
@
%s*synth21
|4     |IBUF        |     1|
2default:default
@
%s*synth21
+------+------------+------+
2default:default
<
%s*synth2-

Report Instance Areas: 
2default:default
N
%s*synth2?
++------+---------+----------------+------+
2default:default
N
%s*synth2?
+|      |Instance |Module          |Cells |
2default:default
N
%s*synth2?
++------+---------+----------------+------+
2default:default
N
%s*synth2?
+|1     |top      |                |     5|
2default:default
N
%s*synth2?
+|2     |  U0     |dac_clk_clk_wiz |     5|
2default:default
N
%s*synth2?
++------+---------+----------------+------+
2default:default
¶
%s*synth2ñ
ÅFinished Writing Synthesis Report : Time (s): cpu = 00:00:18 ; elapsed = 00:00:25 . Memory (MB): peak = 569.992 ; gain = 421.570
2default:default
i
%s*synth2Z
FSynthesis finished with 0 errors, 0 critical warnings and 0 warnings.
2default:default
£
%s*synth2ì
Synthesis Optimization Complete : Time (s): cpu = 00:00:18 ; elapsed = 00:00:25 . Memory (MB): peak = 569.992 ; gain = 421.570
2default:default
\
-Analyzing %s Unisim elements for replacement
17*netlist2
22default:defaultZ29-17
a
2Unisim Transformation completed in %s CPU seconds
28*netlist2
02default:defaultZ29-28
‡
$Parsing XDC File [%s] for cell '%s'
848*designutils2É
oz:/DAT096/git/ES-Project-Spring-2014/Source code/HW/soundlie/soundlie.srcs/sources_1/ip/dac_clk/dac_clk_OOC.xdc2default:default2
U02default:defaultZ20-848
È
-Finished Parsing XDC File [%s] for cell '%s'
847*designutils2É
oz:/DAT096/git/ES-Project-Spring-2014/Source code/HW/soundlie/soundlie.srcs/sources_1/ip/dac_clk/dac_clk_OOC.xdc2default:default2
U02default:defaultZ20-847
€
$Parsing XDC File [%s] for cell '%s'
848*designutils2
kz:/DAT096/git/ES-Project-Spring-2014/Source code/HW/soundlie/soundlie.srcs/sources_1/ip/dac_clk/dac_clk.xdc2default:default2
U02default:defaultZ20-848
ﬁ
%Done setting XDC timing constraints.
35*timing2Å
kz:/DAT096/git/ES-Project-Spring-2014/Source code/HW/soundlie/soundlie.srcs/sources_1/ip/dac_clk/dac_clk.xdc2default:default2
562default:default8@Z38-35
—
Deriving generated clocks
2*timing2Å
kz:/DAT096/git/ES-Project-Spring-2014/Source code/HW/soundlie/soundlie.srcs/sources_1/ip/dac_clk/dac_clk.xdc2default:default2
562default:default8@Z38-2
‰
-Finished Parsing XDC File [%s] for cell '%s'
847*designutils2
kz:/DAT096/git/ES-Project-Spring-2014/Source code/HW/soundlie/soundlie.srcs/sources_1/ip/dac_clk/dac_clk.xdc2default:default2
U02default:defaultZ20-847
‚
$Parsing XDC File [%s] for cell '%s'
848*designutils2Ö
qz:/DAT096/git/ES-Project-Spring-2014/Source code/HW/soundlie/soundlie.srcs/sources_1/ip/dac_clk/dac_clk_board.xdc2default:default2
U02default:defaultZ20-848
Î
-Finished Parsing XDC File [%s] for cell '%s'
847*designutils2Ö
qz:/DAT096/git/ES-Project-Spring-2014/Source code/HW/soundlie/soundlie.srcs/sources_1/ip/dac_clk/dac_clk_board.xdc2default:default2
U02default:defaultZ20-847
C
Pushed %s inverter(s).
98*opt2
02default:defaultZ31-138
u
!Unisim Transformation Summary:
%s111*project29
%No Unisim elements were transformed.
2default:defaultZ1-111
L
Releasing license: %s
83*common2
	Synthesis2default:defaultZ17-83
Ω
G%s Infos, %s Warnings, %s Critical Warnings and %s Errors encountered.
28*	vivadotcl2
232default:default2
02default:default2
02default:default2
02default:defaultZ4-41
U
%s completed successfully
29*	vivadotcl2 
synth_design2default:defaultZ4-42
¸
I%sTime (s): cpu = %s ; elapsed = %s . Memory (MB): peak = %s ; gain = %s
268*common2"
synth_design: 2default:default2
00:00:272default:default2
00:00:312default:default2
982.3712default:default2
789.9802default:defaultZ17-268

sreport_utilization: Time (s): cpu = 00:00:00 ; elapsed = 00:00:00.098 . Memory (MB): peak = 982.371 ; gain = 0.000
*common
w
Exiting %s at %s...
206*common2
Vivado2default:default2,
Fri Apr 25 17:39:42 20142default:defaultZ17-206