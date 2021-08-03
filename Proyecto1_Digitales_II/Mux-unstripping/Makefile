
OUTPUT=output
CCVERILOG=iverilog
VVP=vvp
GKTW=gtkwave
SED=sed
YOSYS=yosys

GTKWAVEFILES = mux.vcd

YOSISFILESIN32_8B=muxUNS_desc_cond.v
YOSYSFILEOUT32_8B=muxUNS_desc_cond_synth.v
SCRIPTFOLDER = ./scripts/
SCRIPT32_8B = yosys_muxUNS.sh
ESTRUCTURAL32= muxUNS_desc_estr.v

BANCOFOLDER = ./bancos_prueba/
VERILOGFILES32_8B=BancoPruebasmuxUNS.v
ALL = muxUNS




all: $(ALL)

muxUNS:
	$(SED) 's/muxUNS_desc_cond/muxUNS_desc_estr/' $(YOSISFILESIN32_8B) > $(YOSYSFILEOUT32_8B)
	#se corre el script para realizar la síntesis RTLIL
	$(YOSYS) -f script $(SCRIPT32_8B)

	#se realiza la visualización de las señales
	$(CCVERILOG) -o $(OUTPUT) $(VERILOGFILES32_8B)
	$(VVP) $(OUTPUT)
	$(GKTW) $(GTKWAVEFILES)
	#se elimina los archivos temporales
	rm $(YOSYSFILEOUT32_8B)
	rm $(ESTRUCTURAL32)
	rm $(OUTPUT)
	rm $(GTKWAVEFILES)