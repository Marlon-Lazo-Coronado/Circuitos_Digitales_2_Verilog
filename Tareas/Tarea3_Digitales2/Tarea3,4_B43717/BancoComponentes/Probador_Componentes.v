//**************************************************************
//***************Probador_Componentes***************************

module Probador_Componentes(
	input data_out,
	input SMUX1,
	input SNOT ,
	input SAND ,
	input SOR ,
	input [1:0] SMUX1_2bits,
	output reg [1:0] data_in0,
	output reg [1:0] data_in1,
	output reg selector,
	output reg clok,
	output reg A,
	output reg B);
	
	initial begin
		$dumpfile("Componentes.vcd");
		$dumpvars;
		$display ("\t\t\tclok,\tdata_out,\tSNOT, \tSAND,\tSOR,\tA,\tB,\tSMUX1,\tselector,\tdata_in0,\tdata_in1,\tSMUX1_2bits");
		$monitor($time,"\t%b\t%b\t\t%b\t\t%b\t%b\t%b\t%b\t%b\t%b\t%b\t%b\t%b", clok,data_out,SNOT,SAND,SOR,A,B,SMUX1,selector,data_in0, data_in1, SMUX1_2bits);
		
		// Valores iniciales de las señales.
		                
		A = 'b0;
		B = 'b0;
		selector = 'b0; 
		
		data_in0 = 'b0;
		data_in1 = 'b0;
		
		
		/* Pruebas para todos los componentes incluido el mux 2x1 de un bit.
		repeat (8) begin		
        		@(posedge clok);	
			{B,A,selector} <= {B,A,selector} + 1; // Suma 1, asignación no bloqueante 
			
		end
		
		
		repeat (4) begin		
        		@(posedge clok);	
			A <= ~A;
		end*/
		
		
		
		//Prueba mux2x1 de 2 bits
		repeat (32) begin		
        		@(posedge clok);	
			{data_in0,data_in1,selector} <= {data_in0,data_in1,selector} + 1; // Suma 1, asignación no bloqueante 
			
		end
		
		
		 /*                      
		A = 'b0;
		B = 'b0;
		selector = 'b0; */
		
		data_in0 = 'b0;
		data_in1 = 'b0;
		selector = 'b0;
		$finish;
		
	end
	// Reloj
	initial	clok 	<= 0;			// Valor inicial al reloj, sino siempre será indeterminado
	always	#2 clok 	<= ~clok;		// Hace "toggle" cada 4 segundos
endmodule










