module Mux_Conductual_2x1_2bits (
	output reg	[1:0] data_out,
	output reg	valid_out1,
	input 		clok,
	input		valid1,
	input		valid2,
	input 		reset_L,	
	input 		selector,
	input 		[1:0] data_in0,
	input 		[1:0] data_in1);
	
	always @ (posedge clok) begin           //<<   >>
		
		if (reset_L==0) 
			data_out <= 0;
			
			
		if (reset_L==1)
			if ((selector == 0) & (valid1==1))
				data_out <= data_in0;
			if ((selector == 1) & (valid2==1))
				data_out <= data_in1;
		
		if (selector == 0)
			valid_out1 <= valid1;
		else
			valid_out1 <= valid2;
		
	end
	
endmodule
