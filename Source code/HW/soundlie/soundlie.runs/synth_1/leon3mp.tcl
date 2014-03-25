# 
# Synthesis run script generated by Vivado
# 

  set_param gui.test TreeTableDev
set_msg_config -id {HDL 9-1061} -limit 100000
set_msg_config -id {HDL 9-1654} -limit 100000
create_project -in_memory -part xc7a100tcsg324-2
set_property target_language VHDL [current_project]
set_param project.compositeFile.enableAutoGeneration 0
add_files {{C:/ES-Project-Spring-2014/Source code/HW/soundlie/soundlie.runs/xadc_wiz_0_synth_1/xadc_wiz_0.dcp}}
set_property used_in_implementation false [get_files {{C:/ES-Project-Spring-2014/Source code/HW/soundlie/soundlie.runs/xadc_wiz_0_synth_1/xadc_wiz_0.dcp}}]
set_property use_blackbox_stub false [get_files {{C:/ES-Project-Spring-2014/Source code/HW/soundlie/soundlie.runs/xadc_wiz_0_synth_1/xadc_wiz_0.dcp}}]

read_ip {{C:/ES-Project-Spring-2014/Source code/HW/soundlie/soundlie.srcs/sources_1/ip/ila_0/ila_0.xci}}
set_property used_in_implementation false [get_files -all {{c:/ES-Project-Spring-2014/Source code/HW/soundlie/soundlie.srcs/sources_1/ip/ila_0/constraints/ila.xdc}}]
set_property used_in_implementation false [get_files -all {{c:/ES-Project-Spring-2014/Source code/HW/soundlie/soundlie.srcs/sources_1/ip/ila_0/ila_0_ooc.xdc}}]
set_msg_config -id {IP_Flow 19-2162} -severity warning -new_severity info
set_property is_locked true [get_files {{C:/ES-Project-Spring-2014/Source code/HW/soundlie/soundlie.srcs/sources_1/ip/ila_0/ila_0.xci}}]

