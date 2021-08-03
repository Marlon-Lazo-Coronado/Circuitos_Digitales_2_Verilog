module Probador(
	//Salidas
	output reg		clk,
	output reg		reset_L,
	output reg		enable,	
	//Entradas
	input			[4:0] gray_out,
	input			[4:0] salida_gray);
	
	reg [4:0] comparador,temp1,temp2;
	
	initial begin
		$dumpfile("Gray.vcd");
		$dumpvars;
		$display ("\t\t\tclk,\treset_L,\tenable,\tgray_out,\tsalida_gray,\tcomparador");
		$monitor($time,"\t%b\t%b\t\t%b\t\t%b\t%b",clk,reset_L,enable,gray_out,salida_gray,comparador);           
		
		reset_L = 'b0;
		enable = 'b0;
		comparador = 'b0;
		
		#3 reset_L = 'b1;
		#2 enable = 'b1;
		#154 enable = 'b0;
		$finish;
	end
	
	always @ ( * ) begin
		if ( temp1 != temp2 )
			comparador +=1;
	end
	
	always @ ( posedge clk ) begin
		temp1 <= gray_out;
		temp2 <= salida_gray;
	end
	
	
	
	// Reloj
	initial	clk	<= 0;			// Valor inicial al reloj, sino siempre será indeterminado
	always  #1 clk 	<= ~clk;		// Hace "toggle" cada 4 segundos
	
	
	
	
	
endmodule
