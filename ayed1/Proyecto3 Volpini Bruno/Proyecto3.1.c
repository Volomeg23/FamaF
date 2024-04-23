#include <stdlib.h>
#include <stdio.h>

// PUNTO 1 ENTRADA/SALIDA

void punto3 (int a, int b) {
    if (b - 2 == (a * 3 + 1)%5) {
        printf("True\n");
        } else {
            printf("False\n");
        }
}

void punto5 (int a, int b, int c) {  // en esta expresion, el tipo del resultado puede ser True o False interpretados en C como los enteros 1 o 0 respectivamente.
    if (b < a * c) {
        printf("True\n");
        } else {
            printf("False\n");
        }
}

int main (void) {
    int x = 0, y = 0, z = 0;
	printf("Ingrese el valor de x\n");
    scanf("%d", &x);
    printf("Ingrese el valor de y\n");
    scanf("%d", &y);
    printf("Ingrese el valor de z\n");
    scanf("%d", &z);
    //ejercico 3.1.1
    printf("%d\n",x + y + 1);  // para x→7, y→3, z→5 = 11 y para x→1, y→10, z→8 = 12
   // Ejercicio 3.1.2
    printf("%d\n", z * z + y * 45 - 15 * x);  //para x→7, y→3, z→5 = 55 y para x→1, y→10, z→8 = 499
   // Ejercicio 3.1.3
    punto3(x,y);     //para x→7, y→3, z→5 = False y para x→1, y→10, z→8 = False
   // Ejercicio 3.1.4
    printf("%d\n", y/2 *x);  //para x→7, y→3, z→5 = 7 y para x→1, y→10, z→8 = 5
   // Ejercicio 3.1.5
    punto5(x,y,z);       //para x→7, y→3, z→5 = True y para x→1, y→10, z→8 = False
	return 0;
}
