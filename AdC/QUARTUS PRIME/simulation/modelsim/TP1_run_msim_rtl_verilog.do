transcript on
if {[file exists rtl_work]} {
	vdel -lib rtl_work -all
}
vlib rtl_work
vmap work rtl_work

vlog -sv -work work +incdir+/home/bruno/Escritorio/3ero\ FamaF/AdC/QUARTUS\ PRIME {/home/bruno/Escritorio/3ero FamaF/AdC/QUARTUS PRIME/maindec.sv}

vlog -sv -work work +incdir+/home/bruno/Escritorio/3ero\ FamaF/AdC/QUARTUS\ PRIME {/home/bruno/Escritorio/3ero FamaF/AdC/QUARTUS PRIME/maindec_tb.sv}

vsim -t 1ps -L altera_ver -L lpm_ver -L sgate_ver -L altera_mf_ver -L altera_lnsim_ver -L cycloneive_ver -L rtl_work -L work -voptargs="+acc"  maindec_tb

add wave *
view structure
view signals
run -all
