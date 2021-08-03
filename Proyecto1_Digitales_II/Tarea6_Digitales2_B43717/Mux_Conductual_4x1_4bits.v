
`include "Mux_Conductual_2x1_4bits.v"

module Mux_Conductual_4x1_4bits (
	output		[3:0] out3,
	output		valid_out3,
	input		clok,
	input		valid1,
	input		valid2,
	input		valid3,
	input		valid4,
	input 		reset_L,	
	//input 		selector,
	input 		[1:0] selector_2bits,
	input 		[3:0] bus1,
	input 		[3:0] bus2,
	input 		[3:0] bus3,
	input 		[3:0] bus4);
	
	wire [3:0] c1;
	wire [3:0] c2;
	wire v1,v2;    // Se cambian de pocicion los buses 3 y 2 para que la secuencia de selector_2bits saque los buses en orde del 0 al 4
	               // Los valid 3 y 2 tambien deben cambiar.
	
	Mux_Conductual_2x1_4bits intst(.out2(c1),.valid_out2(v1),.clok(clok),.valid1(valid1),.valid2(valid3),.reset_L(reset_L),.selector(selector_2bits[1]),.bus1(bus1),.bus2(bus3));
		
		
		
	Mux_Conductual_2x1_4bits wt(.out2(c2),.valid_out2(v2),.clok(clok),.valid1(valid2),.valid2(valid4),.reset_L(reset_L),.selector(selector_2bits[1]),.bus1(bus2),.bus2(bus4));
	
	

	Mux_Conductual_2x1_4bits dx(.out2(out3),.valid_out2(valid_out3),.clok(clok),.valid1(v1),.valid2(v2),.reset_L(reset_L),.selector(selector_2bits[0]),.bus1(c1),.bus2(c2));
	
	
		
		
endmodule
