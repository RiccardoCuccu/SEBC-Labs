#DATATYPE=ADDRESS
DATATYPE=DATA

## Synopsys
cd syn
setsynopsys
rm -r work
mkdir work
design_vision -f create_sdf.scr

## ModelSim
cd ../sim
rm -r work
setmentor
vlib work
vsim -do ../fill_forward.scr

## Conversion
cd ../syn
vcd2saif -64 -input ../sim/frommentor_$DATATYPE.vcd -output ../backward_$DATATYPE.saif

## Synopsys
setsynopsys
design_vision -f backward_all.scr

cd ..

#grep Totals ./syn/reports/*$DATATYPE.txt > estratto_$DATATYPE_1ns.txt