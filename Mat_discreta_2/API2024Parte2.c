#include <assert.h>
#include <stdbool.h>
#include <stdio.h>
#include <stdlib.h>
#include <string.h>

#include "APIG24.h"
#include "API2024Parte2.h"

typedef struct ColorStr{
    u32 id;
    u32 cantidad;
    u32 max_grade;
    u32 min_grade;
    u32 max_min;
    u32* vertices;
}ColorStr;

typedef struct GroupStr{
    u32 cantidad_total;
    u32 cantidad_colores;
    ColorStr* subgroups;
}Group;

inline static u32 maxx(u32 x, u32 y) {
    return (x>y)?x:y;
}

u32 Greedy(Grafo G, u32* Orden){

    u32 V = NumeroDeVertices(G);
    u32 D = Delta(G);
    //primero chequeamos la biyeccion
    for(u32 i = 0; i < V; i++){
        if(!existe_vertice(G, Orden[i])){ //si el vertice no existe
            return MAX_U32 - 1; //devuelvo el maximo valor de u32 
        }
    }
    u32 max_color = 1;
    bool* coloured = calloc(V, sizeof(bool));   // dice si el i-esimo nodo esta coloreado
    bool* color_used = calloc(D+1, sizeof(bool));    // dice si el i-esimo color esta usado
    color* Color = calloc(V, sizeof(color));    // color de cada nodo

    ExtraerColores(G, Color);

    if (coloured == NULL || color_used == NULL){
        return MAX_U32 - 1; 
    }

    Color[Orden[0]] = 0;
    coloured[Orden[0]] = true;

    for (u32 i = 1; i < V; ++i) {
        u32 min_number = 0, max_vec = 0;
                              
            //listar_vecinos(G, Orden[i]);              
            for (u32 j = 0; j < Grado(Orden[i],G); j++) {
                if (coloured[Vecino(j,Orden[i],G)]) {
                    //printf("Vecino %u de %u ya coloreado con color %u\n", Vecino(j,Orden[i],G), Orden[i], Color[Vecino(j,Orden[i],G)]);
                    color_used[Color[Vecino(j,Orden[i],G)]] = true;
                    max_vec = maxx(max_vec, Color[Vecino(j,Orden[i],G)]);
                }
            }
        while (color_used[min_number]) {
            min_number++;
        }

        max_color = maxx(max_color, min_number);
        Color[Orden[i]] = min_number;
        coloured[Orden[i]] = true;
        //printf("Vertice %u coloreado con color %u\n\n\n", Orden[i], min_number);

        for (u32 j = 0; j <= max_vec; ++j){
            color_used[j] = false;
        }
    }

    free(coloured);
    coloured = NULL;
    free(color_used);
    color_used = NULL;
    ImportarColores(Color, G);
    free(Color);
    Color = NULL;
    ActualizarColoreo(G, max_color+1);
    return max_color+1;
    //si se necesita comprobar que coloreo se hizo en cada vertice --> descomentar los printf y listar_vertices

}

int compare(const void *a, const void *b) {
    u32 num1 = *(const u32 *)a;
    u32 num2 = *(const u32 *)b;
    
    // Si ambos números son pares, ordenar de forma decreciente
    if (num1 % 2 == 0 && num2 % 2 == 0) {
        return (num2 - num1);
    }
    // Si ambos números son impares, ordenar de forma creciente
    else if (num1 % 2 != 0 && num2 % 2 != 0) {
        return (num1 - num2);
    }
    // Si uno es par y el otro es impar, colocar el par antes
    else if (num1 % 2 == 0) {
        return -1;
    } else {
        return 1;
    }
}

int compare2(const void *a, const void *b) {
    u32 num1 = *(const u32 *)a;
    u32 num2 = *(const u32 *)b;
    
    // Si ambos números son pares, ordenar de forma creciente
    if (num1 % 2 == 0 && num2 % 2 == 0) {
        return (num1 - num2);
    }
    // Si ambos números son impares, ordenar de forma decreciente
    else if (num1 % 2 != 0 && num2 % 2 != 0) {
        return (num2 - num1);
    }
    // Si uno es par y el otro es impar, colocar el par antes
    else if (num1 % 2 == 0) {
        return -1;
    } else {
        return 1;
    }
}

