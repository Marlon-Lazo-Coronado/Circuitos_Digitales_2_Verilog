//Demultiplexor 32:8.
module demux_32_8(
  input clk_f,
  input clk_4f,
  input reset_L,
  
  input[31:0] data_in,
  
  output reg valid_0,
  output reg valid_out,
  output reg[7:0] data_out
);

reg[3:0] selector;

always@(posedge clk_f)
begin
	//Generación de la señal valid.
	if(data_in!=0)
		valid_0=1;

	//Generación de la señal del selector.
	if(valid_0==1)
		selector = 2'b00;
		#2
		selector = 2'b01;
		#2
		selector = 2'b10;
		#2
		selector = 2'b11;
end

always @(posedge clk_4f)
begin	
	//Escogencia de la salida.
	if(reset_L == 1) 
	begin
		if(selector==0)
		begin
			valid_out = 1'b1;
			#2
			data_out <= data_in[31:24];
		end
		else if(selector==1)
		begin
			valid_out = 1'b1;
			#2
			data_out <= data_in[23:16];
		end
		else if(selector==2)
		begin
			valid_out = 1'b1;
			#2
			data_out <= data_in[15:8];	
		end
		else if(selector==3)
		begin
			valid_out = 1'b1;	
			#2
			data_out <= data_in[7:0];
		end
	end	
	else
	begin
		data_out = 32'h00000000;
	end
end
endmodule
