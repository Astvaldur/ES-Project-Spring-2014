# 
# Synthesis run script generated by Vivado
# 

  set_param gui.test TreeTableDev
set_msg_config -id {HDL 9-1061} -limit 100000
set_msg_config -id {HDL 9-1654} -limit 100000
create_project -in_memory -part xc7a100tcsg324-2
set_property target_language VHDL [current_project]
set_param project.compositeFile.enableAutoGeneration 0
add_files {{Z:/DAT096/git/ES-Project-Spring-2014/Source code/HW/soundlie/soundlie.runs/xadc_wiz_0_synth_1/xadc_wiz_0.dcp}}
set_property used_in_implementation false [get_files {{Z:/DAT096/git/ES-Project-Spring-2014/Source code/HW/soundlie/soundlie.runs/xadc_wiz_0_synth_1/xadc_wiz_0.dcp}}]
set_property use_blackbox_stub false [get_files {{Z:/DAT096/git/ES-Project-Spring-2014/Source code/HW/soundlie/soundlie.runs/xadc_wiz_0_synth_1/xadc_wiz_0.dcp}}]
add_files {{Z:/DAT096/git/ES-Project-Spring-2014/Source code/HW/soundlie/soundlie.runs/dac_clk_synth_1/dac_clk.dcp}}
set_property used_in_implementation false [get_files {{Z:/DAT096/git/ES-Project-Spring-2014/Source code/HW/soundlie/soundlie.runs/dac_clk_synth_1/dac_clk.dcp}}]
set_property use_blackbox_stub false [get_files {{Z:/DAT096/git/ES-Project-Spring-2014/Source code/HW/soundlie/soundlie.runs/dac_clk_synth_1/dac_clk.dcp}}]

read_ip {{Z:/DAT096/git/ES-Project-Spring-2014/Source code/HW/soundlie/soundlie.srcs/sources_1/ip/ila_xadc/ila_xadc.xci}}
set_property used_in_implementation false [get_files -all {{z:/DAT096/git/ES-Project-Spring-2014/Source code/HW/soundlie/soundlie.srcs/sources_1/ip/ila_xadc/constraints/ila.xdc}}]
set_property used_in_implementation false [get_files -all {{z:/DAT096/git/ES-Project-Spring-2014/Source code/HW/soundlie/soundlie.srcs/sources_1/ip/ila_xadc/ila_xadc_ooc.xdc}}]
set_msg_config -id {IP_Flow 19-2162} -severity warning -new_severity info
set_property is_locked true [get_files {{Z:/DAT096/git/ES-Project-Spring-2014/Source code/HW/soundlie/soundlie.srcs/sources_1/ip/ila_xadc/ila_xadc.xci}}]

read_ip {{Z:/DAT096/git/ES-Project-Spring-2014/Source code/HW/soundlie/soundlie.srcs/sources_1/ip/ila_leon3/ila_leon3.xci}}
set_property used_in_implementation false [get_files -all {{z:/DAT096/git/ES-Project-Spring-2014/Source code/HW/soundlie/soundlie.srcs/sources_1/ip/ila_leon3/constraints/ila.xdc}}]
set_property used_in_implementation false [get_files -all {{z:/DAT096/git/ES-Project-Spring-2014/Source code/HW/soundlie/soundlie.srcs/sources_1/ip/ila_leon3/ila_leon3_ooc.xdc}}]
set_msg_config -id {IP_Flow 19-2162} -severity warning -new_severity info
set_property is_locked true [get_files {{Z:/DAT096/git/ES-Project-Spring-2014/Source code/HW/soundlie/soundlie.srcs/sources_1/ip/ila_leon3/ila_leon3.xci}}]

