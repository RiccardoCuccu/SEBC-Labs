cd ..
python TB_generator.py
cd sim

rm -r work

setmentor
vlib work

vsim -do sim_script.tcl