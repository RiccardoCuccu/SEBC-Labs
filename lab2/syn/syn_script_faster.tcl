analyze -library WORK -format vhdl {/home/lp19.21/Documents/lab2/fsm-adder.vhd /home/lp19.21/Documents/lab2/dpadder.vhd /home/lp19.21/Documents/lab2/top.vhd}
elaborate TOP -architecture STRUCTURAL -library WORK
compile -exact_map

create_clock -name "CLK" -period 2 {clock}


current_design fsm_adder
report_fsm > ./reports/faster/report_power_fsm_adder.txt
report_timing > ./reports/faster/report_timing_fsm_adder.txt

current_design top
report_area > ./reports/faster/report_area_top.txt
report_timing -nworst 10 > ./reports/faster/report_timing_nworst_top.txt

report_power > ./reports/faster/report_power_summary.txt
report_power -hier > ./reports/faster/report_power_cells.txt
report_power -net > ./reports/faster/report_power_net.txt

#list_design > list_design.txt

current_instance FSM
report_power -cell > ./reports/faster/report_power_fsm_cells.txt
report_power -net > ./reports/faster/report_power_fsm_net.txt

#quit
