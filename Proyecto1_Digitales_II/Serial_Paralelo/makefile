objetivo1: dependencia1 dependencia2
	gtkwave Serial_P.vcd
	
dependencia1:

	yosys -s script.ys
	
	sed -i 's/Serial_Paralelo/Serial_Paralelo_Estruc/g' Serial_Paralelo_Estruc.v
	sed -i 's/data_out_SP/data_out_SP_Estruc/g' Serial_Paralelo_Estruc.v
	sed -i 's/valid_SP/valid_SP_Estruc/g' Serial_Paralelo_Estruc.v
	sed -i 's/active/active_Estruc/g' Serial_Paralelo_Estruc.v

	emacs --batch Banco_de_Pruebas6_SP.v -f verilog-batch-auto
	
dependencia2:
	iverilog -o resultado Banco_de_Pruebas6_SP.v
	vvp resultado
	
