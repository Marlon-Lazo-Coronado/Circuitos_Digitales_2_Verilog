module Mux_Conductual (
	output reg	[1:0] data_out,
	input 		clok,
	input 		reset_L,	
	input 		selector,
	input 		[1:0] data_in0,
	input 		[1:0] data_in1);
	reg	[1:0] salida1;            //Variable auxiliar, ut�l para el funcionamiento interno del m�dulo.

	always @ (*) begin
		
		if (selector == 1 )
			salida1 = data_in1;	// Asignaci�n bloqueante por ser cobinacional
      		else
			salida1 = data_in0;	
    	end


	always @ (posedge clok) begin           //<<   >>
	
		if (reset_L==1)
		
			data_out <= salida1; // Asignaci�n no bloqueante por ser secuencial.
		else
			data_out <= 'b0;
	end
endmodule
