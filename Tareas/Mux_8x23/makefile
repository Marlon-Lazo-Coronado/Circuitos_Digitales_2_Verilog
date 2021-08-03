objetivo1: dependencia1 dependencia2
	gtkwave Mux.vcd
	
dependencia1:

	yosys -s script.ys
	
	sed -i 's/Demux_8x32/Demux_8x32_Estruc/g' Demux_8x32_Estruc.v
	sed -i 's/data_out_8x32/data_out_8x32_Estruc/g' Demux_8x32_Estruc.v
	sed -i 's/valid_out_8x32/valid_out_Estruc/g' Demux_8x32_Estruc.v

	emacs --batch Banco_de_Pruebas6.v -f verilog-batch-auto
	
dependencia2:
	iverilog -o resultado Banco_de_Pruebas6.v
	vvp resultado
	
