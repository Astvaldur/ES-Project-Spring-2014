# 
# Synthesis run script generated by Vivado
# 

  set_param gui.test TreeTableDev
set_msg_config -id {HDL 9-1061} -limit 100000
set_msg_config -id {HDL 9-1654} -limit 100000
set_msg_config -id {Labtools 27-147} -limit 4294967295
create_project -in_memory -part xc7a100tcsg324-2
set_property target_language VHDL [current_project]
set_param project.compositeFile.enableAutoGeneration 0
add_files C:/Project/soundlie/soundlie.runs/xadc_wiz_0_synth_1/xadc_wiz_0.dcp
set_property used_in_implementation false [get_files C:/Project/soundlie/soundlie.runs/xadc_wiz_0_synth_1/xadc_wiz_0.dcp]
set_property use_blackbox_stub false [get_files C:/Project/soundlie/soundlie.runs/xadc_wiz_0_synth_1/xadc_wiz_0.dcp]
read_verilog c:/Project/soundlie/soundlie.srcs/sources_1/ip/xadc_wiz_0/xadc_wiz_0_stub.v
read_vhdl -library grlib {
  C:/Project/soundlie/soundlie.srcs/sources_1/imports/grlib-gpl-1.3.4-b4140/lib/grlib/stdlib/version.vhd
  C:/Project/soundlie/soundlie.srcs/sources_1/imports/grlib-gpl-1.3.4-b4140/lib/grlib/stdlib/config_types.vhd
  C:/Project/soundlie/soundlie.srcs/sources_1/imports/grlib-gpl-1.3.4-b4140/lib/grlib/stdlib/stdlib.vhd
  C:/Project/soundlie/soundlie.srcs/sources_1/imports/grlib-gpl-1.3.4-b4140/lib/grlib/stdlib/config.vhd
  C:/Project/soundlie/soundlie.srcs/sources_1/imports/grlib-gpl-1.3.4-b4140/lib/grlib/amba/amba.vhd
  C:/Project/soundlie/soundlie.srcs/sources_1/imports/grlib-gpl-1.3.4-b4140/lib/grlib/sparc/sparc.vhd
  C:/Project/soundlie/soundlie.srcs/sources_1/imports/grlib-gpl-1.3.4-b4140/lib/grlib/modgen/multlib.vhd
  C:/Project/soundlie/soundlie.srcs/sources_1/imports/grlib-gpl-1.3.4-b4140/lib/grlib/modgen/leaves.vhd
  C:/Project/soundlie/soundlie.srcs/sources_1/imports/grlib-gpl-1.3.4-b4140/lib/grlib/amba/devices.vhd
  C:/Project/soundlie/soundlie.srcs/sources_1/imports/grlib-gpl-1.3.4-b4140/lib/grlib/amba/ahbmst.vhd
  C:/Project/soundlie/soundlie.srcs/sources_1/imports/grlib-gpl-1.3.4-b4140/lib/grlib/amba/apbctrl.vhd
  C:/Project/soundlie/soundlie.srcs/sources_1/imports/grlib-gpl-1.3.4-b4140/lib/grlib/amba/ahbctrl.vhd
}
read_vhdl -library techmap {
  C:/Project/soundlie/soundlie.srcs/sources_1/imports/grlib-gpl-1.3.4-b4140/lib/techmap/gencomp/gencomp.vhd
  C:/Project/soundlie/soundlie.srcs/sources_1/imports/grlib-gpl-1.3.4-b4140/lib/techmap/maps/allclkgen.vhd
  C:/Project/soundlie/soundlie.srcs/sources_1/imports/grlib-gpl-1.3.4-b4140/lib/techmap/inferred/memory_inferred.vhd
  C:/Project/soundlie/soundlie.srcs/sources_1/imports/grlib-gpl-1.3.4-b4140/lib/techmap/unisim/memory_unisim.vhd
  C:/Project/soundlie/soundlie.srcs/sources_1/imports/grlib-gpl-1.3.4-b4140/lib/techmap/maps/grgates.vhd
  C:/Project/soundlie/soundlie.srcs/sources_1/imports/grlib-gpl-1.3.4-b4140/lib/techmap/maps/allmem.vhd
  C:/Project/soundlie/soundlie.srcs/sources_1/imports/grlib-gpl-1.3.4-b4140/lib/techmap/maps/syncram.vhd
  C:/Project/soundlie/soundlie.srcs/sources_1/imports/grlib-gpl-1.3.4-b4140/lib/techmap/maps/syncram_2p.vhd
  C:/Project/soundlie/soundlie.srcs/sources_1/imports/grlib-gpl-1.3.4-b4140/lib/techmap/maps/allmul.vhd
  C:/Project/soundlie/soundlie.srcs/sources_1/imports/grlib-gpl-1.3.4-b4140/lib/techmap/inferred/mul_inferred.vhd
  C:/Project/soundlie/soundlie.srcs/sources_1/imports/grlib-gpl-1.3.4-b4140/lib/techmap/maps/techmult.vhd
  C:/Project/soundlie/soundlie.srcs/sources_1/imports/grlib-gpl-1.3.4-b4140/lib/techmap/maps/regfile_3p.vhd
  C:/Project/soundlie/soundlie.srcs/sources_1/imports/grlib-gpl-1.3.4-b4140/lib/techmap/unisim/clkgen_unisim.vhd
  C:/Project/soundlie/soundlie.srcs/sources_1/imports/grlib-gpl-1.3.4-b4140/lib/techmap/unisim/buffer_unisim.vhd
  C:/Project/soundlie/soundlie.srcs/sources_1/imports/grlib-gpl-1.3.4-b4140/lib/techmap/maps/syncram_dp.vhd
  C:/Project/soundlie/soundlie.srcs/sources_1/imports/grlib-gpl-1.3.4-b4140/lib/techmap/maps/syncram64.vhd
  C:/Project/soundlie/soundlie.srcs/sources_1/imports/grlib-gpl-1.3.4-b4140/lib/techmap/maps/grlfpw_net.vhd
  C:/Project/soundlie/soundlie.srcs/sources_1/imports/grlib-gpl-1.3.4-b4140/lib/techmap/maps/grfpw_net.vhd
  C:/Project/soundlie/soundlie.srcs/sources_1/imports/grlib-gpl-1.3.4-b4140/lib/techmap/gencomp/netcomp.vhd
  C:/Project/soundlie/soundlie.srcs/sources_1/imports/grlib-gpl-1.3.4-b4140/lib/techmap/unisim/tap_unisim.vhd
  C:/Project/soundlie/soundlie.srcs/sources_1/imports/grlib-gpl-1.3.4-b4140/lib/techmap/maps/techbuf.vhd
  C:/Project/soundlie/soundlie.srcs/sources_1/imports/grlib-gpl-1.3.4-b4140/lib/techmap/maps/clkmux.vhd
  C:/Project/soundlie/soundlie.srcs/sources_1/imports/grlib-gpl-1.3.4-b4140/lib/techmap/maps/clkand.vhd
  C:/Project/soundlie/soundlie.srcs/sources_1/imports/grlib-gpl-1.3.4-b4140/lib/techmap/maps/alltap.vhd
  C:/Project/soundlie/soundlie.srcs/sources_1/imports/grlib-gpl-1.3.4-b4140/lib/techmap/unisim/pads_unisim.vhd
  C:/Project/soundlie/soundlie.srcs/sources_1/imports/grlib-gpl-1.3.4-b4140/lib/techmap/maps/tap.vhd
  C:/Project/soundlie/soundlie.srcs/sources_1/imports/grlib-gpl-1.3.4-b4140/lib/techmap/maps/syncreg.vhd
  C:/Project/soundlie/soundlie.srcs/sources_1/imports/grlib-gpl-1.3.4-b4140/lib/techmap/maps/syncrambw.vhd
  C:/Project/soundlie/soundlie.srcs/sources_1/imports/grlib-gpl-1.3.4-b4140/lib/techmap/maps/allpads.vhd
  C:/Project/soundlie/soundlie.srcs/sources_1/imports/grlib-gpl-1.3.4-b4140/lib/techmap/maps/outpad.vhd
  C:/Project/soundlie/soundlie.srcs/sources_1/imports/grlib-gpl-1.3.4-b4140/lib/techmap/maps/iopad.vhd
  C:/Project/soundlie/soundlie.srcs/sources_1/imports/grlib-gpl-1.3.4-b4140/lib/techmap/maps/inpad.vhd
  C:/Project/soundlie/soundlie.srcs/sources_1/imports/grlib-gpl-1.3.4-b4140/lib/techmap/maps/clkgen.vhd
}
read_vhdl -library gaisler {
  C:/Project/soundlie/soundlie.srcs/sources_1/imports/grlib-gpl-1.3.4-b4140/lib/gaisler/srmmu/mmuconfig.vhd
  C:/Project/soundlie/soundlie.srcs/sources_1/imports/grlib-gpl-1.3.4-b4140/lib/gaisler/srmmu/mmuiface.vhd
  C:/Project/soundlie/soundlie.srcs/sources_1/imports/grlib-gpl-1.3.4-b4140/lib/gaisler/leon3/leon3.vhd
  C:/Project/soundlie/soundlie.srcs/sources_1/imports/grlib-gpl-1.3.4-b4140/lib/gaisler/srmmu/mmulrue.vhd
  C:/Project/soundlie/soundlie.srcs/sources_1/imports/grlib-gpl-1.3.4-b4140/lib/gaisler/srmmu/libmmu.vhd
  C:/Project/soundlie/soundlie.srcs/sources_1/imports/grlib-gpl-1.3.4-b4140/lib/gaisler/leon3v3/libfpu.vhd
  C:/Project/soundlie/soundlie.srcs/sources_1/imports/grlib-gpl-1.3.4-b4140/lib/gaisler/arith/arith.vhd
  C:/Project/soundlie/soundlie.srcs/sources_1/imports/grlib-gpl-1.3.4-b4140/lib/gaisler/srmmu/mmutlbcam.vhd
  C:/Project/soundlie/soundlie.srcs/sources_1/imports/grlib-gpl-1.3.4-b4140/lib/gaisler/srmmu/mmulru.vhd
  C:/Project/soundlie/soundlie.srcs/sources_1/imports/grlib-gpl-1.3.4-b4140/lib/gaisler/leon3v3/libiu.vhd
  C:/Project/soundlie/soundlie.srcs/sources_1/imports/grlib-gpl-1.3.4-b4140/lib/gaisler/srmmu/mmutw.vhd
  C:/Project/soundlie/soundlie.srcs/sources_1/imports/grlib-gpl-1.3.4-b4140/lib/gaisler/srmmu/mmutlb.vhd
  C:/Project/soundlie/soundlie.srcs/sources_1/imports/grlib-gpl-1.3.4-b4140/lib/gaisler/leon3v3/libcache.vhd
  C:/Project/soundlie/soundlie.srcs/sources_1/imports/grlib-gpl-1.3.4-b4140/lib/gaisler/srmmu/mmu.vhd
  C:/Project/soundlie/soundlie.srcs/sources_1/imports/grlib-gpl-1.3.4-b4140/lib/gaisler/leon3v3/mmu_icache.vhd
  C:/Project/soundlie/soundlie.srcs/sources_1/imports/grlib-gpl-1.3.4-b4140/lib/gaisler/leon3v3/mmu_dcache.vhd
  C:/Project/soundlie/soundlie.srcs/sources_1/imports/grlib-gpl-1.3.4-b4140/lib/gaisler/leon3v3/mmu_acache.vhd
  C:/Project/soundlie/soundlie.srcs/sources_1/imports/grlib-gpl-1.3.4-b4140/lib/gaisler/leon3v3/libleon3.vhd
  C:/Project/soundlie/soundlie.srcs/sources_1/imports/grlib-gpl-1.3.4-b4140/lib/gaisler/uart/uart.vhd
  C:/Project/soundlie/soundlie.srcs/sources_1/imports/grlib-gpl-1.3.4-b4140/lib/gaisler/net/net.vhd
  C:/Project/soundlie/soundlie.srcs/sources_1/imports/grlib-gpl-1.3.4-b4140/lib/gaisler/misc/misc.vhd
  C:/Project/soundlie/soundlie.srcs/sources_1/imports/grlib-gpl-1.3.4-b4140/lib/gaisler/leon3v3/regfile_3p_l3.vhd
  C:/Project/soundlie/soundlie.srcs/sources_1/imports/grlib-gpl-1.3.4-b4140/lib/gaisler/leon3v3/mmu_cache.vhd
  C:/Project/soundlie/soundlie.srcs/sources_1/imports/grlib-gpl-1.3.4-b4140/lib/gaisler/leon3v3/iu3.vhd
  C:/Project/soundlie/soundlie.srcs/sources_1/imports/grlib-gpl-1.3.4-b4140/lib/gaisler/arith/mul32.vhd
  C:/Project/soundlie/soundlie.srcs/sources_1/imports/grlib-gpl-1.3.4-b4140/lib/gaisler/arith/div32.vhd
  C:/Project/soundlie/soundlie.srcs/sources_1/imports/grlib-gpl-1.3.4-b4140/lib/gaisler/uart/libdcom.vhd
  C:/Project/soundlie/soundlie.srcs/sources_1/imports/grlib-gpl-1.3.4-b4140/lib/gaisler/memctrl/memctrl.vhd
  C:/Project/soundlie/soundlie.srcs/sources_1/imports/grlib-gpl-1.3.4-b4140/lib/gaisler/leon3v3/tbufmem.vhd
  C:/Project/soundlie/soundlie.srcs/sources_1/imports/grlib-gpl-1.3.4-b4140/lib/gaisler/leon3v3/proc3.vhd
  C:/Project/soundlie/soundlie.srcs/sources_1/imports/grlib-gpl-1.3.4-b4140/lib/gaisler/leon3v3/grlfpwx.vhd
  C:/Project/soundlie/soundlie.srcs/sources_1/imports/grlib-gpl-1.3.4-b4140/lib/gaisler/leon3v3/grfpwxsh.vhd
  C:/Project/soundlie/soundlie.srcs/sources_1/imports/grlib-gpl-1.3.4-b4140/lib/gaisler/leon3v3/grfpwx.vhd
  C:/Project/soundlie/soundlie.srcs/sources_1/imports/grlib-gpl-1.3.4-b4140/lib/gaisler/leon3v3/cachemem.vhd
  C:/Project/soundlie/soundlie.srcs/sources_1/imports/grlib-gpl-1.3.4-b4140/lib/gaisler/jtag/libjtagcom.vhd
  C:/Project/soundlie/soundlie.srcs/sources_1/imports/grlib-gpl-1.3.4-b4140/lib/gaisler/greth/ethernet_mac.vhd
  C:/Project/soundlie/soundlie.srcs/sources_1/imports/grlib-gpl-1.3.4-b4140/lib/gaisler/uart/dcom_uart.vhd
  C:/Project/soundlie/soundlie.srcs/sources_1/imports/grlib-gpl-1.3.4-b4140/lib/gaisler/uart/dcom.vhd
  C:/Project/soundlie/soundlie.srcs/sources_1/imports/grlib-gpl-1.3.4-b4140/lib/gaisler/memctrl/sdmctrl.vhd
  C:/Project/soundlie/soundlie.srcs/sources_1/imports/grlib-gpl-1.3.4-b4140/lib/gaisler/leon3v3/leon3x.vhd
  C:/Project/soundlie/soundlie.srcs/sources_1/imports/grlib-gpl-1.3.4-b4140/lib/gaisler/leon3v3/dsu3x.vhd
  C:/Project/soundlie/soundlie.srcs/sources_1/imports/grlib-gpl-1.3.4-b4140/lib/gaisler/jtag/jtagcom2.vhd
  C:/Project/soundlie/soundlie.srcs/sources_1/imports/grlib-gpl-1.3.4-b4140/lib/gaisler/jtag/jtagcom.vhd
  C:/Project/soundlie/soundlie.srcs/sources_1/imports/grlib-gpl-1.3.4-b4140/lib/gaisler/jtag/jtag.vhd
  C:/Project/soundlie/soundlie.srcs/sources_1/imports/grlib-gpl-1.3.4-b4140/lib/gaisler/greth/greth_gbit.vhd
  C:/Project/soundlie/soundlie.srcs/sources_1/imports/grlib-gpl-1.3.4-b4140/lib/gaisler/greth/greth.vhd
  C:/Project/soundlie/soundlie.srcs/sources_1/imports/grlib-gpl-1.3.4-b4140/lib/gaisler/uart/apbuart.vhd
  C:/Project/soundlie/soundlie.srcs/sources_1/imports/grlib-gpl-1.3.4-b4140/lib/gaisler/uart/ahbuart.vhd
  C:/Project/soundlie/soundlie.srcs/sources_1/imports/grlib-gpl-1.3.4-b4140/lib/gaisler/spi/spi.vhd
  C:/Project/soundlie/soundlie.srcs/sources_1/imports/grlib-gpl-1.3.4-b4140/lib/gaisler/misc/rstgen.vhd
  C:/Project/soundlie/soundlie.srcs/sources_1/imports/grlib-gpl-1.3.4-b4140/lib/gaisler/misc/gptimer.vhd
  C:/Project/soundlie/soundlie.srcs/sources_1/imports/grlib-gpl-1.3.4-b4140/lib/gaisler/misc/ahbram.vhd
  C:/Project/soundlie/soundlie.srcs/sources_1/imports/grlib-gpl-1.3.4-b4140/lib/gaisler/leon3v3/leon3s.vhd
  C:/Project/soundlie/soundlie.srcs/sources_1/imports/grlib-gpl-1.3.4-b4140/lib/gaisler/leon3v3/dsu3.vhd
  C:/Project/soundlie/soundlie.srcs/sources_1/imports/grlib-gpl-1.3.4-b4140/lib/gaisler/jtag/ahbjtag.vhd
  C:/Project/soundlie/soundlie.srcs/sources_1/imports/grlib-gpl-1.3.4-b4140/lib/gaisler/irqmp/irqmp.vhd
  C:/Project/soundlie/soundlie.srcs/sources_1/imports/grlib-gpl-1.3.4-b4140/lib/gaisler/greth/grethm.vhd
}
read_vhdl -library eth {
  C:/Project/soundlie/soundlie.srcs/sources_1/imports/grlib-gpl-1.3.4-b4140/lib/eth/core/greth_pkg.vhd
  C:/Project/soundlie/soundlie.srcs/sources_1/imports/grlib-gpl-1.3.4-b4140/lib/eth/core/eth_rstgen.vhd
  C:/Project/soundlie/soundlie.srcs/sources_1/imports/grlib-gpl-1.3.4-b4140/lib/eth/core/greth_tx.vhd
  C:/Project/soundlie/soundlie.srcs/sources_1/imports/grlib-gpl-1.3.4-b4140/lib/eth/core/greth_rx.vhd
  C:/Project/soundlie/soundlie.srcs/sources_1/imports/grlib-gpl-1.3.4-b4140/lib/eth/core/eth_edcl_ahb_mst.vhd
  C:/Project/soundlie/soundlie.srcs/sources_1/imports/grlib-gpl-1.3.4-b4140/lib/eth/core/eth_ahb_mst.vhd
  C:/Project/soundlie/soundlie.srcs/sources_1/imports/grlib-gpl-1.3.4-b4140/lib/eth/core/grethc.vhd
  C:/Project/soundlie/soundlie.srcs/sources_1/imports/grlib-gpl-1.3.4-b4140/lib/eth/comp/ethcomp.vhd
}
read_vhdl {
  {C:/Project/soundlie/soundlie.srcs/sources_1/imports/XADC module/XADC_pkg.vhd}
  {C:/Project/soundlie/soundlie.srcs/sources_1/imports/XADC module/interface_XADC.vhd}
  {C:/Project/soundlie/soundlie.srcs/sources_1/imports/PWM module/PWM_pkg.vhd}
  {C:/Project/soundlie/soundlie.srcs/sources_1/imports/PWM module/PWM.vhd}
  {C:/Project/soundlie/soundlie.srcs/sources_1/imports/XADC module/XADCapb.vhd}
  {C:/Project/soundlie/soundlie.srcs/sources_1/imports/PWM module/PWMapb.vhd}
  C:/Project/soundlie/soundlie.srcs/sources_1/imports/grlib-gpl-1.3.4-b4140/designs/leon3-digilent-nexys4/config.vhd
  C:/Project/soundlie/soundlie.srcs/sources_1/imports/grlib-gpl-1.3.4-b4140/designs/leon3-digilent-nexys4/ahbrom.vhd
  C:/Project/soundlie/soundlie.srcs/sources_1/imports/grlib-gpl-1.3.4-b4140/designs/leon3-digilent-nexys4/leon3mp.vhd
}
read_vhdl -library esa {
  C:/Project/soundlie/soundlie.srcs/sources_1/imports/grlib-gpl-1.3.4-b4140/lib/esa/memoryctrl/memoryctrl.vhd
  C:/Project/soundlie/soundlie.srcs/sources_1/imports/grlib-gpl-1.3.4-b4140/lib/esa/memoryctrl/mctrl.vhd
}
read_xdc C:/Project/soundlie/soundlie.srcs/constrs_1/new/leon3mp.xdc
set_property used_in_implementation false [get_files C:/Project/soundlie/soundlie.srcs/constrs_1/new/leon3mp.xdc]

