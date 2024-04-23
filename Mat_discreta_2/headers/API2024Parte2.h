#ifndef APIG2024PARTE2_H
#define APIG2024PARTE2_H


#include <stdio.h>
#include <stdlib.h>

#include "APIG24.h"



typedef struct ColorStr* Colores;


u32 Greedy(Grafo G, u32* Orden);
//Orden O(m)

char GulDukat(Grafo G,u32* Orden);
//Si todo anduvo bien devuelven el char 0, si no el char 1.
//La forma de ordenar los v ́ertices en ambos casos es ordenar v ́ertices por bloques de colores, como en el VIT.
//Es decir, ambas funciones lo que har ́an es ordenar los v ́ertices poniendo primero todos los v ́ertices que tengan un color
//x1, luego todos los v ́ertices que tengan un color x2, etc.
//La diferencia entre ambas funciones es quienes son los colores x1, x2, ... etc. asi que en cada caso especificaremos esto.
//Ambas funciones deberian ser, idealmente, O(n), pero O(nlog n) es aceptable.

//Entonces debe poner primero todos los colores que sean divisibles por 4, ordenados entre si de acuerdo con M(x) (de
//mayor a menor), luego todos los colores pares no divisibles por 4, ordenados entre si de acuerdo con M(x) + m(x) (de mayor
//a menor) y finalmente todos los colores impares, ordenados entre si de acuerdo con m(x). (de mayor a menor).

char ElimGarak(Grafo G,u32* Orden);

// La forma de llenar Orden como se dijo, es poner todos los v ́ertices de color x1 primero, luego los de color x2, etc, donde
// x1, x2, ... vienen dados de la siguiente manera, asumiendo que hay r colores:
// xr = 1.
// xr−1 = 2.
// x1 es el color que tiene la menor cantidad de v ́ertices de ese color, excluyendo a los colores 1 y 2.
// x2 es el color que tiene la menor cantidad de v ́ertices de ese color, excluyendo a los colores 1,2 y x1.
// etc.

void pares_dec_impares_crec(u32* Orden, u32 V);
void print_orden(u32* Orden, u32 V);
void pares_crec_impares_dec(u32* Orden, u32 V);
void mergeSort_by_Grade(u32* Orden, int left, int right,Grafo G);
#endif // APIG2024PARTE2_H