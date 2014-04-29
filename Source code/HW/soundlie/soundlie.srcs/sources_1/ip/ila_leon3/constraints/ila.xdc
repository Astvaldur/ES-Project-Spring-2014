set_false_path -from [get_cells -hierarchical -filter { NAME =~  "*ila_core_inst/u_ila_reset_ctrl/asyncrounous_transfer*/din_reg_reg*" && (PRIMITIVE_TYPE =~ FLOP_LATCH.*.* || PRIMITIVE_TYPE =~ RTL_REGISTER.flop.*) } ] -to [get_cells -hierarchical -filter { NAME =~  "*ila_core_inst/u_ila_reset_ctrl/asyncrounous_transfer*/dout_reg0_reg*" && (PRIMITIVE_TYPE =~ FLOP_LATCH.*.* || PRIMITIVE_TYPE =~ RTL_REGISTER.flop.*) } ]
set_false_path -from [get_cells -hierarchical -filter { NAME =~  "*ila_core_inst/u_ila_cap_ctrl/u_cap_addrgen/*cfg_data_vec_reg*" && (PRIMITIVE_TYPE =~ FLOP_LATCH.*.* || PRIMITIVE_TYPE =~ RTL_REGISTER.flop.*) } ] -to [get_cells -hierarchical -filter { NAME =~  "*ila_core_inst/u_ila_cap_ctrl/u_cap_addrgen/*icap_addr_reg*" && (PRIMITIVE_TYPE =~ FLOP_LATCH.*.* || PRIMITIVE_TYPE =~ RTL_REGISTER.flop.*) } ]
set_false_path -to [get_cells -hierarchical -filter { NAME =~  "*ila_core_inst/u_ila_cap_ctrl/u_cap_addrgen/u_cap_sample_counter/iscnt_reg*" && (PRIMITIVE_TYPE =~ FLOP_LATCH.*.* || PRIMITIVE_TYPE =~ RTL_REGISTER.flop.*) } ]
set_false_path -to [get_cells -hierarchical -filter { NAME =~  "*ila_core_inst/u_ila_cap_ctrl/u_cap_addrgen/u_cap_window_counter/iwcnt_reg*" && (PRIMITIVE_TYPE =~ FLOP_LATCH.*.* || PRIMITIVE_TYPE =~ RTL_REGISTER.flop.*) } ]
set_false_path -to [get_cells -hierarchical -filter { NAME =~  "*ila_core_inst/u_ila_cap_ctrl/u_cap_addrgen/u_cap_sample_counter/u_scnt_cmp/allx_typeA_match_detection.cs_allx_typeA_inst/DUT/I_WHOLE_SLICE.G_SLICE_IDX[*].U_ALL_SRL_SLICE/I_IS_TERMINATION_SLICE_W_OUTPUT_REG.DOUT_O*" && (PRIMITIVE_TYPE =~ FLOP_LATCH.*.* || PRIMITIVE_TYPE =~ RTL_REGISTER.flop.*) } ]
set_false_path -to [get_cells -hierarchical -filter { NAME =~  "*ila_core_inst/u_ila_cap_ctrl/u_cap_addrgen/u_cap_window_counter/u_wcnt_lcmp/allx_typeA_match_detection.cs_allx_typeA_inst/DUT/I_WHOLE_SLICE.G_SLICE_IDX[*].U_ALL_SRL_SLICE/I_IS_TERMINATION_SLICE_W_OUTPUT_REG.DOUT_O*" && (PRIMITIVE_TYPE =~ FLOP_LATCH.*.* || PRIMITIVE_TYPE =~ RTL_REGISTER.flop.*) } ]
set_false_path -to [get_cells -hierarchical -filter { NAME =~  "*ila_core_inst/u_ila_cap_ctrl/U_NS1*/I_YESLUT6.I_YES_OREG.O*" && (PRIMITIVE_TYPE =~ FLOP_LATCH.*.* || PRIMITIVE_TYPE =~ RTL_REGISTER.flop.*) } ]
set_false_path -to [get_cells -hierarchical -filter { NAME =~  "*ila_core_inst/u_ila_cap_ctrl/U_CDONE/I_YESLUT6.I_YES_OREG.O*" && (PRIMITIVE_TYPE =~ FLOP_LATCH.*.* || PRIMITIVE_TYPE =~ RTL_REGISTER.flop.*) } ]
#set_false_path -from [get_cells -hierarchical -filter { NAME =~  "*ila_core_inst/u_ila_regs/reg_*/I_EN_CTL_EQ1.U_CTL/xsdb_reg_reg*" && (PRIMITIVE_TYPE =~ FLOP_LATCH.*.* || PRIMITIVE_TYPE =~ RTL_REGISTER.flop.*) } ] -to [get_cells -hierarchical -filter { NAME =~  "*ila_core_inst/u_trig/U_TM/G_NMU[*].U_M/allx_typeA_match_detection.cs_allx_typeA_inst/probeDelay1*" && (PRIMITIVE_TYPE =~ FLOP_LATCH.*.* || PRIMITIVE_TYPE =~ RTL_REGISTER.flop.*) } ]
set_false_path -from [get_cells -hierarchical -filter { NAME =~  "*ila_core_inst/u_ila_regs/reg_*/I_EN_CTL_EQ1.U_CTL/xsdb_reg_reg*" && (PRIMITIVE_TYPE =~ FLOP_LATCH.*.* || PRIMITIVE_TYPE =~ RTL_REGISTER.flop.*) } ]
set_false_path -from [get_cells -hierarchical -filter { NAME =~  "*ila_core_inst/u_trig/U_TM/G_NMU[*].U_M/allx_typeA_match_detection.cs_allx_typeA_inst/DUT/I_WHOLE_SLICE.G_SLICE_IDX[*].U_ALL_SRL_SLICE*" && (PRIMITIVE_TYPE =~ FLOP_LATCH.*.* || PRIMITIVE_TYPE =~ RTL_REGISTER.flop.*) } ] -to [get_cells -hierarchical -filter { NAME =~  "*ila_core_inst/u_trig/U_TM/G_NMU[*].U_M/allx_typeA_match_detection.cs_allx_typeA_inst/DUT/I_WHOLE_SLICE.G_SLICE_IDX[*].U_ALL_SRL_SLICE/I_IS_TERMINATION_SLICE_W_OUTPUT_REG.DOUT_O*" && (PRIMITIVE_TYPE =~ FLOP_LATCH.*.* || PRIMITIVE_TYPE =~ RTL_REGISTER.flop.*) } ]
set_false_path -from [get_cells -hierarchical -filter { NAME =~  "*ila_core_inst/u_trig/genblk1[*].U_TC/allx_typeA_match_detection.cs_allx_typeA_inst/DUT/I_WHOLE_SLICE.G_SLICE_IDX[*].U_ALL_SRL_SLICE*" && (PRIMITIVE_TYPE =~ FLOP_LATCH.*.* || PRIMITIVE_TYPE =~ RTL_REGISTER.flop.*) } ] -to [get_cells -hierarchical -filter { NAME =~  "*ila_core_inst/u_trig/genblk*[*].U_TC/allx_typeA_match_detection.cs_allx_typeA_inst/DUT/I_WHOLE_SLICE.G_SLICE_IDX[*].U_ALL_SRL_SLICE/I_IS_TERMINATION_SLICE_W_OUTPUT_REG.DOUT_O*" && (PRIMITIVE_TYPE =~ FLOP_LATCH.*.* || PRIMITIVE_TYPE =~ RTL_REGISTER.flop.*) } ]
set_false_path -to [get_cells -hierarchical -filter { NAME =~  "*ila_core_inst/u_ila_cap_ctrl/u_cap_addrgen/icap_wr_en*" && (PRIMITIVE_TYPE =~ FLOP_LATCH.*.* || PRIMITIVE_TYPE =~ RTL_REGISTER.flop.*) } ]
set_false_path -to [get_cells -hierarchical -filter { NAME =~  "*ila_core_inst/u_ila_cap_ctrl/u_cap_addrgen/u_cap_sample_counter/iscnt*" && (PRIMITIVE_TYPE =~ FLOP_LATCH.*.* || PRIMITIVE_TYPE =~ RTL_REGISTER.flop.*) } ]
set_false_path -from [get_cells -hierarchical -filter { NAME =~  "*ila_core_inst/u_ila_cap_ctrl/u_cap_addrgen/u_cap_window_counter/u_wcnt_hcmp/allx_typeA_match_detection.cs_allx_typeA_inst/DUT/I_WHOLE_SLICE.G_SLICE_IDX[*].U_ALL_SRL_SLICE/*" && (PRIMITIVE_TYPE =~ FLOP_LATCH.*.* || PRIMITIVE_TYPE =~ RTL_REGISTER.flop.*) } ] -to [get_cells -hierarchical -filter { NAME =~  "*ila_core_inst/u_ila_cap_ctrl/u_cap_addrgen/u_cap_window_counter/u_wcnt_hcmp/allx_typeA_match_detection.cs_allx_typeA_inst/DUT/I_WHOLE_SLICE.G_SLICE_IDX[*].U_ALL_SRL_SLICE/I_IS_TERMINATION_SLICE_W_OUTPUT_REG.DOUT_O*" && (PRIMITIVE_TYPE =~ FLOP_LATCH.*.* || PRIMITIVE_TYPE =~ RTL_REGISTER.flop.*) } ]
set_false_path -from [get_cells -hierarchical -filter { NAME =~  "*ila_core_inst/u_ila_cap_ctrl/U_NS0*/*" && (PRIMITIVE_TYPE =~ FLOP_LATCH.*.* || PRIMITIVE_TYPE =~ RTL_REGISTER.flop.*) } ] -to [get_cells -hierarchical -filter { NAME =~  "*ila_core_inst/u_ila_cap_ctrl/U_NS0*/I_YESLUT6.I_YES_OREG.O*" && (PRIMITIVE_TYPE =~ FLOP_LATCH.*.* || PRIMITIVE_TYPE =~ RTL_REGISTER.flop.*) } ]
set_false_path -to [get_cells -hierarchical -filter { NAME =~  "*ila_core_inst/u_trig/U_TM/G_NMU[*].U_M/allx_typeA_match_detection.cs_allx_typeA_inst/DUT/I_WHOLE_SLICE.G_SLICE_IDX[*].U_ALL_SRL_SLICE/I_IS_TERMINATION_SLICE_W_OUTPUT_REG.DOUT_O*" && (PRIMITIVE_TYPE =~ FLOP_LATCH.*.* || PRIMITIVE_TYPE =~ RTL_REGISTER.flop.*) } ]
set_false_path -to [get_cells -hierarchical -filter { NAME =~  "*ila_core_inst/u_trig/genblk1[*].U_TC/allx_typeA_match_detection.cs_allx_typeA_inst/DUT/I_WHOLE_SLICE.G_SLICE_IDX[*].U_ALL_SRL_SLICE/I_IS_TERMINATION_SLICE_W_OUTPUT_REG.DOUT_O*" && (PRIMITIVE_TYPE =~ FLOP_LATCH.*.* || PRIMITIVE_TYPE =~ RTL_REGISTER.flop.*) } ]
set_false_path -to [get_cells -hierarchical -filter { NAME =~  "*ila_core_inst/u_trig/genblk1[*].U_TC/allx_typeA_match_detection.cs_allx_typeA_inst/DUT/I_WHOLE_SLICE.G_SLICE_IDX[*].U_ALL_SRL_SLICE/I_IS_TERMINATION_SLICE_W_OUTPUT_REG.DOUT_O*" && (PRIMITIVE_TYPE =~ FLOP_LATCH.*.* || PRIMITIVE_TYPE =~ RTL_REGISTER.flop.*) } ]
set_false_path -to [get_cells -hierarchical -filter { NAME =~  "*ila_core_inst/u_trig/U_TM/G_NMU[*].U_M/allx_typeA_match_detection.cs_allx_typeA_inst/DUT/I_WHOLE_SLICE.G_SLICE_IDX[*].U_ALL_SRL_SLICE/I_IS_TERMINATION_SLICE_W_OUTPUT_REG.DOUT_O*" && (PRIMITIVE_TYPE =~ FLOP_LATCH.*.* || PRIMITIVE_TYPE =~ RTL_REGISTER.flop.*) } ]
set_false_path -to [get_cells -hierarchical -filter { NAME =~  "*ila_core_inst/u_ila_cap_ctrl/u_cap_addrgen/u_cap_window_counter/u_wcnt_hcmp/allx_typeA_match_detection.cs_allx_typeA_inst/DUT/I_WHOLE_SLICE.G_SLICE_IDX[*].U_ALL_SRL_SLICE/I_IS_TERMINATION_SLICE_W_OUTPUT_REG.DOUT_O*" && (PRIMITIVE_TYPE =~ FLOP_LATCH.*.* || PRIMITIVE_TYPE =~ RTL_REGISTER.flop.*) } ]
set_false_path -from [get_cells -hierarchical -filter { NAME =~  "*ila_core_inst/u_ila_cap_ctrl/CAP_DONE_O*" && (PRIMITIVE_TYPE =~ FLOP_LATCH.*.* || PRIMITIVE_TYPE =~ RTL_REGISTER.flop.*) } ] -to [get_cells -hierarchical -filter { NAME =~  "*ila_core_inst/u_ila_regs/reg*/I_EN_STAT_EQ1.U_STAT/xsdb_reg*" && (PRIMITIVE_TYPE =~ FLOP_LATCH.*.* || PRIMITIVE_TYPE =~ RTL_REGISTER.flop.*) } ]
set_false_path -from [get_cells -hierarchical -filter { NAME =~  "*ila_core_inst/u_ila_cap_ctrl/CAP_TRIGGER_O*" && (PRIMITIVE_TYPE =~ FLOP_LATCH.*.* || PRIMITIVE_TYPE =~ RTL_REGISTER.flop.*) } ] -to [get_cells -hierarchical -filter { NAME =~  "*ila_core_inst/u_ila_regs/reg*/I_EN_STAT_EQ1.U_STAT/xsdb_reg*" && (PRIMITIVE_TYPE =~ FLOP_LATCH.*.* || PRIMITIVE_TYPE =~ RTL_REGISTER.flop.*) } ]
set_false_path -from [get_cells -hierarchical -filter { NAME =~  "*ila_core_inst/u_ila_cap_ctrl/u_cap_addrgen/captured_samples*" && (PRIMITIVE_TYPE =~ FLOP_LATCH.*.* || PRIMITIVE_TYPE =~ RTL_REGISTER.flop.*) } ] -to [get_cells -hierarchical -filter { NAME =~  "*ila_core_inst/u_ila_regs/reg*/I_EN_STAT_EQ1.U_STAT/xsdb_reg*" && (PRIMITIVE_TYPE =~ FLOP_LATCH.*.* || PRIMITIVE_TYPE =~ RTL_REGISTER.flop.*) } ]
set_false_path -from [get_cells -hierarchical -filter { NAME =~  "*ila_core_inst/u_ila_reset_ctrl/asyncrounous_transfer.arm_in_transfer_inst/dout_reg*" && (PRIMITIVE_TYPE =~ FLOP_LATCH.*.* || PRIMITIVE_TYPE =~ RTL_REGISTER.flop.*) } ] -to [get_cells -hierarchical -filter { NAME =~  "*ila_core_inst/u_ila_reset_ctrl/asyncrounous_transfer.arm_in_transfer_inst/din_reg*" && (PRIMITIVE_TYPE =~ FLOP_LATCH.*.* || PRIMITIVE_TYPE =~ RTL_REGISTER.flop.*) } ]
set_false_path -from [get_cells -hierarchical -filter { NAME =~  "*ila_core_inst/u_ila_reset_ctrl/asyncrounous_transfer.halt_in_transfer_inst/dout_reg*" && (PRIMITIVE_TYPE =~ FLOP_LATCH.*.* || PRIMITIVE_TYPE =~ RTL_REGISTER.flop.*) } ] -to [get_cells -hierarchical -filter { NAME =~  "*ila_core_inst/u_ila_reset_ctrl/asyncrounous_transfer.halt_in_transfer_inst/din_reg*" && (PRIMITIVE_TYPE =~ FLOP_LATCH.*.* || PRIMITIVE_TYPE =~ RTL_REGISTER.flop.*) } ]
set_false_path -to [get_cells -hierarchical -filter { NAME =~  "*ila_core_inst/u_trig/genblk1[*].U_TC/allx_typeA_match_detection.cs_allx_typeA_inst/DUT/I_WHOLE_SLICE.G_SLICE_IDX[*].U_ALL_SRL_SLICE/I_IS_TERMINATION_SLICE_W_OUTPUT_REG.DOUT_O*" && (PRIMITIVE_TYPE =~ FLOP_LATCH.*.* || PRIMITIVE_TYPE =~ RTL_REGISTER.flop.*) } ]
set_false_path -to [get_cells -hierarchical -filter { NAME =~  "*ila_core_inst/u_ila_cap_ctrl/u_cap_addrgen/u_cap_window_counter/u_wcnt_hcmp/allx_typeA_match_detection.cs_allx_typeA_inst/DUT/I_WHOLE_SLICE.G_SLICE_IDX[*].U_ALL_SRL_SLICE/I_IS_TERMINATION_SLICE_W_OUTPUT_REG.DOUT_O*" && (PRIMITIVE_TYPE =~ FLOP_LATCH.*.* || PRIMITIVE_TYPE =~ RTL_REGISTER.flop.*) } ]
set_false_path -from [get_cells -hierarchical -filter { NAME =~  "*ila_core_inst/u_ila_reset_ctrl/asyncrounous_transfer.halt_out_transfer_inst/dout_reg*" && (PRIMITIVE_TYPE =~ FLOP_LATCH.*.* || PRIMITIVE_TYPE =~ RTL_REGISTER.flop.*) } ] -to [get_cells -hierarchical -filter { NAME =~  "*ila_core_inst/u_ila_reset_ctrl/asyncrounous_transfer.halt_out_transfer_inst/din_reg*" && (PRIMITIVE_TYPE =~ FLOP_LATCH.*.* || PRIMITIVE_TYPE =~ RTL_REGISTER.flop.*) } ]
set_false_path -from [get_cells -hierarchical -filter { NAME =~  "*ila_core_inst/u_ila_reset_ctrl/asyncrounous_transfer.arm_out_transfer_inst/dout_reg*" && (PRIMITIVE_TYPE =~ FLOP_LATCH.*.* || PRIMITIVE_TYPE =~ RTL_REGISTER.flop.*) } ] -to [get_cells -hierarchical -filter { NAME =~  "*ila_core_inst/u_ila_reset_ctrl/asyncrounous_transfer.arm_out_transfer_inst/din_reg*" && (PRIMITIVE_TYPE =~ FLOP_LATCH.*.* || PRIMITIVE_TYPE =~ RTL_REGISTER.flop.*) } ]
set_false_path -to [get_cells -hierarchical -filter { NAME =~  "*ila_core_inst/u_ila_cap_ctrl/U_NS0*/I_YESLUT6.I_YES_OREG.O*" && (PRIMITIVE_TYPE =~ FLOP_LATCH.*.* || PRIMITIVE_TYPE =~ RTL_REGISTER.flop.*) } ]
