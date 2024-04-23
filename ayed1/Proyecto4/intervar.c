#include <stdlib.h>
#include <stdio.h>

int pedirEntero (void) {
    int n = 0;
    printf("Ingrese un valor\n");
    scanf("%d", &n);
    return n;
}

int interVariables (int x, int y) {
    int z = 0;
    z = pedirEntero();
    z = x;
    x = y;
    y = z;
    printf("el valor de x es %d\n",x);
    printf("el valor de y es %d\n",y);
    printf("el valor de z es %d\n",z);
    return 0;
}

int main (void) {
    int x = 0, y = 0;
    x = pedirEntero();
    y = pedirEntero();
    interVariables(x,y);
    return 0;
}