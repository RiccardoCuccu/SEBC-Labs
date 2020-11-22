analyze -library WORK -format vhdl {/home/lp19.21/Documents/lab1/fa_syn.vhd /home/lp19.21/Documents/lab1/ha_syn.vhd}
analyze -library WORK -format vhdl {/home/lp19.21/Documents/lab1/fa_syn.vhd /home/lp19.21/Documents/lab1/fd.vhd}
#analyze -library WORK -format vhdl {/home/lp19.21/Documents/lab1/fa_syn.vhd /home/lp19.21/Documents/lab1/counter_syn.vhd}
analyze -library WORK -format vhdl {/home/lp19.21/Documents/lab1/fa_syn.vhd /home/lp19.21/Documents/lab1/counter_fixovf_syn.vhd}
elaborate COUNT -library WORK
compile -exact_map

create_clock -name clk -period 2 CK
#report_timing > report_timing_counter.txt
#report_power > report_power_counter.txt
report_timing > report_timing_counter_fixovf.txt
report_power > report_power_counter_fixovf.txt
quit