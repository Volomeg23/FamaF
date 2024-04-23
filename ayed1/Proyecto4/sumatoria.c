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


void pedirArreglo (int a[], int n_max){
    assert(n_max >= 0);
    int i = 0;
    while (i < n_max) {
        a[i] = pedirEntero();
        i++;
    }
}


int sumatoria(int a[], int tam){
    assert(tam >= 0);
    int i = 0;
    int x = 0;
    while (i < tam ){
        x = x + a[i];
        i++;
    }
    return x;
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


#define N 6
int main (void) {
    int a[N];
    pedirArreglo(a,N);
    imprimeArreglo(a,N);
    sumatoria(a,N);
    return 0;
}






