transcript on
if {[file exists rtl_work]} {
	vdel -lib rtl_work -all
}
vlib rtl_work
vmap work rtl_work

vlog -sv -work work +incdir+/home/bruno/Escritorio/3ero\ FamaF/AdC/ModulosTP3 {/home/bruno/Escritorio/3ero FamaF/AdC/ModulosTP3/writeback.sv}
vlog -sv -work work +incdir+/home/bruno/Escritorio/3ero\ FamaF/AdC/ModulosTP3 {/home/bruno/Escritorio/3ero FamaF/AdC/ModulosTP3/sl2.sv}
vlog -sv -work work +incdir+/home/bruno/Escritorio/3ero\ FamaF/AdC/ModulosTP3 {/home/bruno/Escritorio/3ero FamaF/AdC/ModulosTP3/signext.sv}
vlog -sv -work work +incdir+/home/bruno/Escritorio/3ero\ FamaF/AdC/ModulosTP3 {/home/bruno/Escritorio/3ero FamaF/AdC/ModulosTP3/regfile.sv}
vlog -sv -work work +incdir+/home/bruno/Escritorio/3ero\ FamaF/AdC/ModulosTP3 {/home/bruno/Escritorio/3ero FamaF/AdC/ModulosTP3/processor_arm.sv}
vlog -sv -work work +incdir+/home/bruno/Escritorio/3ero\ FamaF/AdC/ModulosTP3 {/home/bruno/Escritorio/3ero FamaF/AdC/ModulosTP3/mux4.sv}
vlog -sv -work work +incdir+/home/bruno/Escritorio/3ero\ FamaF/AdC/ModulosTP3 {/home/bruno/Escritorio/3ero FamaF/AdC/ModulosTP3/mux2.sv}
vlog -sv -work work +incdir+/home/bruno/Escritorio/3ero\ FamaF/AdC/ModulosTP3 {/home/bruno/Escritorio/3ero FamaF/AdC/ModulosTP3/memory.sv}
vlog -sv -work work +incdir+/home/bruno/Escritorio/3ero\ FamaF/AdC/ModulosTP3 {/home/bruno/Escritorio/3ero FamaF/AdC/ModulosTP3/imem.sv}
vlog -sv -work work +incdir+/home/bruno/Escritorio/3ero\ FamaF/AdC/ModulosTP3 {/home/bruno/Escritorio/3ero FamaF/AdC/ModulosTP3/flopr_e.sv}
vlog -sv -work work +incdir+/home/bruno/Escritorio/3ero\ FamaF/AdC/ModulosTP3 {/home/bruno/Escritorio/3ero FamaF/AdC/ModulosTP3/flopr.sv}
vlog -sv -work work +incdir+/home/bruno/Escritorio/3ero\ FamaF/AdC/ModulosTP3 {/home/bruno/Escritorio/3ero FamaF/AdC/ModulosTP3/fetch.sv}
vlog -sv -work work +incdir+/home/bruno/Escritorio/3ero\ FamaF/AdC/ModulosTP3 {/home/bruno/Escritorio/3ero FamaF/AdC/ModulosTP3/execute.sv}
vlog -sv -work work +incdir+/home/bruno/Escritorio/3ero\ FamaF/AdC/ModulosTP3 {/home/bruno/Escritorio/3ero FamaF/AdC/ModulosTP3/exception.sv}
vlog -sv -work work +incdir+/home/bruno/Escritorio/3ero\ FamaF/AdC/ModulosTP3 {/home/bruno/Escritorio/3ero FamaF/AdC/ModulosTP3/esync.sv}
vlog -sv -work work +incdir+/home/bruno/Escritorio/3ero\ FamaF/AdC/ModulosTP3 {/home/bruno/Escritorio/3ero FamaF/AdC/ModulosTP3/decode.sv}
vlog -sv -work work +incdir+/home/bruno/Escritorio/3ero\ FamaF/AdC/ModulosTP3 {/home/bruno/Escritorio/3ero FamaF/AdC/ModulosTP3/datapath.sv}
vlog -sv -work work +incdir+/home/bruno/Escritorio/3ero\ FamaF/AdC/ModulosTP3 {/home/bruno/Escritorio/3ero FamaF/AdC/ModulosTP3/comp_n.sv}
vlog -sv -work work +incdir+/home/bruno/Escritorio/3ero\ FamaF/AdC/ModulosTP3 {/home/bruno/Escritorio/3ero FamaF/AdC/ModulosTP3/alu.sv}
vlog -sv -work work +incdir+/home/bruno/Escritorio/3ero\ FamaF/AdC/ModulosTP3 {/home/bruno/Escritorio/3ero FamaF/AdC/ModulosTP3/adder.sv}
vlog -sv -work work +incdir+/home/bruno/Escritorio/3ero\ FamaF/AdC/ModulosTP3 {/home/bruno/Escritorio/3ero FamaF/AdC/ModulosTP3/controller.sv}
vlog -sv -work work +incdir+/home/bruno/Escritorio/3ero\ FamaF/AdC/ModulosTP3 {/home/bruno/Escritorio/3ero FamaF/AdC/ModulosTP3/maindec.sv}
vlog -sv -work work +incdir+/home/bruno/Escritorio/3ero\ FamaF/AdC/ModulosTP3 {/home/bruno/Escritorio/3ero FamaF/AdC/ModulosTP3/aludec.sv}
vcom -2008 -work work {/home/bruno/Escritorio/3ero FamaF/AdC/ModulosTP3/dmem.vhd}

vlog -sv -work work +incdir+/home/bruno/Escritorio/3ero\ FamaF/AdC/TP3/../ModulosTP3 {/home/bruno/Escritorio/3ero FamaF/AdC/TP3/../ModulosTP3/processor_tb.sv}

vsim -t 1ps -L altera_ver -L lpm_ver -L sgate_ver -L altera_mf_ver -L altera_lnsim_ver -L cycloneive_ver -L rtl_work -L work -voptargs="+acc"  processor_tb

add wave *
view structure
view signals
run -all
