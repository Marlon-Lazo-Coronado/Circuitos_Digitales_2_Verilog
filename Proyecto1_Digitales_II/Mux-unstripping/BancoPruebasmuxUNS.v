`timescale 	1ns	/ 100ps
// escala	unidad temporal (valor de "#1") / precisi�n

// includes de archivos de verilog
// Pueden omitirse y llamarse desde el makefile
`include "muxUNS_desc_cond.v"
`include "muxUNS_desc_estr.v"
`include "probador.v"
`include "cmos_cells.v"

module BancoPruebas; // Testbench
	// Por lo general, las se�ales en el banco de pruebas son wires.
	// No almacenan un valor, son manejadas por otras instancias de m�dulos.
	wire reset,clk,clk2f, valid_in0,valid_in1,valid_out_cond,valid_out_estr;
    wire [31:0] lane0,lane1,data_out_cond, data_out_estr;

	// Descripci�n conductual de alarma
	muxUNS_desc_cond	muxUNS_cond(/*AUTOINST*/
				       // Outputs
				       .data_out	(data_out_cond[31:0]),
				       .valid_out	(valid_out_cond),
				       // Inputs
				       .clk		(clk2f),
				       .valid_in0	(valid_in0),
				       .valid_in1	(valid_in1),
				       .reset		(reset),
				       .lane_in0	(lane0[31:0]),
				       .lane_in1	(lane1[31:0]));

	muxUNS_desc_cond	muxUNS_estr(/*AUTOINST*/
				       // Outputs
				       .data_out	(data_out_estr[31:0]),
				       .valid_out	(valid_out_estr),
				       // Inputs
				       .clk		(clk2f),
				       .valid_in0	(valid_in0),
				       .valid_in1	(valid_in1),
				       .reset		(reset),
				       .lane_in0	(lane0[31:0]),
				       .lane_in1	(lane1[31:0]));


	
	// Probador: generador de se�ales y monitor
	probador 				prob(/*AUTOINST*/
						     // Outputs
						     .lane0		(lane0[31:0]),
						     .lane1		(lane1[31:0]),
						     .valid0		(valid_in0),
						     .valid1		(valid_in1),
						     .clk		(clk),
						     .clk2f		(clk2f),
						     .reset		(reset),
						     // Inputs
						     .data_out_estr	(data_out_estr[31:0]),
						     .data_out_condu	(data_out_cond[31:0]),
						     .valid_out_estr	(valid_out_estr),
						     .valid_out_cond	(valid_out_cond));

endmodule
