.include "functions.s"


.equ SCREEN_WIDTH, 		640
.equ SCREEN_HEIGH, 		480
.equ BITS_PER_PIXEL,  	32



.globl main
main:
	// X0 contiene la direccion base del framebuffer
 	mov x20, x0	// Save framebuffer base address to x20	
	//---------------- CODE HERE ------------------------------------

    
// VARIABLES LIBRES HASTA AHORA X16, X17, X18

    
INICIO: 
    mov x7, 0 // DESPLAZAMIENTO DE X POR CADA FRAME marcianos
    mov x8, 0 // DESPLAZAMIENTO DE Y POR CADA FRAME marcianos
    mov x16, 0 // DESPLAZAMIENTO DE X POR CADA FRAME player
    
    mov x21, 11 // repeticion de sprite
    mov x24, 0 // y + x14 para bajar y unidades y repetir
    mov x19, 0
    mov x22, 3 // ESCALAR, cantidad de pixeles por unidad (1 = 3 pixeles juntos)
    mov x23, 2 // repeticion de filas


///////////////////Frame 0///////////////////////////

bl Fondo
    

bl Marciano_numero1  

mov x16, 0
mov x19, 0
mov x21, 11
mov x24, 50
mov x23, 2

bl Marciano_numero2

mov x19, 0
mov x21, 8
mov x24, 150
mov x23, 2

bl Marciano_numero3

mov x19, 0
mov x21, 4
mov x24, 150
mov x23, 2

bl Player



    

mov x19, 0
mov x21, 4
mov x24, 50
mov x23, 2



bl Cobertura

mov x19, 0
mov x21, 4
mov x24, 50
mov x23, 2
/////////Efectos De Frame/////////
/*

bl DisparosPlayer

    



MarcianitoMuerto:
    
    mov x10, 0
    mov x3, 100 // eje x
    mov x4, 243 // eje y
    mov x6, 58 //  largo cuad
    mov x9, x6 
    mov x2, 45 // alto cuadrado
    add x2, x2, x4
    bl Cuadraditos
    */

///////////////////////// 1 Frame //////////////////////////////////
    bl delay2



    mov x5, SCREEN_WIDTH

	mov x10, 0
    mov x0, x20




bl Fondo

mov x7, 0
mov x19, 0
mov x21, 11
mov x24, 0
mov x23, 2

bl Marciano_numero1


mov x19, 0
mov x21, 11
mov x24, 50
mov x23, 2

bl Marciano_numero2

mov x19, 0
mov x21, 8
mov x24, 150
mov x23, 2

bl Marciano_numero3

mov x16, 5
mov x19, 0
mov x21, 4
mov x24, 150
mov x23, 2

bl Player



    

mov x19, 0
mov x21, 4
mov x24, 50
mov x23, 2



bl Cobertura

mov x19, 0
mov x21, 4
mov x24, 50
mov x23, 2

///////////////////////// 2 Frame //////////////////////////////////
    bl delay2



    mov x5, SCREEN_WIDTH

	mov x10, 0
    mov x0, x20




bl Fondo

mov x7, 0
mov x19, 0
mov x21, 11
mov x24, 0
mov x23, 2

bl Marciano_numero1


mov x19, 0
mov x21, 11
mov x24, 50
mov x23, 2

bl Marciano_numero2

mov x19, 0
mov x21, 8
mov x24, 150
mov x23, 2

bl Marciano_numero3

mov x16, 10
mov x19, 0
mov x21, 4
mov x24, 150
mov x23, 2

bl Player



    

mov x19, 0
mov x21, 4
mov x24, 50
mov x23, 2



bl Cobertura

mov x19, 0
mov x21, 4
mov x24, 50
mov x23, 2

///////////////////////// 3 Frame //////////////////////////////////
    bl delay2



    mov x5, SCREEN_WIDTH

	mov x10, 0
    mov x0, x20




bl Fondo

mov x7, 0
mov x19, 0
mov x21, 11
mov x24, 0
mov x23, 2

bl Marciano_numero1


mov x19, 0
mov x21, 11
mov x24, 50
mov x23, 2

bl Marciano_numero2

mov x19, 0
mov x21, 8
mov x24, 150
mov x23, 2

bl Marciano_numero3

mov x16, 15
mov x19, 0
mov x21, 4
mov x24, 150
mov x23, 2

bl Player



    

mov x19, 0
mov x21, 4
mov x24, 50
mov x23, 2



bl Cobertura

mov x19, 0
mov x21, 4
mov x24, 50
mov x23, 2

///////////////////////// 4 Frame //////////////////////////////////
    bl delay2



    mov x5, SCREEN_WIDTH

	mov x10, 0
    mov x0, x20




bl Fondo

mov x7, 0
mov x19, 0
mov x21, 11
mov x24, 0
mov x23, 2

bl Marciano_numero1


mov x19, 0
mov x21, 11
mov x24, 50
mov x23, 2

bl Marciano_numero2

mov x19, 0
mov x21, 8
mov x24, 150
mov x23, 2

bl Marciano_numero3

mov x16, 20
mov x19, 0
mov x21, 4
mov x24, 150
mov x23, 2

bl Player



    

mov x19, 0
mov x21, 4
mov x24, 50
mov x23, 2



bl Cobertura

mov x19, 0
mov x21, 4
mov x24, 50
mov x23, 2

///////////////////////// 5 Frame //////////////////////////////////
    bl delay2



    mov x5, SCREEN_WIDTH

	mov x10, 0
    mov x0, x20




bl Fondo

mov x7, 3
mov x19, 0
mov x21, 11
mov x24, 0
mov x23, 2

bl Marciano_numero1.2


mov x19, 0
mov x21, 11
mov x24, 50
mov x23, 2

bl Marciano_numero2.2

mov x19, 0
mov x21, 8
mov x24, 150
mov x23, 2

bl Marciano_numero3.2

mov x16, 25
mov x19, 0
mov x21, 4
mov x24, 150
mov x23, 2

bl Player



    

mov x19, 0
mov x21, 4
mov x24, 50
mov x23, 2



bl Cobertura

mov x19, 0
mov x21, 4
mov x24, 50
mov x23, 2


///////////////////////// 6 Frame //////////////////////////////////
    bl delay2



    mov x5, SCREEN_WIDTH

	mov x10, 0
    mov x0, x20




bl Fondo

mov x7, 3
mov x19, 0
mov x21, 11
mov x24, 0
mov x23, 2

bl Marciano_numero1.2


mov x19, 0
mov x21, 11
mov x24, 50
mov x23, 2

bl Marciano_numero2.2

mov x19, 0
mov x21, 8
mov x24, 150
mov x23, 2

bl Marciano_numero3.2

mov x16, 30
mov x19, 0
mov x21, 4
mov x24, 150
mov x23, 2

bl Player



    

mov x19, 0
mov x21, 4
mov x24, 50
mov x23, 2



bl Cobertura

mov x19, 0
mov x21, 4
mov x24, 50
mov x23, 2

///////////////////////// 7 Frame //////////////////////////////////
    bl delay2



    mov x5, SCREEN_WIDTH

	mov x10, 0
    mov x0, x20




bl Fondo

mov x7, 3
mov x19, 0
mov x21, 11
mov x24, 0
mov x23, 2

bl Marciano_numero1.2


mov x19, 0
mov x21, 11
mov x24, 50
mov x23, 2

bl Marciano_numero2.2

mov x19, 0
mov x21, 8
mov x24, 150
mov x23, 2

bl Marciano_numero3.2

mov x16, 35
mov x19, 0
mov x21, 4
mov x24, 150
mov x23, 2

bl Player



    

mov x19, 0
mov x21, 4
mov x24, 50
mov x23, 2



bl Cobertura

mov x19, 0
mov x21, 4
mov x24, 50
mov x23, 2

///////////////////////// 8 Frame //////////////////////////////////
    bl delay2



    mov x5, SCREEN_WIDTH

	mov x10, 0
    mov x0, x20




bl Fondo

mov x7, 3
mov x19, 0
mov x21, 11
mov x24, 0
mov x23, 2

bl Marciano_numero1.2


mov x19, 0
mov x21, 11
mov x24, 50
mov x23, 2

bl Marciano_numero2.2

mov x19, 0
mov x21, 8
mov x24, 150
mov x23, 2

bl Marciano_numero3.2

mov x16, 40
mov x19, 0
mov x21, 4
mov x24, 150
mov x23, 2

bl Player



    

mov x19, 0
mov x21, 4
mov x24, 50
mov x23, 2



bl Cobertura

mov x19, 0
mov x21, 4
mov x24, 50
mov x23, 2


///////////////////////// 9 Frame //////////////////////////////////
    bl delay2



    mov x5, SCREEN_WIDTH

	mov x10, 0
    mov x0, x20




bl Fondo

mov x7, 3
mov x19, 0
mov x21, 11
mov x24, 0
mov x23, 2

bl Marciano_numero1.2


mov x19, 0
mov x21, 11
mov x24, 50
mov x23, 2

bl Marciano_numero2.2

mov x19, 0
mov x21, 8
mov x24, 150
mov x23, 2

bl Marciano_numero3.2

mov x16, 45
mov x19, 0
mov x21, 4
mov x24, 150
mov x23, 2

bl Player



    

mov x19, 0
mov x21, 4
mov x24, 50
mov x23, 2



bl Cobertura

mov x19, 0
mov x21, 4
mov x24, 50
mov x23, 2


///////////////////////// 10 Frame //////////////////////////////////
    bl delay2



    mov x5, SCREEN_WIDTH

	mov x10, 0
    mov x0, x20




bl Fondo

mov x7, 6
mov x19, 0
mov x21, 11
mov x24, 0
mov x23, 2

bl Marciano_numero1


mov x19, 0
mov x21, 11
mov x24, 50
mov x23, 2

bl Marciano_numero2

mov x19, 0
mov x21, 8
mov x24, 150
mov x23, 2

bl Marciano_numero3

mov x16, 50
mov x19, 0
mov x21, 4
mov x24, 150
mov x23, 2

bl Player



    

mov x19, 0
mov x21, 4
mov x24, 50
mov x23, 2



bl Cobertura

mov x19, 0
mov x21, 4
mov x24, 50
mov x23, 2

///////////////////////// 11 Frame //////////////////////////////////
    bl delay2



    mov x5, SCREEN_WIDTH

	mov x10, 0
    mov x0, x20




bl Fondo

mov x7, 6
mov x19, 0
mov x21, 11
mov x24, 0
mov x23, 2

bl Marciano_numero1


mov x19, 0
mov x21, 11
mov x24, 50
mov x23, 2

bl Marciano_numero2

mov x19, 0
mov x21, 8
mov x24, 150
mov x23, 2

bl Marciano_numero3

mov x16, 55
mov x19, 0
mov x21, 4
mov x24, 150
mov x23, 2

bl Player



    

mov x19, 0
mov x21, 4
mov x24, 50
mov x23, 2



bl Cobertura

mov x19, 0
mov x21, 4
mov x24, 50
mov x23, 2

///////////////////////// 12 Frame //////////////////////////////////
    bl delay2



    mov x5, SCREEN_WIDTH

	mov x10, 0
    mov x0, x20




bl Fondo

mov x7, 6
mov x19, 0
mov x21, 11
mov x24, 0
mov x23, 2

bl Marciano_numero1


mov x19, 0
mov x21, 11
mov x24, 50
mov x23, 2

bl Marciano_numero2

mov x19, 0
mov x21, 8
mov x24, 150
mov x23, 2

bl Marciano_numero3

mov x16, 60
mov x19, 0
mov x21, 4
mov x24, 150
mov x23, 2

bl Player



    

mov x19, 0
mov x21, 4
mov x24, 50
mov x23, 2



bl Cobertura

mov x19, 0
mov x21, 4
mov x24, 50
mov x23, 2

///////////////////////// 13 Frame //////////////////////////////////
    bl delay2



    mov x5, SCREEN_WIDTH

	mov x10, 0
    mov x0, x20




bl Fondo

mov x7, 6
mov x19, 0
mov x21, 11
mov x24, 0
mov x23, 2

bl Marciano_numero1


mov x19, 0
mov x21, 11
mov x24, 50
mov x23, 2

bl Marciano_numero2

mov x19, 0
mov x21, 8
mov x24, 150
mov x23, 2

bl Marciano_numero3

mov x16, 65
mov x19, 0
mov x21, 4
mov x24, 150
mov x23, 2

bl Player



    

mov x19, 0
mov x21, 4
mov x24, 50
mov x23, 2



bl Cobertura

mov x19, 0
mov x21, 4
mov x24, 50
mov x23, 2

///////////////////////// 14 Frame //////////////////////////////////
    bl delay2



    mov x5, SCREEN_WIDTH

	mov x10, 0
    mov x0, x20




bl Fondo

mov x7, 6
mov x19, 0
mov x21, 11
mov x24, 0
mov x23, 2

bl Marciano_numero1


mov x19, 0
mov x21, 11
mov x24, 50
mov x23, 2

bl Marciano_numero2

mov x19, 0
mov x21, 8
mov x24, 150
mov x23, 2

bl Marciano_numero3

mov x16, 70
mov x19, 0
mov x21, 4
mov x24, 150
mov x23, 2

bl Player



    

mov x19, 0
mov x21, 4
mov x24, 50
mov x23, 2



bl Cobertura

mov x19, 0
mov x21, 4
mov x24, 50
mov x23, 2

///////////////////////// 15 Frame //////////////////////////////////
    bl delay2



    mov x5, SCREEN_WIDTH

	mov x10, 0
    mov x0, x20




bl Fondo

mov x7, 9
mov x19, 0
mov x21, 11
mov x24, 0
mov x23, 2

bl Marciano_numero1.2


mov x19, 0
mov x21, 11
mov x24, 50
mov x23, 2

bl Marciano_numero2.2

mov x19, 0
mov x21, 8
mov x24, 150
mov x23, 2

bl Marciano_numero3.2

mov x16, 75
mov x19, 0
mov x21, 4
mov x24, 150
mov x23, 2

bl Player



    

mov x19, 0
mov x21, 4
mov x24, 50
mov x23, 2



bl Cobertura

mov x19, 0
mov x21, 4
mov x24, 50
mov x23, 2

///////////////////////// 16 Frame //////////////////////////////////
    bl delay2



    mov x5, SCREEN_WIDTH

	mov x10, 0
    mov x0, x20




bl Fondo

mov x7, 9
mov x19, 0
mov x21, 11
mov x24, 0
mov x23, 2

bl Marciano_numero1.2


mov x19, 0
mov x21, 11
mov x24, 50
mov x23, 2

bl Marciano_numero2.2

mov x19, 0
mov x21, 8
mov x24, 150
mov x23, 2

bl Marciano_numero3.2

mov x16, 80
mov x19, 0
mov x21, 4
mov x24, 150
mov x23, 2

bl Player



    

mov x19, 0
mov x21, 4
mov x24, 50
mov x23, 2



bl Cobertura

mov x19, 0
mov x21, 4
mov x24, 50
mov x23, 2

mov x18, 330
mov x17, 0
bl DisparosMarcianos

///////////////////////// 17 Frame //////////////////////////////////
    bl delay2



    mov x5, SCREEN_WIDTH

	mov x10, 0
    mov x0, x20




bl Fondo

mov x7, 9
mov x19, 0
mov x21, 11
mov x24, 0
mov x23, 2

bl Marciano_numero1.2


mov x19, 0
mov x21, 11
mov x24, 50
mov x23, 2

bl Marciano_numero2.2

mov x19, 0
mov x21, 8
mov x24, 150
mov x23, 2

bl Marciano_numero3.2

mov x16, 85
mov x19, 0
mov x21, 4
mov x24, 150
mov x23, 2

bl Player



    

mov x19, 0
mov x21, 4
mov x24, 50
mov x23, 2



bl Cobertura

mov x19, 0
mov x21, 4
mov x24, 50
mov x23, 2

mov x18, 330
mov x17, 10
bl DisparosMarcianos

///////////////////////// 18 Frame //////////////////////////////////
    bl delay2



    mov x5, SCREEN_WIDTH

	mov x10, 0
    mov x0, x20




bl Fondo

mov x7, 9
mov x19, 0
mov x21, 11
mov x24, 0
mov x23, 2

bl Marciano_numero1.2


mov x19, 0
mov x21, 11
mov x24, 50
mov x23, 2

bl Marciano_numero2.2

mov x19, 0
mov x21, 8
mov x24, 150
mov x23, 2

bl Marciano_numero3.2

mov x16, 90
mov x19, 0
mov x21, 4
mov x24, 150
mov x23, 2

bl Player



    

mov x19, 0
mov x21, 4
mov x24, 50
mov x23, 2



bl Cobertura

mov x19, 0
mov x21, 4
mov x24, 50
mov x23, 2

mov x18, 330
mov x17, 20
bl DisparosMarcianos

///////////////////////// 19 Frame //////////////////////////////////
    bl delay2



    mov x5, SCREEN_WIDTH

	mov x10, 0
    mov x0, x20




bl Fondo

mov x7, 9
mov x19, 0
mov x21, 11
mov x24, 0
mov x23, 2

bl Marciano_numero1.2


mov x19, 0
mov x21, 11
mov x24, 50
mov x23, 2

bl Marciano_numero2.2

mov x19, 0
mov x21, 8
mov x24, 150
mov x23, 2

bl Marciano_numero3.2

mov x16, 95
mov x19, 0
mov x21, 4
mov x24, 150
mov x23, 2

bl Player



    

mov x19, 0
mov x21, 4
mov x24, 50
mov x23, 2



bl Cobertura

mov x19, 0
mov x21, 4
mov x24, 50
mov x23, 2


mov x18, 330
mov x17, 30
bl DisparosMarcianos



///////////////////////// 20 Frame //////////////////////////////////
    bl delay2



    mov x5, SCREEN_WIDTH

	mov x10, 0
    mov x0, x20




bl Fondo

mov x7, 12
mov x19, 0
mov x21, 11
mov x24, 0
mov x23, 2

bl Marciano_numero1


mov x19, 0
mov x21, 11
mov x24, 50
mov x23, 2

bl Marciano_numero2

mov x19, 0
mov x21, 8
mov x24, 150
mov x23, 2

