analyze -library WORK -format vhdl {/home/lp19.21/Documents/lab1/fa_syn.vhd /home/lp19.21/Documents/lab3/saiftest/inccomp.vhd}
elaborate inccomp -library WORK -architecture behavioral
compile -exact_map

write -hierarchy -format ddc -output inccomp.ddc

ungroup -all -flatten
change_names -hierarchy -rules verilog
write_sdf ../inccomp.sdf
write -f verilog -hierarchy -output ../inccomp_netlist.v
quit