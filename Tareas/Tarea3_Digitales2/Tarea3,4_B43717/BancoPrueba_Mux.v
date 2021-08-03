`timescale 	100 ns				/ 10ps              

`include "Mux_Conductual.v"
`include "Mux_Estructural.v"
`include "probador_Mux.v"

module BancoPrueba_Mux; // Testbench
	//Los buses se deben declarar en lineas aparte por ser de diferentes tamaños.
	wire [1:0] data_out;
	wire reset_L, selector;  
	wire [1:0] data_in0; 
	wire [1:0] data_in1;
	wire [1:0] data_out_Est;
	wire [5:0]cheker;
	wire [5:0]contador;
	wire [5:0]contador2;
	wire bandera;
	wire bandera2;

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
	
	
	// Descripción conductual de alarma, las instancias se realizan por medio de AUTOINST.
	Mux_Estructural Mux_Estructural_Intancia( /*AUTOINST*/
						 // Outputs
						 .data_out_Est		(data_out_Est[1:0]),
						 // Inputs
						 .clok			(clok),
						 .reset_L		(reset_L),
						 .selector		(selector),
						 .data_in0		(data_in0[1:0]),
						 .data_in1		(data_in1[1:0]));
	
	
	
	// Probador: generador de señales y monitor
	probador_Mux probador_Instanciado( /*AUTOINST*/
					  // Outputs
					  .clok			(clok),
					  .cheker		(cheker[5:0]),
					  .contador		(contador[5:0]),
					  .contador2		(contador2[5:0]),
					  .bandera		(bandera),
					  .bandera2		(bandera2),
					  .reset_L		(reset_L),
					  .selector		(selector),
					  .data_in0		(data_in0[1:0]),
					  .data_in1		(data_in1[1:0]),
					  // Inputs
					  .data_out		(data_out[1:0]),
					  .data_out_Est		(data_out_Est[1:0]));
endmodule
