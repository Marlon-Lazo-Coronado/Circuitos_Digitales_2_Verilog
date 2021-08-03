module Gray_cont(
    		input clk, 
    		input reset_L,
    		input enable, 
    		output reg [4:0] gray_out);
 
 reg n0, n1, n2,n3; 
 reg [4:0] counter; 
 
always @(*) begin
    if ((enable==1) & (reset_L==1)) begin
    
        n3 = counter[4] ^ counter[3];
        n2 = counter[3] ^ counter[2];
        n1 = counter[2] ^ counter[1];
        n0 = counter[1] ^ counter[0];
        
        gray_out[0] =n0;
        gray_out[1] =n1;
        gray_out[2] =n2;
        gray_out[3] =n3;
        gray_out[4] =counter[4];
        end
end
 
 always @ (posedge clk) begin
 
    if (reset_L==0) begin
        counter <= 'b0;
        gray_out <= 'b0;
    end
    
    else 
    	if(enable==1) begin
        counter <= counter + 1;
    end
end

endmodule
