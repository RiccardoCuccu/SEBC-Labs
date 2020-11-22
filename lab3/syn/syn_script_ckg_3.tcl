analyze -library WORK -format vhdl {/home/lp19.21/Documents/lab1/fa_syn.vhd /home/lp19.21/Documents/lab3/inccomp.vhd}
elaborate inccomp -library WORK -architecture behavioral
uniquify
compile -exact_map -gate_clock

create_clock -name clk -period 5 {ck}

report_timing > ./reports/report_timing_3_ckg_comparator.txt
report_power > ./reports/report_power_3_ckg_comparator.txt
report_power -include_input_nets > ./reports/report_power_3_ckg_comparator_input_nets.txt
report_power -net -include_input_nets > ./reports/report_power_3_ckg_comparator_input_nets_only_nets.txt

set_switching_activity -static_probability 0.5 -toggle_rate 2 -base_clock clk {ck}
set_switching_activity -static_probability 0 -base_clock clk {rst}
set_switching_activity -static_probability 0.12 -toggle_rate 0.025 -base_clock clk {INCA INCB}

report_power > ./reports/report_power_3_ckg_comparator_ckrstinc.txt
report_power -include_input_nets > ./reports/report_power_3_ckg_comparator_input_nets_ckrstinc.txt
report_power -net -include_input_nets > ./reports/report_power_3_ckg_comparator_input_nets_only_nets_ckrstinc.txt

report_cell > ./reports/report_cell_3_ckg_comparator_ckrstinc.txt

quit