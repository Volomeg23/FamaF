#include <stdlib.h>
#include <stdio.h>

void absolute(int x, int *y) {
    if(x >= 0){
        *y = x;
    }else{
       *y = -x;
    }
}

int main(void) {
    int a=0, res=0;  // No modificar esta declaración
    a = -10;
    absolute(a,&res);
    printf("el valor absoluto de %d es %d\n",a,res);
    return EXIT_SUCCESS;
}

//en este caso la varibale res se pasa por referencia permitiendo la modificacion de la variable fuera de la llamda a la funcion
// la variable int *y es de tipo out, ya que absolute solo la usa para escribir en ella

