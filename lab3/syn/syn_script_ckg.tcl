analyze -library WORK -format vhdl {/home/lp19.21/Documents/lab1/fa_syn.vhd /home/lp19.21/Documents/lab3/inccomp.vhd}
elaborate inccomp -library WORK -architecture behavioral
uniquify
compile -exact_map

create_clock -name clk -period 5 {ck}
report_timing > ./reports/report_timing_1_base_comparator.txt
report_power > ./reports/report_power_1_base_comparator.txt
report_power -include_input_nets > ./reports/report_power_1_base_comparator_input_nets.txt
report_power -net -include_input_nets > ./reports/report_power_1_base_comparator_input_nets_only_nets.txt

report_cell > ./reports/report_cell_1_base_comparator.txt

# -------------------------------------------------------------------------------------------

remove_design -designs

analyze -library WORK -format vhdl {/home/lp19.21/Documents/lab1/fa_syn.vhd /home/lp19.21/Documents/lab3/inccomp.vhd}
elaborate inccomp -library WORK -architecture behavioral
uniquify
compile -exact_map

create_clock -name clk -period 5 {ck}

set_switching_activity -static_probability 0.5 -toggle_rate 2 -base_clock clk {ck}
set_switching_activity -static_probability 0 -base_clock clk {rst}

report_timing > ./reports/report_timing_2_changeprobability_comparator.txt
report_power > ./reports/report_power_2_changeprobability_comparator_ckrst.txt
report_power -include_input_nets > ./reports/report_power_2_changeprobability_comparator_input_nets_ckrst.txt
report_power -net -include_input_nets > ./reports/report_power_2_changeprobability_comparator_input_nets_only_nets_ckrst.txt

set_switching_activity -static_probability 0.12 -toggle_rate 0.025 -base_clock clk {INCA INCB}

report_power > ./reports/report_power_2_changeprobability_comparator_inc.txt
report_power -include_input_nets > ./reports/report_power_2_changeprobability_comparator_input_nets_inc.txt
report_power -net -include_input_nets > ./reports/report_power_2_changeprobability_comparator_input_nets_only_nets_inc.txt

report_cell > ./reports/report_cell_2_changeprobability_comparator_inc.txt

# -------------------------------------------------------------------------------------------

remove_design -designs

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

report_power > ./reports/report_power_3_changeprobability_comparator_ckrst.txt
report_power -include_input_nets > ./reports/report_power_3_changeprobability_comparator_input_nets_ckrst.txt
report_power -net -include_input_nets > ./reports/report_power_3_changeprobability_comparator_input_nets_only_nets_ckrst.txt

set_switching_activity -static_probability 0.12 -toggle_rate 0.025 -base_clock clk {INCA INCB}

report_power > ./reports/report_power_3_changeprobability_comparator_inc.txt
report_power -include_input_nets > ./reports/report_power_3_changeprobability_comparator_input_nets_inc.txt
report_power -net -include_input_nets > ./reports/report_power_3_changeprobability_comparator_input_nets_only_nets_inc.txt

report_cell > ./reports/report_cell_3_changeprobability_comparator_inc.txt

quit