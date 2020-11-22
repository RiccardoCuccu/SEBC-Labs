vcom -reportprogress 300 -work work /home/lp19.21/Documents/lab3/fd.vhd
vcom -reportprogress 300 -work work /home/lp19.21/Documents/lab3/ckgbug.vhd

vsim -t 100fs -novopt work.ckgbug(test)

add wave *

power add *
run 3.5 ns
power report -file ./reports/report_power_ckgbug.txt

#quit