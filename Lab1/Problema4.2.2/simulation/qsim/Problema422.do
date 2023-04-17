onerror {quit -f}
vlib work
vlog -work work Problema422_qsim.vo
vlog -work work Problema422.vt
vsim -novopt -c -t 1ps -L cycloneiii_ver -L altera_ver -L altera_mf_ver -L 220model_ver -L sgate work.Problema422_vlg_vec_tst
vcd file -direction Problema422.msim.vcd
vcd add -internal Problema422_vlg_vec_tst/*
vcd add -internal Problema422_vlg_vec_tst/i1/*
add wave /*
run -all