read_xdc C:/Project/soundlie/soundlie.srcs/constrs_1/new/misc.xdc
set_property used_in_implementation false [get_files C:/Project/soundlie/soundlie.srcs/constrs_1/new/misc.xdc]

read_xdc C:/Project/soundlie/soundlie.srcs/constrs_1/new/io.xdc
set_property used_in_implementation false [get_files C:/Project/soundlie/soundlie.srcs/constrs_1/new/io.xdc]

read_xdc C:/Project/soundlie/soundlie.srcs/constrs_1/new/uart.xdc
set_property used_in_implementation false [get_files C:/Project/soundlie/soundlie.srcs/constrs_1/new/uart.xdc]

read_xdc C:/Project/soundlie/soundlie.srcs/constrs_1/new/xadc.xdc
set_property used_in_implementation false [get_files C:/Project/soundlie/soundlie.srcs/constrs_1/new/xadc.xdc]

read_xdc C:/Project/soundlie/soundlie.srcs/constrs_1/new/pwm.xdc
set_property used_in_implementation false [get_files C:/Project/soundlie/soundlie.srcs/constrs_1/new/pwm.xdc]

read_xdc C:/Project/soundlie/soundlie.srcs/constrs_1/new/unused.xdc
set_property used_in_implementation false [get_files C:/Project/soundlie/soundlie.srcs/constrs_1/new/unused.xdc]

read_xdc dont_buffer.xdc
set_property used_in_implementation false [get_files dont_buffer.xdc]
set_param synth.vivado.isSynthRun true
set_property webtalk.parent_dir C:/Project/soundlie/soundlie.data/wt [current_project]
set_property parent.project_dir C:/Project/soundlie [current_project]
synth_design -top leon3mp -part xc7a100tcsg324-2 -directive RuntimeOptimized
write_checkpoint leon3mp.dcp
report_utilization -file leon3mp_utilization_synth.rpt -pb leon3mp_utilization_synth.pb