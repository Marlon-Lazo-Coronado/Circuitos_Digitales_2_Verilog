module Serial_Paralelo (
	output reg	[7:0] data_out_SP,
	output reg	valid_SP,
	output reg	active,
	input		clk_32f,
	input		data_in_SP,
	input 		reset_L);
	
	reg	[7:0] inic;
	reg	[7:0] inic2;
	reg	[1:0] cont;
	reg	[2:0] i;
	reg	[2:0] j;
	reg	[2:0] k;
	reg	flag;
	reg	flag2;
	reg	flagx;
	reg	Aux1;
	reg	[2:0] flag3;
	
always @ (*) begin 

	
	active = 'b0; flagx = 'b0;//cont = 'b11; flag3 = 'b0; flagx = 'b0; inic2 = 'b0; inic='b0; 
	
	
	if (reset_L == 1) begin
	
		if ((flag2 == 1) | (data_in_SP == 1))
			flagx = 'b1;
			
		if ((inic2 == 'b10111100) & (j =='b111)) begin 
			if ( (cont == 'b11) & (flag3 == 'b100) & (active == 0))
			active = 'b1;
		end		
	end
end


	always @ (posedge clk_32f) begin  

	if (reset_L == 0) begin
	cont <= 'b11; flag3 <= 'b0; /*flagx <= 'b0;*/ inic2 <= 'b0; inic<='b0;
	
	i<='b111; k<='b000; j<='b111; flag2<='b0; Aux1<='b0;
	data_out_SP<='b0; valid_SP<='b0; /*active <= 'b0;*/
	end  
	
	
	if (reset_L == 1) begin
	
		/*if ((flag2 == 1) | (data_in_SP == 1))
			flagx <= 'b1;*/
	
		if ((inic2 == 'b10111100) & (j =='b000)) begin 
			cont <=cont -1;
			flag3 <= flag3 +1;
			/*if ( (cont == 'b11) & (flag3 == 'b100) & (active == 0))
			active <= 'b1;*/
		end

		
		
		if ((reset_L == 1) & (flagx == 1) & (active == 0))
			inic2[j] <= data_in_SP;	
	end
	
	
	if (data_in_SP == 'b1)
		flag2 <= 'b1;   //Boton
		
	if ((reset_L == 1) & (flagx == 1) & (active == 0))
		j <= j - 1;
	
	if ( active == 'b1) begin
		i <= i - 1;
		k <= k + 1;
		
		inic[i] <= data_in_SP;
		data_out_SP[i] <= data_in_SP;
				
		//if ((inic != 'b10111100) & (k == 'b111)) begin
		
			//data_out_SP <= data_out_SP;
			if (Aux1==0) begin       //Boton
				valid_SP <= 'b1;
				Aux1<= 'b1;
			end
		//end
		
		if ((inic == 'b10111100) & (k == 'b111)) begin
		
			data_out_SP <= 'b0;  //Quitar esta sentencia si se quiere que pase el BC
			valid_SP <= ~valid_SP;
		end
	end
end	
endmodule
