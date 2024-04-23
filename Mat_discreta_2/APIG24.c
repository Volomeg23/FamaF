#include <assert.h>
#include <stdbool.h>
#include <stdio.h>
#include <stdlib.h>
#include <string.h>

#include "APIG24.h"
#include "EstructuraGrafo24.h"


Grafo ConstruirGrafo(FILE *archivo) {
    unsigned int cant_vertices = 0;
    unsigned int cant_lados = 0;
    Grafo G = NULL;

    char line[256];
    while (fgets(line, sizeof(line), archivo) != NULL) {
        if (line[0] != 'c') {
            break;
        }
    }

    if (sscanf(line, "p edge %u%u\n", &cant_vertices, &cant_lados) == 2) {
        assert (cant_vertices >= 2);
        assert (cant_lados > 0);
        G = Crear_Grafo(cant_vertices);
        if (G == NULL) {
            return NULL;
        }
        u32 v1, v2, lines = 0;
        u32 read_to = cant_lados;
        while(fscanf(archivo, "e %u %u\n",&v1, &v2) == 2 && read_to != 0) {
            lines++;
            agregar_lado(G, v1, v2);
            read_to--;
        }
        if (lines < cant_lados) {
            DestruirGrafo(G);
            fprintf(stderr, "Error: Cantidad de lados invalida\n");
            return NULL;
        }

    }
    // for(u32 i =0 ; i < cant_vertices; i++){
    //     if(ExtraerGrado(G, i) == 0){
    //         DestruirGrafo(G);
    //         fprintf(stderr, "Error: Vertice sin lados\n");
    //         return NULL;
    //     }
    // }
    return G;
}

void DestruirGrafo(Grafo G) {
    if (G == NULL) {
        return;
    } else {
        Destruir_Nodos(G);
        free(G);
    }
}

u32 NumeroDeVertices(Grafo G){
    u32 info[3]; for(int i = 0; i < 3; i++) info[i] = 0;
    info_grafo(G, info);
    return info[0];
}
u32 NumeroDeLados(Grafo G){
    u32 info[3]; for(int i = 0; i < 3; i++) info[i] = 0;
    info_grafo(G, info);
    return info[1];
}
u32 Delta(Grafo G){
    u32 info[3]; for(int i = 0; i < 3; i++) info[i] = 0;
    info_grafo(G, info);
    return info[2];
}
u32 Grado(u32 i,Grafo G){
    if(G == NULL){
        fprintf(stderr, "Error: Grafo nulo\n");
        return 0;
    }
    u32 vertices = NumeroDeVertices(G);
    if(i >= vertices){
        return 0;
    }
    u32 grado = ExtraerGrado(G, i);
    return grado; // falta abstraccion
}

color Color(u32 i,Grafo G){
    if(G == NULL){
        fprintf(stderr, "Error: Grafo nulo\n");
        return 0;
    }
    u32 vertices = NumeroDeVertices(G);
    if(i >= vertices){
        return MAX_U32 - 1;
  
    }
    color color = ExtraerColor(G, i);
    return color; // falta abstraccion
}

u32 Vecino(u32 j,u32 i,Grafo G){
    if(G == NULL){
        fprintf(stderr, "Error: Grafo nulo\n");
        return 0;
    }
    u32 vertices = NumeroDeVertices(G);
    u32 grado = Grado(i, G);
    if (i >= vertices || (i < vertices && j >= grado)) { 
        return MAX_U32 - 1;
    }
    u32 vecino = ExtraerVecino(G, i, j);
    return vecino; 
}

void AsignarColor(color x,u32 i,Grafo  G){
    if(G == NULL){
        fprintf(stderr, "Error: Grafo nulo\n");
        return;
    }
    u32 vertices = NumeroDeVertices(G);
    if(i >= vertices){
        return;
    }
    ColorearVertice(G, i, x); // falta abstraccion
    return;
}

void ExtraerColores(Grafo G,color* Color){
    if(G == NULL){
        fprintf(stderr, "Error: Grafo nulo\n");
        return;
    }
    u32 vertices = NumeroDeVertices(G);
    for(u32 i = 0; i < vertices; i++){
        Color[i] = ExtraerColor(G, i);
    }
    return;
}
void ImportarColores(color* Color,Grafo  G){
    if(G == NULL){
        fprintf(stderr, "Error: Grafo nulo\n");
        return;
    }
    u32 vertices = NumeroDeVertices(G);
    for(u32 i = 0; i < vertices; i++){ 
        ColorearVertice(G, i, Color[i]);
    }
    return;
}