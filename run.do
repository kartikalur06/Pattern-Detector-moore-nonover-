vlib work
vlog moore_nonover.v
vlog tb_moore_nonover.v
vsim tb
add wave -position insertpoint sim:/tb/dut/*
run -all
