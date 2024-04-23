#include <stdlib.h>
#include <stdio.h>
#include <assert.h>

int pedirEntero (void) {
    int n = 0;
    printf("Ingrese un valor para la funcion\n");
    scanf("%d", &n);
    return n;
}


void holaHasta(int n) {
    assert(n>0);
    while (n != 0) {
        printf("Hola\n");
        n = n -1;
    }
}


int main (void) {
    int n = pedirEntero();
    holaHasta(n);
    return 0;
}
