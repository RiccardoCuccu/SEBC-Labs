cp /home/lp19.21/Documents/setup/syn/.synopsys_dc.setup .
rm -r work

mkdir work
setsynopsys
#design_vision -f syn_script.tcl
dc_shell-xg-t -f syn_script_counter.tcl