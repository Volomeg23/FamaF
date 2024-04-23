#include <stdlib.h>
#include <stdio.h>


int pedirEntero (void) {
    int n = 0;
    printf("Ingrese un valor\n");
    scanf("%d", &n);
    return n;
}

int suma_hasta (int n){
    int x = n;
    while (n!=0){
        x = x + (n - 1);
        n--;
    }
    printf("El valor de N es %d\n",x);
    return x;
}

int main (void){
    int z = 0;
    z = pedirEntero();
    (z > 0) ? suma_hasta(z) : printf("valor no valido\n");
return 0;
}