read_verilog {
  {z:/DAT096/git/ES-Project-Spring-2014/Source code/HW/soundlie/soundlie.srcs/sources_1/ip/xadc_wiz_0/xadc_wiz_0_stub.v}
  {z:/DAT096/git/ES-Project-Spring-2014/Source code/HW/soundlie/soundlie.srcs/sources_1/ip/dac_clk/dac_clk_stub.v}
}
read_vhdl -library grlib {
  {Z:/DAT096/git/ES-Project-Spring-2014/Source code/HW/soundlie/soundlie.srcs/sources_1/imports/grlib-gpl-1.3.4-b4140/lib/grlib/stdlib/version.vhd}
  {Z:/DAT096/git/ES-Project-Spring-2014/Source code/HW/soundlie/soundlie.srcs/sources_1/imports/grlib-gpl-1.3.4-b4140/lib/grlib/stdlib/config_types.vhd}
  {Z:/DAT096/git/ES-Project-Spring-2014/Source code/HW/soundlie/soundlie.srcs/sources_1/imports/grlib-gpl-1.3.4-b4140/lib/grlib/stdlib/stdlib.vhd}
  {Z:/DAT096/git/ES-Project-Spring-2014/Source code/HW/soundlie/soundlie.srcs/sources_1/imports/grlib-gpl-1.3.4-b4140/lib/grlib/stdlib/config.vhd}
  {Z:/DAT096/git/ES-Project-Spring-2014/Source code/HW/soundlie/soundlie.srcs/sources_1/imports/grlib-gpl-1.3.4-b4140/lib/grlib/amba/amba.vhd}
  {Z:/DAT096/git/ES-Project-Spring-2014/Source code/HW/soundlie/soundlie.srcs/sources_1/imports/grlib-gpl-1.3.4-b4140/lib/grlib/sparc/sparc.vhd}
  {Z:/DAT096/git/ES-Project-Spring-2014/Source code/HW/soundlie/soundlie.srcs/sources_1/imports/grlib-gpl-1.3.4-b4140/lib/grlib/modgen/multlib.vhd}
  {Z:/DAT096/git/ES-Project-Spring-2014/Source code/HW/soundlie/soundlie.srcs/sources_1/imports/grlib-gpl-1.3.4-b4140/lib/grlib/modgen/leaves.vhd}
  {Z:/DAT096/git/ES-Project-Spring-2014/Source code/HW/soundlie/soundlie.srcs/sources_1/imports/grlib-gpl-1.3.4-b4140/lib/grlib/amba/devices.vhd}
  {Z:/DAT096/git/ES-Project-Spring-2014/Source code/HW/soundlie/soundlie.srcs/sources_1/imports/grlib-gpl-1.3.4-b4140/lib/grlib/amba/ahbmst.vhd}
  {Z:/DAT096/git/ES-Project-Spring-2014/Source code/HW/soundlie/soundlie.srcs/sources_1/imports/grlib-gpl-1.3.4-b4140/lib/grlib/amba/apbctrl.vhd}
  {Z:/DAT096/git/ES-Project-Spring-2014/Source code/HW/soundlie/soundlie.srcs/sources_1/imports/grlib-gpl-1.3.4-b4140/lib/grlib/amba/ahbctrl.vhd}
}
read_vhdl -library techmap {
  {Z:/DAT096/git/ES-Project-Spring-2014/Source code/HW/soundlie/soundlie.srcs/sources_1/imports/grlib-gpl-1.3.4-b4140/lib/techmap/gencomp/gencomp.vhd}
  {Z:/DAT096/git/ES-Project-Spring-2014/Source code/HW/soundlie/soundlie.srcs/sources_1/imports/grlib-gpl-1.3.4-b4140/lib/techmap/maps/allclkgen.vhd}
  {Z:/DAT096/git/ES-Project-Spring-2014/Source code/HW/soundlie/soundlie.srcs/sources_1/imports/grlib-gpl-1.3.4-b4140/lib/techmap/inferred/memory_inferred.vhd}
  {Z:/DAT096/git/ES-Project-Spring-2014/Source code/HW/soundlie/soundlie.srcs/sources_1/imports/grlib-gpl-1.3.4-b4140/lib/techmap/unisim/memory_unisim.vhd}
  {Z:/DAT096/git/ES-Project-Spring-2014/Source code/HW/soundlie/soundlie.srcs/sources_1/imports/grlib-gpl-1.3.4-b4140/lib/techmap/maps/grgates.vhd}
  {Z:/DAT096/git/ES-Project-Spring-2014/Source code/HW/soundlie/soundlie.srcs/sources_1/imports/grlib-gpl-1.3.4-b4140/lib/techmap/maps/allmem.vhd}
  {Z:/DAT096/git/ES-Project-Spring-2014/Source code/HW/soundlie/soundlie.srcs/sources_1/imports/grlib-gpl-1.3.4-b4140/lib/techmap/maps/syncram.vhd}
  {Z:/DAT096/git/ES-Project-Spring-2014/Source code/HW/soundlie/soundlie.srcs/sources_1/imports/grlib-gpl-1.3.4-b4140/lib/techmap/maps/syncram_2p.vhd}
  {Z:/DAT096/git/ES-Project-Spring-2014/Source code/HW/soundlie/soundlie.srcs/sources_1/imports/grlib-gpl-1.3.4-b4140/lib/techmap/maps/allmul.vhd}
  {Z:/DAT096/git/ES-Project-Spring-2014/Source code/HW/soundlie/soundlie.srcs/sources_1/imports/grlib-gpl-1.3.4-b4140/lib/techmap/inferred/mul_inferred.vhd}
  {Z:/DAT096/git/ES-Project-Spring-2014/Source code/HW/soundlie/soundlie.srcs/sources_1/imports/grlib-gpl-1.3.4-b4140/lib/techmap/maps/techmult.vhd}
  {Z:/DAT096/git/ES-Project-Spring-2014/Source code/HW/soundlie/soundlie.srcs/sources_1/imports/grlib-gpl-1.3.4-b4140/lib/techmap/maps/regfile_3p.vhd}
  {Z:/DAT096/git/ES-Project-Spring-2014/Source code/HW/soundlie/soundlie.srcs/sources_1/imports/grlib-gpl-1.3.4-b4140/lib/techmap/unisim/clkgen_unisim.vhd}
  {Z:/DAT096/git/ES-Project-Spring-2014/Source code/HW/soundlie/soundlie.srcs/sources_1/imports/grlib-gpl-1.3.4-b4140/lib/techmap/unisim/buffer_unisim.vhd}
  {Z:/DAT096/git/ES-Project-Spring-2014/Source code/HW/soundlie/soundlie.srcs/sources_1/imports/grlib-gpl-1.3.4-b4140/lib/techmap/maps/syncram_dp.vhd}
  {Z:/DAT096/git/ES-Project-Spring-2014/Source code/HW/soundlie/soundlie.srcs/sources_1/imports/grlib-gpl-1.3.4-b4140/lib/techmap/maps/syncram64.vhd}
  {Z:/DAT096/git/ES-Project-Spring-2014/Source code/HW/soundlie/soundlie.srcs/sources_1/imports/grlib-gpl-1.3.4-b4140/lib/techmap/maps/grlfpw_net.vhd}
  {Z:/DAT096/git/ES-Project-Spring-2014/Source code/HW/soundlie/soundlie.srcs/sources_1/imports/grlib-gpl-1.3.4-b4140/lib/techmap/maps/grfpw_net.vhd}
  {Z:/DAT096/git/ES-Project-Spring-2014/Source code/HW/soundlie/soundlie.srcs/sources_1/imports/grlib-gpl-1.3.4-b4140/lib/techmap/gencomp/netcomp.vhd}
  {Z:/DAT096/git/ES-Project-Spring-2014/Source code/HW/soundlie/soundlie.srcs/sources_1/imports/grlib-gpl-1.3.4-b4140/lib/techmap/unisim/tap_unisim.vhd}
  {Z:/DAT096/git/ES-Project-Spring-2014/Source code/HW/soundlie/soundlie.srcs/sources_1/imports/grlib-gpl-1.3.4-b4140/lib/techmap/maps/techbuf.vhd}
  {Z:/DAT096/git/ES-Project-Spring-2014/Source code/HW/soundlie/soundlie.srcs/sources_1/imports/grlib-gpl-1.3.4-b4140/lib/techmap/maps/clkmux.vhd}
  {Z:/DAT096/git/ES-Project-Spring-2014/Source code/HW/soundlie/soundlie.srcs/sources_1/imports/grlib-gpl-1.3.4-b4140/lib/techmap/maps/clkand.vhd}
  {Z:/DAT096/git/ES-Project-Spring-2014/Source code/HW/soundlie/soundlie.srcs/sources_1/imports/grlib-gpl-1.3.4-b4140/lib/techmap/maps/alltap.vhd}
  {Z:/DAT096/git/ES-Project-Spring-2014/Source code/HW/soundlie/soundlie.srcs/sources_1/imports/grlib-gpl-1.3.4-b4140/lib/techmap/unisim/pads_unisim.vhd}
  {Z:/DAT096/git/ES-Project-Spring-2014/Source code/HW/soundlie/soundlie.srcs/sources_1/imports/grlib-gpl-1.3.4-b4140/lib/techmap/maps/tap.vhd}
  {Z:/DAT096/git/ES-Project-Spring-2014/Source code/HW/soundlie/soundlie.srcs/sources_1/imports/grlib-gpl-1.3.4-b4140/lib/techmap/maps/syncreg.vhd}
  {Z:/DAT096/git/ES-Project-Spring-2014/Source code/HW/soundlie/soundlie.srcs/sources_1/imports/grlib-gpl-1.3.4-b4140/lib/techmap/maps/syncrambw.vhd}
  {Z:/DAT096/git/ES-Project-Spring-2014/Source code/HW/soundlie/soundlie.srcs/sources_1/imports/grlib-gpl-1.3.4-b4140/lib/techmap/maps/allpads.vhd}
  {Z:/DAT096/git/ES-Project-Spring-2014/Source code/HW/soundlie/soundlie.srcs/sources_1/imports/grlib-gpl-1.3.4-b4140/lib/techmap/maps/outpad.vhd}
  {Z:/DAT096/git/ES-Project-Spring-2014/Source code/HW/soundlie/soundlie.srcs/sources_1/imports/grlib-gpl-1.3.4-b4140/lib/techmap/maps/iopad.vhd}
  {Z:/DAT096/git/ES-Project-Spring-2014/Source code/HW/soundlie/soundlie.srcs/sources_1/imports/grlib-gpl-1.3.4-b4140/lib/techmap/maps/inpad.vhd}
  {Z:/DAT096/git/ES-Project-Spring-2014/Source code/HW/soundlie/soundlie.srcs/sources_1/imports/grlib-gpl-1.3.4-b4140/lib/techmap/maps/clkgen.vhd}
}
read_vhdl -library gaisler {
  {Z:/DAT096/git/ES-Project-Spring-2014/Source code/HW/soundlie/soundlie.srcs/sources_1/imports/grlib-gpl-1.3.4-b4140/lib/gaisler/srmmu/mmuconfig.vhd}
  {Z:/DAT096/git/ES-Project-Spring-2014/Source code/HW/soundlie/soundlie.srcs/sources_1/imports/grlib-gpl-1.3.4-b4140/lib/gaisler/srmmu/mmuiface.vhd}
  {Z:/DAT096/git/ES-Project-Spring-2014/Source code/HW/soundlie/soundlie.srcs/sources_1/imports/grlib-gpl-1.3.4-b4140/lib/gaisler/leon3/leon3.vhd}
  {Z:/DAT096/git/ES-Project-Spring-2014/Source code/HW/soundlie/soundlie.srcs/sources_1/imports/grlib-gpl-1.3.4-b4140/lib/gaisler/srmmu/mmulrue.vhd}
  {Z:/DAT096/git/ES-Project-Spring-2014/Source code/HW/soundlie/soundlie.srcs/sources_1/imports/grlib-gpl-1.3.4-b4140/lib/gaisler/srmmu/libmmu.vhd}
  {Z:/DAT096/git/ES-Project-Spring-2014/Source code/HW/soundlie/soundlie.srcs/sources_1/imports/grlib-gpl-1.3.4-b4140/lib/gaisler/leon3v3/libfpu.vhd}
  {Z:/DAT096/git/ES-Project-Spring-2014/Source code/HW/soundlie/soundlie.srcs/sources_1/imports/grlib-gpl-1.3.4-b4140/lib/gaisler/arith/arith.vhd}
  {Z:/DAT096/git/ES-Project-Spring-2014/Source code/HW/soundlie/soundlie.srcs/sources_1/imports/grlib-gpl-1.3.4-b4140/lib/gaisler/srmmu/mmutlbcam.vhd}
  {Z:/DAT096/git/ES-Project-Spring-2014/Source code/HW/soundlie/soundlie.srcs/sources_1/imports/grlib-gpl-1.3.4-b4140/lib/gaisler/srmmu/mmulru.vhd}
  {Z:/DAT096/git/ES-Project-Spring-2014/Source code/HW/soundlie/soundlie.srcs/sources_1/imports/grlib-gpl-1.3.4-b4140/lib/gaisler/leon3v3/libiu.vhd}
  {Z:/DAT096/git/ES-Project-Spring-2014/Source code/HW/soundlie/soundlie.srcs/sources_1/imports/grlib-gpl-1.3.4-b4140/lib/gaisler/srmmu/mmutw.vhd}
  {Z:/DAT096/git/ES-Project-Spring-2014/Source code/HW/soundlie/soundlie.srcs/sources_1/imports/grlib-gpl-1.3.4-b4140/lib/gaisler/srmmu/mmutlb.vhd}
  {Z:/DAT096/git/ES-Project-Spring-2014/Source code/HW/soundlie/soundlie.srcs/sources_1/imports/grlib-gpl-1.3.4-b4140/lib/gaisler/leon3v3/libcache.vhd}
  {Z:/DAT096/git/ES-Project-Spring-2014/Source code/HW/soundlie/soundlie.srcs/sources_1/imports/grlib-gpl-1.3.4-b4140/lib/gaisler/srmmu/mmu.vhd}
  {Z:/DAT096/git/ES-Project-Spring-2014/Source code/HW/soundlie/soundlie.srcs/sources_1/imports/grlib-gpl-1.3.4-b4140/lib/gaisler/leon3v3/mmu_icache.vhd}
  {Z:/DAT096/git/ES-Project-Spring-2014/Source code/HW/soundlie/soundlie.srcs/sources_1/imports/grlib-gpl-1.3.4-b4140/lib/gaisler/leon3v3/mmu_dcache.vhd}
  {Z:/DAT096/git/ES-Project-Spring-2014/Source code/HW/soundlie/soundlie.srcs/sources_1/imports/grlib-gpl-1.3.4-b4140/lib/gaisler/leon3v3/mmu_acache.vhd}
  {Z:/DAT096/git/ES-Project-Spring-2014/Source code/HW/soundlie/soundlie.srcs/sources_1/imports/grlib-gpl-1.3.4-b4140/lib/gaisler/leon3v3/libleon3.vhd}
  {Z:/DAT096/git/ES-Project-Spring-2014/Source code/HW/soundlie/soundlie.srcs/sources_1/imports/grlib-gpl-1.3.4-b4140/lib/gaisler/uart/uart.vhd}
  {Z:/DAT096/git/ES-Project-Spring-2014/Source code/HW/soundlie/soundlie.srcs/sources_1/imports/grlib-gpl-1.3.4-b4140/lib/gaisler/net/net.vhd}
  {Z:/DAT096/git/ES-Project-Spring-2014/Source code/HW/soundlie/soundlie.srcs/sources_1/imports/grlib-gpl-1.3.4-b4140/lib/gaisler/misc/misc.vhd}
  {Z:/DAT096/git/ES-Project-Spring-2014/Source code/HW/soundlie/soundlie.srcs/sources_1/imports/grlib-gpl-1.3.4-b4140/lib/gaisler/leon3v3/regfile_3p_l3.vhd}
  {Z:/DAT096/git/ES-Project-Spring-2014/Source code/HW/soundlie/soundlie.srcs/sources_1/imports/grlib-gpl-1.3.4-b4140/lib/gaisler/leon3v3/mmu_cache.vhd}
  {Z:/DAT096/git/ES-Project-Spring-2014/Source code/HW/soundlie/soundlie.srcs/sources_1/imports/grlib-gpl-1.3.4-b4140/lib/gaisler/leon3v3/iu3.vhd}
  {Z:/DAT096/git/ES-Project-Spring-2014/Source code/HW/soundlie/soundlie.srcs/sources_1/imports/grlib-gpl-1.3.4-b4140/lib/gaisler/arith/mul32.vhd}
  {Z:/DAT096/git/ES-Project-Spring-2014/Source code/HW/soundlie/soundlie.srcs/sources_1/imports/grlib-gpl-1.3.4-b4140/lib/gaisler/arith/div32.vhd}
  {Z:/DAT096/git/ES-Project-Spring-2014/Source code/HW/soundlie/soundlie.srcs/sources_1/imports/grlib-gpl-1.3.4-b4140/lib/gaisler/uart/libdcom.vhd}
  {Z:/DAT096/git/ES-Project-Spring-2014/Source code/HW/soundlie/soundlie.srcs/sources_1/imports/grlib-gpl-1.3.4-b4140/lib/gaisler/memctrl/memctrl.vhd}
  {Z:/DAT096/git/ES-Project-Spring-2014/Source code/HW/soundlie/soundlie.srcs/sources_1/imports/grlib-gpl-1.3.4-b4140/lib/gaisler/leon3v3/tbufmem.vhd}
  {Z:/DAT096/git/ES-Project-Spring-2014/Source code/HW/soundlie/soundlie.srcs/sources_1/imports/grlib-gpl-1.3.4-b4140/lib/gaisler/leon3v3/proc3.vhd}
  {Z:/DAT096/git/ES-Project-Spring-2014/Source code/HW/soundlie/soundlie.srcs/sources_1/imports/grlib-gpl-1.3.4-b4140/lib/gaisler/leon3v3/grlfpwx.vhd}
  {Z:/DAT096/git/ES-Project-Spring-2014/Source code/HW/soundlie/soundlie.srcs/sources_1/imports/grlib-gpl-1.3.4-b4140/lib/gaisler/leon3v3/grfpwxsh.vhd}
  {Z:/DAT096/git/ES-Project-Spring-2014/Source code/HW/soundlie/soundlie.srcs/sources_1/imports/grlib-gpl-1.3.4-b4140/lib/gaisler/leon3v3/grfpwx.vhd}
  {Z:/DAT096/git/ES-Project-Spring-2014/Source code/HW/soundlie/soundlie.srcs/sources_1/imports/grlib-gpl-1.3.4-b4140/lib/gaisler/leon3v3/cachemem.vhd}
  {Z:/DAT096/git/ES-Project-Spring-2014/Source code/HW/soundlie/soundlie.srcs/sources_1/imports/grlib-gpl-1.3.4-b4140/lib/gaisler/jtag/libjtagcom.vhd}
  {Z:/DAT096/git/ES-Project-Spring-2014/Source code/HW/soundlie/soundlie.srcs/sources_1/imports/grlib-gpl-1.3.4-b4140/lib/gaisler/greth/ethernet_mac.vhd}
  {Z:/DAT096/git/ES-Project-Spring-2014/Source code/HW/soundlie/soundlie.srcs/sources_1/imports/grlib-gpl-1.3.4-b4140/lib/gaisler/uart/dcom_uart.vhd}
  {Z:/DAT096/git/ES-Project-Spring-2014/Source code/HW/soundlie/soundlie.srcs/sources_1/imports/grlib-gpl-1.3.4-b4140/lib/gaisler/uart/dcom.vhd}
  {Z:/DAT096/git/ES-Project-Spring-2014/Source code/HW/soundlie/soundlie.srcs/sources_1/imports/grlib-gpl-1.3.4-b4140/lib/gaisler/memctrl/sdmctrl.vhd}
  {Z:/DAT096/git/ES-Project-Spring-2014/Source code/HW/soundlie/soundlie.srcs/sources_1/imports/grlib-gpl-1.3.4-b4140/lib/gaisler/leon3v3/leon3x.vhd}
  {Z:/DAT096/git/ES-Project-Spring-2014/Source code/HW/soundlie/soundlie.srcs/sources_1/imports/grlib-gpl-1.3.4-b4140/lib/gaisler/leon3v3/dsu3x.vhd}
  {Z:/DAT096/git/ES-Project-Spring-2014/Source code/HW/soundlie/soundlie.srcs/sources_1/imports/grlib-gpl-1.3.4-b4140/lib/gaisler/jtag/jtagcom2.vhd}
  {Z:/DAT096/git/ES-Project-Spring-2014/Source code/HW/soundlie/soundlie.srcs/sources_1/imports/grlib-gpl-1.3.4-b4140/lib/gaisler/jtag/jtagcom.vhd}
  {Z:/DAT096/git/ES-Project-Spring-2014/Source code/HW/soundlie/soundlie.srcs/sources_1/imports/grlib-gpl-1.3.4-b4140/lib/gaisler/jtag/jtag.vhd}
  {Z:/DAT096/git/ES-Project-Spring-2014/Source code/HW/soundlie/soundlie.srcs/sources_1/imports/grlib-gpl-1.3.4-b4140/lib/gaisler/greth/greth_gbit.vhd}
  {Z:/DAT096/git/ES-Project-Spring-2014/Source code/HW/soundlie/soundlie.srcs/sources_1/imports/grlib-gpl-1.3.4-b4140/lib/gaisler/greth/greth.vhd}
  {Z:/DAT096/git/ES-Project-Spring-2014/Source code/HW/soundlie/soundlie.srcs/sources_1/imports/grlib-gpl-1.3.4-b4140/lib/gaisler/uart/apbuart.vhd}
  {Z:/DAT096/git/ES-Project-Spring-2014/Source code/HW/soundlie/soundlie.srcs/sources_1/imports/grlib-gpl-1.3.4-b4140/lib/gaisler/uart/ahbuart.vhd}
  {Z:/DAT096/git/ES-Project-Spring-2014/Source code/HW/soundlie/soundlie.srcs/sources_1/imports/grlib-gpl-1.3.4-b4140/lib/gaisler/spi/spi.vhd}
  {Z:/DAT096/git/ES-Project-Spring-2014/Source code/HW/soundlie/soundlie.srcs/sources_1/imports/grlib-gpl-1.3.4-b4140/lib/gaisler/misc/rstgen.vhd}
  {Z:/DAT096/git/ES-Project-Spring-2014/Source code/HW/soundlie/soundlie.srcs/sources_1/imports/grlib-gpl-1.3.4-b4140/lib/gaisler/misc/grgpio.vhd}
  {Z:/DAT096/git/ES-Project-Spring-2014/Source code/HW/soundlie/soundlie.srcs/sources_1/imports/grlib-gpl-1.3.4-b4140/lib/gaisler/misc/gptimer.vhd}
  {Z:/DAT096/git/ES-Project-Spring-2014/Source code/HW/soundlie/soundlie.srcs/sources_1/imports/grlib-gpl-1.3.4-b4140/lib/gaisler/misc/ahbram.vhd}
  {Z:/DAT096/git/ES-Project-Spring-2014/Source code/HW/soundlie/soundlie.srcs/sources_1/imports/grlib-gpl-1.3.4-b4140/lib/gaisler/leon3v3/leon3s.vhd}
  {Z:/DAT096/git/ES-Project-Spring-2014/Source code/HW/soundlie/soundlie.srcs/sources_1/imports/grlib-gpl-1.3.4-b4140/lib/gaisler/leon3v3/dsu3.vhd}
  {Z:/DAT096/git/ES-Project-Spring-2014/Source code/HW/soundlie/soundlie.srcs/sources_1/imports/grlib-gpl-1.3.4-b4140/lib/gaisler/jtag/ahbjtag.vhd}
  {Z:/DAT096/git/ES-Project-Spring-2014/Source code/HW/soundlie/soundlie.srcs/sources_1/imports/grlib-gpl-1.3.4-b4140/lib/gaisler/irqmp/irqmp.vhd}
  {Z:/DAT096/git/ES-Project-Spring-2014/Source code/HW/soundlie/soundlie.srcs/sources_1/imports/grlib-gpl-1.3.4-b4140/lib/gaisler/greth/grethm.vhd}
}
read_vhdl -library eth {
  {Z:/DAT096/git/ES-Project-Spring-2014/Source code/HW/soundlie/soundlie.srcs/sources_1/imports/grlib-gpl-1.3.4-b4140/lib/eth/core/greth_pkg.vhd}
  {Z:/DAT096/git/ES-Project-Spring-2014/Source code/HW/soundlie/soundlie.srcs/sources_1/imports/grlib-gpl-1.3.4-b4140/lib/eth/core/eth_rstgen.vhd}
  {Z:/DAT096/git/ES-Project-Spring-2014/Source code/HW/soundlie/soundlie.srcs/sources_1/imports/grlib-gpl-1.3.4-b4140/lib/eth/core/greth_tx.vhd}
  {Z:/DAT096/git/ES-Project-Spring-2014/Source code/HW/soundlie/soundlie.srcs/sources_1/imports/grlib-gpl-1.3.4-b4140/lib/eth/core/greth_rx.vhd}
  {Z:/DAT096/git/ES-Project-Spring-2014/Source code/HW/soundlie/soundlie.srcs/sources_1/imports/grlib-gpl-1.3.4-b4140/lib/eth/core/eth_edcl_ahb_mst.vhd}
  {Z:/DAT096/git/ES-Project-Spring-2014/Source code/HW/soundlie/soundlie.srcs/sources_1/imports/grlib-gpl-1.3.4-b4140/lib/eth/core/eth_ahb_mst.vhd}
  {Z:/DAT096/git/ES-Project-Spring-2014/Source code/HW/soundlie/soundlie.srcs/sources_1/imports/grlib-gpl-1.3.4-b4140/lib/eth/core/grethc.vhd}
  {Z:/DAT096/git/ES-Project-Spring-2014/Source code/HW/soundlie/soundlie.srcs/sources_1/imports/grlib-gpl-1.3.4-b4140/lib/eth/comp/ethcomp.vhd}
}
read_vhdl {
  {Z:/DAT096/git/ES-Project-Spring-2014/Source code/HW/soundlie/soundlie.srcs/sources_1/imports/fir_2cascaded/fir1.vhd}
  {Z:/DAT096/git/ES-Project-Spring-2014/Source code/HW/soundlie/soundlie.srcs/sources_1/imports/fir_2cascaded/fir_wrap.vhd}
  {Z:/DAT096/git/ES-Project-Spring-2014/Source code/HW/soundlie/soundlie.srcs/sources_1/imports/XADC module/XADC_pkg.vhd}
  {Z:/DAT096/git/ES-Project-Spring-2014/Source code/HW/soundlie/soundlie.srcs/sources_1/imports/XADC module/interface_XADC.vhd}
  {Z:/DAT096/git/ES-Project-Spring-2014/Source code/HW/soundlie/soundlie.srcs/sources_1/imports/questa/DACInterface.vhdl}
  {Z:/DAT096/git/ES-Project-Spring-2014/Source code/HW/soundlie/soundlie.srcs/sources_1/imports/questa/clk_enable.vhdl}
  {Z:/DAT096/git/ES-Project-Spring-2014/Source code/HW/soundlie/soundlie.srcs/sources_1/imports/PWM module/PWM_pkg.vhd}
  {Z:/DAT096/git/ES-Project-Spring-2014/Source code/HW/soundlie/soundlie.srcs/sources_1/imports/PWM module/PWM.vhd}
  {Z:/DAT096/git/ES-Project-Spring-2014/Source code/HW/soundlie/soundlie.srcs/sources_1/imports/fir_2cascaded/top_fir.vhd}
  {Z:/DAT096/git/ES-Project-Spring-2014/Source code/HW/soundlie/soundlie.srcs/sources_1/imports/XADC module/XADCapb.vhd}
  {Z:/DAT096/git/ES-Project-Spring-2014/Source code/HW/soundlie/soundlie.srcs/sources_1/imports/questa/DAC_apb.vhdl}
  {Z:/DAT096/git/ES-Project-Spring-2014/Source code/HW/soundlie/soundlie.srcs/sources_1/imports/grlib-gpl-1.3.4-b4140/designs/leon3-digilent-nexys4/config.vhd}
  {Z:/DAT096/git/ES-Project-Spring-2014/Source code/HW/soundlie/soundlie.srcs/sources_1/imports/grlib-gpl-1.3.4-b4140/designs/leon3-digilent-nexys4/ahbrom.vhd}
  {Z:/DAT096/git/ES-Project-Spring-2014/Source code/HW/soundlie/soundlie.srcs/sources_1/imports/grlib-gpl-1.3.4-b4140/designs/leon3-digilent-nexys4/leon3mp.vhd}
}
read_vhdl -library esa {
  {Z:/DAT096/git/ES-Project-Spring-2014/Source code/HW/soundlie/soundlie.srcs/sources_1/imports/grlib-gpl-1.3.4-b4140/lib/esa/memoryctrl/memoryctrl.vhd}
  {Z:/DAT096/git/ES-Project-Spring-2014/Source code/HW/soundlie/soundlie.srcs/sources_1/imports/grlib-gpl-1.3.4-b4140/lib/esa/memoryctrl/mctrl.vhd}
}
read_xdc {{Z:/DAT096/git/ES-Project-Spring-2014/Source code/HW/soundlie/soundlie.srcs/constrs_1/new/leon3mp.xdc}}
set_property used_in_implementation false [get_files {{Z:/DAT096/git/ES-Project-Spring-2014/Source code/HW/soundlie/soundlie.srcs/constrs_1/new/leon3mp.xdc}}]

