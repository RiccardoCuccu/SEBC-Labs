cp /home/lp19.21/Documents/setup/syn/.synopsys_dc.setup .
setsynopsys

rm -r work
mkdir work
#design_vision -f syn_script_ckg.tcl

#rm -r work
#mkdir work
design_vision -f syn_script_ckg_mod.tcl





#rm -r work
#mkdir work
#design_vision -f syn_script_base.tcl

#rm -r work
#mkdir work
#design_vision -f syn_script_ckg_1.tcl
#
#rm -r work
#mkdir work
#design_vision -f syn_script_ckg_2.tcl
#
#rm -r work
#mkdir work
#design_vision -f syn_script_ckg_3.tcl
#
#rm -r work
#mkdir work
#design_vision -f syn_script_ckg_mod_1.tcl
#
#rm -r work
#mkdir work
#design_vision -f syn_script_ckg_mod_2.tcl
#
#rm -r work
#mkdir work
#design_vision -f syn_script_ckg_mod_3.tcl

#dc_shell-xg-t -f syn_script.tcl