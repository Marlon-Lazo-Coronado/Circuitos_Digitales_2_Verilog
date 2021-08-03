`timescale 	1s				/ 100ps
// escala	unidad temporal (valor de "#4") / precisión
// Pueden omitirse y llamarse desde el testbench


`include "Mux_Conductual_4x1_4bits.v"
`include "Mux_Conductual_4x1_4bits_Estruc.v"
//`include "Mux_Conductual_4x1_4bits_Estruc.v"

`include "probador6.v"
`include "cmos_cells.v"



module BancoPrueba_Mux; // Testbench
	//Los buses se deben declarar en lineas aparte por ser de diferentes tamaños.
	wire	[3:0] out2;
	wire	[3:0] out2_Estruc;
	wire	valid_out2;
	wire	[3:0] out3;
	wire	[3:0] out3_Estruc;
	wire	valid_out3;
	wire [1:0] data_out;
	wire valid1_out1;
	wire [1:0] data_out_Estruc;
	wire valid_out1_Estruc;
	wire valid_out2_Estruc;
	wire valid_out3_Estruc;
	wire valid1;
	wire valid2;
	wire valid3;
	wire valid4;
	wire reset_L, selector; 
	wire [1:0] selector_2bits; 
	wire [1:0] data_in0; 
	wire [1:0] data_in1;
	wire [3:0] bus1;
	wire [3:0] bus2;
	wire [3:0] bus3;
	wire [3:0] bus4;

	// Descripción conductual de alarma, las instancias se realizan por medio de AUTOINST.
	Mux_Conductual_2x1_2bits Mux_Intanciado_cond( /*AUTOINST*/
						     // Outputs
						     .data_out		(data_out[1:0]),
						     .valid_out1	(valid_out1),
						     // Inputs
						     .clok		(clok),
						     .valid1		(valid1),
						     .valid2		(valid2),
						     .reset_L		(reset_L),
						     .selector		(selector),
						     .data_in0		(data_in0[1:0]),
						     .data_in1		(data_in1[1:0]));
						     
						     
	Mux_Conductual_2x1_2bits_Estruc Mux_Conductual_2x1_2bits_Estruc_Inst( /*AUTOINST*/
									     // Outputs
									     .data_out_Estruc	(data_out_Estruc[1:0]),
									     .valid_out1_Estruc	(valid_out1_Estruc),
									     // Inputs
									     .clok		(clok),
									     .data_in0		(data_in0[1:0]),
									     .data_in1		(data_in1[1:0]),
									     .reset_L		(reset_L),
									     .selector		(selector),
									     .valid1		(valid1),
									     .valid2		(valid2));
	
	
	Mux_Conductual_2x1_4bits inst22x(/*AUTOINST*/
					 // Outputs
					 .out2			(out2[3:0]),
					 .valid_out2		(valid_out2),
					 // Inputs
					 .clok			(clok),
					 .valid1		(valid1),
					 .valid2		(valid2),
					 .reset_L		(reset_L),
					 .selector		(selector),
					 .bus1			(bus1[3:0]),
					 .bus2			(bus2[3:0]));
					 
					 
					 
	Mux_Conductual_2x1_4bits_Estruc inst_214(/*AUTOINST*/
						 // Outputs
						 .out2_Estruc		(out2_Estruc[3:0]),
						 .valid_out2_Estruc	(valid_out2_Estruc),
						 // Inputs
						 .bus1			(bus1[3:0]),
						 .bus2			(bus2[3:0]),
						 .clok			(clok),
						 .reset_L		(reset_L),
						 .selector		(selector),
						 .valid1		(valid1),
						 .valid2		(valid2));
					 
	
	
	Mux_Conductual_4x1_4bits inst44x(/*AUTOINST*/
					 // Outputs
					 .out3			(out3[3:0]),
					 .valid_out3		(valid_out3),
					 // Inputs
					 .clok			(clok),
					 .valid1		(valid1),
					 .valid2		(valid2),
					 .valid3		(valid3),
					 .valid4		(valid4),
					 .reset_L		(reset_L),
					 .selector_2bits	(selector_2bits[1:0]),
					 .bus1			(bus1[3:0]),
					 .bus2			(bus2[3:0]),
					 .bus3			(bus3[3:0]),
					 .bus4			(bus4[3:0]));
					 
					 
	Mux_Conductual_4x1_4bits_Estruc inst_414(/*AUTOINST*/
						 // Outputs
						 .out3_Estruc		(out3_Estruc[3:0]),
						 .valid_out3_Estruc	(valid_out3_Estruc),
						 // Inputs
						 .bus1			(bus1[3:0]),
						 .bus2			(bus2[3:0]),
						 .bus3			(bus3[3:0]),
						 .bus4			(bus4[3:0]),
						 .clok			(clok),
						 .reset_L		(reset_L),
						 .selector_2bits	(selector_2bits[1:0]),
						 .valid1		(valid1),
						 .valid2		(valid2),
						 .valid3		(valid3),
						 .valid4		(valid4));
	
	
	
	// Probador: generador de señales y monitor
	probador6 probador_Instanciado( /*AUTOINST*/
				       // Outputs
				       .clok		(clok),
				       .valid1		(valid1),
				       .valid2		(valid2),
				       .valid3		(valid3),
				       .valid4		(valid4),
				       .reset_L		(reset_L),
				       .selector	(selector),
				       .selector_2bits	(selector_2bits[1:0]),
				       .data_in0	(data_in0[1:0]),
				       .data_in1	(data_in1[1:0]),
				       .bus1		(bus1[3:0]),
				       .bus2		(bus2[3:0]),
				       .bus3		(bus3[3:0]),
				       .bus4		(bus4[3:0]),
				       // Inputs
				       .out2		(out2[3:0]),
				       .out2_Estruc	(out2_Estruc[3:0]),
				       .valid_out2	(valid_out2),
				       .valid_out2_Estruc(valid_out2_Estruc),
				       .data_out	(data_out[1:0]),
				       .valid_out1	(valid_out1),
				       .out3		(out3[3:0]),
				       .out3_Estruc	(out3_Estruc[3:0]),
				       .valid_out3	(valid_out3),
				       .valid_out3_Estruc(valid_out3_Estruc),
				       .data_out_Estruc	(data_out_Estruc[1:0]),
				       .valid_out1_Estruc(valid_out1_Estruc));
endmodule
