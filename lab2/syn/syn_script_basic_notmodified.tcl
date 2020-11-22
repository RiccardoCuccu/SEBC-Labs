analyze -library WORK -format vhdl {/home/lp19.21/Documents/lab2/fsm-adder.vhd /home/lp19.21/Documents/lab2/dpadder.vhd /home/lp19.21/Documents/lab2/top.vhd}
elaborate TOP -architecture STRUCTURAL -library WORK
compile -exact_map

# create_clock -name "CLK" -period 10 {clock}
# report_clock > ./reports/basic/report_clock.txt

# #write -hierarchy -format ddc -output /home/lp19.21/Documents/lab2/syn/top_simple.ddc
# #write -hierarchy -format vhdl -output /home/lp19.21/Documents/lab2/syn/top_simple.vhdl
# #read_file -format ddc {/home/lp19.21/Documents/lab2/syn/top_simple.ddc}

# current_design fsm_adder
# report_fsm > ./reports/basic/report_fsm.txt
# report_timing > ./reports/basic/report_timing_fsm.txt

# current_design top
# report_area > ./reports/basic/report_area.txt
# report_timing -nworst 10 > ./reports/basic/report_timing_nworst.txt

# report_power > ./reports/basic/report_power_summary.txt
# report_power -hier > ./reports/basic/report_power_cells.txt
# report_power -net > ./reports/basic/report_power_net.txt

# #list_design > list_design.txt

# current_instance FSM
# report_power -cell > ./reports/basic/report_power_fsm_cells.txt
# report_power -net > ./reports/basic/report_power_fsm_net.txt

# current_instance
create_clock -name "CLK" -period 2 {clock}
report_power > ./reports/basic/report_power_summary.txt

set_max_dynamic_power 238
compile -exact_map
report_power > ./reports/basic/report_power_summary_constrained_238.txt
report_constraints > ./reports/basic/report_constraints_238.txt

#quit
