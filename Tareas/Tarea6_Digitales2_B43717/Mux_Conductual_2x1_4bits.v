//Como son buses no pueden llevar reg a la salida!***
`include "Mux_Conductual_2x1_2bits.v"


module Mux_Conductual_2x1_4bits (
	output		[3:0] out2,
	output		valid_out2,
	input		clok,
	input		valid1,
	input		valid2,
	input 		reset_L,	
	input 		selector,
	input 		[3:0] bus1,
	input 		[3:0] bus2);
	
	
		
		
		
	Mux_Conductual_2x1_2bits xy(.data_out(out2[1:0]),.valid_out1(valid_out2),.clok(clok),.valid1(valid1),.valid2(valid2), .reset_L(reset_L),.selector(selector), .data_in0(bus1[1:0]),.data_in1(bus2[1:0]));



	Mux_Conductual_2x1_2bits yz(.data_out(out2[3:2]),.valid_out1(valid_out2),.clok(clok),.valid1(valid1),.valid2(valid2), .reset_L(reset_L),.selector(selector), .data_in0(bus1[3:2]),.data_in1(bus2[3:2]));
	
		
		
endmodule