bl Marciano_numero3

mov x16, 100
mov x19, 0
mov x21, 4
mov x24, 150
mov x23, 2

bl Player



    

mov x19, 0
mov x21, 4
mov x24, 50
mov x23, 2



bl Cobertura

mov x19, 0
mov x21, 4
mov x24, 50
mov x23, 2

mov x18, 330
mov x17, 40
bl DisparosMarcianos


///////////////////////// 21 Frame //////////////////////////////////  
    bl delay2



    mov x5, SCREEN_WIDTH

	mov x10, 0
    mov x0, x20




bl Fondo

mov x7, 12
mov x19, 0
mov x21, 11
mov x24, 0
mov x23, 2

bl Marciano_numero1


mov x19, 0
mov x21, 11
mov x24, 50
mov x23, 2

bl Marciano_numero2

mov x19, 0
mov x21, 8
mov x24, 150
mov x23, 2

bl Marciano_numero3

mov x16, 105
mov x19, 0
mov x21, 4
mov x24, 150
mov x23, 2

bl Player



    

mov x19, 0
mov x21, 4
mov x24, 50
mov x23, 2



bl Cobertura

mov x19, 0
mov x21, 4
mov x24, 50
mov x23, 2

mov x18, 330
mov x17, 50
bl DisparosMarcianos


///////////////////////// 22 Frame //////////////////////////////////  aca podemos hacer que dispare
    bl delay2



    mov x5, SCREEN_WIDTH

	mov x10, 0
    mov x0, x20




bl Fondo

mov x7, 12
mov x19, 0
mov x21, 11
mov x24, 0
mov x23, 2

bl Marciano_numero1


mov x19, 0
mov x21, 11
mov x24, 50
mov x23, 2

bl Marciano_numero2

mov x19, 0
mov x21, 8
mov x24, 150
mov x23, 2

bl Marciano_numero3

mov x16, 105
mov x19, 0
mov x21, 4
mov x24, 150
mov x23, 2

bl Player



    

mov x19, 0
mov x21, 4
mov x24, 50
mov x23, 2



bl Cobertura

mov x19, 0
mov x21, 4
mov x24, 50
mov x23, 2


///////EFECTOS//////////

//Disparo de player
movz x10, 0xFF, lsl 16
	movk x10, 0xFFFF, lsl 00
    mov x3, 139 // eje x
    mov x4, 433 // eje y
    mov x2, 12 // largo linea
    add x2, x2, x4 
    bl LineaVertical

mov x18, 330
mov x17, 60
bl DisparosMarcianos



//////////////////////// 23 Frame ////////////////////////////////// 
    bl delay2



    mov x5, SCREEN_WIDTH

	mov x10, 0
    mov x0, x20




bl Fondo

mov x7, 12
mov x19, 0
mov x21, 11
mov x24, 0
mov x23, 2

bl Marciano_numero1


mov x19, 0
mov x21, 11
mov x24, 50
mov x23, 2

bl Marciano_numero2

mov x19, 0
mov x21, 8
mov x24, 150
mov x23, 2

bl Marciano_numero3

mov x16, 105
mov x19, 0
mov x21, 4
mov x24, 150
mov x23, 2

bl Player



    

mov x19, 0
mov x21, 4
mov x24, 50
mov x23, 2



bl Cobertura

mov x19, 0
mov x21, 4
mov x24, 50
mov x23, 2

//Disparo de player
movz x10, 0xFF, lsl 16
	movk x10, 0xFFFF, lsl 00
    mov x3, 139 // eje x
    mov x4, 423 // eje y
    mov x2, 12 // largo linea
    add x2, x2, x4 
    bl LineaVertical


mov x18, 330
mov x17, 70
bl DisparosMarcianos


//////////////////////// 24 Frame //////////////////////////////////  
    bl delay2



    mov x5, SCREEN_WIDTH

	mov x10, 0
    mov x0, x20




bl Fondo

mov x7, 12
mov x19, 0
mov x21, 11
mov x24, 0
mov x23, 2

bl Marciano_numero1


mov x19, 0
mov x21, 11
mov x24, 50
mov x23, 2

bl Marciano_numero2

mov x19, 0
mov x21, 8
mov x24, 150
mov x23, 2

bl Marciano_numero3

mov x16, 110
mov x19, 0
mov x21, 4
mov x24, 150
mov x23, 2

bl Player



    

mov x19, 0
mov x21, 4
mov x24, 50
mov x23, 2



bl Cobertura

mov x19, 0
mov x21, 4
mov x24, 50
mov x23, 2


//Disparo de player
movz x10, 0xFF, lsl 16
	movk x10, 0xFFFF, lsl 00
    mov x3, 139 // eje x
    mov x4, 413 // eje y
    mov x2, 12 // largo linea
    add x2, x2, x4 
    bl LineaVertical

mov x18, 330
mov x17, 80
bl DisparosMarcianos


//////////////////////// 25 Frame //////////////////////////////////  
    bl delay2



    mov x5, SCREEN_WIDTH

	mov x10, 0
    mov x0, x20




bl Fondo

mov x7, 15
mov x19, 0
mov x21, 11
mov x24, 0
mov x23, 2

bl Marciano_numero1.2


mov x19, 0
mov x21, 11
mov x24, 50
mov x23, 2

bl Marciano_numero2.2

mov x19, 0
mov x21, 8
mov x24, 150
mov x23, 2

bl Marciano_numero3.2

mov x16, 115
mov x19, 0
mov x21, 4
mov x24, 150
mov x23, 2

bl Player



    

mov x19, 0
mov x21, 4
mov x24, 50
mov x23, 2



bl Cobertura

mov x19, 0
mov x21, 4
mov x24, 50
mov x23, 2

//Disparo de player
movz x10, 0xFF, lsl 16
	movk x10, 0xFFFF, lsl 00
    mov x3, 139 // eje x
    mov x4, 403 // eje y
    mov x2, 12 // largo linea
    add x2, x2, x4 
    bl LineaVertical

mov x18, 330
mov x17, 90
bl DisparosMarcianos


//////////////////////// 26 Frame //////////////////////////////////  
    bl delay2



    mov x5, SCREEN_WIDTH

	mov x10, 0
    mov x0, x20




bl Fondo

mov x7, 15
mov x19, 0
mov x21, 11
mov x24, 0
mov x23, 2

bl Marciano_numero1.2


mov x19, 0
mov x21, 11
mov x24, 50
mov x23, 2

bl Marciano_numero2.2

mov x19, 0
mov x21, 8
mov x24, 150
mov x23, 2

bl Marciano_numero3.2

mov x16, 120
mov x19, 0
mov x21, 4
mov x24, 150
mov x23, 2

bl Player



    

mov x19, 0
mov x21, 4
mov x24, 50
mov x23, 2



bl Cobertura

mov x19, 0
mov x21, 4
mov x24, 50
mov x23, 2


//Disparo de player
movz x10, 0xFF, lsl 16
	movk x10, 0xFFFF, lsl 00
    mov x3, 139 // eje x
    mov x4, 393 // eje y
    mov x2, 12 // largo linea
    add x2, x2, x4 
    bl LineaVertical

mov x18, 330
mov x17, 100
bl DisparosMarcianos


//////////////////////// 27 Frame //////////////////////////////////  
    bl delay2



    mov x5, SCREEN_WIDTH

	mov x10, 0
    mov x0, x20




bl Fondo

mov x7, 15
mov x19, 0
mov x21, 11
mov x24, 0
mov x23, 2

bl Marciano_numero1.2


mov x19, 0
mov x21, 11
mov x24, 50
mov x23, 2

bl Marciano_numero2.2

mov x19, 0
mov x21, 8
mov x24, 150
mov x23, 2

bl Marciano_numero3.2

mov x16, 125
mov x19, 0
mov x21, 4
mov x24, 150
mov x23, 2

bl Player



    

mov x19, 0
mov x21, 4
mov x24, 50
mov x23, 2



bl Cobertura

mov x19, 0
mov x21, 4
mov x24, 50
mov x23, 2

//Disparo de player
movz x10, 0xFF, lsl 16
	movk x10, 0xFFFF, lsl 00
    mov x3, 139 // eje x
    mov x4, 383 // eje y
    mov x2, 12 // largo linea
    add x2, x2, x4 
    bl LineaVertical

mov x18, 330
mov x17, 110
bl DisparosMarcianos


//////////////////////// 28 Frame //////////////////////////////////  
    bl delay2



    mov x5, SCREEN_WIDTH

	mov x10, 0
    mov x0, x20




bl Fondo

mov x7, 15
mov x19, 0
mov x21, 11
mov x24, 0
mov x23, 2

bl Marciano_numero1.2


mov x19, 0
mov x21, 11
mov x24, 50
mov x23, 2

bl Marciano_numero2.2

mov x19, 0
mov x21, 8
mov x24, 150
mov x23, 2

bl Marciano_numero3.2

mov x16, 130
mov x19, 0
mov x21, 4
mov x24, 150
mov x23, 2

bl Player



    

mov x19, 0
mov x21, 4
mov x24, 50
mov x23, 2



bl Cobertura

mov x19, 0
mov x21, 4
mov x24, 50
mov x23, 2


//Disparo de player
movz x10, 0xFF, lsl 16
	movk x10, 0xFFFF, lsl 00
    mov x3, 139 // eje x
    mov x4, 373 // eje y
    mov x2, 12 // largo linea
    add x2, x2, x4 
    bl LineaVertical

mov x18, 330
mov x17, 120
bl DisparosMarcianos

//////////////////////// 29 Frame //////////////////////////////////  
    bl delay2



    mov x5, SCREEN_WIDTH

	mov x10, 0
    mov x0, x20




bl Fondo

mov x7, 15
mov x19, 0
mov x21, 11
mov x24, 0
mov x23, 2

bl Marciano_numero1.2


mov x19, 0
mov x21, 11
mov x24, 50
mov x23, 2

bl Marciano_numero2.2

mov x19, 0
mov x21, 8
mov x24, 150
mov x23, 2

bl Marciano_numero3.2

mov x16, 135
mov x19, 0
mov x21, 4
mov x24, 150
mov x23, 2

bl Player



    

mov x19, 0
mov x21, 4
mov x24, 50
mov x23, 2



bl Cobertura

mov x19, 0
mov x21, 4
mov x24, 50
mov x23, 2


//Disparo de player
movz x10, 0xFF, lsl 16
	movk x10, 0xFFFF, lsl 00
    mov x3, 139 // eje x
    mov x4, 363 // eje y
    mov x2, 12 // largo linea
    add x2, x2, x4 
    bl LineaVertical

mov x18, 330
mov x17, 130
bl DisparosMarcianos


//////////////////////// 30 Frame //////////////////////////////////  
    bl delay2



    mov x5, SCREEN_WIDTH

	mov x10, 0
    mov x0, x20




bl Fondo

mov x7, 18
mov x19, 0
mov x21, 11
mov x24, 0
mov x23, 2

bl Marciano_numero1


mov x19, 0
mov x21, 11
mov x24, 50
mov x23, 2

bl Marciano_numero2

mov x19, 0
mov x21, 8
mov x24, 150
mov x23, 2

bl Marciano_numero3

mov x16, 140
mov x19, 0
mov x21, 4
mov x24, 150
mov x23, 2

bl Player



    

mov x19, 0
mov x21, 4
mov x24, 50
mov x23, 2



bl Cobertura

mov x19, 0
mov x21, 4
mov x24, 50
mov x23, 2

//Disparo de player
movz x10, 0xFF, lsl 16
	movk x10, 0xFFFF, lsl 00
    mov x3, 139 // eje x
    mov x4, 353 // eje y
    mov x2, 12 // largo linea
    add x2, x2, x4 
    bl LineaVertical

mov x18, 330
mov x17, 140
bl DisparosMarcianos


//////////////////////// 31 Frame //////////////////////////////////  
    bl delay2



    mov x5, SCREEN_WIDTH

	mov x10, 0
    mov x0, x20




bl Fondo

mov x7, 18
mov x19, 0
mov x21, 11
mov x24, 0
mov x23, 2

bl Marciano_numero1


mov x19, 0
mov x21, 11
mov x24, 50
mov x23, 2

bl Marciano_numero2

mov x19, 0
mov x21, 8
mov x24, 150
mov x23, 2

bl Marciano_numero3

mov x16, 145
mov x19, 0
mov x21, 4
mov x24, 150
mov x23, 2

bl Player



    

mov x19, 0
mov x21, 4
mov x24, 50
mov x23, 2



bl Cobertura

mov x19, 0
mov x21, 4
mov x24, 50
mov x23, 2

//Disparo de player
movz x10, 0xFF, lsl 16
	movk x10, 0xFFFF, lsl 00
    mov x3, 139 // eje x
    mov x4, 343 // eje y
    mov x2, 12 // largo linea
    add x2, x2, x4 
    bl LineaVertical

mov x18, 330
mov x17, 150
bl DisparosMarcianos

//////////////////////// 32 Frame //////////////////////////////////  
    bl delay2



    mov x5, SCREEN_WIDTH

	mov x10, 0
    mov x0, x20




bl Fondo

mov x7, 18
mov x19, 0
mov x21, 11
mov x24, 0
mov x23, 2

bl Marciano_numero1


mov x19, 0
mov x21, 11
mov x24, 50
mov x23, 2

bl Marciano_numero2

mov x19, 0
mov x21, 8
mov x24, 150
mov x23, 2

bl Marciano_numero3

mov x16, 150
mov x19, 0
mov x21, 4
mov x24, 150
mov x23, 2

bl Player



    

mov x19, 0
mov x21, 4
mov x24, 50
mov x23, 2



bl Cobertura

mov x19, 0
mov x21, 4
mov x24, 50
mov x23, 2

//Disparo de player
movz x10, 0xFF, lsl 16
	movk x10, 0xFFFF, lsl 00
    mov x3, 139 // eje x
    mov x4, 333 // eje y
    mov x2, 12 // largo linea
    add x2, x2, x4 
    bl LineaVertical

mov x18, 330
mov x17, 160
bl DisparosMarcianos

//////////////////////// 33 Frame //////////////////////////////////  
    bl delay2



    mov x5, SCREEN_WIDTH

	mov x10, 0
    mov x0, x20




bl Fondo

mov x7, 18
mov x19, 0
mov x21, 11
mov x24, 0
mov x23, 2

bl Marciano_numero1


mov x19, 0
mov x21, 11
mov x24, 50
mov x23, 2

bl Marciano_numero2

mov x19, 0
mov x21, 8
mov x24, 150
mov x23, 2

bl Marciano_numero3

mov x16, 155
mov x19, 0
mov x21, 4
mov x24, 150
mov x23, 2

bl Player



    

mov x19, 0
mov x21, 4
mov x24, 50
mov x23, 2



bl Cobertura

mov x19, 0
mov x21, 4
mov x24, 50
mov x23, 2

//Disparo de player
movz x10, 0xFF, lsl 16
	movk x10, 0xFFFF, lsl 00
    mov x3, 139 // eje x
    mov x4, 323 // eje y
    mov x2, 12 // largo linea
    add x2, x2, x4 
    bl LineaVertical

mov x18, 330
mov x17, 170
bl DisparosMarcianos


//////////////////////// 34 Frame //////////////////////////////////  
    bl delay2



    mov x5, SCREEN_WIDTH

	mov x10, 0
    mov x0, x20




bl Fondo

mov x7, 18
mov x19, 0
mov x21, 11
mov x24, 0
mov x23, 2

bl Marciano_numero1


mov x19, 0
mov x21, 11
mov x24, 50
mov x23, 2

bl Marciano_numero2

mov x19, 0
mov x21, 8
mov x24, 150
mov x23, 2

bl Marciano_numero3

mov x16, 160
mov x19, 0
mov x21, 4
mov x24, 150
mov x23, 2

bl Player



    

mov x19, 0
mov x21, 4
mov x24, 50
mov x23, 2



bl Cobertura

mov x19, 0
mov x21, 4
mov x24, 50
mov x23, 2


//Disparo de player
movz x10, 0xFF, lsl 16
	movk x10, 0xFFFF, lsl 00
    mov x3, 139 // eje x
    mov x4, 313 // eje y
    mov x2, 12 // largo linea
    add x2, x2, x4 
    bl LineaVertical

mov x18, 330
mov x17, 180
bl DisparosMarcianos

//////////////////////// 35 Frame //////////////////////////////////  
    bl delay2



    mov x5, SCREEN_WIDTH

	mov x10, 0
    mov x0, x20




bl Fondo

mov x7, 21
mov x19, 0
mov x21, 11
mov x24, 0
mov x23, 2

bl Marciano_numero1.2


mov x19, 0
mov x21, 11
mov x24, 50
mov x23, 2

bl Marciano_numero2.2

mov x19, 0
mov x21, 8
mov x24, 150
mov x23, 2

bl Marciano_numero3.2

mov x16, 165
mov x19, 0
mov x21, 4
mov x24, 150
mov x23, 2

bl Player



    

mov x19, 0
mov x21, 4
mov x24, 50
mov x23, 2



bl Cobertura

mov x19, 0
mov x21, 4
mov x24, 50
mov x23, 2


//Disparo de player
movz x10, 0xFF, lsl 16
	movk x10, 0xFFFF, lsl 00
    mov x3, 139 // eje x
    mov x4, 303 // eje y
    mov x2, 12 // largo linea
    add x2, x2, x4 
    bl LineaVertical

mov x18, 330
mov x17, 190
bl DisparosMarcianos


//////////////////////// 36 Frame //////////////////////////////////  
    bl delay2



    mov x5, SCREEN_WIDTH

	mov x10, 0
    mov x0, x20




bl Fondo

mov x7, 21
mov x19, 0
mov x21, 11
mov x24, 0
mov x23, 2

bl Marciano_numero1.2


mov x19, 0
mov x21, 11
mov x24, 50
mov x23, 2

bl Marciano_numero2.2

mov x19, 0
mov x21, 8
mov x24, 150
mov x23, 2

bl Marciano_numero3.2

mov x16, 170
mov x19, 0
mov x21, 4
mov x24, 150
mov x23, 2

bl Player



    

mov x19, 0
mov x21, 4
mov x24, 50
mov x23, 2



bl Cobertura

