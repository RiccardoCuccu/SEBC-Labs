cp /home/lp19.21/Documents/setup/syn/.synopsys_dc.setup .
setsynopsys

rm -r work
mkdir work
design_vision -f syn_script.tcl