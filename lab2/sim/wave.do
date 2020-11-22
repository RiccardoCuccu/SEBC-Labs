onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate -format Logic -radix decimal /tbadd/top_test/clock
add wave -noupdate -format Logic -radix decimal /tbadd/top_test/reset
add wave -noupdate -format Literal -radix decimal /tbadd/top_test/a
add wave -noupdate -format Literal -radix decimal /tbadd/top_test/b
add wave -noupdate -format Literal -radix decimal /tbadd/top_test/c
add wave -noupdate -format Literal -radix decimal /tbadd/top_test/d
add wave -noupdate -format Literal -radix decimal /tbadd/top_test/e
add wave -noupdate -format Literal -radix decimal /tbadd/top_test/f
add wave -noupdate -format Literal -radix decimal /tbadd/top_test/sum
add wave -noupdate -format Literal -radix decimal /tbadd/top_test/sum_signal
add wave -noupdate -format Literal -radix decimal /tbadd/top_test/sum0
add wave -noupdate -format Literal -radix decimal /tbadd/top_test/sum1
add wave -noupdate -format Logic -radix decimal /tbadd/top_test/sel00
add wave -noupdate -format Logic -radix decimal /tbadd/top_test/sel01
add wave -noupdate -format Logic -radix decimal /tbadd/top_test/sel10
add wave -noupdate -format Logic -radix decimal /tbadd/top_test/sel11
add wave -noupdate -format Literal -radix decimal /tbadd/top_test/datapath/mux00
add wave -noupdate -format Literal -radix decimal /tbadd/top_test/datapath/mux01
add wave -noupdate -format Literal -radix decimal /tbadd/top_test/datapath/mux02
add wave -noupdate -format Literal -radix decimal /tbadd/top_test/datapath/mux03
add wave -noupdate -format Literal -radix decimal /tbadd/top_test/datapath/mux10
add wave -noupdate -format Literal -radix decimal /tbadd/top_test/datapath/mux11
add wave -noupdate -format Literal -radix decimal /tbadd/top_test/datapath/mux12
add wave -noupdate -format Literal -radix decimal /tbadd/top_test/datapath/mux13
add wave -noupdate -format Logic -radix decimal /tbadd/top_test/datapath/clock
add wave -noupdate -format Logic -radix decimal /tbadd/top_test/datapath/reset
add wave -noupdate -format Logic -radix decimal /tbadd/top_test/datapath/sel00
add wave -noupdate -format Logic -radix decimal /tbadd/top_test/datapath/sel01
add wave -noupdate -format Logic -radix decimal /tbadd/top_test/datapath/sel10
add wave -noupdate -format Logic -radix decimal /tbadd/top_test/datapath/sel11
add wave -noupdate -format Literal -radix decimal /tbadd/top_test/datapath/sum
add wave -noupdate -format Literal -radix decimal /tbadd/top_test/datapath/operanda
add wave -noupdate -format Literal -radix decimal /tbadd/top_test/datapath/operandb
add wave -noupdate -format Literal -radix decimal /tbadd/top_test/datapath/temp_sum
add wave -noupdate -format Logic -radix decimal /tbadd/top_test/fsm/clock
add wave -noupdate -format Logic -radix decimal /tbadd/top_test/fsm/reset
add wave -noupdate -format Logic -radix decimal /tbadd/top_test/fsm/sel00
add wave -noupdate -format Logic -radix decimal /tbadd/top_test/fsm/sel01
add wave -noupdate -format Logic -radix decimal /tbadd/top_test/fsm/sel10
add wave -noupdate -format Logic -radix decimal /tbadd/top_test/fsm/sel11
add wave -noupdate -format Literal -radix decimal /tbadd/top_test/fsm/current_state
add wave -noupdate -format Literal -radix decimal /tbadd/top_test/fsm/next_state
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {0 ps} 0}
configure wave -namecolwidth 150
configure wave -valuecolwidth 100
configure wave -justifyvalue left
configure wave -signalnamewidth 0
configure wave -snapdistance 10
configure wave -datasetprefix 0
configure wave -rowmargin 4
configure wave -childrowmargin 2
configure wave -gridoffset 0
configure wave -gridperiod 25
configure wave -griddelta 40
configure wave -timeline 0
configure wave -timelineunits ps
update
WaveRestoreZoom {18200 ps} {20100 ps}
