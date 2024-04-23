#include <stdlib.h>
#include <stdio.h>

void absolute(int x, int y) {
    if (x >= 0){
        y = x;
    }else{
        y = -x;
    }
}

int main(void) {
    int a=0, res=0;
    a = -10;
    absolute(a,res);
    printf("el valor absoluto de %d es %d\n",a,res);
    return EXIT_SUCCESS;
}

// el valor mostrado en pantalla no es el indicado ya que el procedimiento pasa la variable res por valor y al recibirla
//y modificarla no afecta el valor original de res que es res = 0



