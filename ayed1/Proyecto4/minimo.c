#include <stdlib.h>
#include <stdio.h>


int pedirEntero (void) {
    int n = 0;
    printf("Ingrese un valor para la funcion\n");
    scanf("%d", &n);
    return n;
}


int minimo (int x, int y) {
    if (x < y) {
        x = x; 
    } else {
        x = y;
    }
    return x;
}

int main (void) {
    int x = pedirEntero();
    int y = pedirEntero();
    x = minimo(x,y);
    printf("el minimo entre x e y es %d\n",x);
    return 0;
}