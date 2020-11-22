vcom -reportprogress 300 -work work /home/lp19.21/Documents/lab2/dpadder.vhd
vcom -reportprogress 300 -work work /home/lp19.21/Documents/lab2/fsm-adder.vhd
vcom -reportprogress 300 -work work /home/lp19.21/Documents/lab2/top.vhd
vcom -reportprogress 300 -work work /home/lp19.21/Documents/lab2/tb_adder.vhd

vsim -t 100ps -novopt work.tbadd(test)
#add wave *
#add wave -r sim:/tbadd/top_test/*
source wave.do

power add *
run 6.5 ns
power report -file ./reports/report_power.txt

restart -f
power add /tbadd/top_test/fsm/*
run 6.5 ns
power report -file ./reports/report_power_fsm.txt

restart -f
power add /tbadd/top_test/datapath/*
run 6.5 ns
power report -file ./reports/report_power_datapath.txt

#quit