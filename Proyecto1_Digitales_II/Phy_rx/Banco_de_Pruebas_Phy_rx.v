`timescale 	1s				/ 100ps
// escala	unidad temporal (valor de "#4") / precisión
// Pueden omitirse y llamarse desde el testbench

/*`include "Serial_Paralelo.v"
`include "Demux_8x32.v"
`include "Unstriping.v"*/
`include "probador_SP.v"
`include "Phy_rx.v"
`include "Phy_rx_Estruc.v"
`include "cmos_cells.v"



module BancoPrueba_Mux; // Testbench
	//Los buses se deben declarar en lineas aparte por ser de diferentes tamaños.
	wire	clk_32f;     //Frecuencia de 32
	wire	data_in_SP;
	wire data_in_SP2;
	wire	reset_L;
	
	wire clk_4f;      // Frecuencia de 8
    	wire clk;      // Frecuencia de 1
	
	wire valid_outx;
	wire [31:0] data_outx;
	
	wire	[31:0] data_outx_Estruc;
	wire	valid_outx_Estruc;
	wire	active1;
	wire	active2;
	wire	active1_Estruc;
	wire	active2_Estruc;
	

	
	Phy_rx Phy_rx_instan( /*AUTOINST*/
			     // Outputs
			     .valid_outx	(valid_outx),
			     .data_outx		(data_outx[31:0]),
			     .active1		(active1),
			     .active2		(active2),
			     // Inputs
			     .clk_32f		(clk_32f),
			     .clk_4f		(clk_4f),
			     .clk		(clk),
			     .data_in_SP	(data_in_SP),
			     .data_in_SP2	(data_in_SP2),
			     .reset_L		(reset_L));
						  
	
						     
	Phy_rx_Estruc Phy_rx_Estruc_instancia( /*AUTOINST*/
					      // Outputs
					      .active1_Estruc	(active1_Estruc),
					      .active2_Estruc	(active2_Estruc),
					      .data_outx_Estruc	(data_outx_Estruc[31:0]),
					      .valid_outx_Estruc(valid_outx_Estruc),
					      // Inputs
					      .clk		(clk),
					      .clk_32f		(clk_32f),
					      .clk_4f		(clk_4f),
					      .data_in_SP	(data_in_SP),
					      .data_in_SP2	(data_in_SP2),
					      .reset_L		(reset_L));
	
	
	// Probador: generador de señales y monitor
	probador_SP probador_Instanciado( /*AUTOINST*/
					 // Outputs
					 .clk_32f		(clk_32f),
					 .reset_L		(reset_L),
					 .data_in_SP		(data_in_SP),
					 .data_in_SP2		(data_in_SP2),
					 .clk_4f		(clk_4f),
					 .clk			(clk),
					 // Inputs
					 .active1		(active1),
					 .active2		(active2),
					 .data_outx		(data_outx[31:0]),
					 .valid_outx		(valid_outx),
					 .valid_outx_Estruc	(valid_outx_Estruc),
					 .data_outx_Estruc	(data_outx_Estruc[31:0]),
					 .active1_Estruc	(active1_Estruc),
					 .active2_Estruc	(active2_Estruc));
endmodule

/*

	yosys -s script.ys
	
	sed -i 's/Phy_rx/Phy_rx_Estruc/g' Phy_rx_Estruc.v
	sed -i 's/valid_outx/valid_outx_Estruc/g' Phy_rx_Estruc.v
	sed -i 's/data_outx/data_outx_Estruc/g' Phy_rx_Estruc.v
	sed -i 's/active1/active1_Estruc/g' Phy_rx_Estruc.v
	sed -i 's/active2/active2_Estruc/g' Phy_rx_Estruc.v


*/
