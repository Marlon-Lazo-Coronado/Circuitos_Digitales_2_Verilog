module controlador (
    input wire [WORD_SIZE-1:0] cont_in,
    output wire cont_out
);

	parameter BUS_SIZE=16;
	parameter WORD_SIZE=5; 
	parameter WORD_NUM=BUS_SIZE/WORD_SIZE;

	assign cont_out = |cont_in[WORD_SIZE-1:0];

endmodule