void pares_dec_impares_crec(u32* Orden, u32 V){
    // Usar qsort para ordenar los números en Orden
    qsort(Orden, V, sizeof(u32), compare);
}

void pares_crec_impares_dec(u32* Orden, u32 V){
    // Usar qsort para ordenar los números en Orden
    qsort(Orden, V, sizeof(u32), compare2);
}
int compare_grado(const void* a, const void* b, Grafo G) {
    u32 vertice1 = *(const u32*)a;
    u32 vertice2 = *(const u32*)b;
    
    u32 grado1 = Grado(vertice1, G);
    u32 grado2 = Grado(vertice2, G);
    
    return grado2 - grado1;
}



void merge(u32* Orden, int left, int middle, int right, Grafo G) {
    int i, j, k;
    int n1 = middle - left + 1;
    int n2 = right - middle;

    // Crear arreglos temporales
    int L[n1], R[n2];

    // Copiar datos a los arreglos temporales L[] y R[]
    for (i = 0; i < n1; i++)
        L[i] = Orden[left + i];
    for (j = 0; j < n2; j++)
        R[j] = Orden[middle + 1 + j];

    // Combinar los arreglos temporales de vuelta en arr[left..right]
    i = 0;
    j = 0;
    k = left;
    while (i < n1 && j < n2) {
        if ( Grado(L[i],G) >= Grado(R[j],G)) {
            Orden[k] = L[i];
            i++;
        } else {
            Orden[k] = R[j];
            j++;
        }
        k++;
    }

    // Copiar los elementos restantes de L[], si hay alguno
    while (i < n1) {
        Orden[k] = L[i];
        i++;
        k++;
    }

    // Copiar los elementos restantes de R[], si hay alguno
    while (j < n2) {
        Orden[k] = R[j];
        j++;
        k++;
    }
}

// Función principal de Merge Sort que ordena el arreglo arr[left..right] usando merge()
void mergeSort_by_Grade(u32* Orden, int left, int right, Grafo G) {
    if (left < right) {
        // Encuentra el punto medio del arreglo
        int middle = left + (right - left) / 2;

        // Ordena primero y segundo subarreglos
        mergeSort_by_Grade(Orden, left, middle, G);
        mergeSort_by_Grade(Orden, middle + 1, right, G);

        // Combina los subarreglos ordenados
        merge(Orden, left, middle, right, G);
    }
}

void print_orden(u32* Orden, u32 V){
    for(u32 i = 0; i < V; i++){
        printf("%u ", Orden[i]);
    }
    printf("\n");
}

void merge2(ColorStr* Color , int left, int middle, int right) {
    int i, j, k;
    int n1 = middle - left + 1;
    int n2 = right - middle;

    // Crear arreglos temporales
    ColorStr L[n1], R[n2];

    // Copiar datos a los arreglos temporales L[] y R[]
    for (i = 0; i < n1; i++)
        L[i] = Color[left + i];
    for (j = 0; j < n2; j++)
        R[j] = Color[middle + 1 + j];

    // Combinar los arreglos temporales de vuelta en arr[left..right]
    i = 0;
    j = 0;
    k = left;
    while (i < n1 && j < n2) {
        if ( L[i].cantidad <= R[j].cantidad) {
            Color[k] = L[i];
            i++;
        } else {
            Color[k] = R[j];
            j++;
        }
        k++;
    }

    // Copiar los elementos restantes de L[], si hay alguno
    while (i < n1) {
        Color[k] = L[i];
        i++;
        k++;
    }

    // Copiar los elementos restantes de R[], si hay alguno
    while (j < n2) {
        Color[k] = R[j];
        j++;
        k++;
    }
}

// Función principal de Merge Sort que ordena el arreglo arr[left..right] usando merge()
void mergeSort_by_VertexCount(ColorStr* Color, int left, int right) {
    if (left < right) {
        // Encuentra el punto medio del arreglo
        int middle = left + (right - left) / 2;

        // Ordena primero y segundo subarreglos
        mergeSort_by_VertexCount(Color, left, middle);
        mergeSort_by_VertexCount(Color, middle + 1, right);

        // Combina los subarreglos ordenados
        merge2(Color, left, middle, right);
    }
}

