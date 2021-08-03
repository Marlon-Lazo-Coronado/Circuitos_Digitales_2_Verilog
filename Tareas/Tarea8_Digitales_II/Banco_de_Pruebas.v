`timescale 	1s				/ 100ps
// escala	unidad temporal (valor de "#4") / precisión
// Pueden omitirse y llamarse desde el testbench

`include "Gray_cont.v"
`include "contador_gray_synth.v"
`include "Probador.v"
`include "cmos_cells.v"

module BancoPrueba;
	wire reset_L;
    	wire clk;
    	wire enable;
    	wire [4:0] gray_out;
    	
    	wire [4:0] salida_gray;
    	
    	
    	

	Gray_cont Gray_cont_inst( /*AUTOINST*/
				 // Outputs
				 .gray_out		(gray_out[4:0]),
				 // Inputs
				 .clk			(clk),
				 .reset_L		(reset_L),
				 .enable		(enable));
						     
	
	contador_gray_synth contador_gray_synth_ins(/*AUTOINST*/
						    // Outputs
						    .salida_gray	(salida_gray[4:0]),
						    // Inputs
						    .clk		(clk),
						    .enable		(enable),
						    .reset_L		(reset_L));
	
	
	
	
	// Probador: generador de señales y monitor
	Probador Probador_Inst( /*AUTOINST*/
			       // Outputs
			       .clk		(clk),
			       .reset_L		(reset_L),
			       .enable		(enable),
			       // Inputs
			       .gray_out	(gray_out[4:0]),
			       .salida_gray	(salida_gray[4:0]));
endmodule
