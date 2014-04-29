// Copyright 1986-1999, 2001-2013 Xilinx, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2013.4 (win64) Build 353583 Mon Dec  9 17:49:19 MST 2013
// Date        : Fri Apr 25 17:39:42 2014
// Host        : CSE-4225-10 running 64-bit Service Pack 1  (build 7601)
// Command     : write_verilog -force -mode synth_stub {z:/DAT096/git/ES-Project-Spring-2014/Source
//               code/HW/soundlie/soundlie.srcs/sources_1/ip/dac_clk/dac_clk_stub.v}
// Design      : dac_clk
// Purpose     : Stub declaration of top-level module interface
// Device      : xc7a100tcsg324-2
// --------------------------------------------------------------------------------

// This empty module with port declaration file causes synthesis tools to infer a black box for IP.
// The synthesis directives are for Synopsys Synplify support to prevent IO buffer insertion.
// Please paste the declaration into a Verilog source file or add the file as an additional source.
module dac_clk(clk, clk_out, reset)
/* synthesis syn_black_box black_box_pad_pin="clk,clk_out,reset" */;
  input clk;
  output clk_out;
  input reset;
endmodule
