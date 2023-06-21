onerror {quit -f}
vlib work
vlog -work work Problema54.vo
vlog -work work Problema54.vt
vsim -novopt -c -t 1ps -L cycloneive_ver -L altera_ver -L altera_mf_ver -L 220model_ver -L sgate work.Problema54_vlg_vec_tst
vcd file -direction Problema54.msim.vcd
vcd add -internal Problema54_vlg_vec_tst/*
vcd add -internal Problema54_vlg_vec_tst/i1/*
add wave /*
run -all
