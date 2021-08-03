module probador_SP(
	output reg		clk_32f,
	output reg 		reset_L,	
	output reg		data_in_SP,
	output reg		data_in_SP2,
	
	output reg		clk_4f,
	output reg		clk,
	
	input			active1,
	input			active2,
	input			[31:0] data_outx,
	input			valid_outx,
	input			valid_outx_Estruc,
	input			[31:0] data_outx_Estruc,
	input			active1_Estruc,
	input			active2_Estruc);
	
	reg [7:0] prueba = 'b10111100; // BC
	reg [7:0] valor1 = 'b10101010;
	reg [7:0] valor2 = 'b10111011;
	reg [2:0] q='b111;
	reg [2:0] p='b111;
	reg x;
	reg y;
	reg z;
	
	
	initial begin
		$dumpfile("Serial_P.vcd");
		$dumpvars;
		$display ("\t\t\tclk_32f,\tdata_in_SP,\tdata_in_SP2,\treset_L,\tclk_4f,\tclk,\tactive1,\tactive2,\tdata_outx,\tvalid_outx,\tvalid_outx_Estruc,\tdata_outx_Estruc,\tactive1_Estruc,\tactive2_Estruc");	$monitor($time,"\t%b\t%b\t\t%b\t\t%b\t%b",clk_32f,data_in_SP,data_in_SP2,reset_L,clk_4f,clk,active1,active2,data_outx,valid_outx,valid_outx_Estruc,data_outx_Estruc,active1_Estruc,active2_Estruc);
		
		// Valores iniciales de las señales.           
		
		data_in_SP = 'b0;
		data_in_SP2 = 'b0;
		reset_L = 'b0;
		clk_4f = 'b0;
		clk = 'b1;
		
		#40 reset_L = 'b1 ;
		
		
		repeat (32) begin				
        		@(posedge clk_32f);         
      
        		data_in_SP <= 'b0;              //Esta!
		end
		
		repeat (32) begin				
        		@(posedge clk_32f);         
      
        		data_in_SP2 <= 'b0;              //Esta!
		end
		
		repeat (32) begin				
        		@(posedge clk_32f);
      
        		data_in_SP <= prueba[q];
       		q <= q - 1;
		end
		
		repeat (32) begin				
        		@(posedge clk_32f);
      
        		data_in_SP2 <= prueba[q];
        		q <= q - 1;
		end
		
		repeat (32) begin				
        		@(posedge clk_32f);
		data_in_SP <= 'b0;
		data_in_SP2 <= 'b0;
		end
							
		repeat (36) begin				
        		@(posedge clk_32f);         
      
        		data_in_SP <= valor1[q];
        		q <= q - 1;
        		
        		if (q == 'b011)begin
        		data_in_SP2 <= 1/*valor2[p]*/;
        		p <= p - 1;
        		end
		end
		
		
		
		repeat (32) begin				
        		@(posedge clk_32f);         
      
        		data_in_SP2 <= 0;
        		data_in_SP <= 0;
        		//q <= q - 1;
		end
		//PARA APAGAR LA SALIDA
		/*q <= 'b111;////////////////////
		repeat (8) begin				
        		@(posedge clk_32f);
      
        		data_in_SP <= prueba[q];
       		q <= q - 1;
		end
		q <= 'b111;
		repeat (8) begin				
        		@(posedge clk_32f);
      
        		data_in_SP2 <= prueba[q];
        		q <= q - 1;
		end*/
		
		
		
		repeat (128) begin				
        		@(posedge clk_32f);
		data_in_SP <= 'b1;
		data_in_SP2 <= 'b1;
		end
		
		$finish;
		
	end
	
		always @(posedge clk_32f) begin
			z <= ~z; 
		end
		
		always @(posedge z) begin
			clk_4f <= ~clk_4f; 
		end
			
		always @(posedge x) begin
			x <= ~x; end
			
		always @(posedge clk_4f) begin
			clk <= ~clk; end
			
		always @(posedge y) begin
			y <= ~y; end
	
	// Reloj
	initial	clk_32f	<= 0;		// Valor inicial al reloj, sino siempre será indeterminado
	initial	clk_4f	<= 0;
	initial	clk	<= 0;
	initial	x	<= 0;
	initial	y	<= 0;
	initial	z	<= 0;
	always  #1 clk_32f 	<= ~clk_32f;		// Hace "toggle" cada 4 segundos
	
				
	
	
	
	
	
endmodule