mov x19, 0
mov x21, 4
mov x24, 50
mov x23, 2

//Disparo de player
movz x10, 0xFF, lsl 16
	movk x10, 0xFFFF, lsl 00
    mov x3, 139 // eje x
    mov x4, 293 // eje y
    mov x2, 12 // largo linea
    add x2, x2, x4 
    bl LineaVertical


//////////////////////// 37 Frame //////////////////////////////////  
    bl delay2



    mov x5, SCREEN_WIDTH

	mov x10, 0
    mov x0, x20




bl Fondo

mov x7, 21
mov x19, 0
mov x21, 11
mov x24, 0
mov x23, 2

bl Marciano_numero1.2


mov x19, 0
mov x21, 11
mov x24, 50
mov x23, 2

bl Marciano_numero2.2

mov x19, 0
mov x21, 8
mov x24, 150
mov x23, 2

bl Marciano_numero3.2

mov x16, 175
mov x19, 0
mov x21, 4
mov x24, 150
mov x23, 2

bl Player



    

mov x19, 0
mov x21, 4
mov x24, 50
mov x23, 2



bl Cobertura

mov x19, 0
mov x21, 4
mov x24, 50
mov x23, 2
//Disparo de player
movz x10, 0xFF, lsl 16
	movk x10, 0xFFFF, lsl 00
    mov x3, 139 // eje x
    mov x4, 283 // eje y
    mov x2, 12 // largo linea
    add x2, x2, x4 
    bl LineaVertical


//////////////////////// 38 Frame //////////////////////////////////  
    bl delay2



    mov x5, SCREEN_WIDTH

	mov x10, 0
    mov x0, x20




bl Fondo

mov x7, 21
mov x19, 0
mov x21, 11
mov x24, 0
mov x23, 2

bl Marciano_numero1.2


mov x19, 0
mov x21, 11
mov x24, 50
mov x23, 2

bl Marciano_numero2.2

mov x19, 0
mov x21, 8
mov x24, 150
mov x23, 2

bl Marciano_numero3.2

mov x16, 180
mov x19, 0
mov x21, 4
mov x24, 150
mov x23, 2

bl Player



    

mov x19, 0
mov x21, 4
mov x24, 50
mov x23, 2



bl Cobertura

mov x19, 0
mov x21, 4
mov x24, 50
mov x23, 2

// HITMARKER
    mov x10, 0
    mov x3, 120 // eje x
    add x3, x3, x19
    mov x4, 190 // eje y
    add x4, x4, x24
    mov x6, 58 //  largo cuad
    mov x9, x6 
    mov x2, 45 // alto cuadrado
    add x2, x2, x4
    bl Cuadraditos

bl Explosion1
    
//////////////////////// 39 Frame //////////////////////////////////  
    bl delay2



    mov x5, SCREEN_WIDTH

	mov x10, 0
    mov x0, x20




bl Fondo

mov x7, 21
mov x19, 0
mov x21, 11
mov x24, 0
mov x23, 2

bl Marciano_numero1.2


mov x19, 0
mov x21, 11
mov x24, 50
mov x23, 2

bl Marciano_numero2.2

mov x19, 0
mov x21, 8
mov x24, 150
mov x23, 2

bl Marciano_numero3.2

mov x16, 185
mov x19, 0
mov x21, 4
mov x24, 150
mov x23, 2

bl Player



    

mov x19, 0
mov x21, 4
mov x24, 50
mov x23, 2



bl Cobertura

mov x19, 0
mov x21, 4
mov x24, 50
mov x23, 2

// HITMARKER
    mov x10, 0
    mov x3, 120 // eje x
    add x3, x3, x19
    mov x4, 190 // eje y
    add x4, x4, x24
    mov x6, 58 //  largo cuad
    mov x9, x6 
    mov x2, 45 // alto cuadrado
    add x2, x2, x4
    bl Cuadraditos

bl Explosion1

//////////////////////// 40 Frame //////////////////////////////////  
    bl delay2



    mov x5, SCREEN_WIDTH

	mov x10, 0
    mov x0, x20




bl Fondo

mov x7, 24
mov x19, 0
mov x21, 11
mov x24, 0
mov x23, 2

bl Marciano_numero1


mov x19, 0
mov x21, 11
mov x24, 50
mov x23, 2

bl Marciano_numero2

mov x19, 0
mov x21, 8
mov x24, 150
mov x23, 2

bl Marciano_numero3

mov x16, 190
mov x19, 0
mov x21, 4
mov x24, 150
mov x23, 2

bl Player



    

mov x19, 0
mov x21, 4
mov x24, 50
mov x23, 2



bl Cobertura

mov x19, 0
mov x21, 4
mov x24, 50
mov x23, 2

    mov x10, 0
    mov x3, 123 // eje x
    add x3, x3, x19
    mov x4, 190 // eje y
    add x4, x4, x24
    mov x6, 58 //  largo cuad
    mov x9, x6 
    mov x2, 45 // alto cuadrado
    add x2, x2, x4
    bl Cuadraditos


//////////////////////// 41 Frame //////////////////////////////////  
    bl delay2



    mov x5, SCREEN_WIDTH

	mov x10, 0
    mov x0, x20




bl Fondo

mov x7, 24
mov x19, 0
mov x21, 11
mov x24, 0
mov x23, 2

bl Marciano_numero1


mov x19, 0
mov x21, 11
mov x24, 50
mov x23, 2

bl Marciano_numero2

mov x19, 0
mov x21, 8
mov x24, 150
mov x23, 2

bl Marciano_numero3

mov x16, 195
mov x19, 0
mov x21, 4
mov x24, 150
mov x23, 2

bl Player



    

mov x19, 0
mov x21, 4
mov x24, 50
mov x23, 2



bl Cobertura

mov x19, 0
mov x21, 4
mov x24, 50
mov x23, 2

mov x10, 0
    mov x3, 123 // eje x
    add x3, x3, x19
    mov x4, 190 // eje y
    add x4, x4, x24
    mov x6, 58 //  largo cuad
    mov x9, x6 
    mov x2, 45 // alto cuadrado
    add x2, x2, x4
    bl Cuadraditos


//////////////////////// 42 Frame //////////////////////////////////  
    bl delay2



    mov x5, SCREEN_WIDTH

	mov x10, 0
    mov x0, x20




bl Fondo

mov x7, 24
mov x19, 0
mov x21, 11
mov x24, 0
mov x23, 2

bl Marciano_numero1


mov x19, 0
mov x21, 11
mov x24, 50
mov x23, 2

bl Marciano_numero2

mov x19, 0
mov x21, 8
mov x24, 150
mov x23, 2

bl Marciano_numero3

mov x16, 200
mov x19, 0
mov x21, 4
mov x24, 150
mov x23, 2

bl Player



    

mov x19, 0
mov x21, 4
mov x24, 50
mov x23, 2



bl Cobertura

mov x19, 0
mov x21, 4
mov x24, 50
mov x23, 2

mov x10, 0
    mov x3, 123 // eje x
    add x3, x3, x19
    mov x4, 190 // eje y
    add x4, x4, x24
    mov x6, 58 //  largo cuad
    mov x9, x6 
    mov x2, 45 // alto cuadrado
    add x2, x2, x4
    bl Cuadraditos


//////////////////////// 43 Frame //////////////////////////////////  
    bl delay2



    mov x5, SCREEN_WIDTH

	mov x10, 0
    mov x0, x20




bl Fondo

mov x7, 24
mov x19, 0
mov x21, 11
mov x24, 0
mov x23, 2

bl Marciano_numero1


mov x19, 0
mov x21, 11
mov x24, 50
mov x23, 2

bl Marciano_numero2

mov x19, 0
mov x21, 8
mov x24, 150
mov x23, 2

bl Marciano_numero3

mov x16, 205
mov x19, 0
mov x21, 4
mov x24, 150
mov x23, 2

bl Player



    

mov x19, 0
mov x21, 4
mov x24, 50
mov x23, 2



bl Cobertura

mov x19, 0
mov x21, 4
mov x24, 50
mov x23, 2

mov x10, 0
    mov x3, 123 // eje x
    add x3, x3, x19
    mov x4, 190 // eje y
    add x4, x4, x24
    mov x6, 58 //  largo cuad
    mov x9, x6 
    mov x2, 45 // alto cuadrado
    add x2, x2, x4
    bl Cuadraditos


//////////////////////// 44 Frame //////////////////////////////////  
    bl delay2



    mov x5, SCREEN_WIDTH

	mov x10, 0
    mov x0, x20




bl Fondo

mov x7, 24
mov x19, 0
mov x21, 11
mov x24, 0
mov x23, 2

bl Marciano_numero1


mov x19, 0
mov x21, 11
mov x24, 50
mov x23, 2

bl Marciano_numero2

mov x19, 0
mov x21, 8
mov x24, 150
mov x23, 2

bl Marciano_numero3

mov x16, 210
mov x19, 0
mov x21, 4
mov x24, 150
mov x23, 2

bl Player



    

mov x19, 0
mov x21, 4
mov x24, 50
mov x23, 2



bl Cobertura

mov x19, 0
mov x21, 4
mov x24, 50
mov x23, 2

mov x10, 0
    mov x3, 123 // eje x
    add x3, x3, x19
    mov x4, 190 // eje y
    add x4, x4, x24
    mov x6, 58 //  largo cuad
    mov x9, x6 
    mov x2, 45 // alto cuadrado
    add x2, x2, x4
    bl Cuadraditos


//////////////////////// 45 Frame //////////////////////////////////  
    bl delay2



    mov x5, SCREEN_WIDTH

	mov x10, 0
    mov x0, x20




bl Fondo

mov x7, 27
mov x19, 0
mov x21, 11
mov x24, 0
mov x23, 2

bl Marciano_numero1.2


mov x19, 0
mov x21, 11
mov x24, 50
mov x23, 2

bl Marciano_numero2.2

mov x19, 0
mov x21, 8
mov x24, 150
mov x23, 2

bl Marciano_numero3.2

mov x16, 215
mov x19, 0
mov x21, 4
mov x24, 150
mov x23, 2

bl Player



    

mov x19, 0
mov x21, 4
mov x24, 50
mov x23, 2



bl Cobertura

mov x19, 0
mov x21, 4
mov x24, 50
mov x23, 2

mov x10, 0
    mov x3, 126 // eje x
    add x3, x3, x19
    mov x4, 190 // eje y
    add x4, x4, x24
    mov x6, 58 //  largo cuad
    mov x9, x6 
    mov x2, 45 // alto cuadrado
    add x2, x2, x4
    bl Cuadraditos


//////////////////////// 46 Frame //////////////////////////////////  
    bl delay2



    mov x5, SCREEN_WIDTH

	mov x10, 0
    mov x0, x20




bl Fondo

mov x7, 27
mov x19, 0
mov x21, 11
mov x24, 0
mov x23, 2

bl Marciano_numero1.2


mov x19, 0
mov x21, 11
mov x24, 50
mov x23, 2

bl Marciano_numero2.2

mov x19, 0
mov x21, 8
mov x24, 150
mov x23, 2

bl Marciano_numero3.2

mov x16, 220
mov x19, 0
mov x21, 4
mov x24, 150
mov x23, 2

bl Player



    

mov x19, 0
mov x21, 4
mov x24, 50
mov x23, 2



bl Cobertura

mov x19, 0
mov x21, 4
mov x24, 50
mov x23, 2

mov x10, 0
    mov x3, 126 // eje x
    add x3, x3, x19
    mov x4, 190 // eje y
    add x4, x4, x24
    mov x6, 58 //  largo cuad
    mov x9, x6 
    mov x2, 45 // alto cuadrado
    add x2, x2, x4
    bl Cuadraditos



//////////////////////// 47 Frame //////////////////////////////////  
    bl delay2



    mov x5, SCREEN_WIDTH

	mov x10, 0
    mov x0, x20




bl Fondo

mov x7, 27
mov x19, 0
mov x21, 11
mov x24, 0
mov x23, 2

bl Marciano_numero1.2


mov x19, 0
mov x21, 11
mov x24, 50
mov x23, 2

bl Marciano_numero2.2

mov x19, 0
mov x21, 8
mov x24, 150
mov x23, 2

bl Marciano_numero3.2

mov x16, 225
mov x19, 0
mov x21, 4
mov x24, 150
mov x23, 2

bl Player



    

mov x19, 0
mov x21, 4
mov x24, 50
mov x23, 2



bl Cobertura

mov x19, 0
mov x21, 4
mov x24, 50
mov x23, 2

mov x10, 0
    mov x3, 126 // eje x
    add x3, x3, x19
    mov x4, 190 // eje y
    add x4, x4, x24
    mov x6, 58 //  largo cuad
    mov x9, x6 
    mov x2, 45 // alto cuadrado
    add x2, x2, x4
    bl Cuadraditos



//////////////////////// 48 Frame //////////////////////////////////  
    bl delay2



    mov x5, SCREEN_WIDTH

	mov x10, 0
    mov x0, x20




bl Fondo

mov x7, 27
mov x19, 0
mov x21, 11
mov x24, 0
mov x23, 2

bl Marciano_numero1.2


mov x19, 0
mov x21, 11
mov x24, 50
mov x23, 2

bl Marciano_numero2.2

mov x19, 0
mov x21, 8
mov x24, 150
mov x23, 2

bl Marciano_numero3.2

mov x16, 230
mov x19, 0
mov x21, 4
mov x24, 150
mov x23, 2

bl Player



    

mov x19, 0
mov x21, 4
mov x24, 50
mov x23, 2



bl Cobertura

mov x19, 0
mov x21, 4
mov x24, 50
mov x23, 2

mov x10, 0
    mov x3, 126 // eje x
    add x3, x3, x19
    mov x4, 190 // eje y
    add x4, x4, x24
    mov x6, 58 //  largo cuad
    mov x9, x6 
    mov x2, 45 // alto cuadrado
    add x2, x2, x4
    bl Cuadraditos



//////////////////////// 49 Frame //////////////////////////////////  
    bl delay2



    mov x5, SCREEN_WIDTH

	mov x10, 0
    mov x0, x20




bl Fondo

mov x7, 27
mov x19, 0
mov x21, 11
mov x24, 0
mov x23, 2

bl Marciano_numero1.2


mov x19, 0
mov x21, 11
mov x24, 50
mov x23, 2

bl Marciano_numero2.2

mov x19, 0
mov x21, 8
mov x24, 150
mov x23, 2

bl Marciano_numero3.2

mov x16, 235
mov x19, 0
mov x21, 4
mov x24, 150
mov x23, 2

bl Player



    

mov x19, 0
mov x21, 4
mov x24, 50
mov x23, 2



bl Cobertura

mov x19, 0
mov x21, 4
mov x24, 50
mov x23, 2

mov x10, 0
    mov x3, 126 // eje x
    add x3, x3, x19
    mov x4, 190 // eje y
    add x4, x4, x24
    mov x6, 58 //  largo cuad
    mov x9, x6 
    mov x2, 45 // alto cuadrado
    add x2, x2, x4
    bl Cuadraditos



//////////////////////// 50 Frame //////////////////////////////////  
    bl delay2



    mov x5, SCREEN_WIDTH

	mov x10, 0
    mov x0, x20




bl Fondo

mov x7, 30
mov x19, 0
mov x21, 11
mov x24, 0
mov x23, 2

bl Marciano_numero1


mov x19, 0
mov x21, 11
mov x24, 50
mov x23, 2

bl Marciano_numero2

mov x19, 0
mov x21, 8
mov x24, 150
mov x23, 2

bl Marciano_numero3

mov x16, 240
mov x19, 0
mov x21, 4
mov x24, 150
mov x23, 2

bl Player



    

mov x19, 0
mov x21, 4
mov x24, 50
mov x23, 2



bl Cobertura

mov x19, 0
mov x21, 4
mov x24, 50
mov x23, 2

mov x10, 0
    mov x3, 129 // eje x
    add x3, x3, x19
    mov x4, 190 // eje y
    add x4, x4, x24
    mov x6, 58 //  largo cuad
    mov x9, x6 
    mov x2, 45 // alto cuadrado
    add x2, x2, x4
    bl Cuadraditos


//////////////////////// 51 Frame //////////////////////////////////  
    bl delay2



    mov x5, SCREEN_WIDTH

	mov x10, 0
    mov x0, x20




bl Fondo

mov x7, 30
mov x19, 0
mov x21, 11
mov x24, 0
mov x23, 2

bl Marciano_numero1


mov x19, 0
mov x21, 11
mov x24, 50
mov x23, 2

bl Marciano_numero2

mov x19, 0
mov x21, 8
mov x24, 150
mov x23, 2

bl Marciano_numero3

mov x16, 245
mov x19, 0
mov x21, 4
mov x24, 150
mov x23, 2

bl Player



    

mov x19, 0
mov x21, 4
mov x24, 50
mov x23, 2



bl Cobertura

mov x19, 0
mov x21, 4
mov x24, 50
mov x23, 2

mov x10, 0
    mov x3, 129 // eje x
    add x3, x3, x19
    mov x4, 190 // eje y
    add x4, x4, x24
    mov x6, 58 //  largo cuad
    mov x9, x6 
    mov x2, 45 // alto cuadrado
    add x2, x2, x4
    bl Cuadraditos


//////////////////////// 52 Frame //////////////////////////////////  
    bl delay2



    mov x5, SCREEN_WIDTH

	mov x10, 0
    mov x0, x20




bl Fondo

mov x7, 30
mov x19, 0
mov x21, 11
mov x24, 0
mov x23, 2

bl Marciano_numero1


mov x19, 0
mov x21, 11
mov x24, 50
mov x23, 2

bl Marciano_numero2

mov x19, 0
mov x21, 8
mov x24, 150
mov x23, 2

bl Marciano_numero3

mov x16, 250
mov x19, 0
mov x21, 4
mov x24, 150
mov x23, 2

bl Player



    

mov x19, 0
mov x21, 4
mov x24, 50
mov x23, 2



bl Cobertura

mov x19, 0
mov x21, 4
mov x24, 50
mov x23, 2

mov x10, 0
    mov x3, 129 // eje x
    add x3, x3, x19
    mov x4, 190 // eje y
    add x4, x4, x24
    mov x6, 58 //  largo cuad
    mov x9, x6 
    mov x2, 45 // alto cuadrado
    add x2, x2, x4
    bl Cuadraditos

