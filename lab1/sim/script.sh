rm -r work

setmentor
vlib work

#vsim -c -do sim1_script.tcl
#vsim -c -do sim2_script.tcl
#vsim -do sim3_script_mux.tcl
vsim -do sim4_script_sync_counter.tcl
#vsim -do sim4_script_1bit_counter.tcl