vcom -reportprogress 300 -work work /home/lp19.21/Documents/lab3/inccomp.vhd
vlog -reportprogress 300 -work work /home/lp19.21/Documents/lab3/tb_inccomp.v

vsim -t 100fs -novopt work.tbinccomp

add wave sim:/tbinccomp/DUT/*

power add *
run 100 ns
power report -file ./reports/report_power_inccomp.txt

#quit