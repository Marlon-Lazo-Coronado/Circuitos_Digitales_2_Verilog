module probador6(
	output reg 		clok,
	output reg		valid1,
	output reg		valid2,
	output reg		valid3,
	output reg		valid4,
	output reg 		reset_L,	
	output reg		selector,
	output reg 		[1:0] selector_2bits,
	output reg 		[1:0] data_in0,
	output reg 		[1:0] data_in1,
	output reg 		[3:0] bus1,
	output reg 		[3:0] bus2,
	output reg 		[3:0] bus3,
	output reg 		[3:0] bus4,
	input	[3:0] out2,
	input	[3:0] out2_Estruc,
	input	valid_out2,
	input	valid_out2_Estruc,
	input	[1:0] data_out,
	input	valid_out1,
	input	[3:0] out3,
	input	[3:0] out3_Estruc,
	input	valid_out3,
	input	valid_out3_Estruc,
	input	[1:0] data_out_Estruc,
	input	valid_out1_Estruc);
	
	initial begin
		$dumpfile("Mux.vcd");
		$dumpvars;
		$display ("\t\t\tclok,\tvalid1,\tvalid2,\tvalid3,\tvalid4, \treset_L,\tselector,\tselector_2bits,\tdata_in0,\tdata_in1,\tdata_out,\tvalid_out1,\tbus1,\tbus2,\tbus3\tbus4,\tout2,\tout3,\tvalid_out2,\tout2_Estruc,\tvalid_out3,\tout3_Estruc");
		$monitor($time,"\t%b\t%b\t\t%b\t\t%b\t%b\t%b\t%b\t%b\t%b\t%b\t%b\t%b\t%b",clok,valid1,valid2,valid3,valid4,reset_L,selector,selector_2bits,data_in0,data_in1,data_out,valid_out1,bus1,bus2,bus3,bus4,out2,out2_Estruc,out3,out3_Estruc,valid_out2,valid_out3);
		
		// Valores iniciales de las señales.           
		valid1 = 'b1;            
		valid2 = 'b0;
		valid3 = 'b0;            
		valid4 = 'b0;
		selector = 'b0;
		selector_2bits = 'b0;
		reset_L = 'b0;
		data_in0 = 'b0;
		data_in1 = 'b0;
		bus1 ='b0;
		bus2 ='b0;
		bus3 ='b0;
		bus4 ='b0;
		
		#7 reset_L = 'b1 ;
		
		repeat (16) begin				
        		@(posedge clok);
        		
        		selector <= ~selector;
        		selector_2bits <= ~selector_2bits;
        			
        		data_in0 <= data_in0 +1;
        		data_in1 <= data_in1 -1;
        		
        		valid1 <= ~valid1;
        		valid2 <= ~valid2;
        		valid3 <= ~valid3;
        		valid4 <= ~valid4;
        		bus1 <= bus1 +1;
        		bus2 <= bus1 -1;
        		bus3 <= bus3 +1;
        		bus4 <= bus4 -1;
        		
    
        		
		end
		
		valid1 = 'b0;            
		valid2 = 'b0;
		valid3 = 'b0;            
		valid4 = 'b0;
		selector = 'b0;
		selector_2bits = 'b0;
		reset_L = 'b0;
		data_in0 = 'b0;
		data_in1 = 'b0;
		bus1 = 'b0;
        	bus2 = 'b0;
        	bus3 = 'b0;
        	bus4 = 'b0;
		$finish;
		
	end
	// Reloj
	initial	clok 	<= 0;			// Valor inicial al reloj, sino siempre será indeterminado
	always	#1 clok 	<= ~clok;		// Hace "toggle" cada 4 segundos
endmodule
