vcom -93 -work ./work ../vREF/counter_ref.vhd
vcom -93 -work ./work ./counter.vhd
vcom -93 -work ./work ./counter_tb.vhd

vsim -t 100ps -novopt work.counter_tb

set NumericStdNoWarnings 1 
run 0 ps
set NumericStdNoWarnings 0 

#add wave -noupdate -divider -height 18 {Inputs}
add wave -radix binary   -color GREEN      sim:/counter_tb/CLK_TB
add wave -radix binary   -color GREEN      sim:/counter_tb/RST_TB
add wave -radix binary   -color GREEN      sim:/counter_tb/COUNT_TB

#add wave -noupdate -divider -height 18 {Outputs}
add wave -radix decimal  -color RED        sim:/counter_tb/DATA_OUT_TB_REF
add wave -radix decimal  -color RED        sim:/counter_tb/DATA_OUT_TB_BUG
add wave -radix binary   -color RED        sim:/counter_tb/UP_DN_TB_REF
add wave -radix binary   -color RED        sim:/counter_tb/UP_DN_TB_BUG

run 100000 ns