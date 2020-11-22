vcom -reportprogress 300 -work work /home/lp19.21/Documents/lab1/lfsr.vhd
vcom -reportprogress 300 -work work /home/lp19.21/Documents/lab1/fa.vhd
vcom -reportprogress 300 -work work /home/lp19.21/Documents/lab1/rca.vhd
vcom -reportprogress 300 -work work /home/lp19.21/Documents/lab1/tb_rca.vhd
#vcom -reportprogress 300 -work work /home/lp19.21/Documents/lab1/tb_rca2.vhd

vsim -t 10ps -novopt work.tbrca(test)


#add wave *

power add *
run 10 ns
power report -file ./reports/report_power_UADDER2_20.txt

restart -f
power add *
run 100 ns
power report -file ./reports/report_power_UADDER2_200.txt


restart -f
power add *
run 1000 ns
power report -file ./reports/report_power_UADDER2_2000.txt

restart -f
power add *
run 10000 ns
power report -file ./reports/report_power_UADDER2_20000.txt

restart -f
power add *
run 100000 ns
power report -file ./reports/report_power_UADDER2_200000.txt

quit