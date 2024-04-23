#ifndef ESTRUCTURAGRAFO24_H
#define ESTRUCTURAGRAFO24_H

#include <stdio.h>
#include <stdlib.h>
#include <stdbool.h>


typedef unsigned int u32;
typedef u32 color;
typedef struct GrafoSt* Grafo;

typedef struct _vertex_t* vertex_t;



vertex_t Crear_vertice(u32 id);
Grafo Grafo_vacio();
Grafo Crear_Grafo(u32 n);
void info_grafo(Grafo G,u32 info[]);
void Destruir_Nodos(Grafo G);
void Calcular_Delta(Grafo G);
void agregar_lado(Grafo G, u32 u, u32 v);
void listar_vertices(Grafo G);
void listar_vecinos(Grafo G, u32 v);
bool existe_vertice(Grafo G, u32 v);
u32 ExtraerGrado(Grafo G, u32 v);
color ExtraerColor(Grafo G, u32 v);
u32 ExtraerVecino(Grafo G, u32 v, u32 i);
void ColorearVertice(Grafo G, u32 n, color c);
void ActualizarColoreo(Grafo G, u32 i);
u32 ColoreoPropio(Grafo G);
u32* Vecinos(u32 i, Grafo G);


#endif // ESTRUCTURAGRAFO24_H
