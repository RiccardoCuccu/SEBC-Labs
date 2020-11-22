setsynopsys

#rm -r work
#mkdir work
vcd2saif -64 -input ../inccomp.vcd -output ../backward.saif
design_vision -f backward.do