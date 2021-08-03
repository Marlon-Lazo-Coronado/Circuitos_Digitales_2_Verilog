module probador6(
	output reg		clk_4f,
	output reg		[7:0] data_in_8x32,
	output reg		valid_in_8x32,
	output reg 		reset_L,	
	//output reg 		[1:0] selector_clk_4f,
	input			[31:0] data_out_8x32,
	input			valid_out_8x32,
	input			[31:0] data_out_8x32_Estruc,
	input			valid_out_Estruc);
	
	initial begin
		$dumpfile("Mux.vcd");
		$dumpvars;
		$display ("\t\t\tclk_4f,\tdata_in_8x32,\tvalid_in_8x32,\treset_L,\tdata_out_8x32,\tvalid_out_8x32,\tdata_out_8x32_Estruc,\tvalid_out_Estruc");
		$monitor($time,"\t%b\t%b\t\t%b\t\t%b\t%b\t%b\t%b\t%b",clk_4f,data_in_8x32,valid_in_8x32,reset_L,data_out_8x32,valid_out_8x32,data_out_8x32_Estruc,valid_out_Estruc);
		
		// Valores iniciales de las señales.           
		
		data_in_8x32 = 'b0;
		valid_in_8x32 = 'b0;
		reset_L = 'b0;
		//selector_clk_4f = 'b0;
		
		
		
		
		#3 reset_L = 'b1 ;
		#2 valid_in_8x32 = 'b1;
		
		
		
		#2 repeat (8) begin				
        		@(posedge clk_4f);
        		data_in_8x32 <= data_in_8x32 + 1;
        		valid_in_8x32	<= 1;
        		//selector_clk_4f <= selector_clk_4f + 1;
        		
       	
		end
		
		#8 valid_in_8x32 = 'b0;
		
		
		#8 data_in_8x32 = 'b0;
		valid_in_8x32 = 'b1;
		reset_L = 'b1;
		
		#2 repeat (8) begin				
        		@(posedge clk_4f);
        		data_in_8x32 <= data_in_8x32 + 1;
        		valid_in_8x32	<= 1;
        		//selector_clk_4f <= selector_clk_4f + 1;
        		
       	
		end
		
		//selector_clk_4f = 'b0;
		$finish;
		
	end
	
	// Reloj
	initial	clk_4f	<= 0;			// Valor inicial al reloj, sino siempre será indeterminado
	always  #1 clk_4f 	<= ~clk_4f;		// Hace "toggle" cada 4 segundos
	
	
	
	
	
endmodule
