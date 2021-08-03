module Demux_8x32 (
	output reg	[31:0] data_out_8x32,
	output reg	valid_out_8x32,
	input		clk_4f,
	input		[7:0] data_in_8x32,
	input		valid_in_8x32,
	input 		reset_L);
	
	reg 	[1:0] selector_clk_4f;
	
	
	/*always @ (*) begin
		
		valid_out_8x32 <= valid_in_8x32;
	end*/
	
	always @ (posedge clk_4f) begin           //<<   >>
	
	if (reset_L == 0) begin
	
		data_out_8x32 <= 0;
		selector_clk_4f <= 'b111; //Antes estaba en cero
		end
	else
		begin
	
		if ((valid_in_8x32==1) & (reset_L==1)) begin
		
			
			if (selector_clk_4f == 'b00) begin
			
				data_out_8x32[31:24] <= data_in_8x32;
				selector_clk_4f <= selector_clk_4f +1;
				end
				
			if (selector_clk_4f == 'b01) begin
			
				data_out_8x32[23:16] <= data_in_8x32;
				selector_clk_4f <= selector_clk_4f +1;
				end
			if (selector_clk_4f == 'b10) begin
				data_out_8x32[15:8] <= data_in_8x32;
				selector_clk_4f <= selector_clk_4f +1;
				end
				
			if (selector_clk_4f == 'b11) begin
				data_out_8x32[7:0] <= data_in_8x32;
				selector_clk_4f <= selector_clk_4f +1;
				end
			end
		//valid_out_8x32 <= valid_in_8x32;
		end
		
		valid_out_8x32 <= valid_in_8x32;
	end
		
endmodule
