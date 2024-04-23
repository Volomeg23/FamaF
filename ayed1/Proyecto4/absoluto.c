#include <stdlib.h>
#include <stdio.h>

int pedirEntero (void) {
    int n = 0;
    printf("Ingrese un valor para la funcion\n");
    scanf("%d", &n);
    return n;
}


int absoluto (int x) {
    if (x < 0) {
        x = -x;
    } else {
        x = x;
    }
    return x;
} 

int main (void) {
    int x = pedirEntero();
    x = absoluto(x);
    printf("el valor absoluto de x es %d\n",x);
    return 0;
}