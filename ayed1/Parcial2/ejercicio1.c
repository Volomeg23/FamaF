#include <stdlib.h>
#include <stdio.h>
#include <assert.h>

int pedirEntero (void) {
    int n = 0;
    printf("Ingrese un valor\n");
    scanf("%d", &n);
    return n;
}

int inter_var (int x, int y, int z){
    assert(z*x != y);
    assert(z*y != 0);
    x = (x+z) / (z*x-y);
    y = x%y;
    printf("el valor de x es %d\n",x);
    printf("el valor de y es %d\n",y);
    printf("el valor de z es %d\n",z);
    return 0;
}

int main (void){
    int x = 0, y = 0, z = 0;
    x = pedirEntero();
    y = pedirEntero();
    z = pedirEntero();
    inter_var(x,y,z);
    return 0;
}