`include "Componentes.v"



module Mux_Estructural (
	output		[1:0] data_out_Est,
	input 		clok,
	input 		reset_L,	
	input 		selector,
	input 		[1:0] data_in0,
	input 		[1:0] data_in1); 

	wire [1:0]C1;
	wire [1:0]C2;
	//wire [1:0]C3;
	wire [1:0]tierra;
	
	assign tierra = 'b0;
	
	
	Mux_2x1_2bits st1( .SMUX1_2bits(C1), .A(data_in1), .B(data_in0),  .selector(selector));
	
	Mux_2x1_2bits st2( .SMUX1_2bits(C2), .A(C1),  .B(tierra), .selector(reset_L));
	
	FLOP_D st3( .data_out_est(data_out_Est), .A(C2), .clok(clok));
	
	//FLOP_D st4( .data_out_est(C3[1]), .A(C2[1]), .clok(cloK));
	//assign data_out_Est = C3;
	//assign data_out_Est[1] = C2[1];
	
	//Consutar porque no me dejò usar 2 flops de 1 bit y repartirle cada bit al la salida?
	
	
endmodule
