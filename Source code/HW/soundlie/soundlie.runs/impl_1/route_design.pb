
H
Command: %s
53*	vivadotcl2 
route_design2default:defaultZ4-113
›
@Attempting to get a license for feature '%s' and/or device '%s'
308*common2"
Implementation2default:default2
xc7a100t2default:defaultZ17-347
‹
0Got license for feature '%s' and/or device '%s'
310*common2"
Implementation2default:default2
xc7a100t2default:defaultZ17-349
g
,Running DRC as a precondition to command %s
22*	vivadotcl2 
route_design2default:defaultZ4-22
G
Running DRC with %s threads
24*drc2
22default:defaultZ23-27
M
DRC finished with %s
79*	vivadotcl2
0 Errors2default:defaultZ4-198
\
BPlease refer to the DRC report (report_drc) for more information.
80*	vivadotclZ4-199
M

Starting %s Task
103*constraints2
Routing2default:defaultZ18-103
p
BMultithreading enabled for route_design using a maximum of %s CPUs97*route2
22default:defaultZ35-254
K

Starting %s Task
103*constraints2
Route2default:defaultZ18-103
g

Phase %s%s
101*constraints2
1 2default:default2#
Build RT Design2default:defaultZ18-101
s

Phase %s%s
101*constraints2
1.1 2default:default2-
Build Netlist & NodeGraph2default:defaultZ18-101
F
:Phase 1.1 Build Netlist & NodeGraph | Checksum: 1b4372eb2
*common
ˆ

%s
*constraints2q
]Time (s): cpu = 00:01:12 ; elapsed = 00:00:33 . Memory (MB): peak = 1165.605 ; gain = 137.9532default:default
9
-Phase 1 Build RT Design | Checksum: f1f4c471
*common
ˆ

%s
*constraints2q
]Time (s): cpu = 00:01:12 ; elapsed = 00:00:33 . Memory (MB): peak = 1165.605 ; gain = 137.9532default:default
m

Phase %s%s
101*constraints2
2 2default:default2)
Router Initialization2default:defaultZ18-101
f

Phase %s%s
101*constraints2
2.1 2default:default2 
Create Timer2default:defaultZ18-101
8
,Phase 2.1 Create Timer | Checksum: f1f4c471
*common
ˆ

%s
*constraints2q
]Time (s): cpu = 00:01:13 ; elapsed = 00:00:34 . Memory (MB): peak = 1165.605 ; gain = 137.9532default:default
i

Phase %s%s
101*constraints2
2.2 2default:default2#
Restore Routing2default:defaultZ18-101
;
/Phase 2.2 Restore Routing | Checksum: f1f4c471
*common
ˆ

%s
*constraints2q
]Time (s): cpu = 00:01:13 ; elapsed = 00:00:34 . Memory (MB): peak = 1170.316 ; gain = 142.6642default:default
m

Phase %s%s
101*constraints2
2.3 2default:default2'
Special Net Routing2default:defaultZ18-101
?
3Phase 2.3 Special Net Routing | Checksum: 9c1da427
*common
ˆ

%s
*constraints2q
]Time (s): cpu = 00:01:14 ; elapsed = 00:00:35 . Memory (MB): peak = 1185.668 ; gain = 158.0162default:default
q

Phase %s%s
101*constraints2
2.4 2default:default2+
Local Clock Net Routing2default:defaultZ18-101
C
7Phase 2.4 Local Clock Net Routing | Checksum: 9c1da427
*common
ˆ

%s
*constraints2q
]Time (s): cpu = 00:01:14 ; elapsed = 00:00:35 . Memory (MB): peak = 1185.668 ; gain = 158.0162default:default
g

Phase %s%s
101*constraints2
2.5 2default:default2!
Update Timing2default:defaultZ18-101
w

Phase %s%s
101*constraints2
2.5.1 2default:default2/
Update timing with NCN CRPR2default:defaultZ18-101
l

Phase %s%s
101*constraints2
2.5.1.1 2default:default2"
Hold Budgeting2default:defaultZ18-101
>
2Phase 2.5.1.1 Hold Budgeting | Checksum: 9c1da427
*common
ˆ

%s
*constraints2q
]Time (s): cpu = 00:01:22 ; elapsed = 00:00:40 . Memory (MB): peak = 1192.156 ; gain = 164.5042default:default
I
=Phase 2.5.1 Update timing with NCN CRPR | Checksum: 9c1da427
*common
ˆ

