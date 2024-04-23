transcript on
if {[file exists rtl_work]} {
	vdel -lib rtl_work -all
}
vlib rtl_work
vmap work rtl_work

vlog -sv -work work +incdir+/home/bruno/Escritorio/3ero\ FamaF/AdC/TP2 {/home/bruno/Escritorio/3ero FamaF/AdC/TP2/sl2.sv}
vlog -sv -work work +incdir+/home/bruno/Escritorio/3ero\ FamaF/AdC/TP2 {/home/bruno/Escritorio/3ero FamaF/AdC/TP2/adder.sv}
vlog -sv -work work +incdir+/home/bruno/Escritorio/3ero\ FamaF/AdC/TP2 {/home/bruno/Escritorio/3ero FamaF/AdC/TP2/mux2.sv}
vlog -sv -work work +incdir+/home/bruno/Escritorio/3ero\ FamaF/AdC/TP2 {/home/bruno/Escritorio/3ero FamaF/AdC/TP2/writeback.sv}
vlog -sv -work work +incdir+/home/bruno/Escritorio/3ero\ FamaF/AdC/TP2 {/home/bruno/Escritorio/3ero FamaF/AdC/TP2/signext.sv}
vlog -sv -work work +incdir+/home/bruno/Escritorio/3ero\ FamaF/AdC/TP2 {/home/bruno/Escritorio/3ero FamaF/AdC/TP2/regfile.sv}
vlog -sv -work work +incdir+/home/bruno/Escritorio/3ero\ FamaF/AdC/TP2 {/home/bruno/Escritorio/3ero FamaF/AdC/TP2/processor_arm.sv}
vlog -sv -work work +incdir+/home/bruno/Escritorio/3ero\ FamaF/AdC/TP2 {/home/bruno/Escritorio/3ero FamaF/AdC/TP2/memory.sv}
vlog -sv -work work +incdir+/home/bruno/Escritorio/3ero\ FamaF/AdC/TP2 {/home/bruno/Escritorio/3ero FamaF/AdC/TP2/maindec.sv}
vlog -sv -work work +incdir+/home/bruno/Escritorio/3ero\ FamaF/AdC/TP2 {/home/bruno/Escritorio/3ero FamaF/AdC/TP2/imem.sv}
vlog -sv -work work +incdir+/home/bruno/Escritorio/3ero\ FamaF/AdC/TP2 {/home/bruno/Escritorio/3ero FamaF/AdC/TP2/flopr.sv}
vlog -sv -work work +incdir+/home/bruno/Escritorio/3ero\ FamaF/AdC/TP2 {/home/bruno/Escritorio/3ero FamaF/AdC/TP2/fetch.sv}
vlog -sv -work work +incdir+/home/bruno/Escritorio/3ero\ FamaF/AdC/TP2 {/home/bruno/Escritorio/3ero FamaF/AdC/TP2/execute.sv}
vlog -sv -work work +incdir+/home/bruno/Escritorio/3ero\ FamaF/AdC/TP2 {/home/bruno/Escritorio/3ero FamaF/AdC/TP2/decode.sv}
vlog -sv -work work +incdir+/home/bruno/Escritorio/3ero\ FamaF/AdC/TP2 {/home/bruno/Escritorio/3ero FamaF/AdC/TP2/datapath.sv}
vlog -sv -work work +incdir+/home/bruno/Escritorio/3ero\ FamaF/AdC/TP2 {/home/bruno/Escritorio/3ero FamaF/AdC/TP2/controller.sv}
vlog -sv -work work +incdir+/home/bruno/Escritorio/3ero\ FamaF/AdC/TP2 {/home/bruno/Escritorio/3ero FamaF/AdC/TP2/aludec.sv}
vlog -sv -work work +incdir+/home/bruno/Escritorio/3ero\ FamaF/AdC/TP2 {/home/bruno/Escritorio/3ero FamaF/AdC/TP2/alu.sv}
vcom -2008 -work work {/home/bruno/Escritorio/3ero FamaF/AdC/TP2/dmem.vhd}

vlog -sv -work work +incdir+/home/bruno/Escritorio/3ero\ FamaF/AdC/TP2 {/home/bruno/Escritorio/3ero FamaF/AdC/TP2/processor_tb.sv}

vsim -t 1ps -L altera_ver -L lpm_ver -L sgate_ver -L altera_mf_ver -L altera_lnsim_ver -L cycloneive_ver -L rtl_work -L work -voptargs="+acc"  processor_tb

add wave *
view structure
view signals
run -all
