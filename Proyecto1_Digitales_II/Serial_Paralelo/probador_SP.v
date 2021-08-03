module probador_SP(
	output reg		clk_32f,
	output reg 		reset_L,	
	output reg		data_in_SP,
	input			[7:0] data_out_SP,
	input			valid_SP,
	input			active,
	input			[7:0] data_out_SP_Estruc,
	input			valid_SP_Estruc,
	input			active_Estruc);
	
	reg [7:0] prueba = 'b10111100;
	reg [2:0] q='b111;
	
	
	initial begin
		$dumpfile("Serial_P.vcd");
		$dumpvars;
		$display ("\t\t\tclk_32f,\tdata_in_SP,\treset_L,\tdata_out_SP,\tvalid_SP,\tdata_out_SP_Estruc,\tvalid_SP_Estruc,\tactive_Estruc");
		$monitor($time,"\t%b\t%b\t\t%b\t\t%b\t%b",clk_32f,data_in_SP,reset_L,data_out_SP,valid_SP,data_out_SP_Estruc,valid_SP_Estruc,active_Estruc);
		
		// Valores iniciales de las señales.           
		
		data_in_SP = 'b0;
		reset_L = 'b0;
		
		
		#10 reset_L = 'b1 ;
		
		
		#10 repeat (16) begin				
        		@(posedge clk_32f);
      
        		data_in_SP <= prueba[q];
       		q <= q - 1;
       		
       		
		end
		
		
		repeat (16) begin				
        		@(posedge clk_32f);         // Para comprobar que se leen bien los bits, quitar esta parte y poner
      
        		data_in_SP <= 0;              //Esta!
			
       		
		end
		
		repeat (16) begin				
        		@(posedge clk_32f);
      
        		data_in_SP <= prueba[q];
       		q <= q - 1;
       		
       		
		end
		
		/*#4 data_in_SP = 'b1;              //Esta!
		#4 data_in_SP = 'b0;
		#4 data_in_SP = 'b1;
		#4 data_in_SP = 'b0;
		#4 data_in_SP = 'b1;
		#4 data_in_SP = 'b0;*/
		
		#18 repeat (8) begin				
        		@(posedge clk_32f);
      
        		data_in_SP <= prueba[q];
       		q <= q - 1;
       		
		end
		
		#17 data_in_SP = 'b1;
		//#16 data_in_SP = 'b0;
		
		repeat (8) begin				
        		@(posedge clk_32f);
      
        		data_in_SP <= prueba[q];
       		q <= q - 1;
		end
		
		#10 data_in_SP = 'b1;
		#16 data_in_SP = 'b0;
		$finish;
		
	end
	
	// Reloj
	initial	clk_32f	<= 0;			// Valor inicial al reloj, sino siempre será indeterminado
	always  #1 clk_32f 	<= ~clk_32f;		// Hace "toggle" cada 4 segundos
	
	
	
	
	
endmodule
