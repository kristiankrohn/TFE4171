vcom -work work ./tb_old/hdlc_tb.vhd

echo ""
echo "Compiling hdlc_props.v"
vlog -sv hdlc_props.v

echo ""
echo "Compiling sva_wrapper.v"
vlog -sv sva_wrapper.v

echo ""
echo "Starting simulation"
vsim -c work.hdlc_tb work.sva_wrapper -do "set StdArithNoWarnings 1
set StdNumNoWarnings 1
set NumericStdNoWarnings 1
run 0 ns;
set StdArithNoWarnings 0
set StdNumNoWarnings 0
set NumericStdNoWarnings 0
run 1ms"
