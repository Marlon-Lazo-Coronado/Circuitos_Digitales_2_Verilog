module probador( // M�dulo probador: generador de se�ales y monitor de datos
	input [7:0] data_out_estr,
	input [7:0] data_out_condu,
	input valid_out_estr,
	input valid_out_cond,
	output reg [31:0] lane0,
	output reg [31:0] lane1,
    output reg valid0,
	output reg valid1,
	output reg clk,
	output reg  clk2f,
	output reg reset
	);

	reg [7:0] trans; //contador de transiciones positivas

	// Bloque de procedimiento, no sintetizable, se recorre una �nica vez
	// Generalmente, los initial s�lo se usan en los testbench o probadores
	// Se recomienda siempre sincronizar con el reloj y utilizar
	// asignaciones no bloqueantes en la generaci�n de se�ales
	initial begin
		trans <= 8'h00;
		$dumpfile("mux.vcd");	// Nombre de archivo del "dump"
		$dumpvars;			// Directiva para "dumpear" variables
		// Mensaje que se imprime en consola una vez

		// Mensaje que se imprime en consola cada vez que un elemento de la lista cambia

		lane0 = 32'h00;
		lane1 = 32'h00;
		valid0 = 1'b0;
		valid1 = 1'b0;
		reset=0;

		@(posedge clk);
		reset<=1;
		valid0 <=1;
		lane0 <= 32'hAAAAAAAA;

		@(posedge clk2f);
		valid1<=1;
        lane1 <= 32'heeeeeeee;

		@(posedge clk2f);
		lane0 <= 32'hBBBBBBBB;

		@(posedge clk2f);
		lane1 <= 32'hcccccccc;

		@(posedge clk2f);
		valid0<=0;

		@(posedge clk2f);
		valid1<=0;

		@(posedge clk2f);
		valid0<=1;
		lane0 <= 32'h01;

		@(posedge clk2f);
		valid1<=1;
		lane1<=32'hFFFFFFFF;

		@(posedge clk2f);
		valid0<=0;

		@(posedge clk2f);
		valid1<=0;


		@(posedge clk2f);
		valid0<=1;
		lane0 <= 32'hDDDDDDDD;

		@(posedge clk2f);
		valid1<=1;
		lane1<=32'hFFFFFFFF;

		@(posedge clk2f);
		valid0<=0;

		@(posedge clk2f);
		valid1<=0;

		@(posedge clk2f);
		valid0<=1;
		lane0 <= 32'h01;

		@(posedge clk2f);
		valid1<=1;
		lane1<=32'hDDDDDDDD;

		@(posedge clk);
		@(posedge clk);

		
		$finish;			// Termina de almacenar se�ales
	end
	// Reloj
	initial	clk 	<= 0;			// Valor inicial al reloj, sino siempre ser� indeterminado
	always	#100 clk 	<= ~clk;		// Hace "toggle" cada 2*10ns

	initial	clk2f 	<= 0;			// Valor inicial al reloj, sino siempre ser� indeterminado
	always	#50 clk2f 	<= ~clk2f;

endmodule
