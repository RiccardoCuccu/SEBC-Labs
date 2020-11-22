#vcom -reportprogress 300 -work work /home/lp19.21/Documents/lab6/1/fa.vhd
#vcom -reportprogress 300 -work work /home/lp19.21/Documents/lab6/1/rca.vhd
#vcom -reportprogress 300 -work work /home/lp19.21/Documents/lab6/1/rca_tb.vhd

#vsim -t 100ps -novopt work.testbench
source rca_tb.do
#add wave *

#power add *
#run 100000 ns
#power report -file ./reports/report_power_address.txt
#power report -file ./reports/report_power_data.txt

#quit