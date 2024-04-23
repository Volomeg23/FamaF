#include <stdlib.h>
#include <stdio.h>
#include <assert.h>
#include <stdbool.h>

// PUNTO 3 ASIGNACIONES
//Ejercicio 3.3 (assert, si no se cumple lo de () lo que sigue no se ejecuta, forzando a que el usuario ingrese lo que se debe, USA BOOLEANOS)
void Asignacion_a (int x) {
    printf("Ingrese el valor de x\n");
    scanf("%d", &x);
    assert(x==1);
    x = 5;
    printf("x = %d\n", x);
}

void Asignacion_b (int x, int y) {    
    printf("Ingrese el valor de x\n");
    scanf("%d", &x);
    printf("Ingrese el valor de y\n");
    scanf("%d", &y);
    assert(x==2);
    assert(y==5);
    x = x + y;
    y = y + y;
    printf("x = %d\n", x);
    printf("y = %d\n", y);
}
void Asignacion_c (int x, int y) {    
    printf("Ingrese el valor de x\n");
    scanf("%d", &x);
    printf("Ingrese el valor de y\n");
    scanf("%d", &y);
    assert(x==2);
    assert(y==5);
    y = y + y;
    x = x + y;
    printf("x = %d\n", x);
    printf("y = %d\n", y);
}


int main (void) {
    int x = 0 ,y = 0;
    Asignacion_a(x);        //ejecucion 1 con x=5 da 5, ejecucion 2 con x=2 da 5, ejecucion 3 con x=0 da 5
    Asignacion_b(x,y);      //ejecucion 1 con x=5,y=2 da x=7 e y=4, ejecucion 2 con x=10,y=10 da x=20 e y=20, ejecucion 3 con x=-5,y=5 da x=0 e y=10
    Asignacion_c(x,y);      // ejecucion 1 con x=5,y=2 da x=9 e y=4, ejecucion 2 con x=10,y=10 da x=30 e y=20, ejecucion 3 con x=-5,y=5 da x=5 e y=10
    return 0;              

}
