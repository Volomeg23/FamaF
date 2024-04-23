#include <stdlib.h>
#include <stdio.h>
#include <assert.h>

// PUNTO 6 FUNCIONES 
// a)

int pedirEntero (void) {
    int x = 0;
    printf("Ingrese un valor \n");
    scanf("%d", &x);
    return x;
}

void imprimeEntero (int x) {
    printf("Su valor es %d\n", x);
}



int main (void) {
    int q = pedirEntero();
    imprimeEntero(q);
    return 0;
}

