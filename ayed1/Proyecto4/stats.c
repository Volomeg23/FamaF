#include <stdlib.h>
#include <stdio.h>
#include <assert.h>


struct datos_t {
float maximo;
float minimo;
float promedio;
};

float sumatoria(float a[], int tam){
    assert(tam >= 0);
    int i = 0;
    int x = 0;
    while (i < tam ){
        x = x + a[i];
        i++;
    }
    return x;
}


float pedirEntero (void) {
    float n = 0;
    printf("Ingrese un valor para el indice\n");
    scanf("%f", &n);
    return n;
}


void pedirArreglo (float a[], int n_max){
    assert(n_max >= 0);
    int i = 0;
    while (i < n_max) {
        a[i] = pedirEntero();
        i++;
    }
}

struct datos_t stats (float a[], int tam) {
    struct datos_t res;
    res.minimo = a[0], res.maximo = a[0], res.promedio = 0;
    int i = 0;
    while (i < tam){
        if (a[i] >= res.maximo){
            res.maximo = a[i];
        } else {
        }
        if (a[i] < res.minimo){
            res.minimo = a[i];
        } else {

        }
        i++;
    }
    return res;
}


#define N 6
int main (void){
    float a[N];
    struct datos_t resultado;
    pedirArreglo(a,N);
    sumatoria(a,N);
    resultado = stats(a,N);
    resultado.promedio = sumatoria(a,N)/N;
    printf("el maximo elemento del arreglo es %f\n", resultado.maximo);
    printf("el minimo elemento del arreglo es %f\n", resultado.minimo);
    printf("el promedio de los elementos del arreglo es %f\n", resultado.promedio);
}