v {xschem version=3.4.5 file_version=1.2
}
G {}
K {}
V {}
S {}
E {}
B 2 -290 380 510 780 {flags=graph
y1=0
y2=1.8
ypos1=0
ypos2=2
divy=5
subdivy=1
unity=1
x1=0
x2=1e-06
divx=5
subdivx=1
xlabmag=1.0
ylabmag=1.0
node=test_signal
color=6

unitx=1
logx=0
logy=0

rainbow=1
dataset=-1}
B 2 -290 -50 510 350 {flags=graph
y1=0.59
y2=1.8
ypos1=0
ypos2=2
divy=5
subdivy=1
unity=1
x1=0
x2=1e-06
divx=5
subdivx=1
xlabmag=1.0
ylabmag=1.0
node="vdd
v_adj"
color="6 7"

unitx=1
logx=0
logy=0
rainbow=0
dataset=-1}
B 2 -290 850 510 1250 {flags=graph
y1=-0.17
y2=2
ypos1=0
ypos2=2
divy=5
subdivy=1
unity=1
x1=0
x2=1e-06
divx=5
subdivx=1
xlabmag=1.0
ylabmag=1.0
node="test_out
test_signal"
color="6 7"

unitx=1
logx=0
logy=0

rainbow=0
dataset=-1}
N -610 90 -610 110 {
lab=GND}
N -640 10 -610 10 {
lab=test_signal}
N -610 10 -610 30 {
lab=test_signal}
N -1090 10 -1090 20 {
lab=v_adj}
N -1090 80 -1090 90 {
lab=GND}
N -1180 10 -1180 20 {
lab=vdd}
N -1180 80 -1180 90 {
lab=GND}
N -730 310 -680 310 {
lab=vdd}
N -730 270 -640 270 {
lab=test_out}
N -730 290 -640 290 {
lab=v_adj}
C {devices/code.sym} -1050 600 0 0 {name=TT_MODELS
only_toplevel=true
format="tcleval( @value )"
value="
** opencircuitdesign pdks install
.lib $::SKYWATER_MODELS/sky130.lib.spice tt

"
spice_ignore=false}
C {devices/vsource.sym} -610 60 0 0 {name=V4 value="pulse(0 1.8 0 10n 10n 250n 500n)" savecurrent=false}
C {devices/gnd.sym} -610 110 0 0 {name=l4 lab=GND}
C {devices/lab_pin.sym} -640 10 0 0 {name=p9 sig_type=std_logic lab=test_signal
}
C {devices/launcher.sym} -570 700 0 0 {name=h5
descr="load waves" 
tclcommand="xschem raw_read $netlist_dir/tb_level.raw tran"
}
C {devices/code.sym} -890 600 0 0 {name=SIMULATION
only_toplevel=false 
value="
* .options filetype=ascii
.control
  let vstart = 1.8
  let vstop = 0.5
  let vstep = -0.1
  let vcurrent = vstart
  while vcurrent >= vstop
    alter V9 vcurrent
    alter @V4[PULSE] [ 0 \{vcurrent\} 0 10n 10n 200n 500n ]
    tran 0.1n 1u
    write tb_level.raw
    set appendwrite

    let vcurrent = vcurrent + vstep
  end
.endc

.end
"}
C {devices/vsource.sym} -1090 50 0 0 {name=V9 value=1.8 savecurrent=false}
C {devices/gnd.sym} -1090 90 0 0 {name=l12 lab=GND}
C {devices/lab_pin.sym} -1090 10 2 1 {name=p18 sig_type=std_logic lab=v_adj
}
C {devices/vsource.sym} -1180 50 0 0 {name=V10 value=1.8 savecurrent=false}
C {devices/gnd.sym} -1180 90 0 0 {name=l13 lab=GND}
C {devices/lab_pin.sym} -1180 10 2 1 {name=p19 sig_type=std_logic lab=vdd
}
C {level_shifter.sym} -880 300 0 0 {name=x1}
C {devices/gnd.sym} -730 330 0 0 {name=l1 lab=GND}
C {devices/lab_pin.sym} -680 310 0 1 {name=p1 sig_type=std_logic lab=vdd
}
C {devices/lab_pin.sym} -1030 270 0 0 {name=p2 sig_type=std_logic lab=test_signal
}
C {devices/lab_pin.sym} -640 270 0 1 {name=p3 sig_type=std_logic lab=test_out
}
C {devices/lab_pin.sym} -640 290 0 1 {name=p4 sig_type=std_logic lab=v_adj
}
