onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate -format Literal /testbench/Ain
add wave -noupdate -format Logic /testbench/ck
add wave -noupdate -format Logic /testbench/rst
add wave -noupdate -format Literal /testbench/ABUSTZERO
add wave -noupdate -format Literal /testbench/CBUSTZERO
add wave -noupdate -format Literal /testbench/COUNTBUSTZERO
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {0 ps} 0}
configure wave -namecolwidth 287
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
WaveRestoreZoom {99995600 ps} {99999900 ps}