//////////////////////// 53 Frame //////////////////////////////////  ACA DISPARA
    bl delay2



    mov x5, SCREEN_WIDTH

	mov x10, 0
    mov x0, x20




bl Fondo

mov x7, 30
mov x19, 0
mov x21, 11
mov x24, 0
mov x23, 2

bl Marciano_numero1


mov x19, 0
mov x21, 11
mov x24, 50
mov x23, 2

bl Marciano_numero2

mov x19, 0
mov x21, 8
mov x24, 150
mov x23, 2

bl Marciano_numero3

mov x16, 255
mov x19, 0
mov x21, 4
mov x24, 150
mov x23, 2

bl Player



    

mov x19, 0
mov x21, 4
mov x24, 50
mov x23, 2



bl Cobertura

mov x19, 0
mov x21, 4
mov x24, 50
mov x23, 2

//Disparo de player
movz x10, 0xFF, lsl 16
	movk x10, 0xFFFF, lsl 00
    mov x3, 289 // eje x
    mov x4, 423 // eje y
    mov x2, 12 // largo linea
    add x2, x2, x4 
    bl LineaVertical

mov x10, 0
    mov x3, 129 // eje x
    add x3, x3, x19
    mov x4, 190 // eje y
    add x4, x4, x24
    mov x6, 58 //  largo cuad
    mov x9, x6 
    mov x2, 45 // alto cuadrado
    add x2, x2, x4
    bl Cuadraditos


//////////////////////// 54 Frame //////////////////////////////////  
    bl delay2



    mov x5, SCREEN_WIDTH

	mov x10, 0
    mov x0, x20




bl Fondo

mov x7, 30
mov x19, 0
mov x21, 11
mov x24, 0
mov x23, 2

bl Marciano_numero1


mov x19, 0
mov x21, 11
mov x24, 50
mov x23, 2

bl Marciano_numero2

mov x19, 0
mov x21, 8
mov x24, 150
mov x23, 2

bl Marciano_numero3

mov x16, 255
mov x19, 0
mov x21, 4
mov x24, 150
mov x23, 2

bl Player



    

mov x19, 0
mov x21, 4
mov x24, 50
mov x23, 2



bl Cobertura

mov x19, 0
mov x21, 4
mov x24, 50
mov x23, 2

//Disparo de player
movz x10, 0xFF, lsl 16
	movk x10, 0xFFFF, lsl 00
    mov x3, 289 // eje x
    mov x4, 413 // eje y
    mov x2, 12 // largo linea
    add x2, x2, x4 
    bl LineaVertical


mov x10, 0
    mov x3, 129 // eje x
    add x3, x3, x19
    mov x4, 190 // eje y
    add x4, x4, x24
    mov x6, 58 //  largo cuad
    mov x9, x6 
    mov x2, 45 // alto cuadrado
    add x2, x2, x4
    bl Cuadraditos


//////////////////////// 55 Frame //////////////////////////////////  
    bl delay2



    mov x5, SCREEN_WIDTH

	mov x10, 0
    mov x0, x20




bl Fondo

mov x7, 30
mov x8, 10
mov x19, 0
mov x21, 11
mov x24, 0
mov x23, 2

bl Marciano_numero1.2


mov x19, 0
mov x21, 11
mov x24, 50
mov x23, 2

bl Marciano_numero2.2

mov x19, 0
mov x21, 8
mov x24, 150
mov x23, 2

bl Marciano_numero3.2

mov x16, 255
mov x19, 0
mov x21, 4
mov x24, 150
mov x23, 2

bl Player



    

mov x19, 0
mov x21, 4
mov x24, 50
mov x23, 2



bl Cobertura

mov x19, 0
mov x21, 4
mov x24, 50
mov x23, 2

//Disparo de player
movz x10, 0xFF, lsl 16
	movk x10, 0xFFFF, lsl 00
    mov x3, 289 // eje x
    mov x4, 403 // eje y
    mov x2, 12 // largo linea
    add x2, x2, x4 
    bl LineaVertical


mov x10, 0
    mov x3, 129 // eje x
    add x3, x3, x19
    mov x4, 200 // eje y
    add x4, x4, x24
    mov x6, 58 //  largo cuad
    mov x9, x6 
    mov x2, 45 // alto cuadrado
    add x2, x2, x4
    bl Cuadraditos

//////////////////////// 56 Frame //////////////////////////////////  
    bl delay2



    mov x5, SCREEN_WIDTH

	mov x10, 0
    mov x0, x20




bl Fondo

mov x7, 30
mov x8, 10
mov x19, 0
mov x21, 11
mov x24, 0
mov x23, 2

bl Marciano_numero1.2


mov x19, 0
mov x21, 11
mov x24, 50
mov x23, 2

bl Marciano_numero2.2

mov x19, 0
mov x21, 8
mov x24, 150
mov x23, 2

bl Marciano_numero3.2

mov x16, 260
mov x19, 0
mov x21, 4
mov x24, 150
mov x23, 2

bl Player



    

mov x19, 0
mov x21, 4
mov x24, 50
mov x23, 2



bl Cobertura

mov x19, 0
mov x21, 4
mov x24, 50
mov x23, 2

//Disparo de player
movz x10, 0xFF, lsl 16
	movk x10, 0xFFFF, lsl 00
    mov x3, 289 // eje x
    mov x4, 393 // eje y
    mov x2, 12 // largo linea
    add x2, x2, x4 
    bl LineaVertical


mov x10, 0
    mov x3, 129 // eje x
    add x3, x3, x19
    mov x4, 200 // eje y
    add x4, x4, x24
    mov x6, 58 //  largo cuad
    mov x9, x6 
    mov x2, 45 // alto cuadrado
    add x2, x2, x4
    bl Cuadraditos

//////////////////////// 57 Frame //////////////////////////////////  
    bl delay2



    mov x5, SCREEN_WIDTH

	mov x10, 0
    mov x0, x20




bl Fondo

mov x7, 30
mov x8, 10
mov x19, 0
mov x21, 11
mov x24, 0
mov x23, 2

bl Marciano_numero1.2


mov x19, 0
mov x21, 11
mov x24, 50
mov x23, 2

bl Marciano_numero2.2

mov x19, 0
mov x21, 8
mov x24, 150
mov x23, 2

bl Marciano_numero3.2

mov x16, 265
mov x19, 0
mov x21, 4
mov x24, 150
mov x23, 2

bl Player



    

mov x19, 0
mov x21, 4
mov x24, 50
mov x23, 2



bl Cobertura

mov x19, 0
mov x21, 4
mov x24, 50
mov x23, 2

//Disparo de player
movz x10, 0xFF, lsl 16
	movk x10, 0xFFFF, lsl 00
    mov x3, 289 // eje x
    mov x4, 383 // eje y
    mov x2, 12 // largo linea
    add x2, x2, x4 
    bl LineaVertical

mov x10, 0
    mov x3, 129 // eje x
    add x3, x3, x19
    mov x4, 200 // eje y
    add x4, x4, x24
    mov x6, 58 //  largo cuad
    mov x9, x6 
    mov x2, 45 // alto cuadrado
    add x2, x2, x4
    bl Cuadraditos


//////////////////////// 58 Frame //////////////////////////////////  
    bl delay2



    mov x5, SCREEN_WIDTH

	mov x10, 0
    mov x0, x20




bl Fondo

mov x7, 30
mov x8, 10
mov x19, 0
mov x21, 11
mov x24, 0
mov x23, 2

bl Marciano_numero1.2


mov x19, 0
mov x21, 11
mov x24, 50
mov x23, 2

bl Marciano_numero2.2

mov x19, 0
mov x21, 8
mov x24, 150
mov x23, 2

bl Marciano_numero3.2

mov x16, 270
mov x19, 0
mov x21, 4
mov x24, 150
mov x23, 2

bl Player



    

mov x19, 0
mov x21, 4
mov x24, 50
mov x23, 2



bl Cobertura

mov x19, 0
mov x21, 4
mov x24, 50
mov x23, 2

//Disparo de player
movz x10, 0xFF, lsl 16
	movk x10, 0xFFFF, lsl 00
    mov x3, 289 // eje x
    mov x4, 373 // eje y
    mov x2, 12 // largo linea
    add x2, x2, x4 
    bl LineaVertical

mov x10, 0
    mov x3, 129 // eje x
    add x3, x3, x19
    mov x4, 200 // eje y
    add x4, x4, x24
    mov x6, 58 //  largo cuad
    mov x9, x6 
    mov x2, 45 // alto cuadrado
    add x2, x2, x4
    bl Cuadraditos


//////////////////////// 59 Frame //////////////////////////////////  
    bl delay2



    mov x5, SCREEN_WIDTH

	mov x10, 0
    mov x0, x20




bl Fondo

mov x7, 30
mov x8, 10
mov x19, 0
mov x21, 11
mov x24, 0
mov x23, 2

bl Marciano_numero1.2


mov x19, 0
mov x21, 11
mov x24, 50
mov x23, 2

bl Marciano_numero2.2

mov x19, 0
mov x21, 8
mov x24, 150
mov x23, 2

bl Marciano_numero3.2

mov x16, 275
mov x19, 0
mov x21, 4
mov x24, 150
mov x23, 2

bl Player



    

mov x19, 0
mov x21, 4
mov x24, 50
mov x23, 2



bl Cobertura

mov x19, 0
mov x21, 4
mov x24, 50
mov x23, 2

//Disparo de player
movz x10, 0xFF, lsl 16
	movk x10, 0xFFFF, lsl 00
    mov x3, 289 // eje x
    mov x4, 363 // eje y
    mov x2, 12 // largo linea
    add x2, x2, x4 
    bl LineaVertical

mov x10, 0
    mov x3, 129 // eje x
    add x3, x3, x19
    mov x4, 200 // eje y
    add x4, x4, x24
    mov x6, 58 //  largo cuad
    mov x9, x6 
    mov x2, 45 // alto cuadrado
    add x2, x2, x4
    bl Cuadraditos

//////////////////////// 60 Frame //////////////////////////////////  
    bl delay2



    mov x5, SCREEN_WIDTH

	mov x10, 0
    mov x0, x20




bl Fondo

mov x7, 27
mov x8, 10
mov x19, 0
mov x21, 11
mov x24, 0
mov x23, 2

bl Marciano_numero1


mov x19, 0
mov x21, 11
mov x24, 50
mov x23, 2

bl Marciano_numero2

mov x19, 0
mov x21, 8
mov x24, 150
mov x23, 2

bl Marciano_numero3

mov x16, 280
mov x19, 0
mov x21, 4
mov x24, 150
mov x23, 2

bl Player



    

mov x19, 0
mov x21, 4
mov x24, 50
mov x23, 2



bl Cobertura

mov x19, 0
mov x21, 4
mov x24, 50
mov x23, 2

//Disparo de player
movz x10, 0xFF, lsl 16
	movk x10, 0xFFFF, lsl 00
    mov x3, 289 // eje x
    mov x4, 353 // eje y
    mov x2, 12 // largo linea
    add x2, x2, x4 
    bl LineaVertical

mov x10, 0
    mov x3, 126 // eje x
    add x3, x3, x19
    mov x4, 200 // eje y
    add x4, x4, x24
    mov x6, 58 //  largo cuad
    mov x9, x6 
    mov x2, 45 // alto cuadrado
    add x2, x2, x4
    bl Cuadraditos


//////////////////////// 61 Frame //////////////////////////////////  
    bl delay2



    mov x5, SCREEN_WIDTH

	mov x10, 0
    mov x0, x20




bl Fondo

mov x7, 27
mov x8, 10
mov x19, 0
mov x21, 11
mov x24, 0
mov x23, 2

bl Marciano_numero1


mov x19, 0
mov x21, 11
mov x24, 50
mov x23, 2

bl Marciano_numero2

mov x19, 0
mov x21, 8
mov x24, 150
mov x23, 2

bl Marciano_numero3

mov x16, 285
mov x19, 0
mov x21, 4
mov x24, 150
mov x23, 2

bl Player



    

mov x19, 0
mov x21, 4
mov x24, 50
mov x23, 2



bl Cobertura

mov x19, 0
mov x21, 4
mov x24, 50
mov x23, 2

//Disparo de player
movz x10, 0xFF, lsl 16
	movk x10, 0xFFFF, lsl 00
    mov x3, 289 // eje x
    mov x4, 343 // eje y
    mov x2, 12 // largo linea
    add x2, x2, x4 
    bl LineaVertical

mov x10, 0
    mov x3, 126 // eje x
    add x3, x3, x19
    mov x4, 200 // eje y
    add x4, x4, x24
    mov x6, 58 //  largo cuad
    mov x9, x6 
    mov x2, 45 // alto cuadrado
    add x2, x2, x4
    bl Cuadraditos


//////////////////////// 62 Frame //////////////////////////////////  
    bl delay2



    mov x5, SCREEN_WIDTH

	mov x10, 0
    mov x0, x20




bl Fondo

mov x7, 27
mov x8, 10
mov x19, 0
mov x21, 11
mov x24, 0
mov x23, 2

bl Marciano_numero1


mov x19, 0
mov x21, 11
mov x24, 50
mov x23, 2

bl Marciano_numero2

mov x19, 0
mov x21, 8
mov x24, 150
mov x23, 2

bl Marciano_numero3

mov x16, 290
mov x19, 0
mov x21, 4
mov x24, 150
mov x23, 2

bl Player



    

mov x19, 0
mov x21, 4
mov x24, 50
mov x23, 2



bl Cobertura

mov x19, 0
mov x21, 4
mov x24, 50
mov x23, 2

//Disparo de player
movz x10, 0xFF, lsl 16
	movk x10, 0xFFFF, lsl 00
    mov x3, 289 // eje x
    mov x4, 333 // eje y
    mov x2, 12 // largo linea
    add x2, x2, x4 
    bl LineaVertical

mov x10, 0
    mov x3, 126 // eje x
    add x3, x3, x19
    mov x4, 200 // eje y
    add x4, x4, x24
    mov x6, 58 //  largo cuad
    mov x9, x6 
    mov x2, 45 // alto cuadrado
    add x2, x2, x4
    bl Cuadraditos


//////////////////////// 63 Frame //////////////////////////////////  
    bl delay2



    mov x5, SCREEN_WIDTH

	mov x10, 0
    mov x0, x20




bl Fondo

mov x7, 27
mov x8, 10
mov x19, 0
mov x21, 11
mov x24, 0
mov x23, 2

bl Marciano_numero1


mov x19, 0
mov x21, 11
mov x24, 50
mov x23, 2

bl Marciano_numero2

mov x19, 0
mov x21, 8
mov x24, 150
mov x23, 2

bl Marciano_numero3

mov x16, 295
mov x19, 0
mov x21, 4
mov x24, 150
mov x23, 2

bl Player



    

mov x19, 0
mov x21, 4
mov x24, 50
mov x23, 2



bl Cobertura

mov x19, 0
mov x21, 4
mov x24, 50
mov x23, 2

//Disparo de player
movz x10, 0xFF, lsl 16
	movk x10, 0xFFFF, lsl 00
    mov x3, 289 // eje x
    mov x4, 323 // eje y
    mov x2, 12 // largo linea
    add x2, x2, x4 
    bl LineaVertical

mov x10, 0
    mov x3, 126 // eje x
    add x3, x3, x19
    mov x4, 200 // eje y
    add x4, x4, x24
    mov x6, 58 //  largo cuad
    mov x9, x6 
    mov x2, 45 // alto cuadrado
    add x2, x2, x4
    bl Cuadraditos



//////////////////////// 64 Frame //////////////////////////////////  
    bl delay2



    mov x5, SCREEN_WIDTH

	mov x10, 0
    mov x0, x20




bl Fondo

mov x7, 27
mov x8, 10
mov x19, 0
mov x21, 11
mov x24, 0
mov x23, 2

bl Marciano_numero1


mov x19, 0
mov x21, 11
mov x24, 50
mov x23, 2

bl Marciano_numero2

mov x19, 0
mov x21, 8
mov x24, 150
mov x23, 2

bl Marciano_numero3

mov x16, 300
mov x19, 0
mov x21, 4
mov x24, 150
mov x23, 2

bl Player



    

mov x19, 0
mov x21, 4
mov x24, 50
mov x23, 2



bl Cobertura

mov x19, 0
mov x21, 4
mov x24, 50
mov x23, 2

//Disparo de player
movz x10, 0xFF, lsl 16
	movk x10, 0xFFFF, lsl 00
    mov x3, 289 // eje x
    mov x4, 313 // eje y
    mov x2, 12 // largo linea
    add x2, x2, x4 
    bl LineaVertical

mov x10, 0
    mov x3, 126 // eje x
    add x3, x3, x19
    mov x4, 200 // eje y
    add x4, x4, x24
    mov x6, 58 //  largo cuad
    mov x9, x6 
    mov x2, 45 // alto cuadrado
    add x2, x2, x4
    bl Cuadraditos

mov x18, 280
mov x17, 10
bl DisparosMarcianos



//////////////////////// 65 Frame //////////////////////////////////  
    bl delay2



    mov x5, SCREEN_WIDTH

	mov x10, 0
    mov x0, x20




bl Fondo

mov x7, 24
mov x8, 10
mov x19, 0
mov x21, 11
mov x24, 0
mov x23, 2

bl Marciano_numero1.2


mov x19, 0
mov x21, 11
mov x24, 50
mov x23, 2

bl Marciano_numero2.2

mov x19, 0
mov x21, 8
mov x24, 150
mov x23, 2

bl Marciano_numero3.2

mov x16, 305
mov x19, 0
mov x21, 4
mov x24, 150
mov x23, 2

bl Player



    

mov x19, 0
mov x21, 4
mov x24, 50
mov x23, 2



bl Cobertura

mov x19, 0
mov x21, 4
mov x24, 50
mov x23, 2

//Disparo de player
movz x10, 0xFF, lsl 16
	movk x10, 0xFFFF, lsl 00
    mov x3, 289 // eje x
    mov x4, 303 // eje y
    mov x2, 12 // largo linea
    add x2, x2, x4 
    bl LineaVertical

