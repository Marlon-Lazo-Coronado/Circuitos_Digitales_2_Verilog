//*************************************************************************************
//************************Este es en banco de Pruebas de los componentes***************

`timescale 10 ns/100 ps              
`include "Componentes.v"
`include "Probador_Componentes.v"



module Banco_Prueba_Componentes; // Testbench
	wire data_out;
	wire selector;
	wire SMUX1;
	wire SNOT;
	wire SAND; 
	wire SOR; 
	wire A;
	wire B;
	wire [1:0] data_in0;
	wire [1:0] data_in1;
	wire [1:0] SMUX1_2bits;

	NOT P_NOT(/*Salidas*/ .SNOT (SNOT),/*Entradas*/ .A (A)
					    );
					    
	AND P_ANT( .SAND (SAND), .A (A), .B (B)
					    );
	
	OR P_OR( .SOR (SOR), .A (A), .B (B)
					    );
					    
	FLOP_D P_FLOP( .data_out (data_out), .A(A), .clok (clok)
					    );
					    
					    
	/*Mux_2x1 P_MUX( .SMUX1 (SMUX1), .A(data_in0), .B(data_in1), .selector(selector)
					    );	*/    
					    
	
	Mux_2x1_2bits MUX2x1( .SMUX1_2bits (SMUX1_2bits), .A(data_in0), .B(data_in1), .selector(selector)
					    );
	
	
	
	
	Probador_Componentes probador_Instanciado(/*Salidas*/  .A (A), .B (B), .clok (clok), .selector(selector), .SMUX1 (SMUX1), .data_in0(data_in0), .data_in1(data_in1), 
	
	/*Entradas*/ .SNOT (SNOT), .SAND (SAND), .SOR (SOR), .data_out (data_out), .SMUX1_2bits(SMUX1_2bits)
					  );
endmodule


















