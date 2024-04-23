#include <stdlib.h>
#include <stdio.h>
#include <assert.h>
#include <stdbool.h>

int pedirEntero (void) {
    int n = 0;
    printf("Ingrese un valor para el indice\n");
    scanf("%d", &n);
    return n;
}
int pedirEntero2 (void) {
    int n = 0;
    printf("Ingrese un indice para intercambiar\n");
    scanf("%d", &n);
    return n;
}


void pedirArreglo (int a[], int n_max){
    assert(n_max >= 0);
    int i = 0;
    while (i < n_max) {
        a[i] = pedirEntero();
        i++;
    }
}

void imprimeArreglo (int a[], int n_max) {
    assert(n_max >= 0);
    int i = 0;
    printf("[");
    while (i < n_max) {
        printf("%d,", a[i]);
        i++;
    }
    printf("]\n");
}


void intercambiar (int a[], int tam, int i, int j){
    int temp = 0;
    assert(i < tam);
    assert(j < tam);
    temp = a[i];
    a[i] = a[j];
    a[j] = temp;

}


#define N 6
int main (void) {
    int a[N];
    int p = 0, s = 0;
    pedirArreglo(a,N);
    imprimeArreglo(a,N);
    p = pedirEntero2();
    s = pedirEntero2();
    if (0 <= p && 0 <= s && p != s){
        intercambiar(a,N,p,s);
    } else {
        printf("Valores no validos\n");
    }
    imprimeArreglo(a,N);
    return 0;
}