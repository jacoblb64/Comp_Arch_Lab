onerror {quit -f}
vlib work
vlog -work work A1_Hill_Cipher.vo
vlog -work work A1_Hill_Cipher.vt
vsim -novopt -c -t 1ps -L cycloneii_ver -L altera_ver -L altera_mf_ver -L 220model_ver -L sgate work.hill_cipher_vlg_vec_tst
vcd file -direction A1_Hill_Cipher.msim.vcd
vcd add -internal hill_cipher_vlg_vec_tst/*
vcd add -internal hill_cipher_vlg_vec_tst/i1/*
add wave /*
run -all
