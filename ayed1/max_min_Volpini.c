#include <stdio.h>    /* printf(), scanf() */
#include <stdbool.h>  /* tipo bool         */

#include <assert.h>   /* assert() */


struct max_min_result {
    int max_value;
    int min_value;
    unsigned int max_position;
    unsigned int min_position;
};

int pedirEntero (void){
    int n = 0;
    printf("ingrese un valor par el indice\n");
    scanf("%d",&n);
    return n;
}

void pedirArreglo (int a[],int n_max){
    int i = 0;
    while (i < n_max){
        a[i]= pedirEntero();
        i++;
    }
}

struct max_min_result compute_max_min(int array[], unsigned int length)
{   assert(length > 0);
    struct max_min_result result = { 0, 0, 0, 0 };  //inicializacion multiple
    result.max_value = array[0];
    result.min_value = array[0];
    result.max_position = 0;
    result.min_position = 0;
    for (int unsigned i = 0 ; i < length; i++){
        if (result.max_value < array[i]){
            result.max_value = array[i];
            result.max_position = i;

        }
        if (result.min_value > array[i]){
            result.min_value = array[i];
            result.min_position = i;
        } 
    }
    return result;
}
#define N 10
int main(void)
{
    int array[N];
    pedirArreglo(array,N);
    struct max_min_result result = compute_max_min(array,N);
    printf("Máximo: %d\n", result.max_value);
    printf("Posición del máximo: %u\n", result.max_position);
    printf("Mínimo: %d\n", result.min_value);
    printf("Posición del mínimo: %u\n", result.min_position);
    return 0;
}

