/*
  @file sort.c
  @brief sort functions implementation
*/

#include <assert.h>
#include <stdbool.h>
#include <stdlib.h>
#include <stdio.h>
#include "helpers.h"
#include "sort.h"
#include "player.h"

bool goes_before(player_t x, player_t y){
    bool b = true;
    if( x->rank <=  y->rank ){
        b = true;
    }else{
        b = false;
    }
    return b;
}

/*En C, acceder a una estructura usando punteros es a menudo más eficiente que acceder a la estructura usando el operador punto.

La razón principal de esto es que cuando se accede a una estructura mediante el operador punto,
el compilador debe desreferenciar (acceder al valor en la posicion de memoria apuntada por el puntero)
el puntero a la estructura cada vez que se accede a un miembro de la estructura. 
Esto puede llevar a un mayor número de operaciones de desreferenciación de punteros, lo que a su vez puede hacer que el programa sea menos
eficiente en términos de tiempo de ejecución.

Por otro lado, al acceder a una estructura mediante un puntero, el compilador solo necesita realizar una operación de desreferenciación
de puntero para acceder a la dirección de memoria de la estructura. Una vez que se accede a la dirección de memoria,
se puede acceder directamente a cualquier miembro de la estructura sin necesidad de realizar operaciones adicionales de desreferenciación
de puntero.

Además, el acceso a una estructura mediante un puntero puede ser más eficiente en términos de uso de memoria,
ya que los punteros suelen ocupar menos espacio en memoria que las estructuras completas.

En resumen, el acceso a una estructura mediante punteros puede ser más eficiente que el acceso mediante el operador punto debido a una
menor cantidad de operaciones de desreferenciación de puntero y un uso más eficiente de la memoria.

el uso de punteros a una estructura y el operador punto son herramientas diferentes que se utilizan en diferentes situaciones.
El uso de punteros a una estructura permite trabajar con la misma estructura en diferentes partes del programa o función,
mientras que el operador punto permite acceder directamente a los miembros de una estructura a través de su nombre.

respuesta de profe: Es decir, la magia no está en el operador . vs -> sino en copiar estructuras vs pasar punteros... 

esto se puede explicar ya que cuando usamos el operador . , para cada llamada a la estructura se tiene que copiar la estrucutra a
a memoria estatica, esto siendo para el ejercicio es una tarea que se repite muchisimas veces por lo que a la larga termina
ralentizando el programa, en cambio usando punteros, usamos memoria dinamica permitiendo que la estructura se pueda modificar
sin necesidad de copiarla como variable local de la funcion */





bool array_is_sorted(player_t atp[], unsigned int length) {
    unsigned int i = 1u;
    while (i < length && goes_before(atp[i - 1u], atp[i])) {
        i++;
    }
    return (i == length);
}

void swap(player_t a[], unsigned int i, unsigned j){
player_t tmp;
tmp = a[i];
a[i] = a[j];
a[j] = tmp; 
}


static void insert(player_t a[], unsigned int i) {
    unsigned int j = i;
    while(j>0 && goes_before(a[j],a[j-1])){
        swap(a,j-1,j);
        j=j-1;
    }

}

void sort(player_t a[], unsigned int length) {
    for(unsigned int i = 1u; i < length;i++){
        insert(a, i);
    }
}

