vlog -work work H:/workspace/Comp_Arch_Lab/A1_Hill_Cipher/simulation/modelsim/hill_cipher.vwf.vt
vsim -novopt -c -t 1ps -L cycloneii_ver -L altera_ver -L altera_mf_ver -L 220model_ver -L sgate work.hill_cipher_vlg_vec_tst
onerror {resume}
add wave {hill_cipher_vlg_vec_tst/i1/clk}
add wave {hill_cipher_vlg_vec_tst/i1/encrypt}
add wave {hill_cipher_vlg_vec_tst/i1/load_key}
add wave {hill_cipher_vlg_vec_tst/i1/p1}
add wave {hill_cipher_vlg_vec_tst/i1/p1[3]}
add wave {hill_cipher_vlg_vec_tst/i1/p1[2]}
add wave {hill_cipher_vlg_vec_tst/i1/p1[1]}
add wave {hill_cipher_vlg_vec_tst/i1/p1[0]}
add wave {hill_cipher_vlg_vec_tst/i1/p2}
add wave {hill_cipher_vlg_vec_tst/i1/p2[3]}
add wave {hill_cipher_vlg_vec_tst/i1/p2[2]}
add wave {hill_cipher_vlg_vec_tst/i1/p2[1]}
add wave {hill_cipher_vlg_vec_tst/i1/p2[0]}
add wave {hill_cipher_vlg_vec_tst/i1/p3}
add wave {hill_cipher_vlg_vec_tst/i1/p3[3]}
add wave {hill_cipher_vlg_vec_tst/i1/p3[2]}
add wave {hill_cipher_vlg_vec_tst/i1/p3[1]}
add wave {hill_cipher_vlg_vec_tst/i1/p3[0]}
add wave {hill_cipher_vlg_vec_tst/i1/c1}
add wave {hill_cipher_vlg_vec_tst/i1/c1[3]}
add wave {hill_cipher_vlg_vec_tst/i1/c1[2]}
add wave {hill_cipher_vlg_vec_tst/i1/c1[1]}
add wave {hill_cipher_vlg_vec_tst/i1/c1[0]}
add wave {hill_cipher_vlg_vec_tst/i1/c2}
add wave {hill_cipher_vlg_vec_tst/i1/c2[3]}
add wave {hill_cipher_vlg_vec_tst/i1/c2[2]}
add wave {hill_cipher_vlg_vec_tst/i1/c2[1]}
add wave {hill_cipher_vlg_vec_tst/i1/c2[0]}
add wave {hill_cipher_vlg_vec_tst/i1/c3}
add wave {hill_cipher_vlg_vec_tst/i1/c3[3]}
add wave {hill_cipher_vlg_vec_tst/i1/c3[2]}
add wave {hill_cipher_vlg_vec_tst/i1/c3[1]}
add wave {hill_cipher_vlg_vec_tst/i1/c3[0]}
run -all
