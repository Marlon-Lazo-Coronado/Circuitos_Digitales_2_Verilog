objetivo1: dependencia1 dependencia2
	gtkwave Mux.vcd
	
dependencia1:
	
	yosys -s script_4x1_4b.ys
	
	sed -i 's/Mux_Conductual_4x1_4bits/Mux_Conductual_4x1_4bits_Estruc/g' Mux_Conductual_4x1_4bits_Estruc.v
	sed -i 's/out3/out3_Estruc/g' Mux_Conductual_4x1_4bits_Estruc.v
	
	
	
	
	sed -i 's/Mux_Conductual_2x1_4bits/Mux_Conductual_2x1_4bits_Estruc/g' Mux_Conductual_4x1_4bits_Estruc.v
	sed -i 's/out2/out2_Estruc/g' Mux_Conductual_4x1_4bits_Estruc.v
	
	
	
	sed -i 's/Mux_Conductual_2x1_2bits/Mux_Conductual_2x1_2bits_Estruc/g' Mux_Conductual_4x1_4bits_Estruc.v
	sed -i 's/data_out/data_out_Estruc/g' Mux_Conductual_4x1_4bits_Estruc.v
	sed -i 's/valid_out1/valid_out1_Estruc/g' Mux_Conductual_4x1_4bits_Estruc.v
	
	yosys -s script.ys
	sed -i 's/Mux_Conductual_2x1_2bits/Mux_Conductual_2x1_2bits_Estruc/g' Mux_Conductual_2x1_2bits_Estruc.v
	sed -i 's/data_out/data_out_Estruc/g' Mux_Conductual_2x1_2bits_Estruc.v
	sed -i 's/valid_out1/valid_out1_Estruc/g' Mux_Conductual_2x1_2bits_Estruc.v
	
	yosys -s yosys_2x1_4b.ys
	sed -i 's/Mux_Conductual_2x1_4bits/Mux_Conductual_2x1_4bits_Estruc/g' Mux_Conductual_2x1_4bits_Estruc.v
	sed -i 's/out2/out2_Estruc/g' Mux_Conductual_2x1_4bits_Estruc.v
	

	
	
	
	
	emacs --batch Banco_de_Pruebas6.v -f verilog-batch-auto
dependencia2:
	iverilog -o resultado Banco_de_Pruebas6.v
	vvp resultado
	