mov x10, 0
    mov x3, 123 // eje x
    add x3, x3, x19
    mov x4, 200 // eje y
    add x4, x4, x24
    mov x6, 58 //  largo cuad
    mov x9, x6 
    mov x2, 45 // alto cuadrado
    add x2, x2, x4
    bl Cuadraditos

mov x18, 280
mov x17, 20
bl DisparosMarcianos


//////////////////////// 66 Frame //////////////////////////////////  
    bl delay2



    mov x5, SCREEN_WIDTH

	mov x10, 0
    mov x0, x20




bl Fondo

mov x7, 24
mov x8, 10
mov x19, 0
mov x21, 11
mov x24, 0
mov x23, 2

bl Marciano_numero1.2


mov x19, 0
mov x21, 11
mov x24, 50
mov x23, 2

bl Marciano_numero2.2

mov x19, 0
mov x21, 8
mov x24, 150
mov x23, 2

bl Marciano_numero3.2

mov x16, 310
mov x19, 0
mov x21, 4
mov x24, 150
mov x23, 2

bl Player



    

mov x19, 0
mov x21, 4
mov x24, 50
mov x23, 2



bl Cobertura

mov x19, 0
mov x21, 4
mov x24, 50
mov x23, 2

//Disparo de player
movz x10, 0xFF, lsl 16
	movk x10, 0xFFFF, lsl 00
    mov x3, 289 // eje x
    mov x4, 293 // eje y
    mov x2, 12 // largo linea
    add x2, x2, x4 
    bl LineaVertical

mov x10, 0
    mov x3, 123 // eje x
    add x3, x3, x19
    mov x4, 200 // eje y
    add x4, x4, x24
    mov x6, 58 //  largo cuad
    mov x9, x6 
    mov x2, 45 // alto cuadrado
    add x2, x2, x4
    bl Cuadraditos

mov x18, 280
mov x17, 30
bl DisparosMarcianos

//////////////////////// 67 Frame //////////////////////////////////  
    bl delay2



    mov x5, SCREEN_WIDTH

	mov x10, 0
    mov x0, x20




bl Fondo

mov x7, 24
mov x8, 10
mov x19, 0
mov x21, 11
mov x24, 0
mov x23, 2

bl Marciano_numero1.2


mov x19, 0
mov x21, 11
mov x24, 50
mov x23, 2

bl Marciano_numero2.2

mov x19, 0
mov x21, 8
mov x24, 150
mov x23, 2

bl Marciano_numero3.2

mov x16, 315
mov x19, 0
mov x21, 4
mov x24, 150
mov x23, 2

bl Player



    

mov x19, 0
mov x21, 4
mov x24, 50
mov x23, 2



bl Cobertura

mov x19, 0
mov x21, 4
mov x24, 50
mov x23, 2

//HITMARKER
    mov x10, 0
    mov x3, 265 // eje x
    add x3, x3, x19
    mov x4, 200 // eje y
    add x4, x4, x24
    mov x6, 58 //  largo cuad
    mov x9, x6 
    mov x2, 45 // alto cuadrado
    add x2, x2, x4
    bl Cuadraditos



bl Explosion2


mov x10, 0
    mov x3, 123 // eje x
    add x3, x3, x19
    mov x4, 200 // eje y
    add x4, x4, x24
    mov x6, 58 //  largo cuad
    mov x9, x6 
    mov x2, 45 // alto cuadrado
    add x2, x2, x4
    bl Cuadraditos

mov x18, 280
mov x17, 40
bl DisparosMarcianos

//////////////////////// 68 Frame //////////////////////////////////  
    bl delay2



    mov x5, SCREEN_WIDTH

	mov x10, 0
    mov x0, x20




bl Fondo

mov x7, 24
mov x8, 10
mov x19, 0
mov x21, 11
mov x24, 0
mov x23, 2

bl Marciano_numero1.2


mov x19, 0
mov x21, 11
mov x24, 50
mov x23, 2

bl Marciano_numero2.2

mov x19, 0
mov x21, 8
mov x24, 150
mov x23, 2

bl Marciano_numero3.2

mov x16, 320
mov x19, 0
mov x21, 4
mov x24, 150
mov x23, 2

bl Player



    

mov x19, 0
mov x21, 4
mov x24, 50
mov x23, 2



bl Cobertura

mov x19, 0
mov x21, 4
mov x24, 50
mov x23, 2


    mov x10, 0
    mov x3, 265 // eje x
    add x3, x3, x19
    mov x4, 200 // eje y
    add x4, x4, x24
    mov x6, 58 //  largo cuad
    mov x9, x6 
    mov x2, 45 // alto cuadrado
    add x2, x2, x4
    bl Cuadraditos

bl Explosion2


mov x10, 0
    mov x3, 123 // eje x
    add x3, x3, x19
    mov x4, 200 // eje y
    add x4, x4, x24
    mov x6, 58 //  largo cuad
    mov x9, x6 
    mov x2, 45 // alto cuadrado
    add x2, x2, x4
    bl Cuadraditos

mov x18, 280
mov x17, 50
bl DisparosMarcianos

//////////////////////// 69 Frame //////////////////////////////////  
    bl delay2



    mov x5, SCREEN_WIDTH

	mov x10, 0
    mov x0, x20




bl Fondo

mov x7, 24
mov x8, 10
mov x19, 0
mov x21, 11
mov x24, 0
mov x23, 2

bl Marciano_numero1.2


mov x19, 0
mov x21, 11
mov x24, 50
mov x23, 2

bl Marciano_numero2.2

mov x19, 0
mov x21, 8
mov x24, 150
mov x23, 2

bl Marciano_numero3.2

mov x16, 325
mov x19, 0
mov x21, 4
mov x24, 150
mov x23, 2

bl Player



    

mov x19, 0
mov x21, 4
mov x24, 50
mov x23, 2



bl Cobertura

mov x19, 0
mov x21, 4
mov x24, 50
mov x23, 2

    mov x10, 0
    mov x3, 265 // eje x
    add x3, x3, x19
    mov x4, 200 // eje y
    add x4, x4, x24
    mov x6, 58 //  largo cuad
    mov x9, x6 
    mov x2, 45 // alto cuadrado
    add x2, x2, x4
    bl Cuadraditos

mov x10, 0
    mov x3, 123 // eje x
    add x3, x3, x19
    mov x4, 200 // eje y
    add x4, x4, x24
    mov x6, 58 //  largo cuad
    mov x9, x6 
    mov x2, 45 // alto cuadrado
    add x2, x2, x4
    bl Cuadraditos

mov x18, 280
mov x17, 60
bl DisparosMarcianos

//////////////////////// 70 Frame //////////////////////////////////  
    bl delay2



    mov x5, SCREEN_WIDTH

	mov x10, 0
    mov x0, x20




bl Fondo

mov x7, 21
mov x8, 10
mov x19, 0
mov x21, 11
mov x24, 0
mov x23, 2

bl Marciano_numero1


mov x19, 0
mov x21, 11
mov x24, 50
mov x23, 2

bl Marciano_numero2

mov x19, 0
mov x21, 8
mov x24, 150
mov x23, 2

bl Marciano_numero3

mov x16, 330
mov x19, 0
mov x21, 4
mov x24, 150
mov x23, 2

bl Player



    

mov x19, 0
mov x21, 4
mov x24, 50
mov x23, 2



bl Cobertura

mov x19, 0
mov x21, 4
mov x24, 50
mov x23, 2

    mov x10, 0
    mov x3, 262 // eje x
    add x3, x3, x19
    mov x4, 200 // eje y
    add x4, x4, x24
    mov x6, 58 //  largo cuad
    mov x9, x6 
    mov x2, 45 // alto cuadrado
    add x2, x2, x4
    bl Cuadraditos

mov x10, 0
    mov x3, 120 // eje x
    add x3, x3, x19
    mov x4, 200 // eje y
    add x4, x4, x24
    mov x6, 58 //  largo cuad
    mov x9, x6 
    mov x2, 45 // alto cuadrado
    add x2, x2, x4
    bl Cuadraditos

mov x18, 280
mov x17, 70
bl DisparosMarcianos

//////////////////////// 71 Frame //////////////////////////////////  
    bl delay2



    mov x5, SCREEN_WIDTH

	mov x10, 0
    mov x0, x20




bl Fondo

mov x7, 21
mov x8, 10
mov x19, 0
mov x21, 11
mov x24, 0
mov x23, 2

bl Marciano_numero1


mov x19, 0
mov x21, 11
mov x24, 50
mov x23, 2

bl Marciano_numero2

mov x19, 0
mov x21, 8
mov x24, 150
mov x23, 2

bl Marciano_numero3

mov x16, 335
mov x19, 0
mov x21, 4
mov x24, 150
mov x23, 2

bl Player



    

mov x19, 0
mov x21, 4
mov x24, 50
mov x23, 2



bl Cobertura

mov x19, 0
mov x21, 4
mov x24, 50
mov x23, 2

    mov x10, 0
    mov x3, 262 // eje x
    add x3, x3, x19
    mov x4, 200 // eje y
    add x4, x4, x24
    mov x6, 58 //  largo cuad
    mov x9, x6 
    mov x2, 45 // alto cuadrado
    add x2, x2, x4
    bl Cuadraditos

mov x10, 0
    mov x3, 120 // eje x
    add x3, x3, x19
    mov x4, 200 // eje y
    add x4, x4, x24
    mov x6, 58 //  largo cuad
    mov x9, x6 
    mov x2, 45 // alto cuadrado
    add x2, x2, x4
    bl Cuadraditos

mov x18, 280
mov x17, 80
bl DisparosMarcianos

//////////////////////// 72 Frame //////////////////////////////////  
    bl delay2



    mov x5, SCREEN_WIDTH

	mov x10, 0
    mov x0, x20




bl Fondo

mov x7, 21
mov x8, 10
mov x19, 0
mov x21, 11
mov x24, 0
mov x23, 2

bl Marciano_numero1


mov x19, 0
mov x21, 11
mov x24, 50
mov x23, 2

bl Marciano_numero2

mov x19, 0
mov x21, 8
mov x24, 150
mov x23, 2

bl Marciano_numero3

mov x16, 340
mov x19, 0
mov x21, 4
mov x24, 150
mov x23, 2

bl Player



    

mov x19, 0
mov x21, 4
mov x24, 50
mov x23, 2



bl Cobertura

mov x19, 0
mov x21, 4
mov x24, 50
mov x23, 2

    mov x10, 0
    mov x3, 262 // eje x
    add x3, x3, x19
    mov x4, 200 // eje y
    add x4, x4, x24
    mov x6, 58 //  largo cuad
    mov x9, x6 
    mov x2, 45 // alto cuadrado
    add x2, x2, x4
    bl Cuadraditos

mov x10, 0
    mov x3, 120 // eje x
    add x3, x3, x19
    mov x4, 200 // eje y
    add x4, x4, x24
    mov x6, 58 //  largo cuad
    mov x9, x6 
    mov x2, 45 // alto cuadrado
    add x2, x2, x4
    bl Cuadraditos

mov x18, 280
mov x17, 90
bl DisparosMarcianos

//////////////////////// 73 Frame //////////////////////////////////  
    bl delay2



    mov x5, SCREEN_WIDTH

	mov x10, 0
    mov x0, x20




bl Fondo

mov x7, 21
mov x8, 10
mov x19, 0
mov x21, 11
mov x24, 0
mov x23, 2

bl Marciano_numero1


mov x19, 0
mov x21, 11
mov x24, 50
mov x23, 2

bl Marciano_numero2

mov x19, 0
mov x21, 8
mov x24, 150
mov x23, 2

bl Marciano_numero3

mov x16, 345
mov x19, 0
mov x21, 4
mov x24, 150
mov x23, 2

bl Player



    

mov x19, 0
mov x21, 4
mov x24, 50
mov x23, 2



bl Cobertura

mov x19, 0
mov x21, 4
mov x24, 50
mov x23, 2

    mov x10, 0
    mov x3, 262 // eje x
    add x3, x3, x19
    mov x4, 200 // eje y
    add x4, x4, x24
    mov x6, 58 //  largo cuad
    mov x9, x6 
    mov x2, 45 // alto cuadrado
    add x2, x2, x4
    bl Cuadraditos

mov x10, 0
    mov x3, 120 // eje x
    add x3, x3, x19
    mov x4, 200 // eje y
    add x4, x4, x24
    mov x6, 58 //  largo cuad
    mov x9, x6 
    mov x2, 45 // alto cuadrado
    add x2, x2, x4
    bl Cuadraditos

mov x18, 280
mov x17, 100
bl DisparosMarcianos

//////////////////////// 74 Frame //////////////////////////////////  
    bl delay2



    mov x5, SCREEN_WIDTH

	mov x10, 0
    mov x0, x20




bl Fondo

mov x7, 21
mov x8, 10
mov x19, 0
mov x21, 11
mov x24, 0
mov x23, 2

bl Marciano_numero1


mov x19, 0
mov x21, 11
mov x24, 50
mov x23, 2

bl Marciano_numero2

mov x19, 0
mov x21, 8
mov x24, 150
mov x23, 2

bl Marciano_numero3

mov x16, 350
mov x19, 0
mov x21, 4
mov x24, 150
mov x23, 2

bl Player



    

mov x19, 0
mov x21, 4
mov x24, 50
mov x23, 2



bl Cobertura

mov x19, 0
mov x21, 4
mov x24, 50
mov x23, 2

    mov x10, 0
    mov x3, 262 // eje x
    add x3, x3, x19
    mov x4, 200 // eje y
    add x4, x4, x24
    mov x6, 58 //  largo cuad
    mov x9, x6 
    mov x2, 45 // alto cuadrado
    add x2, x2, x4
    bl Cuadraditos

mov x10, 0
    mov x3, 120 // eje x
    add x3, x3, x19
    mov x4, 200 // eje y
    add x4, x4, x24
    mov x6, 58 //  largo cuad
    mov x9, x6 
    mov x2, 45 // alto cuadrado
    add x2, x2, x4
    bl Cuadraditos

mov x18, 280
mov x17, 110
bl DisparosMarcianos

//////////////////////// 75 Frame //////////////////////////////////  
    bl delay2



    mov x5, SCREEN_WIDTH

	mov x10, 0
    mov x0, x20




bl Fondo

mov x7, 18
mov x8, 10
mov x19, 0
mov x21, 11
mov x24, 0
mov x23, 2

bl Marciano_numero1.2


mov x19, 0
mov x21, 11
mov x24, 50
mov x23, 2

bl Marciano_numero2.2

mov x19, 0
mov x21, 8
mov x24, 150
mov x23, 2

bl Marciano_numero3.2

mov x16, 355
mov x19, 0
mov x21, 4
mov x24, 150
mov x23, 2

bl Player



    

mov x19, 0
mov x21, 4
mov x24, 50
mov x23, 2



bl Cobertura

mov x19, 0
mov x21, 4
mov x24, 50
mov x23, 2

    mov x10, 0
    mov x3, 259 // eje x
    add x3, x3, x19
    mov x4, 200 // eje y
    add x4, x4, x24
    mov x6, 58 //  largo cuad
    mov x9, x6 
    mov x2, 45 // alto cuadrado
    add x2, x2, x4
    bl Cuadraditos

mov x10, 0
    mov x3, 117 // eje x
    add x3, x3, x19
    mov x4, 200 // eje y
    add x4, x4, x24
    mov x6, 58 //  largo cuad
    mov x9, x6 
    mov x2, 45 // alto cuadrado
    add x2, x2, x4
    bl Cuadraditos

mov x18, 280
mov x17, 120
bl DisparosMarcianos

//////////////////////// 76 Frame //////////////////////////////////  
    bl delay2



    mov x5, SCREEN_WIDTH

	mov x10, 0
    mov x0, x20




bl Fondo

mov x7, 18
mov x8, 10
mov x19, 0
mov x21, 11
mov x24, 0
mov x23, 2

bl Marciano_numero1.2


mov x19, 0
mov x21, 11
mov x24, 50
mov x23, 2

bl Marciano_numero2.2

mov x19, 0
mov x21, 8
mov x24, 150
mov x23, 2

bl Marciano_numero3.2

mov x16, 360
mov x19, 0
mov x21, 4
mov x24, 150
mov x23, 2

bl Player



    

mov x19, 0
mov x21, 4
mov x24, 50
mov x23, 2



bl Cobertura

mov x19, 0
mov x21, 4
mov x24, 50
mov x23, 2

    mov x10, 0
    mov x3, 259 // eje x
    add x3, x3, x19
    mov x4, 200 // eje y
    add x4, x4, x24
    mov x6, 58 //  largo cuad
    mov x9, x6 
    mov x2, 45 // alto cuadrado
    add x2, x2, x4
    bl Cuadraditos

mov x10, 0
    mov x3, 117 // eje x
    add x3, x3, x19
    mov x4, 200 // eje y
    add x4, x4, x24
    mov x6, 58 //  largo cuad
    mov x9, x6 
    mov x2, 45 // alto cuadrado
    add x2, x2, x4
    bl Cuadraditos

mov x18, 280
mov x17, 130
bl DisparosMarcianos

//////////////////////// 77 Frame //////////////////////////////////  
    bl delay2



    mov x5, SCREEN_WIDTH

	mov x10, 0
    mov x0, x20




bl Fondo

mov x7, 18
mov x8, 10
mov x19, 0
mov x21, 11
mov x24, 0
mov x23, 2

bl Marciano_numero1.2


mov x19, 0
mov x21, 11
mov x24, 50
mov x23, 2

bl Marciano_numero2.2

mov x19, 0
mov x21, 8
mov x24, 150
mov x23, 2

bl Marciano_numero3.2

mov x16, 365
mov x19, 0
mov x21, 4
mov x24, 150
mov x23, 2

bl Player



    

mov x19, 0
mov x21, 4
mov x24, 50
mov x23, 2



bl Cobertura

mov x19, 0
mov x21, 4
mov x24, 50
mov x23, 2

    mov x10, 0
    mov x3, 259 // eje x
    add x3, x3, x19
    mov x4, 200 // eje y
    add x4, x4, x24
    mov x6, 58 //  largo cuad
    mov x9, x6 
    mov x2, 45 // alto cuadrado
    add x2, x2, x4
    bl Cuadraditos

