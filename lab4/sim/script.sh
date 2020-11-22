rm -r work

setmentor
vlib work

vsim -do sim_script.tcl
#vsim -do ../fill_forward.scr