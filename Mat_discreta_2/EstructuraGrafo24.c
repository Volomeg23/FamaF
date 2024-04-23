#include <stdio.h>
#include <stdlib.h>
#include <string.h>

#include "EstructuraGrafo24.h"
#define MAX_EDGES 7196008
struct _vertex_t {
    u32 id;
    u32 grado;
    color color;
    vertex_t* vecinos;

};

struct GrafoSt {
    u32 num_vertices;
    u32 num_aristas;
    u32 Delta;
    u32 coloreo_propio;
    vertex_t* vertices; 
};

Grafo Grafo_vacio(){
    Grafo G = malloc(sizeof(struct GrafoSt));
    if(G == NULL){
        return NULL;
    }
    G->num_vertices = 0;
    G->num_aristas = 0;
    G->Delta = 0;
    G->vertices = NULL;
    G->coloreo_propio = 0;
    return G;
}

vertex_t Crear_vertice(u32 id){
    vertex_t v = malloc(sizeof(struct _vertex_t));
    if(v == NULL){
        return NULL;
    }
    v->id = id;
    v->grado = 0;
    v->color = 0;
    v->vecinos = NULL;
    return v;
}

void agregar_lado(Grafo G, u32 v1, u32 v2){
    if(G == NULL){
        fprintf(stderr, "Error: Grafo nulo\n");
        return;
    }
    if(v1 >= G->num_vertices || v2 >= G->num_vertices){
        fprintf(stderr, "Error: Vertice fuera de rango\n");
        return;
    }
    vertex_t v1_vertex = G->vertices[v1];
    vertex_t v2_vertex = G->vertices[v2];
    if (v1_vertex == NULL || v2_vertex == NULL){
        fprintf(stderr, "Error: Vertice no encontrado\n");
        return;
    }
    v1_vertex->grado++;
    v1_vertex->vecinos = realloc(v1_vertex->vecinos, v1_vertex->grado * sizeof(vertex_t));
    v1_vertex->vecinos[v1_vertex->grado-1] = v2_vertex;
    G->num_aristas++;
    v2_vertex->grado++;
    v2_vertex->vecinos = realloc(v2_vertex->vecinos, v2_vertex->grado * sizeof(vertex_t));
    v2_vertex->vecinos[v2_vertex->grado-1] = v1_vertex;

    if(G->Delta < v1_vertex->grado){
        G->Delta = v1_vertex->grado;
    }
    if(G->Delta < v2_vertex->grado){
        G->Delta = v2_vertex->grado;
    }
    
    return;
}

Grafo Crear_Grafo(u32 cant_vertices){
    Grafo G = Grafo_vacio();
    if(G == NULL){
        return NULL;
    }
    G->num_vertices = cant_vertices;
    G->vertices = malloc(cant_vertices * sizeof(vertex_t));
    for(u32 i = 0; i < cant_vertices; i++){
        G->vertices[i] = Crear_vertice(i);
    }
    return G;
}

void listar_vertices(Grafo G){
    if(G == NULL){
        fprintf(stderr, "Error: Grafo nulo\n");
        return;
    }
    for(u32 i = 0; i < G->num_vertices; i++){
        vertex_t v = G->vertices[i];
        if(v == NULL){
            printf("Vertice %u: NULL\n", i);
        } else {
            printf("Vertice %u: %u\n", i, v->id);
        }
    }
    return;
}


void info_grafo(Grafo G, u32 info[]){
    if(G == NULL){
        fprintf(stderr, "Error: Grafo nulo\n");
        return;
    }
    info[0] = G->num_vertices;
    info[1] = G->num_aristas;
    info[2] = G->Delta;

    return;
}

void Destruir_Nodos(Grafo grafo) {
    if (grafo == NULL) {
        return; // No hay nada que liberar si el grafo es NULL
    }
    u32 cantidad = grafo->num_vertices;
    // Liberar la memoria de los vecinos de cada vértice y de cada vértice
    for (u32 i = 0; i < cantidad; i++) {
        vertex_t vertice_actual = grafo->vertices[i];
        if (vertice_actual != NULL) {
            free(vertice_actual->vecinos);
            free(vertice_actual);
        }
    }
    

    // Liberar la memoria del array de vértices
    free(grafo->vertices);

    // Liberar la memoria del grafo
}

u32 ExtraerGrado(Grafo G, u32 i){
    return G->vertices[i]->grado;
}

color ExtraerColor(Grafo G, u32 i){
    return G->vertices[i]->color;
}

u32 ExtraerVecino(Grafo G, u32 i, u32 j){
    return G->vertices[i]->vecinos[j]->id; //??????
}

void ColorearVertice(Grafo G, u32 i, color c){
    G->vertices[i]->color = c;
    return;
}

void listar_vecinos(Grafo G, u32 i){
    if(G == NULL){
        fprintf(stderr, "Error: Grafo nulo\n");
        return;
    }
    if(i >= G->num_vertices){
        fprintf(stderr, "Error: Vertice fuera de rango\n");
        return;
    }
    vertex_t v = G->vertices[i];
    if(v == NULL){
        printf("Vertice %u: NULL\n", i);
    } else {
        printf("Vertice: %u y grado %u\n", v->id, v->grado);
        printf("Vecinos: ");
        for(u32 j = 0; j < v->grado; j++){
            printf("%u ", v->vecinos[j]->id);
            
        }
        printf("\n\n");
    }
    return;
}

bool existe_vertice(Grafo G, u32 v){
    if(G == NULL){
        return false;
    }
    if(v >= G->num_vertices){
        return false;
    }
    vertex_t vertice = G->vertices[v];
    if(vertice == NULL){
        return false;
    }
    return true;
}

void ActualizarColoreo(Grafo G, u32 i){
    if(G == NULL){
        return ;
    }
    if(i > G->Delta + 1){
        return ;
    }
    G->coloreo_propio = i;
    return ;

}

u32 ColoreoPropio(Grafo G){
    if(G == NULL){
        return 0;
    }
    return G->coloreo_propio;
}   

u32* Vecinos(u32 i,Grafo G){
    if(G == NULL){
        fprintf(stderr, "Error: Grafo nulo\n");
        return NULL;
    }
    if(i >= G->num_vertices){
        fprintf(stderr, "Error: Vertice fuera de rango\n");
        return NULL;
    }
    u32* result = 0;
    for(u32 j = 0; j < G->vertices[i]->grado; j++){
        result[j] = G->vertices[i]->vecinos[j]->id;
    }
    return result;
}