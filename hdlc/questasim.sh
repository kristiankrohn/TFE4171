rm -rf work
vlib work
rm -rf utility
vlib utility
rm -rf hdlc
vlib hdlc
rm -rf memlib
vlib memlib

vmap work
vmap utility
vmap hdlc
vmap memlib


# Utility files
vcom -work utility  ./lib/tools_pkg.vhd


#memLib
vcom -work memlib ./lib/spmem.vhd 

vcom -work memlib  ./lib/mem_pkg.vhd 


#HDLC files
vcom -work hdlc  ./lib/PCK_CRC16_D8.vhd

vcom -work hdlc  ./lib/hdlc_components_pkg.vhd

#Work files
#Rx
vcom -work work  ./lib/RxFCS.vhd

vcom -work work  ./lib/RxBuff.vhd -explicit

vcom -work work  ./lib/Zero_detect.vhd

vcom -work work  ./lib/flag_detect.vhd

vcom -work work  ./lib/Rxcont.vhd


vcom -work work  ./lib/RxChannel.vhd

vcom -work work  ./lib/RxSync.vhd


#Tx
vcom -work work  ./lib/TxFCS.vhd

vcom -work work  ./lib/TxBuff.vhd -explicit

vcom -work work  ./lib/flag_ins.vhd

vcom -work work  ./lib/zero_ins.vhd

vcom -work work  ./lib/TXcont.vhd


vcom -work work  ./lib/TxChannel.vhd

vcom -work work  ./lib/TxSync.vhd


#WB and host
vcom -work work  ./lib/WB_IF.vhd

vcom -work work  ./hdlc.vhd


# Test bench
vcom -work work  ./tb_old/hdlc_tb.vhd

#Simulation
vsim -c work.hdlc_tb -do "set StdArithNoWarnings 1
set StdNumNoWarnings 1
set NumericStdNoWarnings 1
run 0 ns;
set StdArithNoWarnings 0
set StdNumNoWarnings 0
set NumericStdNoWarnings 0 
run 1ms"  
