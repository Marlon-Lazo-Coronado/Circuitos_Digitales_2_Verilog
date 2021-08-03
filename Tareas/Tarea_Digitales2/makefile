objetivo1: dependencia1 dependencia2
	gtkwave Mux.vcd
dependencia1:
	emacs --batch BancoPrueba_Mux.v -f verilog-batch-auto
dependencia2:
	iverilog -o resultado BancoPrueba_Mux.v
	vvp resultado
