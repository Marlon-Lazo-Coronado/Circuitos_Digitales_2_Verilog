module probador
(
	//Multiplexor 32:8, (Conductual).
	output reg[31:0] data_in,
	output reg reset_L, clk_f, clk_4f,

	input valid_0,
	input valid_out,
	input[7:0] data_out,
	
	//Multiplexor 32:8, (Estructural).
	input valid_out_e,
	input[7:0] data_out_e	
);

initial 
begin
	$dumpfile("generator.vcd");	
	$dumpvars;	
	$display ("\t\t\tclk, \tclk_4f, \treset_L, \tvalid_0, \tdata_in, \tvalid_out, \tdata_out, \tdata_out_e, \tvalid_out_e");
	$monitor($time,"\t%b\t%b\t%b\t\t%b\t\t%b\t%b\t%b\t%b\t%b\t%b", clk_f, clk_4f, reset_L, valid_0, data_in, valid_out, data_out, valid_out_e, data_out_e);
	
	//Valores de prueba de las señales de entrada.
	#1
	data_in = 32'hAABBCCDD;
	#8
	data_in = 32'h11223344;
	#88
	data_in = 32'hFFFFFFFF;
	$finish;			
end

//Señales de control.
	
//Reloj clk_f.
initial clk_f <= 0;
initial #1 clk_f <= 1;
always	#4 clk_f <= ~clk_f;

//Reloj clk_4f.
initial clk_4f <= 0;
initial #1 clk_4f <= 1;			
always	#1 clk_4f <= ~clk_4f;
	
//Reset.
initial
begin
  #0
  reset_L = 1'b0;
  #1
  reset_L = 1'b1;
end
endmodule

