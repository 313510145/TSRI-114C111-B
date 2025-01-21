//
//      CONFIDENTIAL  AND  PROPRIETARY SOFTWARE OF ARM Physical IP, INC.
//      
//      Copyright (c) 1993-2011  ARM Physical IP, Inc.  All  Rights Reserved.
//      
//      Use of this Software is subject to the terms and conditions  of the
//      applicable license agreement with ARM Physical IP, Inc.  In addition,
//      this Software is protected by patents, copyright law and international
//      treaties.
//      
//      The copyright notice(s) in this Software does not indicate actual or
//      intended publication of this Software.
//      
//      name:			High Density Diffusion ROM Generator
//           			TSMC 90nm (CLN90G) Process
//      version:		2008Q2V2
//      comment:		
//      configuration:	 -instname "nco_table_log" -words 1024 -bits 16 -frequency 100 -ring_width 6.0 -code_file "log.txt" -mux 16 -top_layer "met5-9" -power_type rings -horiz met3 -vert met4 -bmux off -ema off -cust_comment "" -bus_notation on -left_bus_delim "[" -right_bus_delim "]" -pwr_gnd_rename "VDD:VDD,GND:VSS" -prefix "" -pin_space 0.0 -name_case upper -check_instname on -diodes on -inside_ring_type GND -drive 6 -asvm off -corners ff_1.1_-40.0,tt_1.0_25.0,ss_0.9_125.0,ff_1.1_125.0
//
//      Verilog model for Synchronous Single-Port Rom
//
//      Instance Name:              nco_table_log
//      Words:                      1024
//      Bits:                       16
//      Mux:                        16
//      Drive:                      6
//      Write Mask:                 Off
//      Extra Margin Adjustment:    Off
//      Accelerated Retention Test: Off
//      Redundant Rows:             0
//      Redundant Columns:          0
//      Test Muxes                  Off
//
//      Creation Date:  2011-01-07 08:22:28Z
//      Version: 	2008Q2V2
//
//      Modeling Assumptions: This model supports full gate level simulation
//          including proper x-handling and timing check behavior.  Unit
//          delay timing is included in the model. Back-annotation of SDF
//          (v2.1) is supported.  SDF can be created utilyzing the delay
//          calculation views provided with this generator and supported
//          delay calculators.  All buses are modeled [MSB:LSB].  All 
//          ports are padded with Verilog primitives.
//
//      Modeling Limitations: None.
//
//      Known Bugs: None.
//
//      Known Work Arounds: N/A
//
`timescale 1 ns/1 ps

  module nco_table_log (
                Q,
                CLK,
                CEN,
                A
                );
  
   output [15:0]            Q;
   input                    CLK;
   input                    CEN;
   input [9:0]              A;


endmodule

