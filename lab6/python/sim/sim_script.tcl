vcom -reportprogress 300 -work work ../fa.vhd
vcom -reportprogress 300 -work work ../rca.vhd
vcom -reportprogress 300 -work work ../rca_tb.vhd

vsim -t 100ps -novopt work.rca_tb(test)
add wave *

power add *
run 10000 ns
power report -file ./reports/report_power_rca.txt

#quit