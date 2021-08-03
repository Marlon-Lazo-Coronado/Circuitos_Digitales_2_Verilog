module probador_Mux(
	input		[1:0] data_out,
	input		[1:0] data_out_sintetizado,
	input		[1:0] data_out_Est,
	output reg	clok,
	output reg	[5:0]cheker,
	output reg	[5:0]contador,
	output reg	[5:0]contador2,
	output reg	bandera,
	output reg	bandera2,
	output reg	reset_L,
	output reg	selector,
	output reg	[1:0] data_in0,
	output reg	[1:0] data_in1);
	
	initial begin
		$dumpfile("Mux.vcd");
		$dumpvars;
		$display ("\t\t\tclok,\tsMux_cond,\treset_L, \tselector,\tdata_in0,\tdata_in1,\tdata_out_Est,\tcheker,\tcontador,\tcontador2,\tdata_out_sintetizado");
		$monitor($time,"\t%b\t%b\t\t%b\t\t%b\t%b\t%b\t%b\t%b", clok, data_out, reset_L, selector, data_in0, data_in1,data_out_Est,cheker,contador,contador2,data_out_sintetizado);
		
		// Valores iniciales de las señales.
		reset_L = 'b0;             
		selector = 'b0;            
		data_in0 = 'b0;
		data_in1 = 'b0;
		cheker = 'b0;
		contador = 'b0;
		contador2 = 'b0;
		bandera = 'b0;
		bandera2 = 'b0;
		
		#2 reset_L = 'b1 ;
		
		repeat (16) begin				
        		@(posedge clok);
        			
        		//Banderas del contador/////////////////////////////////////////////////
        		//Para bit 0 del mux
        		if (data_out[0]==1 )
				bandera <= 1 ;
			else 
				bandera <= 0;
			// para bit 1 del mux	
			if (data_out[1]==0 )
				bandera2 <= 1 ;
			else 
				bandera2 <= 0;	
        		////////////////////////////////////////////////////////////////////
        		//Tipo de señal deprueba
			{data_in0} <= {data_in0} + 1;	
			{data_in1} <= {data_in1} - 1;
			
			selector <= ~ selector;
			
			// Creacion del cheker
			if (data_out==data_out_Est)
				cheker <= cheker;
			else 
				cheker <= cheker + 1;	
			
			//Deteccion de las tranciciones de 0 a 1. ///////////////////////////
			//Para bit 0 del mux
        		if ((data_out[0]==0) && (bandera ==1))
				contador <= contador+ 1;
			else 
				contador <= contador;	
			//Para bit 1 del mux
			if ((data_out[1]==0) && (bandera2 ==1))
				contador2 <= contador2 + 1;
			else 
				contador2 <= contador2;	
			//////////////////////////////////////////////////////////////////////
			
		end
		
		selector = 'b0;
		data_in0 = 'b0;
		data_in1 = 'b0;
		reset_L = 'b0;
		cheker = 'b0;
		contador = 'b0;
		contador2 = 'b0;
		bandera = 'b0;
		bandera2 = 'b0;
		$finish;
		
	end
	// Reloj
	initial	clok 	<= 0;			// Valor inicial al reloj, sino siempre será indeterminado
	always	#1 clok 	<= ~clok;		// Hace "toggle" cada 4 segundos
endmodule
