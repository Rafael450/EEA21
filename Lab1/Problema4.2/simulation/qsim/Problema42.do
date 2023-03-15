onerror {quit -f}
vlib work
vlog -work work Problema42.vo
vlog -work work Problema42.vt
vsim -novopt -c -t 1ps -L cycloneive_ver -L altera_ver -L altera_mf_ver -L 220model_ver -L sgate work.Problema42_vlg_vec_tst
vcd file -direction Problema42.msim.vcd
vcd add -internal Problema42_vlg_vec_tst/*
vcd add -internal Problema42_vlg_vec_tst/i1/*
add wave /*
run -all
