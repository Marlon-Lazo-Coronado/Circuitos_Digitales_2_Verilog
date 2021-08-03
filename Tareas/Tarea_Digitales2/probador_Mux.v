module probador_Mux(
	output reg		clok,
	input		[1:0] data_out,
	output reg	reset_L,
	output reg	selector,
	output reg	[1:0] data_in0,
	output reg	[1:0] data_in1);
	
	initial begin
		$dumpfile("Mux.vcd");
		$dumpvars;
		$display ("\t\t\tclok,\tsMux_cond,\treset_L, \tselector,\tdata_in0,\tdata_in1");
		$monitor($time,"\t%b\t%b\t\t%b\t\t%b\t%b\t%b", clok, data_out, reset_L, selector, data_in0, data_in1);
		
		// Valores iniciales de las señales.
		reset_L = 'b0;             
		selector = 'b0;            
		data_in0[0] = 0;
		data_in0[1] = 0;
		data_in1 = 0;
		/*Se especifica linia por linia el comportamiento de la señal para imitar
		el comportamiento de las señales que aparecen en la propuesta del profesor,
		y como no se tiene mucho conocimiento de verilog, el codigo esta poco obtimizado.*/
		#10 reset_L = 1; 
		
		#4 data_in0 = ~data_in0;
		data_in1[0] = data_in1[0];
		data_in1[1] = ~data_in1[1];
		
		
		#4 selector = ~selector;
		data_in0[0] = data_in0[0];
		data_in0[1] = ~data_in0[1];
		data_in1[0] = data_in1[0];
		data_in1[1] = ~data_in1[1];
		
		#4 data_in0[0] = ~data_in0[0];
		data_in0[1] = data_in0[1];
		data_in1[0] = data_in1[0];
		data_in1[1] = ~data_in1[1];
		
		#4 selector = ~selector;
		data_in0[0] = ~data_in0[0];
		data_in0[1] = ~data_in0[1];
		data_in1[0] = ~data_in1[0];
		data_in1[1] = data_in1[1];
		
		#4 selector = ~selector;
		data_in0 = ~data_in0;
		data_in1[0] = data_in1[0];
		data_in1[1] = ~data_in1[1];
		
		#4 selector = ~selector;
		$finish;
		
	end
	// Reloj
	initial	clok 	<= 0;			// Valor inicial al reloj, sino siempre será indeterminado
	always	#2 clok 	<= ~clok;		// Hace "toggle" cada 4 segundos
endmodule
