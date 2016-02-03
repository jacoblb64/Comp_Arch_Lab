proc AddWaves {} \
{
	;# comment
	add wave -position end sim:/alu_tb/opcode_r
	add wave -position end sim:/alu_tb/input_a

}

vlib work

;# compile
vcom ALU.vhd
;#vcom ALU_tb.vhd

;# start
vsim alu_tb

;# Add the waves
AddWaves

;# generate clock
force -deposit clock 0 0 ns, 1 0.5 ns -repeat 1 ns

;#
run 50ns