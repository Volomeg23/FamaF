#include <stdlib.h>
#include <stdio.h>
#include <assert.h>

//Aca reescribi la funcion del 6a, pero hice algunas modificaciones para que se vea mejor y mas claro como corre el 4b. Sin embargo, se puede usar la funcion pedirEntero e imprimeEntero como estan.

int pedirEntero2 (char* var) {
    int x = 0;
    printf("Ingrese un valor para la variable %s\n",var);
    scanf("%d", &x);
    return x;
}

void imprimeEntero2 (char* var,int x) {
    printf("El valor de la variable %s es %d\n", var,x);
}



// b)
void Condicional_b (int x, int y, int z, int m) { 
    x = pedirEntero2("x");
    y = pedirEntero2("y");
    z = pedirEntero2("z");
    m = 0;
    if (x<y) {
        m = x;
        imprimeEntero2("m",x);
    } else {
        m = y;
       imprimeEntero2("m",y);
    }
    printf("Ahora, si z = %d\n entonces: ", z);
    if (m<z) {
        printf("m sigue siendo igual a %d\n", m);
    } else {
        m = z;
        imprimeEntero2("m",z);
    }
    imprimeEntero2("x",x);
    imprimeEntero2("y",y);
    imprimeEntero2("z",z);
    imprimeEntero2("m",m);
}

// La ventaja de esto es que podemos usar la funcion cuando queramos sin recurir a printf y scanf. 
//Esta funcion se puede usar en el punto 1,2,3,4 y 5. algunos ejemplos de eso serian:

void Asignacion_a (int x) {
    x = pedirEntero2("x");
    assert(x==1);
    x = 5;
    imprimeEntero2("x",x);


}

void Condicional_e (int x, int y){
    x = pedirEntero2("x");
    y = pedirEntero2("y");
    if (x>=y) {
        x=0;
        imprimeEntero2("x",x);
    } else {
        x=2;
        imprimeEntero2("x",x);
    }
}

void Ciclo_1b (int x, int y){  
    int i;
    i =  0;
    x = pedirEntero2("x");
    y = pedirEntero2("y");
    assert (x >= y);
    while (x >= y) {
        x = x - y;
        i = i + 1;
    imprimeEntero2("x",x);
    imprimeEntero2("y",y);
    imprimeEntero2("i",i);
    }
}

int main (void) {
    int x = 0, y = 0, z = 0, w = 0;
    Condicional_b(x,y,z,w);
    Asignacion_a(x);
    Condicional_e(x,y);
    Ciclo_1b(x,y);
    return 0;
}