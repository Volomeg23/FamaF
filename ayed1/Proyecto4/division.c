#include <stdlib.h>
#include <stdio.h>
#include <assert.h>
#include <stdbool.h>


int pedirEntero (void) {
    int n = 0;
    printf("Ingrese un valor para dividir\n");
    scanf("%d", &n);
    return n;
}


struct div_t {
    int cociente;
    int resto;
};

struct div_t division (int x , int y) {
    assert(y != 0);
    struct div_t res;
    res.cociente = x / y;
    res.resto = x % y;
    return res;
}

int main (void) {
    int x = 0, y = 0;
    struct div_t resultado;
    x = pedirEntero();
    y = pedirEntero();
    resultado = division(x,y);
    printf("el cociente de la division es %d\n", resultado.cociente);
    printf("el resto de la division es %d\n", resultado.resto);
    return 0;
}




