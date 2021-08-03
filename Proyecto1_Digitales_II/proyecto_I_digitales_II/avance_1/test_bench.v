//Escala de tiempo.
`timescale 1s/1s

`include "demux_32_8.v"
`include "demux_32_8_synth.v"
`include "probador.v"

`include "cmos_cells.v"

//Test-bench.
module BancoPruebas;

//Cables internos.
//Mux 32:8.
wire clk_f, clk_4f, reset_L, valid_0, valid_out;
wire[7:0] data_out;
wire[31:0] data_in;

wire valid_out_e;
wire[7:0] data_out_e;

//Mux 32:8.
//Instanciación del módulo conductual.
demux_32_8 mux_32_8_inst
(
	/*AUTOINST*/
);
 
//Instanciación del módulo estructural.
demux_32_8_synth mux_32_8_inst_synth
(
	/*AUTOINST*/
);
 
 
//Instanciación del probador.
probador probador_
(
	/*AUTOINST*/
);
endmodule
