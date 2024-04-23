#include <stdlib.h>
#include <stdio.h>

// PUNTO 2 DEBUGGING

void expresion1 (int a) {
    if (a % 4 == 0) {
     printf("True\n"); 
 } else {
     printf("False\n");
 }
}

void expresion2 (int a, int b, int c) {
    if (a + b == 0 && b - a  == (-1) * c) {
     printf("True\n"); 
 } else {
     printf("False\n");
 }
}

void expresion3 (int a, int b) {
    if (!a && b) {         // aca el b si es True al ser la negacion queda False y absorbe al w sea True o False, si es False queda con True y es neutro, por lo tanto w debe ser False.
     printf("True\n"); 
 } else {
     printf("False\n");
 }
}

int main (void) {
    int x = 0, y = 0, z = 0, b = 0, w = 0;
    // x->4 , y->(-4) , z->8, b->1 , w->0 (b y w estan interpretados como booleanos)
    printf("Ingrese el valor de x\n");
    scanf("%d", &x);
    printf("Ingrese el valor de y\n");
    scanf("%d", &y);
    printf("Ingrese el valor de z\n");
    scanf("%d", &z);
    printf("Ingrese el valor de b\n");
    scanf("%d", &b);
    printf("Ingrese el valor de w\n");
    scanf("%d", &w);
    expresion1(x);
    expresion2(x,y,z);
    expresion3(b,w);
	return 0;
}