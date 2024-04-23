#include <stdlib.h>
#include <stdio.h>
#include <assert.h>

int pedirEntero (void) {
    int n = 0;
    printf("Ingrese un valor para dividir\n");
    scanf("%d", &n);
    return n;
}


struct calculos_t{
    int valor_original;
    int segundo_calculo;
    int tercero_calculo;
};

struct calculos_t calculos(int x){
    struct calculos_t res;
    res.valor_original = x;
    res.segundo_calculo = 2*x;
    res.tercero_calculo = x*x;
    return res;
}

int main (void) {
    int x = 0;
    struct calculos_t resultado;
    x = pedirEntero();
    resultado = calculos(x);
    printf("el valor original es igual a  %d\n", resultado.valor_original);
    printf("el segundo calculo es igual a  %d\n", resultado.segundo_calculo);
    printf("el tercer calculo es igual a  %d\n", resultado.tercero_calculo);
    return 0;
}