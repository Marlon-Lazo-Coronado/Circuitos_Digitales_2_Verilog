`timescale 	1s				/ 100ps
// escala	unidad temporal (valor de "#4") / precisión
// Pueden omitirse y llamarse desde el testbench



`include "Demux_8x32.v"
`include "Demux_8x32_Estruc.v"
`include "probador6.v"
`include "cmos_cells.v"



module BancoPrueba_Mux; // Testbench
	//Los buses se deben declarar en lineas aparte por ser de diferentes tamaños.
	wire		clk_4f;
	wire		[7:0] data_in_8x32;
	wire		valid_in_8x32;
	wire 		reset_L;
	//wire 		[1:0] selector_clk_4f;
	wire		[31:0] data_out_8x32;
	wire		valid_out_8x32;
	wire		[31:0] data_out_8x32_Estruc;
	wire		valid_out_Estruc;

	// Descripción conductual de alarma, las instancias se realizan por medio de AUTOINST.
	Demux_8x32 Demux_8x32_instancia( /*AUTOINST*/
					// Outputs
					.data_out_8x32	(data_out_8x32[31:0]),
					.valid_out_8x32	(valid_out_8x32),
					// Inputs
					.clk_4f		(clk_4f),
					.data_in_8x32	(data_in_8x32[7:0]),
					.valid_in_8x32	(valid_in_8x32),
					.reset_L	(reset_L));
						     
	
	Demux_8x32_Estruc Demux_8x32_Estruc_insta(/*AUTOINST*/
						  // Outputs
						  .data_out_8x32_Estruc	(data_out_8x32_Estruc[31:0]),
						  .valid_out_Estruc	(valid_out_Estruc),
						  // Inputs
						  .clk_4f		(clk_4f),
						  .data_in_8x32		(data_in_8x32[7:0]),
						  .reset_L		(reset_L),
						  .valid_in_8x32	(valid_in_8x32));
	
	
	
	
	// Probador: generador de señales y monitor
	probador6 probador_Instanciado( /*AUTOINST*/
				       // Outputs
				       .clk_4f		(clk_4f),
				       .data_in_8x32	(data_in_8x32[7:0]),
				       .valid_in_8x32	(valid_in_8x32),
				       .reset_L		(reset_L),
				       // Inputs
				       .data_out_8x32	(data_out_8x32[31:0]),
				       .valid_out_8x32	(valid_out_8x32),
				       .data_out_8x32_Estruc(data_out_8x32_Estruc[31:0]),
				       .valid_out_Estruc(valid_out_Estruc));
endmodule
