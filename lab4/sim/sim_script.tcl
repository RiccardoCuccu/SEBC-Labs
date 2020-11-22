# Defines DATA TYPE
do ../datatype.def

vcom -reportprogress 300 -work work ../busnormal.vhd
vcom -reportprogress 300 -work work ../businvbeh.vhd
vcom -reportprogress 300 -work work ../transbased.vhd
vcom -reportprogress 300 -work work ../grayencoder.vhd
vcom -reportprogress 300 -work work ../t0encdec.vhd
vlog -reportprogress 300 -work work ../tb_encdec_$DATATYPE.v

vsim -t 100ps -novopt work.testbench
#source wave.do
source wave_t0.do
#add wave *

power add *
run 100000 ns
#power report -file ./reports/report_power_$DATATYPE.txt

#restart -f
#power add /testbench/UBUSTZERO/*
#run 100000 ns
#power report -file ./reports/report_power_UBUSTZERO_$DATATYPE.txt

#quit