mov x10, 0
    mov x3, 117 // eje x
    add x3, x3, x19
    mov x4, 200 // eje y
    add x4, x4, x24
    mov x6, 58 //  largo cuad
    mov x9, x6 
    mov x2, 45 // alto cuadrado
    add x2, x2, x4
    bl Cuadraditos

mov x18, 280
mov x17, 140
bl DisparosMarcianos


//////////////////////// 78 Frame //////////////////////////////////  
    bl delay2



    mov x5, SCREEN_WIDTH

	mov x10, 0
    mov x0, x20




bl Fondo

mov x7, 18
mov x8, 10
mov x19, 0
mov x21, 11
mov x24, 0
mov x23, 2

bl Marciano_numero1.2


mov x19, 0
mov x21, 11
mov x24, 50
mov x23, 2

bl Marciano_numero2.2

mov x19, 0
mov x21, 8
mov x24, 150
mov x23, 2

bl Marciano_numero3.2

mov x16, 370
mov x19, 0
mov x21, 4
mov x24, 150
mov x23, 2

bl Player



    

mov x19, 0
mov x21, 4
mov x24, 50
mov x23, 2



bl Cobertura

mov x19, 0
mov x21, 4
mov x24, 50
mov x23, 2

    mov x10, 0
    mov x3, 259 // eje x
    add x3, x3, x19
    mov x4, 200 // eje y
    add x4, x4, x24
    mov x6, 58 //  largo cuad
    mov x9, x6 
    mov x2, 45 // alto cuadrado
    add x2, x2, x4
    bl Cuadraditos

mov x10, 0
    mov x3, 117 // eje x
    add x3, x3, x19
    mov x4, 200 // eje y
    add x4, x4, x24
    mov x6, 58 //  largo cuad
    mov x9, x6 
    mov x2, 45 // alto cuadrado
    add x2, x2, x4
    bl Cuadraditos

mov x18, 280
mov x17, 150
bl DisparosMarcianos


//////////////////////// 79 Frame //////////////////////////////////  
    bl delay2



    mov x5, SCREEN_WIDTH

	mov x10, 0
    mov x0, x20




bl Fondo

mov x7, 18
mov x8, 10
mov x19, 0
mov x21, 11
mov x24, 0
mov x23, 2

bl Marciano_numero1.2


mov x19, 0
mov x21, 11
mov x24, 50
mov x23, 2

bl Marciano_numero2.2

mov x19, 0
mov x21, 8
mov x24, 150
mov x23, 2

bl Marciano_numero3.2

mov x16, 375
mov x19, 0
mov x21, 4
mov x24, 150
mov x23, 2

bl Player



    

mov x19, 0
mov x21, 4
mov x24, 50
mov x23, 2



bl Cobertura

mov x19, 0
mov x21, 4
mov x24, 50
mov x23, 2

    mov x10, 0
    mov x3, 259 // eje x
    add x3, x3, x19
    mov x4, 200 // eje y
    add x4, x4, x24
    mov x6, 58 //  largo cuad
    mov x9, x6 
    mov x2, 45 // alto cuadrado
    add x2, x2, x4
    bl Cuadraditos

mov x10, 0
    mov x3, 117 // eje x
    add x3, x3, x19
    mov x4, 200 // eje y
    add x4, x4, x24
    mov x6, 58 //  largo cuad
    mov x9, x6 
    mov x2, 45 // alto cuadrado
    add x2, x2, x4
    bl Cuadraditos

mov x18, 280
mov x17, 160
bl DisparosMarcianos


//////////////////////// 80 Frame //////////////////////////////////  
    bl delay2



    mov x5, SCREEN_WIDTH

	mov x10, 0
    mov x0, x20




bl Fondo

mov x7, 15
mov x8, 10
mov x19, 0
mov x21, 11
mov x24, 0
mov x23, 2

bl Marciano_numero1


mov x19, 0
mov x21, 11
mov x24, 50
mov x23, 2

bl Marciano_numero2

mov x19, 0
mov x21, 8
mov x24, 150
mov x23, 2

bl Marciano_numero3

mov x16, 380
mov x19, 0
mov x21, 4
mov x24, 150
mov x23, 2

bl Player



    

mov x19, 0
mov x21, 4
mov x24, 50
mov x23, 2



bl Cobertura

mov x19, 0
mov x21, 4
mov x24, 50
mov x23, 2

    mov x10, 0
    mov x3, 256 // eje x
    add x3, x3, x19
    mov x4, 200 // eje y
    add x4, x4, x24
    mov x6, 58 //  largo cuad
    mov x9, x6 
    mov x2, 45 // alto cuadrado
    add x2, x2, x4
    bl Cuadraditos

mov x10, 0
    mov x3, 114 // eje x
    add x3, x3, x19
    mov x4, 200 // eje y
    add x4, x4, x24
    mov x6, 58 //  largo cuad
    mov x9, x6 
    mov x2, 45 // alto cuadrado
    add x2, x2, x4
    bl Cuadraditos

mov x18, 280
mov x17, 170
bl DisparosMarcianos


//////////////////////// 81 Frame //////////////////////////////////  
    bl delay2



    mov x5, SCREEN_WIDTH

	mov x10, 0
    mov x0, x20




bl Fondo

mov x7, 15
mov x8, 10
mov x19, 0
mov x21, 11
mov x24, 0
mov x23, 2

bl Marciano_numero1


mov x19, 0
mov x21, 11
mov x24, 50
mov x23, 2

bl Marciano_numero2

mov x19, 0
mov x21, 8
mov x24, 150
mov x23, 2

bl Marciano_numero3

mov x16, 385
mov x19, 0
mov x21, 4
mov x24, 150
mov x23, 2

bl Player



    

mov x19, 0
mov x21, 4
mov x24, 50
mov x23, 2



bl Cobertura

mov x19, 0
mov x21, 4
mov x24, 50
mov x23, 2

    mov x10, 0
    mov x3, 256 // eje x
    add x3, x3, x19
    mov x4, 200 // eje y
    add x4, x4, x24
    mov x6, 58 //  largo cuad
    mov x9, x6 
    mov x2, 45 // alto cuadrado
    add x2, x2, x4
    bl Cuadraditos

mov x10, 0
    mov x3, 114 // eje x
    add x3, x3, x19
    mov x4, 200 // eje y
    add x4, x4, x24
    mov x6, 58 //  largo cuad
    mov x9, x6 
    mov x2, 45 // alto cuadrado
    add x2, x2, x4
    bl Cuadraditos

mov x18, 280
mov x17, 180
bl DisparosMarcianos


//////////////////////// 82 Frame //////////////////////////////////  
    bl delay2



    mov x5, SCREEN_WIDTH

	mov x10, 0
    mov x0, x20




bl Fondo

mov x7, 15
mov x8, 10
mov x19, 0
mov x21, 11
mov x24, 0
mov x23, 2

bl Marciano_numero1


mov x19, 0
mov x21, 11
mov x24, 50
mov x23, 2

bl Marciano_numero2

mov x19, 0
mov x21, 8
mov x24, 150
mov x23, 2

bl Marciano_numero3

mov x16, 390
mov x19, 0
mov x21, 4
mov x24, 150
mov x23, 2

bl Player



    

mov x19, 0
mov x21, 4
mov x24, 50
mov x23, 2



bl Cobertura

mov x19, 0
mov x21, 4
mov x24, 50
mov x23, 2

    mov x10, 0
    mov x3, 256 // eje x
    add x3, x3, x19
    mov x4, 200 // eje y
    add x4, x4, x24
    mov x6, 58 //  largo cuad
    mov x9, x6 
    mov x2, 45 // alto cuadrado
    add x2, x2, x4
    bl Cuadraditos

mov x10, 0
    mov x3, 114 // eje x
    add x3, x3, x19
    mov x4, 200 // eje y
    add x4, x4, x24
    mov x6, 58 //  largo cuad
    mov x9, x6 
    mov x2, 45 // alto cuadrado
    add x2, x2, x4
    bl Cuadraditos

mov x18, 280
mov x17, 190
bl DisparosMarcianos


//////////////////////// 83 Frame //////////////////////////////////  
    bl delay2



    mov x5, SCREEN_WIDTH

	mov x10, 0
    mov x0, x20




bl Fondo

mov x7, 15
mov x8, 10
mov x19, 0
mov x21, 11
mov x24, 0
mov x23, 2

bl Marciano_numero1


mov x19, 0
mov x21, 11
mov x24, 50
mov x23, 2

bl Marciano_numero2

mov x19, 0
mov x21, 8
mov x24, 150
mov x23, 2

bl Marciano_numero3

mov x16, 395
mov x19, 0
mov x21, 4
mov x24, 150
mov x23, 2

bl Player



    

mov x19, 0
mov x21, 4
mov x24, 50
mov x23, 2



bl Cobertura

mov x19, 0
mov x21, 4
mov x24, 50
mov x23, 2

    mov x10, 0
    mov x3, 256 // eje x
    add x3, x3, x19
    mov x4, 200 // eje y
    add x4, x4, x24
    mov x6, 58 //  largo cuad
    mov x9, x6 
    mov x2, 45 // alto cuadrado
    add x2, x2, x4
    bl Cuadraditos

mov x10, 0
    mov x3, 114 // eje x
    add x3, x3, x19
    mov x4, 200 // eje y
    add x4, x4, x24
    mov x6, 58 //  largo cuad
    mov x9, x6 
    mov x2, 45 // alto cuadrado
    add x2, x2, x4
    bl Cuadraditos

//////////////////////// 84 Frame //////////////////////////////////  
    bl delay2



    mov x5, SCREEN_WIDTH

	mov x10, 0
    mov x0, x20




bl Fondo

mov x7, 15
mov x8, 10
mov x19, 0
mov x21, 11
mov x24, 0
mov x23, 2

bl Marciano_numero1


mov x19, 0
mov x21, 11
mov x24, 50
mov x23, 2

bl Marciano_numero2

mov x19, 0
mov x21, 8
mov x24, 150
mov x23, 2

bl Marciano_numero3

mov x16, 400
mov x19, 0
mov x21, 4
mov x24, 150
mov x23, 2

bl Player



    

mov x19, 0
mov x21, 4
mov x24, 50
mov x23, 2



bl Cobertura

mov x19, 0
mov x21, 4
mov x24, 50
mov x23, 2

    mov x10, 0
    mov x3, 256 // eje x
    add x3, x3, x19
    mov x4, 200 // eje y
    add x4, x4, x24
    mov x6, 58 //  largo cuad
    mov x9, x6 
    mov x2, 45 // alto cuadrado
    add x2, x2, x4
    bl Cuadraditos

mov x10, 0
    mov x3, 114 // eje x
    add x3, x3, x19
    mov x4, 200 // eje y
    add x4, x4, x24
    mov x6, 58 //  largo cuad
    mov x9, x6 
    mov x2, 45 // alto cuadrado
    add x2, x2, x4
    bl Cuadraditos

//////////////////////// 85 Frame //////////////////////////////////  
    bl delay2



    mov x5, SCREEN_WIDTH

	mov x10, 0
    mov x0, x20




bl Fondo

mov x7, 12
mov x8, 10
mov x19, 0
mov x21, 11
mov x24, 0
mov x23, 2

bl Marciano_numero1.2


mov x19, 0
mov x21, 11
mov x24, 50
mov x23, 2

bl Marciano_numero2.2

mov x19, 0
mov x21, 8
mov x24, 150
mov x23, 2

bl Marciano_numero3.2

mov x16, 405
mov x19, 0
mov x21, 4
mov x24, 150
mov x23, 2

bl Player



    

mov x19, 0
mov x21, 4
mov x24, 50
mov x23, 2



bl Cobertura

mov x19, 0
mov x21, 4
mov x24, 50
mov x23, 2

    mov x10, 0
    mov x3, 253 // eje x
    add x3, x3, x19
    mov x4, 200 // eje y
    add x4, x4, x24
    mov x6, 58 //  largo cuad
    mov x9, x6 
    mov x2, 45 // alto cuadrado
    add x2, x2, x4
    bl Cuadraditos

mov x10, 0
    mov x3, 111 // eje x
    add x3, x3, x19
    mov x4, 200 // eje y
    add x4, x4, x24
    mov x6, 58 //  largo cuad
    mov x9, x6 
    mov x2, 45 // alto cuadrado
    add x2, x2, x4
    bl Cuadraditos

//////////////////////// 86 Frame //////////////////////////////////  
    bl delay2



    mov x5, SCREEN_WIDTH

	mov x10, 0
    mov x0, x20




bl Fondo

mov x7, 12
mov x8, 10
mov x19, 0
mov x21, 11
mov x24, 0
mov x23, 2

bl Marciano_numero1.2


mov x19, 0
mov x21, 11
mov x24, 50
mov x23, 2

bl Marciano_numero2.2

mov x19, 0
mov x21, 8
mov x24, 150
mov x23, 2

bl Marciano_numero3.2

mov x16, 410
mov x19, 0
mov x21, 4
mov x24, 150
mov x23, 2

bl Player



    

mov x19, 0
mov x21, 4
mov x24, 50
mov x23, 2



bl Cobertura

mov x19, 0
mov x21, 4
mov x24, 50
mov x23, 2

    mov x10, 0
    mov x3, 253 // eje x
    add x3, x3, x19
    mov x4, 200 // eje y
    add x4, x4, x24
    mov x6, 58 //  largo cuad
    mov x9, x6 
    mov x2, 45 // alto cuadrado
    add x2, x2, x4
    bl Cuadraditos

mov x10, 0
    mov x3, 111 // eje x
    add x3, x3, x19
    mov x4, 200 // eje y
    add x4, x4, x24
    mov x6, 58 //  largo cuad
    mov x9, x6 
    mov x2, 45 // alto cuadrado
    add x2, x2, x4
    bl Cuadraditos

//////////////////////// 87 Frame //////////////////////////////////  
    bl delay2



    mov x5, SCREEN_WIDTH

	mov x10, 0
    mov x0, x20




bl Fondo

mov x7, 12
mov x8, 10
mov x19, 0
mov x21, 11
mov x24, 0
mov x23, 2

bl Marciano_numero1.2


mov x19, 0
mov x21, 11
mov x24, 50
mov x23, 2

bl Marciano_numero2.2

mov x19, 0
mov x21, 8
mov x24, 150
mov x23, 2

bl Marciano_numero3.2

mov x16, 415
mov x19, 0
mov x21, 4
mov x24, 150
mov x23, 2

bl Player



    

mov x19, 0
mov x21, 4
mov x24, 50
mov x23, 2



bl Cobertura

mov x19, 0
mov x21, 4
mov x24, 50
mov x23, 2

    mov x10, 0
    mov x3, 253 // eje x
    add x3, x3, x19
    mov x4, 200 // eje y
    add x4, x4, x24
    mov x6, 58 //  largo cuad
    mov x9, x6 
    mov x2, 45 // alto cuadrado
    add x2, x2, x4
    bl Cuadraditos

mov x10, 0
    mov x3, 111 // eje x
    add x3, x3, x19
    mov x4, 200 // eje y
    add x4, x4, x24
    mov x6, 58 //  largo cuad
    mov x9, x6 
    mov x2, 45 // alto cuadrado
    add x2, x2, x4
    bl Cuadraditos

//////////////////////// 88 Frame //////////////////////////////////  
    bl delay2



    mov x5, SCREEN_WIDTH

	mov x10, 0
    mov x0, x20




bl Fondo

mov x7, 12
mov x8, 10
mov x19, 0
mov x21, 11
mov x24, 0
mov x23, 2

bl Marciano_numero1.2


mov x19, 0
mov x21, 11
mov x24, 50
mov x23, 2

bl Marciano_numero2.2

mov x19, 0
mov x21, 8
mov x24, 150
mov x23, 2

bl Marciano_numero3.2

mov x16, 420
mov x19, 0
mov x21, 4
mov x24, 150
mov x23, 2

bl Player



    

mov x19, 0
mov x21, 4
mov x24, 50
mov x23, 2



bl Cobertura

mov x19, 0
mov x21, 4
mov x24, 50
mov x23, 2

    mov x10, 0
    mov x3, 253 // eje x
    add x3, x3, x19
    mov x4, 200 // eje y
    add x4, x4, x24
    mov x6, 58 //  largo cuad
    mov x9, x6 
    mov x2, 45 // alto cuadrado
    add x2, x2, x4
    bl Cuadraditos

mov x10, 0
    mov x3, 111 // eje x
    add x3, x3, x19
    mov x4, 200 // eje y
    add x4, x4, x24
    mov x6, 58 //  largo cuad
    mov x9, x6 
    mov x2, 45 // alto cuadrado
    add x2, x2, x4
    bl Cuadraditos

//////////////////////// 89 Frame //////////////////////////////////  ACA DISPARA
    bl delay2



    mov x5, SCREEN_WIDTH

	mov x10, 0
    mov x0, x20




bl Fondo

mov x7, 12
mov x8, 10
mov x19, 0
mov x21, 11
mov x24, 0
mov x23, 2

bl Marciano_numero1.2


mov x19, 0
mov x21, 11
mov x24, 50
mov x23, 2

bl Marciano_numero2.2

mov x19, 0
mov x21, 8
mov x24, 150
mov x23, 2

bl Marciano_numero3.2

mov x16, 420
mov x19, 0
mov x21, 4
mov x24, 150
mov x23, 2

bl Player



    

mov x19, 0
mov x21, 4
mov x24, 50
mov x23, 2



bl Cobertura

mov x19, 0
mov x21, 4
mov x24, 50
mov x23, 2

//Disparo de player
movz x10, 0xFF, lsl 16
	movk x10, 0xFFFF, lsl 00
    mov x3, 454 // eje x
    mov x4, 423 // eje y
    mov x2, 12 // largo linea
    add x2, x2, x4 
    bl LineaVertical

    mov x10, 0
    mov x3, 253 // eje x
    add x3, x3, x19
    mov x4, 200 // eje y
    add x4, x4, x24
    mov x6, 58 //  largo cuad
    mov x9, x6 
    mov x2, 45 // alto cuadrado
    add x2, x2, x4
    bl Cuadraditos