read_xdc {{Z:/DAT096/git/ES-Project-Spring-2014/Source code/HW/soundlie/soundlie.srcs/constrs_1/new/misc.xdc}}
set_property used_in_implementation false [get_files {{Z:/DAT096/git/ES-Project-Spring-2014/Source code/HW/soundlie/soundlie.srcs/constrs_1/new/misc.xdc}}]

read_xdc {{Z:/DAT096/git/ES-Project-Spring-2014/Source code/HW/soundlie/soundlie.srcs/constrs_1/new/io.xdc}}
set_property used_in_implementation false [get_files {{Z:/DAT096/git/ES-Project-Spring-2014/Source code/HW/soundlie/soundlie.srcs/constrs_1/new/io.xdc}}]

read_xdc {{Z:/DAT096/git/ES-Project-Spring-2014/Source code/HW/soundlie/soundlie.srcs/constrs_1/new/uart.xdc}}
set_property used_in_implementation false [get_files {{Z:/DAT096/git/ES-Project-Spring-2014/Source code/HW/soundlie/soundlie.srcs/constrs_1/new/uart.xdc}}]

read_xdc {{Z:/DAT096/git/ES-Project-Spring-2014/Source code/HW/soundlie/soundlie.srcs/constrs_1/new/xadc.xdc}}
set_property used_in_implementation false [get_files {{Z:/DAT096/git/ES-Project-Spring-2014/Source code/HW/soundlie/soundlie.srcs/constrs_1/new/xadc.xdc}}]

