#include <stdlib.h>
#include <stdio.h>
#include <assert.h>
#include <stdbool.h>

// PUNTO 4 CONDICIONALES

void Condicional_e (int x, int y){
     printf("Ingrese el valor de x\n");
    scanf("%d", &x);
    printf("Ingrese el valor de y\n");
    scanf("%d", &y);
    if (x>=y) {
        x=0;
        printf("x = %d\n", x);
    } else {
        x=2;
        printf("x = %d\n", x);
    }
}

void Condicional_f (int x, int y){
    printf("Ingrese el valor de x\n");
    scanf("%d", &x);
    printf("Ingrese el valor de y\n");
    scanf("%d", &y);
    if (x>=y) {
        x=0;
        printf("x = %d\n", x);
    } else {
        x=2;
        printf("x = %d\n", x);
    }
}
void Condicional_b (int x, int y, int z, int m) {   //Este programa calcula el minimo entre 3 numeros y m es igual al minimo.
    printf("Ingrese el valor de x\n");
    scanf("%d", &x);
    printf("Ingrese el valor de y\n");
    scanf("%d", &y);
    printf("Ingrese el valor de z\n");
    scanf("%d", &z);
    m = 0;
    if (x<y) {
        m = x;
        printf("m = %d\n", x);
    } else {
        m = y;
        printf("m = %d\n", y);
    }
    printf("x = %d\n", x);
    printf("y = %d\n", y);
    printf("z = %d\n", z);
    printf("m = %d\n", m);
    printf("Ahora, si z = %d\n entonces: ", z);
    if (m<z) {
        printf("m sigue siendo igual a %d\n", m);
    } else {
        m = z;
        printf("m = %d\n", z);
    }
    printf("x = %d\n", x);
    printf("y = %d\n", y);
    printf("z = %d\n", z);
    printf("m = %d\n", m);
}


int main (void) {
    int x = 0 ,y = 0, z = 0, m = 0;
    Condicional_e(x,y);
    Condicional_f(x,y);
    Condicional_b(x,y,z,m); // Estado sigma1 : x -> 5, y -> 4, z -> 8, m -> 4. Estado Sigma2:  x -> 5, y -> 4, z -> 8, m -> 4.
    return 0;
}

