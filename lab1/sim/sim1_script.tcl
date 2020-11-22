vcom -reportprogress 300 -work work /home/lp19.21/Documents/lab1/lfsr.vhd
vcom -reportprogress 300 -work work /home/lp19.21/Documents/lab1/tb_prob.vhd

vsim -t 100ps -novopt work.tbprob(test)


#add wave *

power add *
run 10 ns
power report -file ./reports/report_power_20.txt

restart -f
power add *
run 100 ns
power report -file ./reports/report_power_200.txt

restart -f
power add *
run 1000 ns
power report -file ./reports/report_power_2000.txt

restart -f
power add *
run 10000 ns
power report -file ./reports/report_power_20000.txt

restart -f
power add *
run 100000 ns
power report -file ./reports/report_power_200000.txt

quit