cp /home/lp19.21/Documents/setup/syn/.synopsys_dc.setup .
setsynopsys

#vcd2saif -64 -input ../sim/frommentor_ADDRESS.vcd -output ../backward_ADDRESS.saif
#vcd2saif -64 -input ../sim/frommentor_DATA.vcd -output ../backward_DATA.saif

rm -r work
mkdir work

#design_vision -f create_sdf.scr
design_vision -f backward_all.scr