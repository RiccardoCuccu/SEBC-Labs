analyze -library WORK -format vhdl {/home/lp19.21/Documents/lab1/fa_syn.vhd /home/lp19.21/Documents/lab1/rca_syn.vhd}
elaborate RCA -library WORK
compile -exact_map

create_clock -name clk -period 1
report_timing > report_timing.txt
report_power > report_power.txt

report_power -hier > report_power_hier.txt
report_power -net -verbose > report_power_net.txt

current_instance /RCA/FAI_1
report_power > report_power_FAI_1.txt
report_power -cell > report_power_FAI_1_cell.txt
report_power -net -verbose > report_power_FAI_1_net.txt

#current_instance /RCA/FAI_2
#report_power > report_power_FAI_2.txt
#report_power -cell > report_power_FAI_2_cell.txt
#report_power -net -verbose > report_power_FAI_2_net.txt

#current_instance /RCA/FAI_3
#report_power > report_power_FAI_3.txt
#report_power -cell > report_power_FAI_3_cell.txt

#current_instance /RCA/FAI_4
#report_power > report_power_FAI_4.txt
#report_power -cell > report_power_FAI_4_cell.txt

#current_instance /RCA/FAI_5
#report_power > report_power_FAI_5.txt
#report_power -cell > report_power_FAI_5_cell.txt

#current_instance /RCA/FAI_6
#report_power > report_power_FAI_6.txt
#report_power -cell > report_power_FAI_6_cell.txt

#current_instance /RCA/FAI_7
#report_power > report_power_FAI_7.txt
#report_power -cell > report_power_FAI_7_cell.txt

current_instance /RCA/FAI_8
report_power > report_power_FAI_8.txt
report_power -cell > report_power_FAI_8_cell.txt
report_power -net -verbose > report_power_FAI_8_net.txt

## Back to RCA
current_instance
report_power -net -verbose > report_power_RCA_net.txt

quit