`timescale 	1s				/ 100ps
// escala	unidad temporal (valor de "#4") / precisión
// Pueden omitirse y llamarse desde el testbench



`include "Serial_Paralelo.v"
`include "Serial_Paralelo_Estruc.v"
`include "probador_SP.v"
`include "cmos_cells.v"



module BancoPrueba_Mux; // Testbench
	//Los buses se deben declarar en lineas aparte por ser de diferentes tamaños.
	wire	[7:0] data_out_SP;
	wire	valid_SP;
	wire	active;
	wire	clk_32f;
	wire	data_in_SP;
	wire	reset_L;
	
	
	wire	[7:0] data_out_SP_Estruc;
	wire	valid_SP_Estruc;
	wire	active_Estruc;

	
	Serial_Paralelo Serial_Paralelo_instancia( /*AUTOINST*/
						  // Outputs
						  .data_out_SP		(data_out_SP[7:0]),
						  .valid_SP		(valid_SP),
						  .active		(active),
						  // Inputs
						  .clk_32f		(clk_32f),
						  .data_in_SP		(data_in_SP),
						  .reset_L		(reset_L));
						  
	
						     
	Serial_Paralelo_Estruc Serial_Paralelo_Estruc_instancia( /*AUTOINST*/
								// Outputs
								.active_Estruc	(active_Estruc),
								.data_out_SP_Estruc(data_out_SP_Estruc[7:0]),
								.valid_SP_Estruc(valid_SP_Estruc),
								// Inputs
								.clk_32f	(clk_32f),
								.data_in_SP	(data_in_SP),
								.reset_L	(reset_L));
	
	
	// Probador: generador de señales y monitor
	probador_SP probador_Instanciado( /*AUTOINST*/
					 // Outputs
					 .clk_32f		(clk_32f),
					 .reset_L		(reset_L),
					 .data_in_SP		(data_in_SP),
					 // Inputs
					 .data_out_SP		(data_out_SP[7:0]),
					 .valid_SP		(valid_SP),
					 .active		(active),
					 .data_out_SP_Estruc	(data_out_SP_Estruc[7:0]),
					 .valid_SP_Estruc	(valid_SP_Estruc),
					 .active_Estruc		(active_Estruc));
endmodule
