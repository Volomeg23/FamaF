#include <stdlib.h>
#include <stdio.h>

// {Pre: x = X, y = Y}
//x := x + 1, 
//y := x + y
//{Post: x = X + 1, y = X + Y}

int pedirEntero (void) {
    int n = 0;
    printf("Ingrese un valor\n");
    scanf("%d", &n);
    return n;
}

void multiple1 (int x, int y){
    x = x + 1;
    y = x + y;
    printf("El valor de x es %d\n",x);
    printf("El valor de y es %d\n",y);
}

int main (void){
    int x = 0, y = 0;
    x = pedirEntero();
    y = pedirEntero();
    multiple1(x,y);
    return 0;
}