read_verilog {{c:/ES-Project-Spring-2014/Source code/HW/soundlie/soundlie.srcs/sources_1/ip/xadc_wiz_0/xadc_wiz_0_stub.v}}
read_vhdl -library grlib {
  {C:/ES-Project-Spring-2014/Source code/HW/soundlie/soundlie.srcs/sources_1/imports/grlib-gpl-1.3.4-b4140/lib/grlib/stdlib/version.vhd}
  {C:/ES-Project-Spring-2014/Source code/HW/soundlie/soundlie.srcs/sources_1/imports/grlib-gpl-1.3.4-b4140/lib/grlib/stdlib/config_types.vhd}
  {C:/ES-Project-Spring-2014/Source code/HW/soundlie/soundlie.srcs/sources_1/imports/grlib-gpl-1.3.4-b4140/lib/grlib/stdlib/stdlib.vhd}
  {C:/ES-Project-Spring-2014/Source code/HW/soundlie/soundlie.srcs/sources_1/imports/grlib-gpl-1.3.4-b4140/lib/grlib/stdlib/config.vhd}
  {C:/ES-Project-Spring-2014/Source code/HW/soundlie/soundlie.srcs/sources_1/imports/grlib-gpl-1.3.4-b4140/lib/grlib/amba/amba.vhd}
  {C:/ES-Project-Spring-2014/Source code/HW/soundlie/soundlie.srcs/sources_1/imports/grlib-gpl-1.3.4-b4140/lib/grlib/sparc/sparc.vhd}
  {C:/ES-Project-Spring-2014/Source code/HW/soundlie/soundlie.srcs/sources_1/imports/grlib-gpl-1.3.4-b4140/lib/grlib/modgen/multlib.vhd}
  {C:/ES-Project-Spring-2014/Source code/HW/soundlie/soundlie.srcs/sources_1/imports/grlib-gpl-1.3.4-b4140/lib/grlib/modgen/leaves.vhd}
  {C:/ES-Project-Spring-2014/Source code/HW/soundlie/soundlie.srcs/sources_1/imports/grlib-gpl-1.3.4-b4140/lib/grlib/amba/devices.vhd}
  {C:/ES-Project-Spring-2014/Source code/HW/soundlie/soundlie.srcs/sources_1/imports/grlib-gpl-1.3.4-b4140/lib/grlib/amba/ahbmst.vhd}
  {C:/ES-Project-Spring-2014/Source code/HW/soundlie/soundlie.srcs/sources_1/imports/grlib-gpl-1.3.4-b4140/lib/grlib/amba/apbctrl.vhd}
  {C:/ES-Project-Spring-2014/Source code/HW/soundlie/soundlie.srcs/sources_1/imports/grlib-gpl-1.3.4-b4140/lib/grlib/amba/ahbctrl.vhd}
}
read_vhdl -library techmap {
  {C:/ES-Project-Spring-2014/Source code/HW/soundlie/soundlie.srcs/sources_1/imports/grlib-gpl-1.3.4-b4140/lib/techmap/gencomp/gencomp.vhd}
  {C:/ES-Project-Spring-2014/Source code/HW/soundlie/soundlie.srcs/sources_1/imports/grlib-gpl-1.3.4-b4140/lib/techmap/maps/allclkgen.vhd}
  {C:/ES-Project-Spring-2014/Source code/HW/soundlie/soundlie.srcs/sources_1/imports/grlib-gpl-1.3.4-b4140/lib/techmap/inferred/memory_inferred.vhd}
  {C:/ES-Project-Spring-2014/Source code/HW/soundlie/soundlie.srcs/sources_1/imports/grlib-gpl-1.3.4-b4140/lib/techmap/unisim/memory_unisim.vhd}
  {C:/ES-Project-Spring-2014/Source code/HW/soundlie/soundlie.srcs/sources_1/imports/grlib-gpl-1.3.4-b4140/lib/techmap/maps/grgates.vhd}
  {C:/ES-Project-Spring-2014/Source code/HW/soundlie/soundlie.srcs/sources_1/imports/grlib-gpl-1.3.4-b4140/lib/techmap/maps/allmem.vhd}
  {C:/ES-Project-Spring-2014/Source code/HW/soundlie/soundlie.srcs/sources_1/imports/grlib-gpl-1.3.4-b4140/lib/techmap/maps/syncram.vhd}
  {C:/ES-Project-Spring-2014/Source code/HW/soundlie/soundlie.srcs/sources_1/imports/grlib-gpl-1.3.4-b4140/lib/techmap/maps/syncram_2p.vhd}
  {C:/ES-Project-Spring-2014/Source code/HW/soundlie/soundlie.srcs/sources_1/imports/grlib-gpl-1.3.4-b4140/lib/techmap/maps/allmul.vhd}
  {C:/ES-Project-Spring-2014/Source code/HW/soundlie/soundlie.srcs/sources_1/imports/grlib-gpl-1.3.4-b4140/lib/techmap/inferred/mul_inferred.vhd}
  {C:/ES-Project-Spring-2014/Source code/HW/soundlie/soundlie.srcs/sources_1/imports/grlib-gpl-1.3.4-b4140/lib/techmap/maps/techmult.vhd}
  {C:/ES-Project-Spring-2014/Source code/HW/soundlie/soundlie.srcs/sources_1/imports/grlib-gpl-1.3.4-b4140/lib/techmap/maps/regfile_3p.vhd}
  {C:/ES-Project-Spring-2014/Source code/HW/soundlie/soundlie.srcs/sources_1/imports/grlib-gpl-1.3.4-b4140/lib/techmap/unisim/clkgen_unisim.vhd}
  {C:/ES-Project-Spring-2014/Source code/HW/soundlie/soundlie.srcs/sources_1/imports/grlib-gpl-1.3.4-b4140/lib/techmap/unisim/buffer_unisim.vhd}
  {C:/ES-Project-Spring-2014/Source code/HW/soundlie/soundlie.srcs/sources_1/imports/grlib-gpl-1.3.4-b4140/lib/techmap/maps/syncram_dp.vhd}
  {C:/ES-Project-Spring-2014/Source code/HW/soundlie/soundlie.srcs/sources_1/imports/grlib-gpl-1.3.4-b4140/lib/techmap/maps/syncram64.vhd}
  {C:/ES-Project-Spring-2014/Source code/HW/soundlie/soundlie.srcs/sources_1/imports/grlib-gpl-1.3.4-b4140/lib/techmap/maps/grlfpw_net.vhd}
  {C:/ES-Project-Spring-2014/Source code/HW/soundlie/soundlie.srcs/sources_1/imports/grlib-gpl-1.3.4-b4140/lib/techmap/maps/grfpw_net.vhd}
  {C:/ES-Project-Spring-2014/Source code/HW/soundlie/soundlie.srcs/sources_1/imports/grlib-gpl-1.3.4-b4140/lib/techmap/gencomp/netcomp.vhd}
  {C:/ES-Project-Spring-2014/Source code/HW/soundlie/soundlie.srcs/sources_1/imports/grlib-gpl-1.3.4-b4140/lib/techmap/unisim/tap_unisim.vhd}
  {C:/ES-Project-Spring-2014/Source code/HW/soundlie/soundlie.srcs/sources_1/imports/grlib-gpl-1.3.4-b4140/lib/techmap/maps/techbuf.vhd}
  {C:/ES-Project-Spring-2014/Source code/HW/soundlie/soundlie.srcs/sources_1/imports/grlib-gpl-1.3.4-b4140/lib/techmap/maps/clkmux.vhd}
  {C:/ES-Project-Spring-2014/Source code/HW/soundlie/soundlie.srcs/sources_1/imports/grlib-gpl-1.3.4-b4140/lib/techmap/maps/clkand.vhd}
  {C:/ES-Project-Spring-2014/Source code/HW/soundlie/soundlie.srcs/sources_1/imports/grlib-gpl-1.3.4-b4140/lib/techmap/maps/alltap.vhd}
  {C:/ES-Project-Spring-2014/Source code/HW/soundlie/soundlie.srcs/sources_1/imports/grlib-gpl-1.3.4-b4140/lib/techmap/unisim/pads_unisim.vhd}
  {C:/ES-Project-Spring-2014/Source code/HW/soundlie/soundlie.srcs/sources_1/imports/grlib-gpl-1.3.4-b4140/lib/techmap/maps/tap.vhd}
  {C:/ES-Project-Spring-2014/Source code/HW/soundlie/soundlie.srcs/sources_1/imports/grlib-gpl-1.3.4-b4140/lib/techmap/maps/syncreg.vhd}
  {C:/ES-Project-Spring-2014/Source code/HW/soundlie/soundlie.srcs/sources_1/imports/grlib-gpl-1.3.4-b4140/lib/techmap/maps/syncrambw.vhd}
  {C:/ES-Project-Spring-2014/Source code/HW/soundlie/soundlie.srcs/sources_1/imports/grlib-gpl-1.3.4-b4140/lib/techmap/maps/allpads.vhd}
  {C:/ES-Project-Spring-2014/Source code/HW/soundlie/soundlie.srcs/sources_1/imports/grlib-gpl-1.3.4-b4140/lib/techmap/maps/outpad.vhd}
  {C:/ES-Project-Spring-2014/Source code/HW/soundlie/soundlie.srcs/sources_1/imports/grlib-gpl-1.3.4-b4140/lib/techmap/maps/iopad.vhd}
  {C:/ES-Project-Spring-2014/Source code/HW/soundlie/soundlie.srcs/sources_1/imports/grlib-gpl-1.3.4-b4140/lib/techmap/maps/inpad.vhd}
  {C:/ES-Project-Spring-2014/Source code/HW/soundlie/soundlie.srcs/sources_1/imports/grlib-gpl-1.3.4-b4140/lib/techmap/maps/clkgen.vhd}
}
read_vhdl -library gaisler {
  {C:/ES-Project-Spring-2014/Source code/HW/soundlie/soundlie.srcs/sources_1/imports/grlib-gpl-1.3.4-b4140/lib/gaisler/srmmu/mmuconfig.vhd}
  {C:/ES-Project-Spring-2014/Source code/HW/soundlie/soundlie.srcs/sources_1/imports/grlib-gpl-1.3.4-b4140/lib/gaisler/srmmu/mmuiface.vhd}
  {C:/ES-Project-Spring-2014/Source code/HW/soundlie/soundlie.srcs/sources_1/imports/grlib-gpl-1.3.4-b4140/lib/gaisler/leon3/leon3.vhd}
  {C:/ES-Project-Spring-2014/Source code/HW/soundlie/soundlie.srcs/sources_1/imports/grlib-gpl-1.3.4-b4140/lib/gaisler/srmmu/mmulrue.vhd}
  {C:/ES-Project-Spring-2014/Source code/HW/soundlie/soundlie.srcs/sources_1/imports/grlib-gpl-1.3.4-b4140/lib/gaisler/srmmu/libmmu.vhd}
  {C:/ES-Project-Spring-2014/Source code/HW/soundlie/soundlie.srcs/sources_1/imports/grlib-gpl-1.3.4-b4140/lib/gaisler/leon3v3/libfpu.vhd}
  {C:/ES-Project-Spring-2014/Source code/HW/soundlie/soundlie.srcs/sources_1/imports/grlib-gpl-1.3.4-b4140/lib/gaisler/arith/arith.vhd}
  {C:/ES-Project-Spring-2014/Source code/HW/soundlie/soundlie.srcs/sources_1/imports/grlib-gpl-1.3.4-b4140/lib/gaisler/srmmu/mmutlbcam.vhd}
  {C:/ES-Project-Spring-2014/Source code/HW/soundlie/soundlie.srcs/sources_1/imports/grlib-gpl-1.3.4-b4140/lib/gaisler/srmmu/mmulru.vhd}
  {C:/ES-Project-Spring-2014/Source code/HW/soundlie/soundlie.srcs/sources_1/imports/grlib-gpl-1.3.4-b4140/lib/gaisler/leon3v3/libiu.vhd}
  {C:/ES-Project-Spring-2014/Source code/HW/soundlie/soundlie.srcs/sources_1/imports/grlib-gpl-1.3.4-b4140/lib/gaisler/srmmu/mmutw.vhd}
  {C:/ES-Project-Spring-2014/Source code/HW/soundlie/soundlie.srcs/sources_1/imports/grlib-gpl-1.3.4-b4140/lib/gaisler/srmmu/mmutlb.vhd}
  {C:/ES-Project-Spring-2014/Source code/HW/soundlie/soundlie.srcs/sources_1/imports/grlib-gpl-1.3.4-b4140/lib/gaisler/leon3v3/libcache.vhd}
  {C:/ES-Project-Spring-2014/Source code/HW/soundlie/soundlie.srcs/sources_1/imports/grlib-gpl-1.3.4-b4140/lib/gaisler/srmmu/mmu.vhd}
  {C:/ES-Project-Spring-2014/Source code/HW/soundlie/soundlie.srcs/sources_1/imports/grlib-gpl-1.3.4-b4140/lib/gaisler/leon3v3/mmu_icache.vhd}
  {C:/ES-Project-Spring-2014/Source code/HW/soundlie/soundlie.srcs/sources_1/imports/grlib-gpl-1.3.4-b4140/lib/gaisler/leon3v3/mmu_dcache.vhd}
  {C:/ES-Project-Spring-2014/Source code/HW/soundlie/soundlie.srcs/sources_1/imports/grlib-gpl-1.3.4-b4140/lib/gaisler/leon3v3/mmu_acache.vhd}
  {C:/ES-Project-Spring-2014/Source code/HW/soundlie/soundlie.srcs/sources_1/imports/grlib-gpl-1.3.4-b4140/lib/gaisler/leon3v3/libleon3.vhd}
  {C:/ES-Project-Spring-2014/Source code/HW/soundlie/soundlie.srcs/sources_1/imports/grlib-gpl-1.3.4-b4140/lib/gaisler/uart/uart.vhd}
  {C:/ES-Project-Spring-2014/Source code/HW/soundlie/soundlie.srcs/sources_1/imports/grlib-gpl-1.3.4-b4140/lib/gaisler/net/net.vhd}
  {C:/ES-Project-Spring-2014/Source code/HW/soundlie/soundlie.srcs/sources_1/imports/grlib-gpl-1.3.4-b4140/lib/gaisler/misc/misc.vhd}
  {C:/ES-Project-Spring-2014/Source code/HW/soundlie/soundlie.srcs/sources_1/imports/grlib-gpl-1.3.4-b4140/lib/gaisler/leon3v3/regfile_3p_l3.vhd}
  {C:/ES-Project-Spring-2014/Source code/HW/soundlie/soundlie.srcs/sources_1/imports/grlib-gpl-1.3.4-b4140/lib/gaisler/leon3v3/mmu_cache.vhd}
  {C:/ES-Project-Spring-2014/Source code/HW/soundlie/soundlie.srcs/sources_1/imports/grlib-gpl-1.3.4-b4140/lib/gaisler/leon3v3/iu3.vhd}
  {C:/ES-Project-Spring-2014/Source code/HW/soundlie/soundlie.srcs/sources_1/imports/grlib-gpl-1.3.4-b4140/lib/gaisler/arith/mul32.vhd}
  {C:/ES-Project-Spring-2014/Source code/HW/soundlie/soundlie.srcs/sources_1/imports/grlib-gpl-1.3.4-b4140/lib/gaisler/arith/div32.vhd}
  {C:/ES-Project-Spring-2014/Source code/HW/soundlie/soundlie.srcs/sources_1/imports/grlib-gpl-1.3.4-b4140/lib/gaisler/uart/libdcom.vhd}
  {C:/ES-Project-Spring-2014/Source code/HW/soundlie/soundlie.srcs/sources_1/imports/grlib-gpl-1.3.4-b4140/lib/gaisler/memctrl/memctrl.vhd}
  {C:/ES-Project-Spring-2014/Source code/HW/soundlie/soundlie.srcs/sources_1/imports/grlib-gpl-1.3.4-b4140/lib/gaisler/leon3v3/tbufmem.vhd}
  {C:/ES-Project-Spring-2014/Source code/HW/soundlie/soundlie.srcs/sources_1/imports/grlib-gpl-1.3.4-b4140/lib/gaisler/leon3v3/proc3.vhd}
  {C:/ES-Project-Spring-2014/Source code/HW/soundlie/soundlie.srcs/sources_1/imports/grlib-gpl-1.3.4-b4140/lib/gaisler/leon3v3/grlfpwx.vhd}
  {C:/ES-Project-Spring-2014/Source code/HW/soundlie/soundlie.srcs/sources_1/imports/grlib-gpl-1.3.4-b4140/lib/gaisler/leon3v3/grfpwxsh.vhd}
  {C:/ES-Project-Spring-2014/Source code/HW/soundlie/soundlie.srcs/sources_1/imports/grlib-gpl-1.3.4-b4140/lib/gaisler/leon3v3/grfpwx.vhd}
  {C:/ES-Project-Spring-2014/Source code/HW/soundlie/soundlie.srcs/sources_1/imports/grlib-gpl-1.3.4-b4140/lib/gaisler/leon3v3/cachemem.vhd}
  {C:/ES-Project-Spring-2014/Source code/HW/soundlie/soundlie.srcs/sources_1/imports/grlib-gpl-1.3.4-b4140/lib/gaisler/jtag/libjtagcom.vhd}
  {C:/ES-Project-Spring-2014/Source code/HW/soundlie/soundlie.srcs/sources_1/imports/grlib-gpl-1.3.4-b4140/lib/gaisler/greth/ethernet_mac.vhd}
  {C:/ES-Project-Spring-2014/Source code/HW/soundlie/soundlie.srcs/sources_1/imports/grlib-gpl-1.3.4-b4140/lib/gaisler/uart/dcom_uart.vhd}
  {C:/ES-Project-Spring-2014/Source code/HW/soundlie/soundlie.srcs/sources_1/imports/grlib-gpl-1.3.4-b4140/lib/gaisler/uart/dcom.vhd}
  {C:/ES-Project-Spring-2014/Source code/HW/soundlie/soundlie.srcs/sources_1/imports/grlib-gpl-1.3.4-b4140/lib/gaisler/memctrl/sdmctrl.vhd}
  {C:/ES-Project-Spring-2014/Source code/HW/soundlie/soundlie.srcs/sources_1/imports/grlib-gpl-1.3.4-b4140/lib/gaisler/leon3v3/leon3x.vhd}
  {C:/ES-Project-Spring-2014/Source code/HW/soundlie/soundlie.srcs/sources_1/imports/grlib-gpl-1.3.4-b4140/lib/gaisler/leon3v3/dsu3x.vhd}
  {C:/ES-Project-Spring-2014/Source code/HW/soundlie/soundlie.srcs/sources_1/imports/grlib-gpl-1.3.4-b4140/lib/gaisler/jtag/jtagcom2.vhd}
  {C:/ES-Project-Spring-2014/Source code/HW/soundlie/soundlie.srcs/sources_1/imports/grlib-gpl-1.3.4-b4140/lib/gaisler/jtag/jtagcom.vhd}
  {C:/ES-Project-Spring-2014/Source code/HW/soundlie/soundlie.srcs/sources_1/imports/grlib-gpl-1.3.4-b4140/lib/gaisler/jtag/jtag.vhd}
  {C:/ES-Project-Spring-2014/Source code/HW/soundlie/soundlie.srcs/sources_1/imports/grlib-gpl-1.3.4-b4140/lib/gaisler/greth/greth_gbit.vhd}
  {C:/ES-Project-Spring-2014/Source code/HW/soundlie/soundlie.srcs/sources_1/imports/grlib-gpl-1.3.4-b4140/lib/gaisler/greth/greth.vhd}
  {C:/ES-Project-Spring-2014/Source code/HW/soundlie/soundlie.srcs/sources_1/imports/grlib-gpl-1.3.4-b4140/lib/gaisler/uart/apbuart.vhd}
  {C:/ES-Project-Spring-2014/Source code/HW/soundlie/soundlie.srcs/sources_1/imports/grlib-gpl-1.3.4-b4140/lib/gaisler/uart/ahbuart.vhd}
  {C:/ES-Project-Spring-2014/Source code/HW/soundlie/soundlie.srcs/sources_1/imports/grlib-gpl-1.3.4-b4140/lib/gaisler/spi/spi.vhd}
  {C:/ES-Project-Spring-2014/Source code/HW/soundlie/soundlie.srcs/sources_1/imports/grlib-gpl-1.3.4-b4140/lib/gaisler/misc/rstgen.vhd}
  {C:/ES-Project-Spring-2014/Source code/HW/soundlie/soundlie.srcs/sources_1/imports/grlib-gpl-1.3.4-b4140/lib/gaisler/misc/gptimer.vhd}
  {C:/ES-Project-Spring-2014/Source code/HW/soundlie/soundlie.srcs/sources_1/imports/grlib-gpl-1.3.4-b4140/lib/gaisler/misc/ahbram.vhd}
  {C:/ES-Project-Spring-2014/Source code/HW/soundlie/soundlie.srcs/sources_1/imports/grlib-gpl-1.3.4-b4140/lib/gaisler/leon3v3/leon3s.vhd}
  {C:/ES-Project-Spring-2014/Source code/HW/soundlie/soundlie.srcs/sources_1/imports/grlib-gpl-1.3.4-b4140/lib/gaisler/leon3v3/dsu3.vhd}
  {C:/ES-Project-Spring-2014/Source code/HW/soundlie/soundlie.srcs/sources_1/imports/grlib-gpl-1.3.4-b4140/lib/gaisler/jtag/ahbjtag.vhd}
  {C:/ES-Project-Spring-2014/Source code/HW/soundlie/soundlie.srcs/sources_1/imports/grlib-gpl-1.3.4-b4140/lib/gaisler/irqmp/irqmp.vhd}
  {C:/ES-Project-Spring-2014/Source code/HW/soundlie/soundlie.srcs/sources_1/imports/grlib-gpl-1.3.4-b4140/lib/gaisler/greth/grethm.vhd}
}
read_vhdl -library eth {
  {C:/ES-Project-Spring-2014/Source code/HW/soundlie/soundlie.srcs/sources_1/imports/grlib-gpl-1.3.4-b4140/lib/eth/core/greth_pkg.vhd}
  {C:/ES-Project-Spring-2014/Source code/HW/soundlie/soundlie.srcs/sources_1/imports/grlib-gpl-1.3.4-b4140/lib/eth/core/eth_rstgen.vhd}
  {C:/ES-Project-Spring-2014/Source code/HW/soundlie/soundlie.srcs/sources_1/imports/grlib-gpl-1.3.4-b4140/lib/eth/core/greth_tx.vhd}
  {C:/ES-Project-Spring-2014/Source code/HW/soundlie/soundlie.srcs/sources_1/imports/grlib-gpl-1.3.4-b4140/lib/eth/core/greth_rx.vhd}
  {C:/ES-Project-Spring-2014/Source code/HW/soundlie/soundlie.srcs/sources_1/imports/grlib-gpl-1.3.4-b4140/lib/eth/core/eth_edcl_ahb_mst.vhd}
  {C:/ES-Project-Spring-2014/Source code/HW/soundlie/soundlie.srcs/sources_1/imports/grlib-gpl-1.3.4-b4140/lib/eth/core/eth_ahb_mst.vhd}
  {C:/ES-Project-Spring-2014/Source code/HW/soundlie/soundlie.srcs/sources_1/imports/grlib-gpl-1.3.4-b4140/lib/eth/core/grethc.vhd}
  {C:/ES-Project-Spring-2014/Source code/HW/soundlie/soundlie.srcs/sources_1/imports/grlib-gpl-1.3.4-b4140/lib/eth/comp/ethcomp.vhd}
}
read_vhdl {
  {C:/ES-Project-Spring-2014/Source code/HW/soundlie/soundlie.srcs/sources_1/imports/XADC module/XADC_pkg.vhd}
  {C:/ES-Project-Spring-2014/Source code/HW/soundlie/soundlie.srcs/sources_1/imports/XADC module/interface_XADC.vhd}
  {C:/ES-Project-Spring-2014/Source code/HW/soundlie/soundlie.srcs/sources_1/imports/PWM module/PWM_pkg.vhd}
  {C:/ES-Project-Spring-2014/Source code/HW/soundlie/soundlie.srcs/sources_1/imports/PWM module/PWM.vhd}
  {C:/ES-Project-Spring-2014/Source code/HW/soundlie/soundlie.srcs/sources_1/imports/XADC module/XADCapb.vhd}
  {C:/ES-Project-Spring-2014/Source code/HW/soundlie/soundlie.srcs/sources_1/imports/PWM module/PWMapb.vhd}
  {C:/ES-Project-Spring-2014/Source code/HW/soundlie/soundlie.srcs/sources_1/imports/grlib-gpl-1.3.4-b4140/designs/leon3-digilent-nexys4/config.vhd}
  {C:/ES-Project-Spring-2014/Source code/HW/soundlie/soundlie.srcs/sources_1/imports/grlib-gpl-1.3.4-b4140/designs/leon3-digilent-nexys4/ahbrom.vhd}
  {C:/ES-Project-Spring-2014/Source code/HW/soundlie/soundlie.srcs/sources_1/imports/grlib-gpl-1.3.4-b4140/designs/leon3-digilent-nexys4/leon3mp.vhd}
}
read_vhdl -library esa {
  {C:/ES-Project-Spring-2014/Source code/HW/soundlie/soundlie.srcs/sources_1/imports/grlib-gpl-1.3.4-b4140/lib/esa/memoryctrl/memoryctrl.vhd}
  {C:/ES-Project-Spring-2014/Source code/HW/soundlie/soundlie.srcs/sources_1/imports/grlib-gpl-1.3.4-b4140/lib/esa/memoryctrl/mctrl.vhd}
}
read_xdc {{C:/ES-Project-Spring-2014/Source code/HW/soundlie/soundlie.srcs/constrs_1/new/leon3mp.xdc}}
set_property used_in_implementation false [get_files {{C:/ES-Project-Spring-2014/Source code/HW/soundlie/soundlie.srcs/constrs_1/new/leon3mp.xdc}}]

