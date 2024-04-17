/*
 * Copyright (c) 2024 Qubitbytes Ltd
 * SPDX-License-Identifier: Apache-2.0
 */
`define default_netname none
`default_nettype none

module tt_um_qubitbytes_alive (
    input  wire [7:0] ui_in,    // Dedicated inputs
    output wire [7:0] uo_out,   // Dedicated outputs
    input  wire [7:0] uio_in,   // IOs: Input path
    output wire [7:0] uio_out,  // IOs: Output path
    output wire [7:0] uio_oe,   // IOs: Enable path (active high: 0=input, 1=output)
    input  wire       ena,      // will go high when the design is enabled
    input  wire       clk,      // clock
    input  wire       rst_n     // reset_n - low to reset
);

  // configure reset button
  wire reset = ! rst_n;

  // configure unused wires
  wire _unused_ok = &{1'b0,
                    ena,
                    uio_in,
                      1'b0,
                      ui_in[7:1],
                      1'b0};
   
    
  // configure led segment
  wire [7:0] led_out;
  assign uo_out[7:0] = led_out; 

    
  // configure speaker
  wire speaker;
  assign uio_oe = 8'b00000001;
  assign uio_out[0] = speaker;
  assign uio_out[7:1] = 0;

    // need to check this
//  assign uio_in[1] = ~speaker;
//  assign uio_in[7:1] = 0; 
    
   // configure clock
    wire ticks_per_mili;
    assign  ticks_per_ms = (ui_in[0] == 1'b0) ? 100 : 10; // 100khz or 10khz

    
   // create process
    music_processor music_processor (
      .clk   (clk),
      .rst   (reset),
      .ticks_per_milli (ticks_per_ms),
      .led   (led_out),
      .sound (speaker)
  );

endmodule
