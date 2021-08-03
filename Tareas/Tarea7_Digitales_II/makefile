objetivo1: dependencia1 dependencia2
	gtkwave Maquina.vcd
	
dependencia1:

	yosys -s script.ys
	
	sed -i 's/Maquina_Estado/Maquina_Estado_Estruc/g' Maquina_Estado_Estruc.v
	sed -i 's/bus_out/bus_out_Estruc/g' Maquina_Estado_Estruc.v
	sed -i 's/control/control_Estruc/g' Maquina_Estado_Estruc.v
	sed -i 's/error/error_Estruc/g' Maquina_Estado_Estruc.v
	sed -i 's/estado/estado_Estruc/g' Maquina_Estado_Estruc.v
	
	sed -i 's/controlador/controlador_Estruc/g' Maquina_Estado_Estruc.v
	sed -i 's/reverter/reverter_Estruc/g' Maquina_Estado_Estruc.v

	emacs --batch Banco_de_Pruebas.v -f verilog-batch-auto
	
dependencia2:
	iverilog -o resultado Banco_de_Pruebas.v
	vvp resultado
	
