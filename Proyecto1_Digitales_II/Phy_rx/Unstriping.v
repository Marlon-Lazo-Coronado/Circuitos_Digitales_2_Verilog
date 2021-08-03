module Unstriping(
    input clk,
    output reg [31:0] data_out,
    output reg valid_out,
    input valid_in0,
    input valid_in1,
    input reset,
    input [31:0] lane_in0,
    input [31:0] lane_in1);

	reg valid0,valid1,selector;
	reg [31:0] lane0;
	reg [31:0]lane1;

always @(*) begin

    valid0=0;
    valid1=0;
    lane0=32'h00;
    lane1=32'h00;

    if(valid_in0==1)begin
    
        if(selector==0)begin
        	lane0 = lane_in0;
        	valid0 = valid_in0;
        	
        end 
        
        else if(selector==1)begin
        	lane0=32'h00;
        	valid0=0;
        end
    end
    
    if(valid_in1==1)begin
    
        if(selector==1)begin
        	lane1 = lane_in1;
        	valid1 = valid_in1;
        end 
        
        else if(selector==0)begin
        	lane1 =32'h00;
        	valid1=0;
        end

    end

end 
/////////////////////////////////////////////////////////////
always @ (posedge clk) begin

    if(reset==0)begin // Cambio de 1 a cero
    
        selector <= 0;
        data_out<= 8'h00;
        valid_out<= 0;
    end 
    
    else begin

    if(valid_in0==1)begin
        if(selector == 0)begin
            data_out <=lane0;
            valid_out <=valid0;
            selector <= 1;
        end
        
        else if(selector==1 && valid_in1==1)begin
        
            data_out<=lane1;
            valid_out<=valid1;
            selector <=0;
        end
    end 
    
    else begin
    
        data_out<=32'h00;
        valid_out<=0;
        selector <=0;
    end 



    end
end


endmodule
