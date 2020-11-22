vcom -reportprogress 300 -work work /home/lp19.21/Documents/lab1/tb_mux21_glitch.vhd

vsim -t 100ps -novopt work.tbmux21bis(test)

add wave *

power add *
run 5 ns
power report -file ./reports/report_power_mux.txt

#quit