void merge3(ColorStr* Color , int left, int middle, int right, u32 op_type) {
    int i, j, k;
    int n1 = middle - left + 1;
    int n2 = right - middle;

    // Crear arreglos temporales
    ColorStr L[n1], R[n2];

    // Copiar datos a los arreglos temporales L[] y R[]
    for (i = 0; i < n1; i++)
        L[i] = Color[left + i];
    for (j = 0; j < n2; j++)
        R[j] = Color[middle + 1 + j];

    // Combinar los arreglos temporales de vuelta en arr[left..right]
    i = 0;
    j = 0;
    k = left;
    if (op_type == 0){
        while (i < n1 && j < n2) {
            if ( L[i].max_grade >= R[j].max_grade) {
                Color[k] = L[i];
                i++;
            } else {
                Color[k] = R[j];
                j++;
            }
            k++;
        }
    }else if (op_type == 1){
        while (i < n1 && j < n2) {
            if ( L[i].min_grade >= R[j].min_grade) {
                Color[k] = L[i];
                i++;
            } else {
                Color[k] = R[j];
                j++;
            }
            k++;
        }
    }else if (op_type == 2){
        while (i < n1 && j < n2) {
            if ( L[i].max_min >= R[j].max_min) {
                Color[k] = L[i];
                i++;
            } else {
                Color[k] = R[j];
                j++;
            }
            k++;
        }
    }

    // Copiar los elementos restantes de L[], si hay alguno
    while (i < n1) {
        Color[k] = L[i];
        i++;
        k++;
    }

    // Copiar los elementos restantes de R[], si hay alguno
    while (j < n2) {
        Color[k] = R[j];
        j++;
        k++;
    }
}



void mergeSort_GulDukat(ColorStr* Grupo, u32 left, u32 right, u32 op_type){
    if (left < right) {
        // Encuentra el punto medio del arreglo
        u32 middle = left + (right - left) / 2;

        // Ordena primero y segundo subarreglos
        mergeSort_GulDukat(Grupo, left, middle, op_type);
        mergeSort_GulDukat(Grupo, middle + 1, right, op_type);

        merge3(Grupo, left, middle, right, op_type);
    }

}