read_xdc {{C:/ES-Project-Spring-2014/Source code/HW/soundlie/soundlie.srcs/constrs_1/new/misc.xdc}}
set_property used_in_implementation false [get_files {{C:/ES-Project-Spring-2014/Source code/HW/soundlie/soundlie.srcs/constrs_1/new/misc.xdc}}]

read_xdc {{C:/ES-Project-Spring-2014/Source code/HW/soundlie/soundlie.srcs/constrs_1/new/io.xdc}}
set_property used_in_implementation false [get_files {{C:/ES-Project-Spring-2014/Source code/HW/soundlie/soundlie.srcs/constrs_1/new/io.xdc}}]

read_xdc {{C:/ES-Project-Spring-2014/Source code/HW/soundlie/soundlie.srcs/constrs_1/new/uart.xdc}}
set_property used_in_implementation false [get_files {{C:/ES-Project-Spring-2014/Source code/HW/soundlie/soundlie.srcs/constrs_1/new/uart.xdc}}]

read_xdc {{C:/ES-Project-Spring-2014/Source code/HW/soundlie/soundlie.srcs/constrs_1/new/xadc.xdc}}
set_property used_in_implementation false [get_files {{C:/ES-Project-Spring-2014/Source code/HW/soundlie/soundlie.srcs/constrs_1/new/xadc.xdc}}]