mov x10, 0
    mov x3, 111 // eje x
    add x3, x3, x19
    mov x4, 200 // eje y
    add x4, x4, x24
    mov x6, 58 //  largo cuad
    mov x9, x6 
    mov x2, 45 // alto cuadrado
    add x2, x2, x4
    bl Cuadraditos

//////////////////////// 90 Frame ////////////////////////////////// 
    bl delay2



    mov x5, SCREEN_WIDTH

	mov x10, 0
    mov x0, x20




bl Fondo

mov x7, 9
mov x8, 10
mov x19, 0
mov x21, 11
mov x24, 0
mov x23, 2

bl Marciano_numero1


mov x19, 0
mov x21, 11
mov x24, 50
mov x23, 2

bl Marciano_numero2

mov x19, 0
mov x21, 8
mov x24, 150
mov x23, 2

bl Marciano_numero3

mov x16, 420
mov x19, 0
mov x21, 4
mov x24, 150
mov x23, 2

bl Player



    

mov x19, 0
mov x21, 4
mov x24, 50
mov x23, 2



bl Cobertura

mov x19, 0
mov x21, 4
mov x24, 50
mov x23, 2

//Disparo de player
movz x10, 0xFF, lsl 16
	movk x10, 0xFFFF, lsl 00
    mov x3, 454 // eje x
    mov x4, 413 // eje y
    mov x2, 12 // largo linea
    add x2, x2, x4 
    bl LineaVertical

    mov x10, 0
    mov x3, 250 // eje x
    add x3, x3, x19
    mov x4, 200 // eje y
    add x4, x4, x24
    mov x6, 58 //  largo cuad
    mov x9, x6 
    mov x2, 45 // alto cuadrado
    add x2, x2, x4
    bl Cuadraditos

mov x10, 0
    mov x3, 108 // eje x
    add x3, x3, x19
    mov x4, 200 // eje y
    add x4, x4, x24
    mov x6, 58 //  largo cuad
    mov x9, x6 
    mov x2, 45 // alto cuadrado
    add x2, x2, x4
    bl Cuadraditos


//////////////////////// 91 Frame ////////////////////////////////// 
    bl delay2



    mov x5, SCREEN_WIDTH

	mov x10, 0
    mov x0, x20




bl Fondo

mov x7, 9
mov x8, 10
mov x19, 0
mov x21, 11
mov x24, 0
mov x23, 2

bl Marciano_numero1


mov x19, 0
mov x21, 11
mov x24, 50
mov x23, 2

bl Marciano_numero2

mov x19, 0
mov x21, 8
mov x24, 150
mov x23, 2

bl Marciano_numero3

mov x16, 415
mov x19, 0
mov x21, 4
mov x24, 150
mov x23, 2

bl Player



    

mov x19, 0
mov x21, 4
mov x24, 50
mov x23, 2



bl Cobertura

mov x19, 0
mov x21, 4
mov x24, 50
mov x23, 2

//Disparo de player
movz x10, 0xFF, lsl 16
	movk x10, 0xFFFF, lsl 00
    mov x3, 454 // eje x
    mov x4, 403 // eje y
    mov x2, 12 // largo linea
    add x2, x2, x4 
    bl LineaVertical

    mov x10, 0
    mov x3, 250 // eje x
    add x3, x3, x19
    mov x4, 200 // eje y
    add x4, x4, x24
    mov x6, 58 //  largo cuad
    mov x9, x6 
    mov x2, 45 // alto cuadrado
    add x2, x2, x4
    bl Cuadraditos

mov x10, 0
    mov x3, 108 // eje x
    add x3, x3, x19
    mov x4, 200 // eje y
    add x4, x4, x24
    mov x6, 58 //  largo cuad
    mov x9, x6 
    mov x2, 45 // alto cuadrado
    add x2, x2, x4
    bl Cuadraditos

//////////////////////// 92 Frame ////////////////////////////////// 
    bl delay2



    mov x5, SCREEN_WIDTH

	mov x10, 0
    mov x0, x20




bl Fondo

mov x7, 9
mov x8, 10
mov x19, 0
mov x21, 11
mov x24, 0
mov x23, 2

bl Marciano_numero1


mov x19, 0
mov x21, 11
mov x24, 50
mov x23, 2

bl Marciano_numero2

mov x19, 0
mov x21, 8
mov x24, 150
mov x23, 2

bl Marciano_numero3

mov x16, 410
mov x19, 0
mov x21, 4
mov x24, 150
mov x23, 2

bl Player



    

mov x19, 0
mov x21, 4
mov x24, 50
mov x23, 2



bl Cobertura

mov x19, 0
mov x21, 4
mov x24, 50
mov x23, 2

//Disparo de player
movz x10, 0xFF, lsl 16
	movk x10, 0xFFFF, lsl 00
    mov x3, 454 // eje x
    mov x4, 393 // eje y
    mov x2, 12 // largo linea
    add x2, x2, x4 
    bl LineaVertical

    mov x10, 0
    mov x3, 250 // eje x
    add x3, x3, x19
    mov x4, 200 // eje y
    add x4, x4, x24
    mov x6, 58 //  largo cuad
    mov x9, x6 
    mov x2, 45 // alto cuadrado
    add x2, x2, x4
    bl Cuadraditos

mov x10, 0
    mov x3, 108 // eje x
    add x3, x3, x19
    mov x4, 200 // eje y
    add x4, x4, x24
    mov x6, 58 //  largo cuad
    mov x9, x6 
    mov x2, 45 // alto cuadrado
    add x2, x2, x4
    bl Cuadraditos



mov x18, 330
mov x17, 10
bl DisparosMarcianos

//////////////////////// 93 Frame ////////////////////////////////// 
    bl delay2



    mov x5, SCREEN_WIDTH

	mov x10, 0
    mov x0, x20




bl Fondo

mov x7, 9
mov x8, 10
mov x19, 0
mov x21, 11
mov x24, 0
mov x23, 2

bl Marciano_numero1


mov x19, 0
mov x21, 11
mov x24, 50
mov x23, 2

bl Marciano_numero2

mov x19, 0
mov x21, 8
mov x24, 150
mov x23, 2

bl Marciano_numero3

mov x16, 405
mov x19, 0
mov x21, 4
mov x24, 150
mov x23, 2

bl Player

mov x19, 0
mov x21, 4
mov x24, 50
mov x23, 2



bl Cobertura

mov x19, 0
mov x21, 4
mov x24, 50
mov x23, 2

//Disparo de player
movz x10, 0xFF, lsl 16
	movk x10, 0xFFFF, lsl 00
    mov x3, 454 // eje x
    mov x4, 383 // eje y
    mov x2, 12 // largo linea
    add x2, x2, x4 
    bl LineaVertical


    mov x10, 0
    mov x3, 250 // eje x
    add x3, x3, x19
    mov x4, 200 // eje y
    add x4, x4, x24
    mov x6, 58 //  largo cuad
    mov x9, x6 
    mov x2, 45 // alto cuadrado
    add x2, x2, x4
    bl Cuadraditos

mov x10, 0
    mov x3, 108 // eje x
    add x3, x3, x19
    mov x4, 200 // eje y
    add x4, x4, x24
    mov x6, 58 //  largo cuad
    mov x9, x6 
    mov x2, 45 // alto cuadrado
    add x2, x2, x4
    bl Cuadraditos

mov x18, 330
mov x17, 20
bl DisparosMarcianos


//////////////////////// 94 Frame ////////////////////////////////// 
    bl delay2



    mov x5, SCREEN_WIDTH

	mov x10, 0
    mov x0, x20




bl Fondo

mov x7, 9
mov x8, 10
mov x19, 0
mov x21, 11
mov x24, 0
mov x23, 2

bl Marciano_numero1


mov x19, 0
mov x21, 11
mov x24, 50
mov x23, 2

bl Marciano_numero2

mov x19, 0
mov x21, 8
mov x24, 150
mov x23, 2

bl Marciano_numero3

mov x16, 400
mov x19, 0
mov x21, 4
mov x24, 150
mov x23, 2

bl Player
   

mov x19, 0
mov x21, 4
mov x24, 50
mov x23, 2



bl Cobertura

mov x19, 0
mov x21, 4
mov x24, 50
mov x23, 2

//Disparo de player
movz x10, 0xFF, lsl 16
	movk x10, 0xFFFF, lsl 00
    mov x3, 454 // eje x
    mov x4, 373 // eje y
    mov x2, 12 // largo linea
    add x2, x2, x4 
    bl LineaVertical


    mov x10, 0
    mov x3, 250 // eje x
    add x3, x3, x19
    mov x4, 200 // eje y
    add x4, x4, x24
    mov x6, 58 //  largo cuad
    mov x9, x6 
    mov x2, 45 // alto cuadrado
    add x2, x2, x4
    bl Cuadraditos

mov x10, 0
    mov x3, 108 // eje x
    add x3, x3, x19
    mov x4, 200 // eje y
    add x4, x4, x24
    mov x6, 58 //  largo cuad
    mov x9, x6 
    mov x2, 45 // alto cuadrado
    add x2, x2, x4
    bl Cuadraditos

mov x18, 330
mov x17, 30
bl DisparosMarcianos



//////////////////////// 95 Frame ////////////////////////////////// 
    bl delay2



    mov x5, SCREEN_WIDTH

	mov x10, 0
    mov x0, x20




bl Fondo

mov x7, 6
mov x8, 10
mov x19, 0
mov x21, 11
mov x24, 0
mov x23, 2

bl Marciano_numero1.2


mov x19, 0
mov x21, 11
mov x24, 50
mov x23, 2

bl Marciano_numero2.2

mov x19, 0
mov x21, 8
mov x24, 150
mov x23, 2

bl Marciano_numero3.2

mov x16, 395
mov x19, 0
mov x21, 4
mov x24, 150
mov x23, 2

bl Player


mov x19, 0
mov x21, 4
mov x24, 50
mov x23, 2



bl Cobertura

mov x19, 0
mov x21, 4
mov x24, 50
mov x23, 2

//Disparo de player
movz x10, 0xFF, lsl 16
	movk x10, 0xFFFF, lsl 00
    mov x3, 454 // eje x
    mov x4, 363 // eje y
    mov x2, 12 // largo linea
    add x2, x2, x4 
    bl LineaVertical


    mov x10, 0
    mov x3, 247 // eje x
    add x3, x3, x19
    mov x4, 200 // eje y
    add x4, x4, x24
    mov x6, 58 //  largo cuad
    mov x9, x6 
    mov x2, 45 // alto cuadrado
    add x2, x2, x4
    bl Cuadraditos

mov x10, 0
    mov x3, 105 // eje x
    add x3, x3, x19
    mov x4, 200 // eje y
    add x4, x4, x24
    mov x6, 58 //  largo cuad
    mov x9, x6 
    mov x2, 45 // alto cuadrado
    add x2, x2, x4
    bl Cuadraditos

mov x18, 330
mov x17, 40
bl DisparosMarcianos


//////////////////////// 96 Frame ////////////////////////////////// 
    bl delay2



    mov x5, SCREEN_WIDTH

	mov x10, 0
    mov x0, x20




bl Fondo

mov x7, 6
mov x8, 10
mov x19, 0
mov x21, 11
mov x24, 0
mov x23, 2

bl Marciano_numero1.2


mov x19, 0
mov x21, 11
mov x24, 50
mov x23, 2

bl Marciano_numero2.2

mov x19, 0
mov x21, 8
mov x24, 150
mov x23, 2

bl Marciano_numero3.2

mov x16, 390
mov x19, 0
mov x21, 4
mov x24, 150
mov x23, 2

bl Player

 

mov x19, 0
mov x21, 4
mov x24, 50
mov x23, 2



bl Cobertura

mov x19, 0
mov x21, 4
mov x24, 50
mov x23, 2

//Disparo de player
movz x10, 0xFF, lsl 16
	movk x10, 0xFFFF, lsl 00
    mov x3, 454 // eje x
    mov x4, 353 // eje y
    mov x2, 12 // largo linea
    add x2, x2, x4 
    bl LineaVertical


    mov x10, 0
    mov x3, 247 // eje x
    add x3, x3, x19
    mov x4, 200 // eje y
    add x4, x4, x24
    mov x6, 58 //  largo cuad
    mov x9, x6 
    mov x2, 45 // alto cuadrado
    add x2, x2, x4
    bl Cuadraditos


mov x10, 0
    mov x3, 105 // eje x
    add x3, x3, x19
    mov x4, 200 // eje y
    add x4, x4, x24
    mov x6, 58 //  largo cuad
    mov x9, x6 
    mov x2, 45 // alto cuadrado
    add x2, x2, x4
    bl Cuadraditos

mov x18, 330
mov x17, 50
bl DisparosMarcianos


//////////////////////// 97 Frame ////////////////////////////////// 
    bl delay2



    mov x5, SCREEN_WIDTH

	mov x10, 0
    mov x0, x20




bl Fondo

mov x7, 6
mov x8, 10
mov x19, 0
mov x21, 11
mov x24, 0
mov x23, 2

bl Marciano_numero1.2


mov x19, 0
mov x21, 11
mov x24, 50
mov x23, 2

bl Marciano_numero2.2

mov x19, 0
mov x21, 8
mov x24, 150
mov x23, 2

bl Marciano_numero3.2

mov x16, 385
mov x19, 0
mov x21, 4
mov x24, 150
mov x23, 2

bl Player

 

mov x19, 0
mov x21, 4
mov x24, 50
mov x23, 2



bl Cobertura

mov x19, 0
mov x21, 4
mov x24, 50
mov x23, 2

//Disparo de player
movz x10, 0xFF, lsl 16
	movk x10, 0xFFFF, lsl 00
    mov x3, 454 // eje x
    mov x4, 343 // eje y
    mov x2, 12 // largo linea
    add x2, x2, x4 
    bl LineaVertical

    mov x10, 0
    mov x3, 247 // eje x
    add x3, x3, x19
    mov x4, 200 // eje y
    add x4, x4, x24
    mov x6, 58 //  largo cuad
    mov x9, x6 
    mov x2, 45 // alto cuadrado
    add x2, x2, x4
    bl Cuadraditos


mov x10, 0
    mov x3, 105 // eje x
    add x3, x3, x19
    mov x4, 200 // eje y
    add x4, x4, x24
    mov x6, 58 //  largo cuad
    mov x9, x6 
    mov x2, 45 // alto cuadrado
    add x2, x2, x4
    bl Cuadraditos

mov x18, 330
mov x17, 60
bl DisparosMarcianos

//////////////////////// 98 Frame ////////////////////////////////// 
    bl delay2



    mov x5, SCREEN_WIDTH

	mov x10, 0
    mov x0, x20




bl Fondo

mov x7, 6
mov x8, 10
mov x19, 0
mov x21, 11
mov x24, 0
mov x23, 2

bl Marciano_numero1.2


mov x19, 0
mov x21, 11
mov x24, 50
mov x23, 2

bl Marciano_numero2.2

mov x19, 0
mov x21, 8
mov x24, 150
mov x23, 2

bl Marciano_numero3.2

mov x16, 380
mov x19, 0
mov x21, 4
mov x24, 150
mov x23, 2

bl Player

 

mov x19, 0
mov x21, 4
mov x24, 50
mov x23, 2



bl Cobertura

mov x19, 0
mov x21, 4
mov x24, 50
mov x23, 2

//Disparo de player
movz x10, 0xFF, lsl 16
	movk x10, 0xFFFF, lsl 00
    mov x3, 454 // eje x
    mov x4, 333 // eje y
    mov x2, 12 // largo linea
    add x2, x2, x4 
    bl LineaVertical

    mov x10, 0
    mov x3, 247 // eje x
    add x3, x3, x19
    mov x4, 200 // eje y
    add x4, x4, x24
    mov x6, 58 //  largo cuad
    mov x9, x6 
    mov x2, 45 // alto cuadrado
    add x2, x2, x4
    bl Cuadraditos


mov x10, 0
    mov x3, 105 // eje x
    add x3, x3, x19
    mov x4, 200 // eje y
    add x4, x4, x24
    mov x6, 58 //  largo cuad
    mov x9, x6 
    mov x2, 45 // alto cuadrado
    add x2, x2, x4
    bl Cuadraditos

mov x18, 330
mov x17, 70
bl DisparosMarcianos


//////////////////////// 99 Frame ////////////////////////////////// 
    bl delay2



    mov x5, SCREEN_WIDTH

	mov x10, 0
    mov x0, x20




bl Fondo

mov x7, 6
mov x8, 10
mov x19, 0
mov x21, 11
mov x24, 0
mov x23, 2

bl Marciano_numero1.2


mov x19, 0
mov x21, 11
mov x24, 50
mov x23, 2

bl Marciano_numero2.2

mov x19, 0
mov x21, 8
mov x24, 150
mov x23, 2

bl Marciano_numero3.2

mov x16, 375
mov x19, 0
mov x21, 4
mov x24, 150
mov x23, 2

bl Player

 

mov x19, 0
mov x21, 4
mov x24, 50
mov x23, 2



bl Cobertura

mov x19, 0
mov x21, 4
mov x24, 50
mov x23, 2

//Disparo de player
movz x10, 0xFF, lsl 16
	movk x10, 0xFFFF, lsl 00
    mov x3, 454 // eje x
    mov x4, 323 // eje y
    mov x2, 12 // largo linea
    add x2, x2, x4 
    bl LineaVertical

    mov x10, 0
    mov x3, 247 // eje x
    add x3, x3, x19
    mov x4, 200 // eje y
    add x4, x4, x24
    mov x6, 58 //  largo cuad
    mov x9, x6 
    mov x2, 45 // alto cuadrado
    add x2, x2, x4
    bl Cuadraditos


mov x10, 0
    mov x3, 105 // eje x
    add x3, x3, x19
    mov x4, 200 // eje y
    add x4, x4, x24
    mov x6, 58 //  largo cuad
    mov x9, x6 
    mov x2, 45 // alto cuadrado
    add x2, x2, x4
    bl Cuadraditos

mov x18, 330
mov x17, 80
bl DisparosMarcianos

//////////////////////// 100 Frame ////////////////////////////////// 
    bl delay2



    mov x5, SCREEN_WIDTH

	mov x10, 0
    mov x0, x20




