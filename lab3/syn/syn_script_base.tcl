analyze -library WORK -format vhdl {/home/lp19.21/Documents/lab1/fa_syn.vhd /home/lp19.21/Documents/lab3/inccomp.vhd}
elaborate inccomp -library WORK -architecture behavioral
uniquify
compile -exact_map

create_clock -name clk -period 5 {ck}
report_timing > ./reports/report_timing_base_comparator.txt
report_power > ./reports/report_power_base_comparator.txt
report_power -include_input_nets > ./reports/report_power_base_comparator_input_nets.txt
report_power -net -include_input_nets > ./reports/report_power_base_comparator_input_nets_only_nets.txt

quit