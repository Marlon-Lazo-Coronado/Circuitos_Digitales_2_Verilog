objetivo1: dependencia1 dependencia2 dependencia3
	sed -n 'p' alarma_desc_conductual.v > alarma_desc_conductual_synth.v
	rm alarma_desc_conductual.v
dependencia1:
	iverilog -o resultado BancoPrueba.v
	vvp resultado
dependencia2:
	gtkwave alarma.vcd
dependencia3:
	yosys -p "read_verilog alarma_desc_conductual.v" -p "opt" -p "show"
