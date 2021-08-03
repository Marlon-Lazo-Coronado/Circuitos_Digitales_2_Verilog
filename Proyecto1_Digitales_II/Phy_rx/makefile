objetivo1: dependencia1 dependencia2
	gtkwave Serial_P.vcd
	
dependencia1:

	emacs --batch Banco_de_Pruebas_Phy_rx.v -f verilog-batch-auto
	
dependencia2:
	iverilog -o resultado Banco_de_Pruebas_Phy_rx.v
	vvp resultado
	
