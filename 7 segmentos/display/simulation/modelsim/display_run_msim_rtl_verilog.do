transcript on
if {[file exists rtl_work]} {
	vdel -lib rtl_work -all
}
vlib rtl_work
vmap work rtl_work

vlog -vlog01compat -work work +incdir+C:/Users/User/Desktop/7\ segmentos {C:/Users/User/Desktop/7 segmentos/BCDtoSSeg.v}
vlog -vlog01compat -work work +incdir+C:/Users/User/Desktop/7\ segmentos/display {C:/Users/User/Desktop/7 segmentos/display/display.v}

vlog -vlog01compat -work work +incdir+C:/Users/User/Desktop/7\ segmentos/display/../../../Documents/GitHub/lab04-grupo-13/lab04-grupo-13/hdl/src/display_7segx4 {C:/Users/User/Desktop/7 segmentos/display/../../../Documents/GitHub/lab04-grupo-13/lab04-grupo-13/hdl/src/display_7segx4/testbench.v}

vsim -t 1ps -L altera_ver -L lpm_ver -L sgate_ver -L altera_mf_ver -L altera_lnsim_ver -L fiftyfivenm_ver -L rtl_work -L work -voptargs="+acc"  testbench

add wave *
view structure
view signals
run -all
