#include <stdlib.h>
#include <stdio.h>

struct comp_t {
    int menores;
    int iguales;
    int mayores;
};

int pedirEntero (void) {
    int n = 0;
    printf("Ingrese un valor para el indice\n");
    scanf("%d", &n);
    return n;
}

int pedirEntero2 (void) {
    int n = 0;
    printf("Ingrese un valor para comparar\n");
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

struct comp_t cuantos(int a[], int tam, int elem) {
    struct comp_t res;
    res.iguales = 0, res.mayores = 0, res.menores = 0;
    int i = 0;
    while (i < tam){
        if (a[i] == elem){
            res.iguales = res.iguales + 1;
        } else if ( a[i] > elem){
            res.mayores = res.mayores + 1;
        } else {
            res.menores = res.menores + 1;
        }
        i++;
    }
    return res;
}


#define N 6
int main (void){
    int a[N];
    int y = 0;
    struct comp_t resultado;
    pedirArreglo(a,N);
    y = pedirEntero2();
    resultado = cuantos(a,N,y);
    printf("la cantidad de elementos iguales al valor son %d\n", resultado.iguales);
    printf("la cantidad de elementos mayores al valor son %d\n", resultado.mayores);
    printf("la cantidad de elementos menores al valor son %d\n", resultado.menores);
}