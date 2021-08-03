/*`include "Serial_Paralelo.v"
`include "Demux_8x32.v"
`include "Unstriping.v"*/

module Phy_rx(
    output valid_outx,
    output [31:0] data_outx,
    output  active1,
    output  active2,
    
    input clk_32f,      // Frecuencia de 32
    
    input clk_4f,      // Frecuencia de 8
    input clk,      // Frecuencia de 1
    
    input data_in_SP,
    input data_in_SP2,
    input reset_L);
    
    wire C1,C3,C4,C5;
    wire [7:0] C2;     // Frecuencia de 1
    wire [7:0] C6;
    wire [31:0] C7;
    wire [31:0] C8;

	// 1.
	Serial_Paralelo inst1(.data_out_SP(C2),.valid_SP(C1),.active(active1),.clk_32f(clk_32f),.data_in_SP(data_in_SP), .reset_L(reset_L));


	// 2.
Demux_8x32 ints2(.data_out_8x32(C7), .valid_out_8x32(C3), .clk_4f(clk_4f), .data_in_8x32(C2), .valid_in_8x32(C1), .reset_L(reset_L));
	
	// 3.
	Serial_Paralelo inst3(.data_out_SP(C6),.valid_SP(C5),.active(active2),.clk_32f(clk_32f),.data_in_SP(data_in_SP2), .reset_L(reset_L));


	// 4.
Demux_8x32 ints4(.data_out_8x32(C8), .valid_out_8x32(C4), .clk_4f(clk_4f), .data_in_8x32(C6), .valid_in_8x32(C5), .reset_L(reset_L));


	// 5.
Unstriping inst(.data_out(data_outx), .valid_out(valid_outx), .valid_in0(C3), .valid_in1(C4), .lane_in0(C7), .lane_in1(C8), .clk(clk), .reset(reset_L));









endmodule
