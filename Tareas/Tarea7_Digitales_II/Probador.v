module Probador(
	//Salidas
	output reg		clk,
	output reg		[15:0] bus_in,
	output reg		reset,	
	//Entradas
	input			[15:0] bus_out,
	input			[3:0] control,
	input			error);
	
	initial begin
		$dumpfile("Maquina.vcd");
		$dumpvars;
		$display ("\t\t\tclk,\tbus_in,\treset,\tbus_out,\tcontrol,\terror");
		$monitor($time,"\t%b\t%b\t\t%b\t\t%b\t%b\t%b\t%b\t%b",clk,bus_in,reset,bus_out,control,error);           
		
		bus_in = 'b0;
		reset = 'b0;
		
		#7 reset = 'b1;
		
		//repeat (4) begin				
        		@(posedge clk);
        		bus_in <= 'hFAE0;
		//end
		
		@(posedge clk);
        		bus_in <= 'hFAE1;
		
		
		@(posedge clk);
        		bus_in <= 'hF0E2;
		
		@(posedge clk);
        		bus_in <= 'hFA03;
		
		
		//Generamos error
		@(posedge clk);
        		bus_in <= 'hF004;
		
		@(posedge clk);
        		bus_in <= 'hFAE0;
		
		
		@(posedge clk);
        		bus_in <= 'hFAE1;
		
		@(posedge clk);
        		bus_in <= 'h0AE3;
		
		@(posedge clk);
        		bus_in <= 'h0000;
        	@(posedge clk);
        		bus_in <= 'h0000;
		
		$finish;
		
	end
	
	// Reloj
	initial	clk	<= 0;			// Valor inicial al reloj, sino siempre será indeterminado
	always  #1 clk 	<= ~clk;		// Hace "toggle" cada 4 segundos
	
	
	
	
	
endmodule
