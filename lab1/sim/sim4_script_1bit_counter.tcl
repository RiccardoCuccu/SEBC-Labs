vcom -reportprogress 300 -work work /home/lp19.21/Documents/lab1/ha.vhd
vcom -reportprogress 300 -work work /home/lp19.21/Documents/lab1/fd.vhd
vcom -reportprogress 300 -work work /home/lp19.21/Documents/lab1/counter_1bit.vhd
vcom -reportprogress 300 -work work /home/lp19.21/Documents/lab1/tb_counter_1bit.vhd

vsim -t 100ps -novopt work.testcount(test)

add wave *

power add /testcount/UCOUNTER1/*
run 20 ns
power report -file ./reports/report_power_counter_1bit.txt

#quit