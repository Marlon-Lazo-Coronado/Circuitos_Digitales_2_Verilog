`timescale 	1s				/ 100ps
// escala	unidad temporal (valor de "#4") / precisión
// Pueden omitirse y llamarse desde el testbench
`include "Mux_Conductual.v"
`include "probador_Mux.v"

module BancoPrueba_Mux; // Testbench
	//Los buses se deben declarar en lineas aparte por ser de diferentes tamaños.
	wire [1:0] data_out;
	wire reset_L, selector;  
	wire [1:0] data_in0; 
	wire [1:0] data_in1;

	// Descripción conductual de alarma, las instancias se realizan por medio de AUTOINST.
	Mux_Conductual	Mux_Intanciado_cond( /*AUTOINST*/
					    // Outputs
					    .data_out		(data_out[1:0]),
					    // Inputs
					    .clok		(clok),
					    .reset_L		(reset_L),
					    .selector		(selector),
					    .data_in0		(data_in0[1:0]),
					    .data_in1		(data_in1[1:0]));
	
	// Probador: generador de señales y monitor
	probador_Mux probador_Instanciado( /*AUTOINST*/
					  // Outputs
					  .clok			(clok),
					  .reset_L		(reset_L),
					  .selector		(selector),
					  .data_in0		(data_in0[1:0]),
					  .data_in1		(data_in1[1:0]),
					  // Inputs
					  .data_out		(data_out[1:0]));
endmodule