bl Fondo

mov x7, 3
mov x8, 10
mov x19, 0
mov x21, 11
mov x24, 0
mov x23, 2

bl Marciano_numero1


mov x19, 0
mov x21, 11
mov x24, 50
mov x23, 2

bl Marciano_numero2

mov x19, 0
mov x21, 8
mov x24, 150
mov x23, 2

bl Marciano_numero3

mov x16, 370
mov x19, 0
mov x21, 4
mov x24, 150
mov x23, 2

bl Player

 

mov x19, 0
mov x21, 4
mov x24, 50
mov x23, 2



bl Cobertura

mov x19, 0
mov x21, 4
mov x24, 50
mov x23, 2

//Disparo de player
movz x10, 0xFF, lsl 16
	movk x10, 0xFFFF, lsl 00
    mov x3, 454 // eje x
    mov x4, 313 // eje y
    mov x2, 12 // largo linea
    add x2, x2, x4 
    bl LineaVertical

    mov x10, 0
    mov x3, 244 // eje x
    add x3, x3, x19
    mov x4, 200 // eje y
    add x4, x4, x24
    mov x6, 58 //  largo cuad
    mov x9, x6 
    mov x2, 45 // alto cuadrado
    add x2, x2, x4
    bl Cuadraditos


mov x10, 0
    mov x3, 102 // eje x
    add x3, x3, x19
    mov x4, 200 // eje y
    add x4, x4, x24
    mov x6, 58 //  largo cuad
    mov x9, x6 
    mov x2, 45 // alto cuadrado
    add x2, x2, x4
    bl Cuadraditos

mov x18, 330
mov x17, 90
bl DisparosMarcianos


//////////////////////// 101 Frame ////////////////////////////////// 
    bl delay2



    mov x5, SCREEN_WIDTH

	mov x10, 0
    mov x0, x20




bl Fondo

mov x7, 3
mov x8, 10
mov x19, 0
mov x21, 11
mov x24, 0
mov x23, 2

bl Marciano_numero1


mov x19, 0
mov x21, 11
mov x24, 50
mov x23, 2

bl Marciano_numero2

mov x19, 0
mov x21, 8
mov x24, 150
mov x23, 2

bl Marciano_numero3

mov x16, 370
mov x19, 0
mov x21, 4
mov x24, 150
mov x23, 2

bl Player

 

mov x19, 0
mov x21, 4
mov x24, 50
mov x23, 2



bl Cobertura

mov x19, 0
mov x21, 4
mov x24, 50
mov x23, 2

//Disparo de player
movz x10, 0xFF, lsl 16
	movk x10, 0xFFFF, lsl 00
    mov x3, 454 // eje x
    mov x4, 303 // eje y
    mov x2, 12 // largo linea
    add x2, x2, x4 
    bl LineaVertical

    mov x10, 0
    mov x3, 244 // eje x
    add x3, x3, x19
    mov x4, 200 // eje y
    add x4, x4, x24
    mov x6, 58 //  largo cuad
    mov x9, x6 
    mov x2, 45 // alto cuadrado
    add x2, x2, x4
    bl Cuadraditos

mov x10, 0
    mov x3, 102 // eje x
    add x3, x3, x19
    mov x4, 200 // eje y
    add x4, x4, x24
    mov x6, 58 //  largo cuad
    mov x9, x6 
    mov x2, 45 // alto cuadrado
    add x2, x2, x4
    bl Cuadraditos

mov x18, 330
mov x17, 100
bl DisparosMarcianos

//////////////////////// 102 Frame ////////////////////////////////// 
    bl delay2



    mov x5, SCREEN_WIDTH

	mov x10, 0
    mov x0, x20




bl Fondo

mov x7, 3
mov x8, 10
mov x19, 0
mov x21, 11
mov x24, 0
mov x23, 2

bl Marciano_numero1


mov x19, 0
mov x21, 11
mov x24, 50
mov x23, 2

bl Marciano_numero2

mov x19, 0
mov x21, 8
mov x24, 150
mov x23, 2

bl Marciano_numero3

mov x16, 365
mov x19, 0
mov x21, 4
mov x24, 150
mov x23, 2

bl Player

 

mov x19, 0
mov x21, 4
mov x24, 50
mov x23, 2



bl Cobertura

mov x19, 0
mov x21, 4
mov x24, 50
mov x23, 2

//Disparo de player
movz x10, 0xFF, lsl 16
	movk x10, 0xFFFF, lsl 00
    mov x3, 454 // eje x
    mov x4, 293 // eje y
    mov x2, 12 // largo linea
    add x2, x2, x4 
    bl LineaVertical

    mov x10, 0
    mov x3, 244 // eje x
    add x3, x3, x19
    mov x4, 200 // eje y
    add x4, x4, x24
    mov x6, 58 //  largo cuad
    mov x9, x6 
    mov x2, 45 // alto cuadrado
    add x2, x2, x4
    bl Cuadraditos

mov x10, 0
    mov x3, 102 // eje x
    add x3, x3, x19
    mov x4, 200 // eje y
    add x4, x4, x24
    mov x6, 58 //  largo cuad
    mov x9, x6 
    mov x2, 45 // alto cuadrado
    add x2, x2, x4
    bl Cuadraditos

mov x18, 330
mov x17, 110
bl DisparosMarcianos

//////////////////////// 103 Frame ////////////////////////////////// 
    bl delay2



    mov x5, SCREEN_WIDTH

	mov x10, 0
    mov x0, x20




bl Fondo

mov x7, 3
mov x8, 10
mov x19, 0
mov x21, 11
mov x24, 0
mov x23, 2

bl Marciano_numero1


mov x19, 0
mov x21, 11
mov x24, 50
mov x23, 2

bl Marciano_numero2

mov x19, 0
mov x21, 8
mov x24, 150
mov x23, 2

bl Marciano_numero3

mov x16, 360
mov x19, 0
mov x21, 4
mov x24, 150
mov x23, 2

bl Player

 

mov x19, 0
mov x21, 4
mov x24, 50
mov x23, 2



bl Cobertura

mov x19, 0
mov x21, 4
mov x24, 50
mov x23, 2

//Disparo de player
movz x10, 0xFF, lsl 16
	movk x10, 0xFFFF, lsl 00
    mov x3, 454 // eje x
    mov x4, 283 // eje y
    mov x2, 12 // largo linea
    add x2, x2, x4 
    bl LineaVertical

    mov x10, 0
    mov x3, 244 // eje x
    add x3, x3, x19
    mov x4, 200 // eje y
    add x4, x4, x24
    mov x6, 58 //  largo cuad
    mov x9, x6 
    mov x2, 45 // alto cuadrado
    add x2, x2, x4
    bl Cuadraditos

mov x10, 0
    mov x3, 102 // eje x
    add x3, x3, x19
    mov x4, 200 // eje y
    add x4, x4, x24
    mov x6, 58 //  largo cuad
    mov x9, x6 
    mov x2, 45 // alto cuadrado
    add x2, x2, x4
    bl Cuadraditos

mov x18, 330
mov x17, 120
bl DisparosMarcianos

//////////////////////// 104 Frame ////////////////////////////////// 
    bl delay2



    mov x5, SCREEN_WIDTH

	mov x10, 0
    mov x0, x20




bl Fondo

mov x7, 3
mov x8, 10
mov x19, 0
mov x21, 11
mov x24, 0
mov x23, 2

bl Marciano_numero1


mov x19, 0
mov x21, 11
mov x24, 50
mov x23, 2

bl Marciano_numero2

mov x19, 0
mov x21, 8
mov x24, 150
mov x23, 2

bl Marciano_numero3

mov x16, 355
mov x19, 0
mov x21, 4
mov x24, 150
mov x23, 2

bl Player

 

mov x19, 0
mov x21, 4
mov x24, 50
mov x23, 2



bl Cobertura

mov x19, 0
mov x21, 4
mov x24, 50
mov x23, 2

//HITMARKER

    mov x10, 0
    mov x3, 450 // eje x
    add x3, x3, x19
    mov x4, 200 // eje y
    add x4, x4, x24
    mov x6, 58 //  largo cuad
    mov x9, x6 
    mov x2, 45 // alto cuadrado
    add x2, x2, x4
    bl Cuadraditos

bl Explosion3
    

    mov x10, 0
    mov x3, 244 // eje x
    add x3, x3, x19
    mov x4, 200 // eje y
    add x4, x4, x24
    mov x6, 58 //  largo cuad
    mov x9, x6 
    mov x2, 45 // alto cuadrado
    add x2, x2, x4
    bl Cuadraditos

mov x10, 0
    mov x3, 102 // eje x
    add x3, x3, x19
    mov x4, 200 // eje y
    add x4, x4, x24
    mov x6, 58 //  largo cuad
    mov x9, x6 
    mov x2, 45 // alto cuadrado
    add x2, x2, x4
    bl Cuadraditos

mov x18, 330
mov x17, 130
bl DisparosMarcianos

//////////////////////// 105 Frame ////////////////////////////////// 
    bl delay2



    mov x5, SCREEN_WIDTH

	mov x10, 0
    mov x0, x20




bl Fondo

mov x7, 0
mov x8, 10
mov x19, 0
mov x21, 11
mov x24, 0
mov x23, 2

bl Marciano_numero1.2


mov x19, 0
mov x21, 11
mov x24, 50
mov x23, 2

bl Marciano_numero2.2

mov x19, 0
mov x21, 8
mov x24, 150
mov x23, 2

bl Marciano_numero3.2

mov x16, 350
mov x19, 0
mov x21, 4
mov x24, 150
mov x23, 2

bl Player

 

mov x19, 0
mov x21, 4
mov x24, 50
mov x23, 2



bl Cobertura

mov x19, 0
mov x21, 4
mov x24, 50
mov x23, 2

//HITMARKER

    mov x10, 0
    mov x3, 447 // eje x
    add x3, x3, x19
    mov x4, 200 // eje y
    add x4, x4, x24
    mov x6, 58 //  largo cuad
    mov x9, x6 
    mov x2, 45 // alto cuadrado
    add x2, x2, x4
    bl Cuadraditos

bl Explosion3

    mov x10, 0
    mov x3, 241 // eje x
    add x3, x3, x19
    mov x4, 200 // eje y
    add x4, x4, x24
    mov x6, 58 //  largo cuad
    mov x9, x6 
    mov x2, 45 // alto cuadrado
    add x2, x2, x4
    bl Cuadraditos

mov x10, 0
    mov x3, 99 // eje x
    add x3, x3, x19
    mov x4, 200 // eje y
    add x4, x4, x24
    mov x6, 58 //  largo cuad
    mov x9, x6 
    mov x2, 45 // alto cuadrado
    add x2, x2, x4
    bl Cuadraditos

mov x18, 330
mov x17, 140
bl DisparosMarcianos


//////////////////////// 106 Frame ////////////////////////////////// 
    bl delay2



    mov x5, SCREEN_WIDTH

	mov x10, 0
    mov x0, x20




bl Fondo

mov x7, 0
mov x8, 10
mov x19, 0
mov x21, 11
mov x24, 0
mov x23, 2

bl Marciano_numero1.2


mov x19, 0
mov x21, 11
mov x24, 50
mov x23, 2

bl Marciano_numero2.2

mov x19, 0
mov x21, 8
mov x24, 150
mov x23, 2

bl Marciano_numero3.2

mov x16, 345
mov x19, 0
mov x21, 4
mov x24, 150
mov x23, 2

bl Player

 

mov x19, 0
mov x21, 4
mov x24, 50
mov x23, 2



bl Cobertura

mov x19, 0
mov x21, 4
mov x24, 50
mov x23, 2

    mov x10, 0
    mov x3, 447 // eje x
    add x3, x3, x19
    mov x4, 200 // eje y
    add x4, x4, x24
    mov x6, 58 //  largo cuad
    mov x9, x6 
    mov x2, 45 // alto cuadrado
    add x2, x2, x4
    bl Cuadraditos

    mov x10, 0
    mov x3, 241 // eje x
    add x3, x3, x19
    mov x4, 200 // eje y
    add x4, x4, x24
    mov x6, 58 //  largo cuad
    mov x9, x6 
    mov x2, 45 // alto cuadrado
    add x2, x2, x4
    bl Cuadraditos

mov x10, 0
    mov x3, 99 // eje x
    add x3, x3, x19
    mov x4, 200 // eje y
    add x4, x4, x24
    mov x6, 58 //  largo cuad
    mov x9, x6 
    mov x2, 45 // alto cuadrado
    add x2, x2, x4
    bl Cuadraditos

mov x18, 330
mov x17, 150
bl DisparosMarcianos


//////////////////////// 107 Frame ////////////////////////////////// 
    bl delay2



    mov x5, SCREEN_WIDTH

	mov x10, 0
    mov x0, x20




bl Fondo

mov x7, 0
mov x8, 10
mov x19, 0
mov x21, 11
mov x24, 0
mov x23, 2

bl Marciano_numero1.2


mov x19, 0
mov x21, 11
mov x24, 50
mov x23, 2

bl Marciano_numero2.2

mov x19, 0
mov x21, 8
mov x24, 150
mov x23, 2

bl Marciano_numero3.2

mov x16, 340
mov x19, 0
mov x21, 4
mov x24, 150
mov x23, 2

bl Player

 

mov x19, 0
mov x21, 4
mov x24, 50
mov x23, 2



bl Cobertura

mov x19, 0
mov x21, 4
mov x24, 50
mov x23, 2

    mov x10, 0
    mov x3, 447 // eje x
    add x3, x3, x19
    mov x4, 200 // eje y
    add x4, x4, x24
    mov x6, 58 //  largo cuad
    mov x9, x6 
    mov x2, 45 // alto cuadrado
    add x2, x2, x4
    bl Cuadraditos

    mov x10, 0
    mov x3, 241 // eje x
    add x3, x3, x19
    mov x4, 200 // eje y
    add x4, x4, x24
    mov x6, 58 //  largo cuad
    mov x9, x6 
    mov x2, 45 // alto cuadrado
    add x2, x2, x4
    bl Cuadraditos

mov x10, 0
    mov x3, 99 // eje x
    add x3, x3, x19
    mov x4, 200 // eje y
    add x4, x4, x24
    mov x6, 58 //  largo cuad
    mov x9, x6 
    mov x2, 45 // alto cuadrado
    add x2, x2, x4
    bl Cuadraditos

mov x18, 330
mov x17, 160
bl DisparosMarcianos


//////////////////////// 108 Frame ////////////////////////////////// 
    bl delay2



    mov x5, SCREEN_WIDTH

	mov x10, 0
    mov x0, x20




bl Fondo

mov x7, 0
mov x8, 10
mov x19, 0
mov x21, 11
mov x24, 0
mov x23, 2

bl Marciano_numero1.2


mov x19, 0
mov x21, 11
mov x24, 50
mov x23, 2

bl Marciano_numero2.2

mov x19, 0
mov x21, 8
mov x24, 150
mov x23, 2

bl Marciano_numero3.2

mov x16, 335
mov x19, 0
mov x21, 4
mov x24, 150
mov x23, 2

bl Player

 

mov x19, 0
mov x21, 4
mov x24, 50
mov x23, 2



bl Cobertura

mov x19, 0
mov x21, 4
mov x24, 50
mov x23, 2

    mov x10, 0
    mov x3, 447 // eje x
    add x3, x3, x19
    mov x4, 200 // eje y
    add x4, x4, x24
    mov x6, 58 //  largo cuad
    mov x9, x6 
    mov x2, 45 // alto cuadrado
    add x2, x2, x4
    bl Cuadraditos

    mov x10, 0
    mov x3, 241 // eje x
    add x3, x3, x19
    mov x4, 200 // eje y
    add x4, x4, x24
    mov x6, 58 //  largo cuad
    mov x9, x6 
    mov x2, 45 // alto cuadrado
    add x2, x2, x4
    bl Cuadraditos

mov x10, 0
    mov x3, 99 // eje x
    add x3, x3, x19
    mov x4, 200 // eje y
    add x4, x4, x24
    mov x6, 58 //  largo cuad
    mov x9, x6 
    mov x2, 45 // alto cuadrado
    add x2, x2, x4
    bl Cuadraditos
mov x18, 330
mov x17, 170
bl DisparosMarcianos


//////////////////////// 109 Frame ////////////////////////////////// 
    bl delay2



    mov x5, SCREEN_WIDTH

	mov x10, 0
    mov x0, x20




bl Fondo

mov x7, 0
mov x8, 10
mov x19, 0
mov x21, 11
mov x24, 0
mov x23, 2

bl Marciano_numero1.2


mov x19, 0
mov x21, 11
mov x24, 50
mov x23, 2

bl Marciano_numero2.2

mov x19, 0
mov x21, 8
mov x24, 150
mov x23, 2

bl Marciano_numero3.2

mov x16, 330
mov x19, 0
mov x21, 4
mov x24, 150
mov x23, 2

bl Player

 

mov x19, 0
mov x21, 4
mov x24, 50
mov x23, 2



bl Cobertura

mov x19, 0
mov x21, 4
mov x24, 50
mov x23, 2

    mov x10, 0
    mov x3, 447 // eje x
    add x3, x3, x19
    mov x4, 200 // eje y
    add x4, x4, x24
    mov x6, 58 //  largo cuad
    mov x9, x6 
    mov x2, 45 // alto cuadrado
    add x2, x2, x4
    bl Cuadraditos

    mov x10, 0
    mov x3, 241 // eje x
    add x3, x3, x19
    mov x4, 200 // eje y
    add x4, x4, x24
    mov x6, 58 //  largo cuad
    mov x9, x6 
    mov x2, 45 // alto cuadrado
    add x2, x2, x4
    bl Cuadraditos


mov x10, 0
    mov x3, 99 // eje x
    add x3, x3, x19
    mov x4, 200 // eje y
    add x4, x4, x24
    mov x6, 58 //  largo cuad
    mov x9, x6 
    mov x2, 45 // alto cuadrado
    add x2, x2, x4
    bl Cuadraditos





///////////////////////////////FIN DE LA ANIMACION////////////////////////////////////////



PantallaGAMEOVER:



exit:

	//---------------------------------------------------------------
	// Infinite Loop 

InfLoop: 
	b InfLoop