read_xdc {{C:/ES-Project-Spring-2014/Source code/HW/soundlie/soundlie.srcs/constrs_1/new/pwm.xdc}}
set_property used_in_implementation false [get_files {{C:/ES-Project-Spring-2014/Source code/HW/soundlie/soundlie.srcs/constrs_1/new/pwm.xdc}}]

read_xdc {{C:/ES-Project-Spring-2014/Source code/HW/soundlie/soundlie.srcs/constrs_1/new/unused.xdc}}
set_property used_in_implementation false [get_files {{C:/ES-Project-Spring-2014/Source code/HW/soundlie/soundlie.srcs/constrs_1/new/unused.xdc}}]

read_xdc dont_touch.xdc
set_property used_in_implementation false [get_files dont_touch.xdc]
read_xdc dont_buffer.xdc
set_property used_in_implementation false [get_files dont_buffer.xdc]
set_param synth.vivado.isSynthRun true
set_property webtalk.parent_dir {C:/ES-Project-Spring-2014/Source code/HW/soundlie/soundlie.data/wt} [current_project]
set_property parent.project_dir {C:/ES-Project-Spring-2014/Source code/HW/soundlie} [current_project]
synth_design -top leon3mp -part xc7a100tcsg324-2 -directive RuntimeOptimized
write_checkpoint leon3mp.dcp
report_utilization -file leon3mp_utilization_synth.rpt -pb leon3mp_utilization_synth.pb
