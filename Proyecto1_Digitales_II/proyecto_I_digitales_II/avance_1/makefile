all: compilar estructural

compilar:
	iverilog -o demux_32_8 demux_32_8.v
	iverilog -o probador probador.v
	iverilog -o test_bench test_bench.v
	
	vvp demux_32_8
	vvp probador
	vvp test_bench
		
	emacs --batch test_bench.v -f verilog-batch-auto
	
	gtkwave generator.vcd
	
estructural:
	yosys -p "read_verilog demux_32_8.v" -p "hierarchy -check -top demux_32_8" -p "proc; opt; fsm; opt; memory; opt" -p "techmap; opt" -p "dfflibmap -liberty cmos_cells.lib" -p "abc -liberty cmos_cells.lib" -p "clean" -p "write_verilog demux_32_8_synth.v"
	
	sed -i 's/demux_32_8/demux_32_8_synth/' demux_32_8_synth.v
	sed -i 's/data_out/data_out_e/' demux_32_8_synth.v
	sed -i 's/valid_out/valid_out_e/' demux_32_8_synth.v
