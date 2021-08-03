`timescale 	1s				/ 100ps
// escala	unidad temporal (valor de "#4") / precisión
// Pueden omitirse y llamarse desde el testbench

`include "Maquina_Estado.v"
`include "Maquina_Estado_Estruc.v"
`include "Probador.v"
`include "cmos_cells.v"

module BancoPrueba_Mux;
	wire [15:0] bus_in;
    	wire reset;
    	wire clk;
    	wire [15:0] bus_out;
    	wire [3:0] control;
    	wire error;
    	
    	wire [15:0] bus_out_Estruc;
    	wire [3:0] control_Estruc;
    	wire error_Estruc;
    	
    	parameter Bus_Size=16; 
    	parameter Word_Size=4; 
    	parameter Word_Num=Bus_Size/Word_Size;

	Maquina_Estado Maquina_Estado_instancia( /*AUTOINST*/
						// Outputs
						.bus_out	(bus_out[Bus_Size-1:0]),
						.control	(control[Word_Num-1:0]),
						.error		(error),
						// Inputs
						.bus_in		(bus_in[Bus_Size-1:0]),
						.reset		(reset),
						.clk		(clk));
						     
	
	Maquina_Estado_Estruc Maquina_Estado_Estruc_ins(/*AUTOINST*/
							// Outputs
							.bus_out_Estruc	(bus_out_Estruc[15:0]),
							.control_Estruc	(control_Estruc[3:0]),
							.error_Estruc	(error_Estruc),
							// Inputs
							.bus_in		(bus_in[15:0]),
							.clk		(clk),
							.reset		(reset));
	
	
	
	
	// Probador: generador de señales y monitor
	Probador Probador_Instanciado( /*AUTOINST*/
				      // Outputs
				      .clk		(clk),
				      .bus_in		(bus_in[15:0]),
				      .reset		(reset),
				      // Inputs
				      .bus_out		(bus_out[15:0]),
				      .control		(control[3:0]),
				      .error		(error));
endmodule
