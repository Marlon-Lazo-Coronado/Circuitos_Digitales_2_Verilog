`include "controlador.v"
`include "reverter.v"

module Maquina_Estado (
    			input [Bus_Size-1:0] bus_in,
   			input wire reset,
    			input wire clk,
    			output wire [Bus_Size-1:0] bus_out,
    			output wire [Word_Num-1:0] control,
    			output reg error);
//Parametrizamos los tamaños de los cables.  			
parameter Bus_Size=16;
parameter Word_Sise=4;
parameter Word_Num=Bus_Size/Word_Sise;
			
reg [3:0] estado; 
reg [3:0] nxt_state;
reg  Prox_err;
reg [Word_Sise-1:0] Prox_Word, Word;

// Utilizamos codificacion One-Hot
parameter F_ERR='h8;
parameter SEQ_ERR='h10;
parameter RESET='h1;
parameter FIRST_PKT='h2;
parameter REG_PKT='h4;



/////////////////////////////////////////////////////////////////////////////////////////////
genvar i;
//Instanciamos 4 veces los modulos
generate

  for (i=0; i < Word_Num; i=i+1) begin  
    controlador inst1 (bus_in[Word_Sise*i +: Word_Sise],control[i]);
    reverter inst2(bus_in[Word_Sise*i +: Word_Sise],bus_out[Word_Sise*(Word_Num-1-i) +: Word_Sise]);
  end
endgenerate


////////////////////////////////////////////////////////////////////////////////////////////
always @ (posedge clk) begin

    if (reset=='b0) begin
    	estado <= RESET;
    	error <='b0;
    	Word<='b0;
    end
    else begin
    	estado <= nxt_state;
    	error<=Prox_err;
    	Word<=Prox_Word;
    end
    
end

/////////////////////////////////////////////////////////////////////////////////////////
always @ (*) begin

    //Valores por defecto
    Prox_err='b0;
    nxt_state= estado;
    Prox_Word=Word;
    
    // Evaluamos los estados
    case (estado)
    
        RESET:begin
            
            if ((bus_in[Bus_Size-1:Bus_Size-Word_Sise]==2**Word_Sise-1)  &&  (bus_in[Word_Sise-1:0]=='h0)) begin
                
                nxt_state=FIRST_PKT;
                Prox_Word='b1;
                Prox_err='b0;
            end  
        end 
        
        FIRST_PKT: begin
            if (bus_in[Bus_Size-1:Bus_Size-Word_Sise]==2**Word_Sise-1) begin
       
                if (bus_in[Word_Sise-1:0]=='b1) begin
                    nxt_state=REG_PKT;
                    Prox_Word='h2;
                    Prox_err='b0;
                end 
                else begin
                    nxt_state=SEQ_ERR;
                    Prox_err='b1;
                    Prox_Word='b0;
                end
            end 
            else begin
                nxt_state=F_ERR;
                Prox_err='b1;
                Prox_Word='b0;
            end
            
        end 
        
        REG_PKT: begin
            if (bus_in[Bus_Size-1:Bus_Size-Word_Sise]==2**Word_Sise-1) begin
                
                if (bus_in[Word_Sise-1:0]==Prox_Word) begin
                    nxt_state=REG_PKT;
                    Prox_Word=bus_in[Word_Sise-1:0]+1;
                    Prox_err='b0;
                end 
                else begin
                    nxt_state=SEQ_ERR;
                    Prox_err='b1;
                    Prox_Word='b0;
                end
            end 
            else begin
                nxt_state=F_ERR;
                Prox_err='b1;
                Prox_Word='b0;
            end  
        end 
        
        SEQ_ERR: begin
            if (bus_in[Bus_Size-1:Bus_Size-Word_Sise]==2**Word_Sise-1) begin
                
                if (bus_in[Word_Sise-1:0]=='h0) begin
                    nxt_state=FIRST_PKT;
                    Prox_err='b0;
                    Prox_Word='b0;
                end 
                else begin
                    nxt_state=SEQ_ERR;
                    Prox_err='b1;
                    Prox_Word='b0;
                end
                
            end 
            else begin
                nxt_state=F_ERR;
                Prox_err='b1;
                Prox_Word='b0;
            end
        end
        
        F_ERR: begin            
            if (bus_in[Bus_Size-1:Bus_Size-Word_Sise]==2**Word_Sise-1) begin
                
                if (bus_in[Word_Sise-1:0]=='h0) begin
                    nxt_state=FIRST_PKT;
                    Prox_err='b0;
                    Prox_Word='b0;
                end 
                else begin
                    nxt_state=SEQ_ERR;
                    Prox_err='b1;
                    Prox_Word='b0;
                end 
            end 
            else begin
                nxt_state=F_ERR;
                Prox_err='b1;
                Prox_Word='b0;
            end 
        end 
         
        //Cubrimos los posibles estados que no se puedan dar
        default: begin
        	nxt_state=RESET;
        	Prox_err='b0;
        	Prox_Word='b0;
        end
    endcase
end
endmodule