%s
*constraints2q
]Time (s): cpu = 00:01:22 ; elapsed = 00:00:40 . Memory (MB): peak = 1192.156 ; gain = 164.5042default:default
9
-Phase 2.5 Update Timing | Checksum: 9c1da427
*common
ˆ

%s
*constraints2q
]Time (s): cpu = 00:01:22 ; elapsed = 00:00:40 . Memory (MB): peak = 1192.156 ; gain = 164.5042default:default
~
Estimated Timing Summary %s
57*route2J
6| WNS=-1.08  | TNS=-13.4  | WHS=-1.98  | THS=-270   |
2default:defaultZ35-57
c

Phase %s%s
101*constraints2
2.6 2default:default2
	Budgeting2default:defaultZ18-101
5
)Phase 2.6 Budgeting | Checksum: 9c1da427
*common
ˆ

%s
*constraints2q
]Time (s): cpu = 00:01:25 ; elapsed = 00:00:42 . Memory (MB): peak = 1192.156 ; gain = 164.5042default:default
?
3Phase 2 Router Initialization | Checksum: 9c1da427
*common
ˆ

%s
*constraints2q
]Time (s): cpu = 00:01:25 ; elapsed = 00:00:42 . Memory (MB): peak = 1192.156 ; gain = 164.5042default:default
g

Phase %s%s
101*constraints2
3 2default:default2#
Initial Routing2default:defaultZ18-101
:
.Phase 3 Initial Routing | Checksum: 13505035b
*common
ˆ

%s
*constraints2q
]Time (s): cpu = 00:02:38 ; elapsed = 00:01:20 . Memory (MB): peak = 1733.297 ; gain = 705.6452default:default
j

Phase %s%s
101*constraints2
4 2default:default2&
Rip-up And Reroute2default:defaultZ18-101
l

Phase %s%s
101*constraints2
4.1 2default:default2&
Global Iteration 02default:defaultZ18-101
k

Phase %s%s
101*constraints2
4.1.1 2default:default2#
Remove Overlaps2default:defaultZ18-101
>
2Phase 4.1.1 Remove Overlaps | Checksum: 118cef964
*common
ˆ

%s
*constraints2q
]Time (s): cpu = 00:04:45 ; elapsed = 00:02:40 . Memory (MB): peak = 1743.430 ; gain = 715.7772default:default
i

Phase %s%s
101*constraints2
4.1.2 2default:default2!
Update Timing2default:defaultZ18-101
<
0Phase 4.1.2 Update Timing | Checksum: 118cef964
*common
ˆ

%s
*constraints2q
]Time (s): cpu = 00:04:47 ; elapsed = 00:02:41 . Memory (MB): peak = 1743.430 ; gain = 715.7772default:default
~
Estimated Timing Summary %s
57*route2J
6| WNS=-0.375 | TNS=-3.29  | WHS=N/A    | THS=N/A    |
2default:defaultZ35-57
p

Phase %s%s
101*constraints2
4.1.3 2default:default2(
collectNewHoldAndFix2default:defaultZ18-101
C
7Phase 4.1.3 collectNewHoldAndFix | Checksum: 118cef964
*common
ˆ

%s
*constraints2q
]Time (s): cpu = 00:04:48 ; elapsed = 00:02:41 . Memory (MB): peak = 1743.430 ; gain = 715.7772default:default
m

Phase %s%s
101*constraints2
4.1.4 2default:default2%
GlobIterForTiming2default:defaultZ18-101
k

Phase %s%s
101*constraints2
4.1.4.1 2default:default2!
Update Timing2default:defaultZ18-101
=
1Phase 4.1.4.1 Update Timing | Checksum: f0169286
*common
ˆ

%s
*constraints2q
]Time (s): cpu = 00:04:48 ; elapsed = 00:02:42 . Memory (MB): peak = 1743.430 ; gain = 715.7772default:default
l

Phase %s%s
101*constraints2
4.1.4.2 2default:default2"
Fast Budgeting2default:defaultZ18-101
>
2Phase 4.1.4.2 Fast Budgeting | Checksum: f0169286
*common
ˆ

%s
*constraints2q
]Time (s): cpu = 00:04:49 ; elapsed = 00:02:42 . Memory (MB): peak = 1745.848 ; gain = 718.1952default:default
@
4Phase 4.1.4 GlobIterForTiming | Checksum: 18e302eff
*common
ˆ

%s
*constraints2q
]Time (s): cpu = 00:04:49 ; elapsed = 00:02:43 . Memory (MB): peak = 1745.848 ; gain = 718.1952default:default
?
3Phase 4.1 Global Iteration 0 | Checksum: 18e302eff
*common
ˆ

