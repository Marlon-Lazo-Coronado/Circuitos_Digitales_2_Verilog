read_verilog muxUNS_desc_cond_synth.v
hierarchy -check -top muxUNS_desc_estr
proc;  opt; fsm; opt; memory; opt
techmap; opt
dfflibmap -liberty cmos_cells.lib
abc -liberty cmos_cells.lib
clean 
show muxUNS_desc_estr
write_verilog muxUNS_desc_estr.v