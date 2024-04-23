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
    x = pedirEntero();
    y = pedirEntero();
    z = x;
    x = y;
    y = z;
    return 0;
}

int main (void) {
    int x = 0, y = 0, z = 0;
    interVariables(x,y);
    return 0;
}