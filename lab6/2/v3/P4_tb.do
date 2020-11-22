vcom -93 -work ./work ../vREF/src/utils/constants.vhd

vcom -93 -work ./work ./src/utils_1/andgate2.vhd
vcom -93 -work ./work ./src/utils_1/orgate2.vhd
vcom -93 -work ./work ./src/utils_1/notgate.vhd
vcom -93 -work ./work ./src/utils_1/fa.vhd
vcom -93 -work ./work ./src/utils_1/rca_gen.vhd
vcom -93 -work ./work ./src/utils_1/mux21_generic.vhd
vcom -93 -work ./work ./src/utils_1/RegisterN.vhd
vcom -93 -work ./work ./src/utils_1/comparator.vhd
vcom -93 -work ./work ./src/P4_1/g_block.vhd
vcom -93 -work ./work ./src/P4_1/pg_block.vhd
vcom -93 -work ./work ./src/P4_1/pg_network_block.vhd
vcom -93 -work ./work ./src/P4_1/pg_network.vhd
vcom -93 -work ./work ./src/P4_1/carry_select_block.vhd
vcom -93 -work ./work ./src/P4_1/carry_logic_network.vhd
vcom -93 -work ./work ./src/P4_1/carry_generator.vhd
vcom -93 -work ./work ./src/P4_1/sum_generator.vhd
vcom -93 -work ./work ./src/P4_1/p4_adder_1.vhd

#vcom -93 -work ./work ./src/utils_2/andgate2.vhd
#vcom -93 -work ./work ./src/utils_2/orgate2.vhd
#vcom -93 -work ./work ./src/utils_2/notgate.vhd
#vcom -93 -work ./work ./src/utils_2/fa.vhd
#vcom -93 -work ./work ./src/utils_2/rca_gen.vhd
#vcom -93 -work ./work ./src/utils_2/mux21_generic.vhd
#vcom -93 -work ./work ./src/utils_2/RegisterN.vhd
#vcom -93 -work ./work ./src/utils_2/comparator.vhd
#vcom -93 -work ./work ./src/P4_2/g_block.vhd
#vcom -93 -work ./work ./src/P4_2/pg_block.vhd
#vcom -93 -work ./work ./src/P4_2/pg_network_block.vhd
#vcom -93 -work ./work ./src/P4_2/pg_network.vhd
#vcom -93 -work ./work ./src/P4_2/carry_select_block.vhd
#vcom -93 -work ./work ./src/P4_2/carry_logic_network.vhd
#vcom -93 -work ./work ./src/P4_2/carry_generator.vhd
#vcom -93 -work ./work ./src/P4_2/sum_generator.vhd
#vcom -93 -work ./work ./src/P4_2/p4_adder_2.vhd

vcom -93 -work ./work ../vREF/src/utils/andgate2.vhd
vcom -93 -work ./work ../vREF/src/utils/orgate2.vhd
vcom -93 -work ./work ../vREF/src/utils/notgate.vhd
vcom -93 -work ./work ../vREF/src/utils/fa.vhd
vcom -93 -work ./work ../vREF/src/utils/rca_gen.vhd
vcom -93 -work ./work ../vREF/src/utils/mux21_generic.vhd
vcom -93 -work ./work ../vREF/src/utils/RegisterN.vhd
vcom -93 -work ./work ../vREF/src/utils/comparator.vhd
vcom -93 -work ./work ../vREF/src/P4_1/g_block.vhd
vcom -93 -work ./work ../vREF/src/P4_1/pg_block.vhd
vcom -93 -work ./work ../vREF/src/P4_1/pg_network_block.vhd
vcom -93 -work ./work ../vREF/src/P4_1/pg_network.vhd
vcom -93 -work ./work ../vREF/src/P4_1/carry_select_block.vhd
vcom -93 -work ./work ../vREF/src/P4_1/carry_logic_network.vhd
vcom -93 -work ./work ../vREF/src/P4_1/carry_generator.vhd
vcom -93 -work ./work ../vREF/src/P4_1/sum_generator.vhd
vcom -93 -work ./work ../vREF/src/p4_adder_ref.vhd

vcom -93 -work ./work ./P4_tb.vhd

vsim -t 100ps -novopt work.p4_tb

set NumericStdNoWarnings 1 
run 0 ps
set NumericStdNoWarnings 0 

add wave *
#add wave -recursive -depth 10 *

#add wave -radix binary   -color GREEN      sim:/inccomp_tb/CK_TB
#add wave -radix binary   -color GREEN      sim:/inccomp_tb/RST_TB
#add wave -radix binary   -color GREEN      sim:/inccomp_tb/INCA_TB
#add wave -radix binary   -color GREEN      sim:/inccomp_tb/INCB_TB
#add wave -radix binary   -color GREEN      sim:/inccomp_tb/EXTA_TB
#add wave -radix binary   -color GREEN      sim:/inccomp_tb/EXTB_TB
#add wave -radix decimal   -color GREEN      sim:/inccomp_tb/A_TB
#add wave -radix decimal   -color GREEN      sim:/inccomp_tb/B_TB
#
#add wave -radix decimal   -color RED        sim:/inccomp_tb/C_TB_REF
#add wave -radix decimal   -color RED        sim:/inccomp_tb/C_TB_BUG
#
#add wave -noupdate -divider -height 18 {Sum signals}
#add wave -radix decimal  /inccomp_tb/dut_ref/p4a_1/sum
#add wave -radix decimal  /inccomp_tb/dut_bug/p4a_1/sum
#add wave -radix decimal  /inccomp_tb/dut_ref/p4a_2/sum
#add wave -radix decimal  /inccomp_tb/dut_bug/p4a_2/sum

#add wave -noupdate -divider -height 18 {Internal signals P4_2}
#add wave /inccomp_tb/dut_ref/p4a_2/scarries
#add wave /inccomp_tb/dut_bug/p4a_2/scarries
#
#add wave /inccomp_tb/dut_ref/p4a_2/serror
#add wave /inccomp_tb/dut_bug/p4a_2/serror
#
#add wave /inccomp_tb/dut_ref/p4a_2/ssum
#add wave /inccomp_tb/dut_bug/p4a_2/ssum
#
#add wave -noupdate -divider -height 18 {Internal signals sum_generator}
#add wave -noupdate -format Literal /inccomp_tb/dut_ref/p4a_2/sg/n_bit
#add wave -noupdate -format Literal /inccomp_tb/dut_bug/p4a_2/sg/n_bit
#
#add wave -noupdate -format Literal /inccomp_tb/dut_ref/p4a_2/sg/carry
#add wave -noupdate -format Literal /inccomp_tb/dut_bug/p4a_2/sg/carry
#
#add wave -noupdate -format Literal /inccomp_tb/dut_ref/p4a_2/sg/a
#add wave -noupdate -format Literal /inccomp_tb/dut_bug/p4a_2/sg/a
#
#add wave -noupdate -format Literal /inccomp_tb/dut_ref/p4a_2/sg/b
#add wave -noupdate -format Literal /inccomp_tb/dut_bug/p4a_2/sg/b
#
#add wave -noupdate -format Literal /inccomp_tb/dut_ref/p4a_2/sg/c_in
#add wave -noupdate -format Literal /inccomp_tb/dut_bug/p4a_2/sg/c_in
#
#add wave -noupdate -format Literal /inccomp_tb/dut_ref/p4a_2/sg/sum
#add wave -noupdate -format Literal /inccomp_tb/dut_bug/p4a_2/sg/sum

run 100000 ns