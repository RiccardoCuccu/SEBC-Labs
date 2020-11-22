cp /home/lp19.21/Documents/setup/syn/.synopsys_dc.setup .
rm -r work

mkdir work
setsynopsys

design_vision -f syn_script_basic.tcl
#design_vision -f syn_script_faster.tcl

#dc_shell-xg-t -f syn_script.tcl