read_xdc {{Z:/DAT096/git/ES-Project-Spring-2014/Source code/HW/soundlie/soundlie.srcs/constrs_1/new/pwm.xdc}}
set_property used_in_implementation false [get_files {{Z:/DAT096/git/ES-Project-Spring-2014/Source code/HW/soundlie/soundlie.srcs/constrs_1/new/pwm.xdc}}]

read_xdc {{Z:/DAT096/git/ES-Project-Spring-2014/Source code/HW/soundlie/soundlie.srcs/constrs_1/new/unused.xdc}}
set_property used_in_implementation false [get_files {{Z:/DAT096/git/ES-Project-Spring-2014/Source code/HW/soundlie/soundlie.srcs/constrs_1/new/unused.xdc}}]

read_xdc dont_touch.xdc
set_property used_in_implementation false [get_files dont_touch.xdc]
read_xdc dont_buffer.xdc
set_property used_in_implementation false [get_files dont_buffer.xdc]
set_param synth.vivado.isSynthRun true
set_property webtalk.parent_dir {Z:/DAT096/git/ES-Project-Spring-2014/Source code/HW/soundlie/soundlie.data/wt} [current_project]
set_property parent.project_dir {Z:/DAT096/git/ES-Project-Spring-2014/Source code/HW/soundlie} [current_project]
synth_design -top leon3mp -part xc7a100tcsg324-2
write_checkpoint leon3mp.dcp
report_utilization -file leon3mp_utilization_synth.rpt -pb leon3mp_utilization_synth.pb
