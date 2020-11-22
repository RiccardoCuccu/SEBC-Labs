onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate -divider -height 20 Inputs
add wave -noupdate -format Literal /testbench/Ain
add wave -noupdate -format Logic /testbench/ck
add wave -noupdate -format Logic /testbench/rst
add wave -noupdate -divider -height 20 {Bus non-encoded}
add wave -noupdate -format Literal /testbench/ABUSNORM
add wave -noupdate -format Literal /testbench/COUNTBUSNORM
add wave -noupdate -format Literal /testbench/CBUSNORM
add wave -noupdate -divider -height 20 Bus-invert
add wave -noupdate -format Literal /testbench/ABUSINV
add wave -noupdate -format Literal /testbench/COUNTBUSINV
add wave -noupdate -format Literal /testbench/CBUSINV
add wave -noupdate -divider -height 20 {Bus transition based}
add wave -noupdate -format Literal /testbench/ABUSTRAN
add wave -noupdate -format Literal /testbench/COUNTBUSTRAN
add wave -noupdate -format Literal /testbench/CBUSTRAN
add wave -noupdate -divider -height 20 {Bus gray-encoded}
add wave -noupdate -format Literal /testbench/ABUSGRAY
add wave -noupdate -format Literal /testbench/COUNTBUSGRAY
add wave -noupdate -format Literal /testbench/CBUSGRAY
add wave -noupdate -divider -height 20 {Testbench signals}
add wave -noupdate -format Literal /testbench/A
add wave -noupdate -format Literal /testbench/infile
add wave -noupdate -format Literal /testbench/count
add wave -noupdate -format Literal /testbench/line
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {107300 ps} 0}
configure wave -namecolwidth 298
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
WaveRestoreZoom {0 ps} {209500 ps}
