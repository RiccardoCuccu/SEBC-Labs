vcom -reportprogress 300 -work work /home/lp19.21/Documents/lab1/lfsr.vhd
vcom -reportprogress 300 -work work /home/lp19.21/Documents/lab1/fa.vhd
vcom -reportprogress 300 -work work /home/lp19.21/Documents/lab1/rca.vhd
#vcom -reportprogress 300 -work work /home/lp19.21/Documents/lab1/tb_rca.vhd
#vcom -reportprogress 300 -work work /home/lp19.21/Documents/lab1/tb_rca2.vhd
vcom -reportprogress 300 -work work /home/lp19.21/Documents/lab1/tb_rca2_new.vhd

vsim -t 10ps -novopt work.tbrca(test)

add wave *

power add *
#run 200 ns
run 2 ns
#power report -file ./reports/report_power_rca.txt
#power report -file ./reports/report_power_rca2.txt
power report -file ./reports/report_power_rca2_new.txt

#quit