char ElimGarak(Grafo G, u32* Orden){

    u32 V = NumeroDeVertices(G);
    u32 C = ColoreoPropio(G);
    //creo una estructura que contiene : id del color, cantidad de vertices con ese color,
    // y un arreglo con los vertices que tienen ese color

    //luego creo un arreglo de estas estructuras, donde cada elemento es un puntero a una estructura ColorStr
    u32* Orden2 = calloc(V, sizeof(u32));


    //creo arreglo de estructuras de color
    ColorStr* colores = calloc(C, sizeof(struct ColorStr));

    if (colores == NULL || Orden2 == NULL){
        return 1;
    }
    //inicializo el arreglo de estructuras
    for(u32 i = 0; i < C; i++){
        colores[i].id = i;
        colores[i].cantidad = 0;
        colores[i].max_grade = 0;
        colores[i].min_grade = MAX_U32;
        colores[i].max_min = 0;
        colores[i].vertices = calloc(V, sizeof(u32));
    }
    //separo los vertices por color
    for (u32 i = 0; i < V; i++){
        u32 color_de = Color(Orden[i], G);
        colores[color_de].vertices[colores[color_de].cantidad] = Orden[i];
        colores[color_de].cantidad++;
    }
    //redimensiono los arreglos de vertices
    for (u32 i = 0; i < C; i++){
        colores[i].vertices = realloc(colores[i].vertices, colores[i].cantidad * sizeof(u32));
    }

    //ahora tengo un arreglo de estructuras, donde cada estructura tiene el id del color, la cantidad de vertices con ese color 
    //y un arreglo con los vertices que tienen ese color

    //si hay 2 colores, primero ordeno los vertices con el color 2 y luego los del color 1
    if (C == 2){
        for (u32 i = 0; i < colores[1].cantidad; i++){
            Orden2[i] = colores[1].vertices[i];
        }
        for (u32 i = 0; i < colores[0].cantidad; i++){
            Orden2[colores[1].cantidad + i] = colores[0].vertices[i];
        }
        return 0;

    }else{
        u32 indice = V-1;
        for (u32 i = 0; i < colores[0].cantidad; i++){
            Orden2[indice] = colores[0].vertices[i];
            indice--;
        }
        for (u32 i = 0; i < colores[1].cantidad; i++){
            Orden2[indice] = colores[1].vertices[i];
            indice--;
        }
        //si hay mas de 2 colores, primero pongo los vertices con el color con menos cantidad de vertices
        //luego los vertices con el color con mas cantidad de vertices que el primero

        //ordeno los colores por cantidad de vertices
        mergeSort_by_VertexCount(colores, 2, C-1);

        //como ya estan ordenados por cantidad de vertices con ese color, simplemente los agrego al arreglo Orden2
        for (u32 i = 2; i < C; i++){
            for (u32 j = 0; j < colores[i].cantidad; j++){
                Orden2[indice] = colores[i].vertices[j];
                indice--;
            }
        }

        //libero memoria
        
        for (u32 i = 0; i < C; i++){
            free(colores[i].vertices);
        }
        free(colores);
        colores = NULL;
        memcpy(Orden, Orden2, V * sizeof(u32));
        free(Orden2);
        Orden2 = NULL;





    }
    return 0;
}
char GulDukat(Grafo G, u32* Orden) {
    u32 V = NumeroDeVertices(G);
    u32 C = ColoreoPropio(G);

    u32* Orden2 = calloc(V, sizeof(u32));

    Group* grupos= calloc(3, sizeof(struct GroupStr));

    ColorStr* colores = calloc(C, sizeof(struct ColorStr));

    if (grupos == NULL || Orden2 == NULL || colores == NULL){
        return 1;
    }

    for (u32 i = 0; i < 3; i++){
        grupos[i].subgroups = calloc(C, sizeof(struct ColorStr));
        grupos[i].cantidad_total = 0;
        grupos[i].cantidad_colores = 0;
    }


    //inicializo el arreglo de estructuras
    for(u32 i = 0; i < C; i++){
        colores[i].id = i;
        colores[i].cantidad = 0;
        colores[i].max_grade = 0;
        colores[i].min_grade = MAX_U32;
        colores[i].max_min = 0;
        colores[i].vertices = calloc(V, sizeof(u32));
    }
    //separo los vertices por color
    for (u32 i = 0; i < V; i++){
        u32 color_de = Color(Orden[i], G);
        colores[color_de].vertices[colores[color_de].cantidad] = Orden[i];
        colores[color_de].cantidad++;
        //guardo en el color el grado maximo de los vertices que tiene  ese color
        if (Grado(Orden[i], G) > colores[color_de].max_grade){
            colores[color_de].max_grade = Grado(Orden[i], G);
        }
        //guardo en el color el grado minimo de los vertices que tiene  ese color
        if (Grado(Orden[i], G) < colores[color_de].min_grade){
            colores[color_de].min_grade = Grado(Orden[i], G);
            
        }
        //en ambos casos, recalcula el max_min
    }
    //redimensiono los arreglos de vertices
    for (u32 i = 0; i < C; i++){
        colores[i].vertices = realloc(colores[i].vertices, colores[i].cantidad * sizeof(u32));
    }

    // calculo el max_min en una sola pasada
    for (u32 i = 0; i < C; i++){
        colores[i].max_min = colores[i].max_grade + colores[i].min_grade;
    }


    //separo los colores en grupos de colores
    for (u32 i = 0; i < C; i++){
        if (colores[i].id % 4 == 0){
            grupos[0].subgroups[grupos[0].cantidad_colores] = colores[i];
            grupos[0].cantidad_total += colores[i].cantidad;
            grupos[0].cantidad_colores++;
        }else if (colores[i].id % 2 == 0 && colores[i].id % 4 != 0){
            grupos[1].subgroups[grupos[1].cantidad_colores] = colores[i];
            grupos[1].cantidad_total += colores[i].cantidad;
            grupos[1].cantidad_colores++;
        }else{
            grupos[2].subgroups[grupos[2].cantidad_colores] = colores[i];
            grupos[2].cantidad_total += colores[i].cantidad;
            grupos[2].cantidad_colores++;
        }
    }
    //redimensiono los arreglos de vertices
    for (u32 i = 0; i < 3; i++){
        grupos[i].subgroups = realloc(grupos[i].subgroups, grupos[i].cantidad_colores * sizeof(struct ColorStr));
    }
    //ordeno cada grupo de colores por grado maximo en subgroups
    //mergeSort_GulDukat(ColorStr* Grupo, u32 left, u32 right, u32 op_type);
    mergeSort_GulDukat(grupos[0].subgroups, 0, grupos[0].cantidad_colores-1, 0);
    //grupo 0 ordenado por mayor grado de cada color
    mergeSort_GulDukat(grupos[1].subgroups, 0, grupos[1].cantidad_colores-1, 2);
    //grupo 1 ordenado por max_min de cada color
    mergeSort_GulDukat(grupos[2].subgroups, 0, grupos[2].cantidad_colores-1, 1);
    //grupo 2 ordenado por menor grado de cada color


    // hago el primer dumpeo de vertices a un ColorStr con los vertices ordenados

    ColorStr* colores1 = calloc(C, sizeof(struct ColorStr));
    ColorStr* colores2 = calloc(C, sizeof(struct ColorStr));
    ColorStr* colores3 = calloc(C, sizeof(struct ColorStr));
    colores1->id = 0;
    colores2->id = 1;
    colores3->id = 2;
    colores1->cantidad = colores2->cantidad = colores3->cantidad = 0;
    colores1->vertices = calloc(V, sizeof(u32));
    colores2->vertices = calloc(V, sizeof(u32));
    colores3->vertices = calloc(V, sizeof(u32));

    for (u32 i = 0; i < grupos[0].cantidad_colores; i++){
        for (u32 j = 0; j < grupos[0].subgroups[i].cantidad; j++){
            colores1->vertices[colores1->cantidad] = grupos[0].subgroups[i].vertices[j];
            colores1->cantidad++;
        }
    }
    for (u32 i = 0; i < grupos[1].cantidad_colores; i++){
        for (u32 j = 0; j < grupos[1].subgroups[i].cantidad; j++){
            colores2->vertices[colores2->cantidad] = grupos[1].subgroups[i].vertices[j];
            colores2->cantidad++;
        }
    }
    for (u32 i = 0; i < grupos[2].cantidad_colores; i++){
        for (u32 j = 0; j < grupos[2].subgroups[i].cantidad; j++){
            colores3->vertices[colores3->cantidad] = grupos[2].subgroups[i].vertices[j];
            colores3->cantidad++;
        }
    }

    //ahora tengo los vertices ordenados por grado en los colores 1, 2 y 3 y cada uno de esos colores tiene muchos vertices separados por su subgrupo


    //ahora tiro todos esos vertices a Orden2

    u32 indice = 0;
    for (u32 i = 0; i < colores1->cantidad; i++){
        Orden2[indice] = colores1->vertices[i];
        indice++;
    }
    for (u32 i = 0; i < colores2->cantidad; i++){
        Orden2[indice] = colores2->vertices[i];
        indice++;
    }
    for (u32 i = 0; i < colores3->cantidad; i++){
        Orden2[indice] = colores3->vertices[i];
        indice++;
    }
    //libero memoria
    for (u32 i = 0; i < 3; i++){
        free(grupos[i].subgroups);
    }
    free(grupos);
    grupos = NULL;


    for (u32 i = 0; i < C; i++){
        free(colores[i].vertices);
    }
    free(colores);
    colores = NULL;

    free(colores1->vertices);
    free(colores2->vertices);
    free(colores3->vertices);
    free(colores1);
    free(colores2);
    free(colores3);
    colores1 = NULL;
    colores2 = NULL;
    colores3 = NULL;

    memcpy(Orden, Orden2, V * sizeof(u32));

    free(Orden2);


    return 1;

}

