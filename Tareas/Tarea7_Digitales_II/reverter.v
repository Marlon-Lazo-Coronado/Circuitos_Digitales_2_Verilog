module reverter (
	
	input wire [WORD_SIZE-1:0] revert_in,
    	output wire [WORD_SIZE-1:0] revert_out
);

	parameter BUS_SIZE=16;
	parameter WORD_SIZE=4;
	parameter WORD_NUM=BUS_SIZE/WORD_SIZE;

	assign revert_out = revert_in;

endmodule
