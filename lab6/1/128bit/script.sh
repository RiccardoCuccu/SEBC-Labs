#!/bin/bash
SECONDS=0
rm -r work

setmentor
vlib work

#vsim &
#vsim -c -do sim_script.tcl
vsim -c -do rca_tb.do

time=$SECONDS
touch time128.txt
printf '%dh:%dm:%ds\n' $(($time/3600)) $(($time%3600/60)) $(($time%60)) > time128.txt