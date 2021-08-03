objetivo1: dependencia1 dependencia2
	gtkwave Mux.vcd
	
dependencia1:
	yosys -s script.ys
	sed -i 's/Mux_Conductual/Mux_Conductual_sintetizado/g' Mux_conduc_Sintetizado.v
	sed -i 's/data_out/data_out_sintetizado/g' Mux_conduc_Sintetizado.v
	emacs --batch BancoPrueba_Mux.v -f verilog-batch-auto
dependencia2:
	iverilog -o resultado BancoPrueba_Mux.v
	vvp resultado
	