%s
*constraints2q
]Time (s): cpu = 00:04:49 ; elapsed = 00:02:43 . Memory (MB): peak = 1745.848 ; gain = 718.1952default:default
l

Phase %s%s
101*constraints2
4.2 2default:default2&
Global Iteration 12default:defaultZ18-101
k

Phase %s%s
101*constraints2
4.2.1 2default:default2#
Remove Overlaps2default:defaultZ18-101
>
2Phase 4.2.1 Remove Overlaps | Checksum: 1257df195
*common
ˆ

%s
*constraints2q
]Time (s): cpu = 00:04:50 ; elapsed = 00:02:43 . Memory (MB): peak = 1745.848 ; gain = 718.1952default:default
i

Phase %s%s
101*constraints2
4.2.2 2default:default2!
Update Timing2default:defaultZ18-101
<
0Phase 4.2.2 Update Timing | Checksum: 1257df195
*common
ˆ

%s
*constraints2q
]Time (s): cpu = 00:04:50 ; elapsed = 00:02:43 . Memory (MB): peak = 1745.848 ; gain = 718.1952default:default
~
Estimated Timing Summary %s
57*route2J
6| WNS=-0.374 | TNS=-3.43  | WHS=N/A    | THS=N/A    |
2default:defaultZ35-57
p

Phase %s%s
101*constraints2
4.2.3 2default:default2(
collectNewHoldAndFix2default:defaultZ18-101
C
7Phase 4.2.3 collectNewHoldAndFix | Checksum: 1257df195
*common
ˆ

%s
*constraints2q
]Time (s): cpu = 00:04:50 ; elapsed = 00:02:44 . Memory (MB): peak = 1745.848 ; gain = 718.1952default:default
?
3Phase 4.2 Global Iteration 1 | Checksum: 1257df195
*common
ˆ

%s
*constraints2q
]Time (s): cpu = 00:04:50 ; elapsed = 00:02:44 . Memory (MB): peak = 1745.848 ; gain = 718.1952default:default
=
1Phase 4 Rip-up And Reroute | Checksum: 1257df195
*common
ˆ

%s
*constraints2q
]Time (s): cpu = 00:04:50 ; elapsed = 00:02:44 . Memory (MB): peak = 1745.848 ; gain = 718.1952default:default
e

Phase %s%s
101*constraints2
5 2default:default2!
Delay CleanUp2default:defaultZ18-101
g

Phase %s%s
101*constraints2
5.1 2default:default2!
Update Timing2default:defaultZ18-101
:
.Phase 5.1 Update Timing | Checksum: 1257df195
*common
ˆ

%s
*constraints2q
]Time (s): cpu = 00:04:51 ; elapsed = 00:02:44 . Memory (MB): peak = 1745.848 ; gain = 718.1952default:default
~
Estimated Timing Summary %s
57*route2J
6| WNS=-0.374 | TNS=-3.43  | WHS=N/A    | THS=N/A    |
2default:defaultZ35-57
7
+Phase 5 Delay CleanUp | Checksum: bc946529
*common
ˆ

%s
*constraints2q
]Time (s): cpu = 00:04:52 ; elapsed = 00:02:45 . Memory (MB): peak = 1745.848 ; gain = 718.1952default:default
e

Phase %s%s
101*constraints2
6 2default:default2!
Post Hold Fix2default:defaultZ18-101
l

Phase %s%s
101*constraints2
6.1 2default:default2&
Full Hold Analysis2default:defaultZ18-101
i

Phase %s%s
101*constraints2
6.1.1 2default:default2!
Update Timing2default:defaultZ18-101
;
/Phase 6.1.1 Update Timing | Checksum: bc946529
*common
ˆ

%s
*constraints2q
]Time (s): cpu = 00:04:54 ; elapsed = 00:02:46 . Memory (MB): peak = 1745.848 ; gain = 718.1952default:default
~
Estimated Timing Summary %s
57*route2J
6| WNS=-0.363 | TNS=-3.38  | WHS=-0.222 | THS=-0.253 |
2default:defaultZ35-57
>
2Phase 6.1 Full Hold Analysis | Checksum: bc946529
*common
ˆ

%s
*constraints2q
]Time (s): cpu = 00:04:54 ; elapsed = 00:02:46 . Memory (MB): peak = 1745.848 ; gain = 718.1952default:default
8
,Phase 6 Post Hold Fix | Checksum: 12bf309e7
*common
ˆ

%s
*constraints2q
]Time (s): cpu = 00:04:54 ; elapsed = 00:02:46 . Memory (MB): peak = 1745.848 ; gain = 718.1952default:default
m

