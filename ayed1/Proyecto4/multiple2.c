#include <stdlib.h>
#include <stdio.h>

//{Pre: x = X, y = Y, z = Z}
//x := y 
//y := y + x + z 
//z := y + x
//{Post: x = Y, y = Y + X + Z, z = Y + X}

int pedirEntero (void) {
    int n = 0;
    printf("Ingrese un valor\n");
    scanf("%d", &n);
    return n;
}

void multiple2 (int x, int y, int z){
    x = y;
    y = y + x + z;
    z = y + x;
    printf("El valor de x es %d\n",x);
    printf("El valor de y es %d\n",y);
    printf("El valor de z es %d\n",z);
}

int main (void){
    int x = 0, y = 0, z = 0;
    x = pedirEntero();
    y = pedirEntero();
    z = pedirEntero();
    multiple2(x,y,z);
    return 0;
}