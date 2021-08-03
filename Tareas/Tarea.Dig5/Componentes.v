//*******************************************************************************************
//***************Banco de componentes para el multiplexor con memoria.***********************

module NOTm (output SNOT, input A);

	not #(0.12 , 0.08) Nombre_NOT ( SNOT,A); // 12 y 8 ns #(12 ,8 )
	
endmodule


//////////////////////////////////////////////////////

module ANDm ( output SAND, input A, input B);
	
	and #(0.12, 0.12 ) Nombre_AND (SAND,A,B) ;  //Agregar retardos  17.5 y 12    #(17.5 ns,12 ns) 
	
endmodule

//////////////////////////////////////////////////////

module ORm ( output SOR, input A, input B);
	
	or #(0.12 ,0.8 )  Nombre_OR (SOR,A,B);  //Agregar retardos  12 y 8 ns#(12 ns,8 ns)
	
endmodule

//////////////////////////////////////////////////////

module FLOP_D ( output reg [1:0]data_out_est, input [1:0]A, input clok);

	always @ (posedge clok) begin           //<<   >>
		
		data_out_est <= A;          // 14 y 20 ns. #(14 ns) 
	end
endmodule


//////////////////////////////////////////////////////////////////////////////////////////////////////

module Mux_2x1 ( output SMUX1, input A, input B, input selector);
	
	wire C1,C2,C3,C4;
	
	NOTm x( .SNOT(C1), .A(selector));
	ANDm y( .SAND(C2), .A(selector), .B(A));
	ANDm z( .SAND(C3), .A(C1), .B(B));
	ORm w( .SOR(C4), .A(C2), .B(C3));
	assign SMUX1 = C4;
	
endmodule

/////////////////////////////////////////////////////////////////////////////////////////////////////

module Mux_2x1_2bits ( output [1:0] SMUX1_2bits, input [1:0] A, input [1:0] B, input selector);
	
	wire C2,C3;

	Mux_2x1 isntancia( .SMUX1(C2), .A(A[0]), .B(B[0]), .selector(selector));
	
	Mux_2x1 isntancia2( .SMUX1(C3), .A(A[1]), .B(B[1]), .selector(selector));
	
	assign SMUX1_2bits[0] = C2;
	assign SMUX1_2bits[1] = C3;
endmodule