Phase %s%s
101*constraints2
7 2default:default2)
Verifying routed nets2default:defaultZ18-101
@
4Phase 7 Verifying routed nets | Checksum: 12bf309e7
*common
ˆ

%s
*constraints2q
]Time (s): cpu = 00:04:54 ; elapsed = 00:02:46 . Memory (MB): peak = 1745.848 ; gain = 718.1952default:default
i

Phase %s%s
101*constraints2
8 2default:default2%
Depositing Routes2default:defaultZ18-101
<
0Phase 8 Depositing Routes | Checksum: 11652e529
*common
ˆ

%s
*constraints2q
]Time (s): cpu = 00:04:57 ; elapsed = 00:02:49 . Memory (MB): peak = 1745.848 ; gain = 718.1952default:default
j

Phase %s%s
101*constraints2
9 2default:default2&
Post Router Timing2default:defaultZ18-101

Post Routing Timing Summary %s
20*route2J
6| WNS=-0.358 | TNS=-3.086 | WHS=0.054  | THS=0.000  |
2default:defaultZ35-20
z
dThe design did not meet timing requirements. Please run report_timing_summary for detailed reports.
39*routeZ35-39
ô
ÜTNS is the sum of the worst slack violation on every endpoint in the design. Review the paths with the biggest WNS violations in the timing reports and modify your constraints or your design to improve both WNS and TNS.
96*routeZ35-253
=
1Phase 9 Post Router Timing | Checksum: 11652e529
*common
ˆ

%s
*constraints2q
]Time (s): cpu = 00:05:06 ; elapsed = 00:02:54 . Memory (MB): peak = 1745.848 ; gain = 718.1952default:default
4
Router Completed Successfully
16*routeZ35-16
4
(Ending Route Task | Checksum: 11652e529
*common
ˆ

%s
*constraints2q
]Time (s): cpu = 00:00:00 ; elapsed = 00:02:54 . Memory (MB): peak = 1745.848 ; gain = 718.1952default:default
ˆ

%s
*constraints2q
]Time (s): cpu = 00:00:00 ; elapsed = 00:02:54 . Memory (MB): peak = 1745.848 ; gain = 718.1952default:default
Q
Releasing license: %s
83*common2"
Implementation2default:defaultZ17-83
½
G%s Infos, %s Warnings, %s Critical Warnings and %s Errors encountered.
28*	vivadotcl2
502default:default2
02default:default2
12default:default2
02default:defaultZ4-41
U
%s completed successfully
29*	vivadotcl2 
route_design2default:defaultZ4-42
ý
I%sTime (s): cpu = %s ; elapsed = %s . Memory (MB): peak = %s ; gain = %s
268*common2"
route_design: 2default:default2
00:05:092default:default2
00:02:562default:default2
1745.8482default:default2
742.5162default:defaultZ17-268
G
Running DRC with %s threads
24*drc2
22default:defaultZ23-27
“
#The results of DRC are in file %s.
168*coretcl2Ò
]C:/ES-Project-Spring-2014/Source code/HW/soundlie/soundlie.runs/impl_1/leon3mp_drc_routed.rpt]C:/ES-Project-Spring-2014/Source code/HW/soundlie/soundlie.runs/impl_1/leon3mp_drc_routed.rpt2default:default8Z2-168
B
,Running Vector-less Activity Propagation...
51*powerZ33-51
G
3
Finished Running Vector-less Activity Propagation
1*powerZ33-1
û
I%sTime (s): cpu = %s ; elapsed = %s . Memory (MB): peak = %s ; gain = %s
268*common2"
report_power: 2default:default2
00:00:372default:default2
00:00:272default:default2
1745.8482default:default2
0.0002default:defaultZ17-268
€
UpdateTimingParams:%s.
91*timing2P
< Speed grade: -2, Delay Type: min_max, Constraints type: SDC2default:defaultZ38-91
s
CMultithreading enabled for timing update using a maximum of %s CPUs155*timing2
22default:defaultZ38-191
4
Writing XDEF routing.
211*designutilsZ20-211
A
#Writing XDEF routing logical nets.
209*designutilsZ20-209
A
#Writing XDEF routing special nets.
210*designutilsZ20-210
‚
I%sTime (s): cpu = %s ; elapsed = %s . Memory (MB): peak = %s ; gain = %s
268*common2)
Write XDEF Complete: 2default:default2
00:00:032default:default2
00:00:032default:default2
1745.8482default:default2
0.0002default:defaultZ17-268


End Record