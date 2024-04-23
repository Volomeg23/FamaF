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

bool todos_positivos(int a[], int tam){
int i;
bool e;
e = true;
i = 0;

while (i<tam - 1) {
    e = e && (a[i] > 0);
    i++ ;
}
if (e) {
    printf("Todos positivos\n");
} else {
    printf("No son todos positivos\n");
}
return e; 
}

bool existe_positivos(int a[], int tam){
int i;
bool e;
e = false;
i = 0;

while (i<tam - 1) {
    e = e || (a[i] > 0);
    i++ ;
}
if (e) {
    printf("alguno de los numeros es positivo\n");
} else {
    printf("Ninguno es positivo\n");
}
return e; 
}

#define N 6
int main (void) {
    int a[N];
    int q = 0;
    pedirArreglo(a,N);
    printf("ingrese 1 si quiere comprobar que todos sean positivos \ningrese 2 si quiere comprobar que alguno sea positivo\n");
    scanf("%d", &q);
    if (q == 1){
        todos_positivos(a,N);
    } else if (q == 2) {
        existe_positivos(a,N);
    } else {
        printf("el numero ingresado no es valido\n");
    }
    imprimeArreglo(a,N);
return 0;
}


/*bool todos_iguales(int a[], int tam){
int i;
bool e;
e = true;
i = 0;

while (i<tam - 1) {
    e = e && a[i] == a[i+1];
    i++ ;
}
if (e) {
    printf("Todos iguales\n");
} else {
    printf("No son todos iguales\n");
}
return e; 
}*/