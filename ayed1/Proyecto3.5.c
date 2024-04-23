#include <stdlib.h>
#include <stdio.h>
#include <assert.h>
#include <stdbool.h>

// PUNTO 5 CICLOS

void Ciclo_h (int x){
    printf("Ingrese el valor de x\n");
    scanf("%d", &x);
    while (x != 0) {
        x= x - 1;
        printf("x = %d\n", x);
    }
}

void Ciclo_i (int x){
    printf("Ingrese el valor de x\n");
    scanf("%d", &x);
    while (x != 0) {
        x=0;
        printf("x = %d\n", x);
    }
}

void Ciclo_1b (int x, int y){     // Este programa hace la division de x con y, i es el cociente de la division.
    int i;
    i =  0;
    printf("Ingrese el valor de x\n");
    scanf("%d", &x);
    printf("Ingrese el valor de y que sea menor a x\n");
    scanf("%d", &y);
    assert (x >= y);
    while (x >= y) {
        x = x - y;
        i = i + 1;
        printf("x = %d\n", x);
        printf("y = %d\n", y);
        printf("i = %d\n", i);
    }
}

void Ciclo_2b (int x){  // Este programa calcula si x es primo
    int i; 
    bool res;
    i = 2;
    res = 1;
    printf("Ingrese el valor de x\n");
    scanf("%d", &x);
    while ((i < x) && res) {
        res = res && (x % i != 0);
        printf("x = %d\n", x);
        printf("i = %d\n", i);
        printf("res = %d\n", res);
        i++;                      // i++ = i +1
    }
     if (res) {
         printf("Si es primo\n");
     } else {
         printf("No es primo\n");
     }
} 

int main (void) {
    int x = 0 ,y = 0;
    Ciclo_h(x);
    Ciclo_i(x);
    Ciclo_1b(x,y);    //Iteracion 1 : x -> 10 , y -> 3, i -> 1. Iteracion 2 :  x -> 7 , y -> 3, i -> 2. Iteracion 3 :  x -> 4 , y -> 3, i -> 3. Iteracion 4 :  x -> 1 , y -> 3, i -> 4.
    Ciclo_2b(x);     // Iteracion 1 : x -> 5, i -> 2, res -> True. Iteracion 2 : x -> 5, i -> 3, res -> True. Iteracion 3 : x -> 5, i -> 4, res -> True.
    return 0;   
}
