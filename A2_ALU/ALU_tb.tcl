puts {
	ECSE 487 - Assignment #2
	ALU Testbench
	Author : Jacob Barnett
	Creation Date : 02/02/2015
	Last Revision : 
}

proc AddWaves {} \
{
	# all relevant signals and appropriate radix's
	add wave -position end sim:/alu_tb/clock
	add wave -position end sim:/alu_tb/reset	
	add wave -radix signed -position end sim:/alu_tb/data0
	add wave -radix signed -position end sim:/alu_tb/data1
	add wave -radix unsigned -position end sim:/alu_tb/opcode
	add wave -radix signed -position end sim:/alu_tb/data_out
	add wave -radix unsigned -position end sim:/alu_tb/status

}

vlib work

# compile ALU and testbench
vcom -reportprogress 300 -work work ALU.vhd
vcom -reportprogress 300 -work work ALU_tb.vhd

# start simulation
vsim alu_tb

# Add the waves
AddWaves

# generate clock
# force -deposit clock 0 0 ns, 1 0.5 ns -repeat 1 ns

# run for an appropriate amount of time
run 500ns