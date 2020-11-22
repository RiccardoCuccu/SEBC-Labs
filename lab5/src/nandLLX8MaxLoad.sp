* Characterizing a simple nand X8 with maximum load

* including MOS model 
.lib '$ST_HSPICE_LIB/include_CMOS013.lib' CMOS013lib

* including a small set of gates containing parasitics informations
.include '$ST_HSPICE_LIB/CMOS013.spi'
 
*****************************************************

* the nand  subcircuit is already described in the file CMOS013.spi
* included above. the name of the subcircuit is ND2LLX8
* and its template is: .subckt ND2LLX8 A B Z gnd vdd


* instance of the nand: can be the same as for mynand
* only the reference to the template name must be changed 
xnand inA8 inB8 outbis gnd_int vdd_int ND2LLX8
cload out8 0 load

vdummy_c8 outbis out8 dc 0
vdummy_gnd8 gnd_int 0 dc 0
vdummy_vdd8 vdd_int vdd dc 0

.plot i(vdummy_c8)
.plot i(vdummy_gnd8)
.plot i(vdummy_vdd8)

*****************************************************
* defining inputs
vina inA8 0 dc 1.2
vinb inB8 0 pwl 0 0 1n 0 '1n+t_tran/0.8' 1.2 2n 1.2 '2n+t_tran/0.8' 0 
v_vdd vdd 0 DC alim
.param alim=1.2

* average values for load and rise/fall times
.param t_tran=0.2608n 
.param load=0.028f


*********************************************************
* defining load variations
.data vectorload8
load
0.06f
60.0f
.enddata

**********************************************************
*    Measuring rising and rising times
.measure tran rnand TRIG v(out8) VAL='alim*0.1' RISE=1
+TARG v(out8) VAL='alim*0.9' RISE=1
.measure tran fnand TRIG v(out8) VAL='alim*0.9' FALL=1
+TARG v(out8) VAL='alim*0.1' FALL=1

*    Measuring delay
.measure tran nanddelayHL TRIG V(inB8) VAL='alim*0.5' RISE=1 
+ TARG V(out8) VAL='alim*0.5' FALL=1

* ADD THE RISE propagation time measure
.measure tran nanddelayLH TRIG V(inB8) VAL='alim*0.5' FALL=1 
+ TARG V(out8) VAL='alim*0.5' RISE=1

* Measuring peak current
.measure tran ipeakmax_c MAX I(VDUMMY_C8)
.measure tran ipeakmin_c MIN I(VDUMMY_C8)

* ADD THE CORRECT MEASURES FOR GND and VDD CURRENTS
.measure tran ipeakmax_gnd MAX I(VDUMMY_GND8)
.measure tran ipeakmin_gnd MIN I(VDUMMY_GND8)
.measure tran ipeakmax_vdd MAX I(VDUMMY_VDD8)
.measure tran ipeakmin_vdd MIN I(VDUMMY_VDD8)

**********************************************************
* defining the simulation step and duration  
.tran 1p 3n sweep data=vectorload8
.dc
.print VT(XNAND.XMN0.M1) VT(XNAND.XMN1.M1) VT(XNAND.XMN2.M1) VT(XNAND.XMN3.M1) 
.print VT(XNAND.XMN4.M1) VT(XNAND.XMN5.M1) VT(XNAND.XMN6.M1) VT(XNAND.XMN7.M1)
.print VT(XNAND.XMP6.M1) VT(XNAND.XMP6_2.M1) VT(XNAND.XMP6_3.M1) 
.print VT(XNAND.XMP7.M1) VT(XNAND.XMP7_2.M1) VT(XNAND.XMP7_3.M1)

* instruction necessary for creating output data
* to be processed by a waveform viewer 
.option post

.OPTION LIMPROBE = 200000
.OPTION EPS=1.0e-9 NOMOD NOTRC SIMUDIV=4 BE ABSTOL=1e-15

.end 
 
