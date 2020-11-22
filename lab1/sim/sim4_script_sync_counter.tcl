vcom -reportprogress 300 -work work /home/lp19.21/Documents/lab1/ha.vhd
vcom -reportprogress 300 -work work /home/lp19.21/Documents/lab1/fd.vhd
#vcom -reportprogress 300 -work work /home/lp19.21/Documents/lab1/counter.vhd
#vcom -reportprogress 300 -work work /home/lp19.21/Documents/lab1/counter_AND.vhd
vcom -reportprogress 300 -work work /home/lp19.21/Documents/lab1/counter_FF.vhd
#vcom -reportprogress 300 -work work /home/lp19.21/Documents/lab1/counter_pipelined.vhd
vcom -reportprogress 300 -work work /home/lp19.21/Documents/lab1/tb_counter.vhd

vsim -t 100ps -novopt work.testcount(test)

add wave *

#power add /testcount/UCOUNTER1/*
#run 520 ns
#power report -file ./reports/report_power_counter.txt

#power add /testcount/UCOUNTER1/*
#run 30 ns
#power report -file ./reports/report_power_counter_bugged.txt

#power add /testcount/UCOUNTER1/*
#run 520 ns
#power report -file ./reports/report_power_counter_AND.txt

power add /testcount/UCOUNTER1/*
run 520 ns
power report -file ./reports/report_power_counter_FF.txt

#power add /testcount/UCOUNTER1/*
#run 520 ns
#power report -file ./reports/report_power_counter_pipelined.txt

#quit