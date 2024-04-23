.data
.org 0x0000
.text
movz x30,224

l1:
stur w30, [x0,#8]
add x0,xzr,xzr
add x30,x30,1
b l1

