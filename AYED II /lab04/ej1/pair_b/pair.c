#include <stdlib.h>
#include "pair.h"

pair_t pair_new(int x, int y) {
    pair_t p = NULL;  // pair_t es un puntero a s_pair_t
    p = malloc(sizeof(pair_t));  // allocar memoria del tamaño de la estructura pair_t
    p->fst = x;
    p->snd = y;
    return p;
}

int pair_first(pair_t p){
    return p->fst;

}

int pair_second(pair_t p){
    return p->snd;
}

pair_t pair_swapped(pair_t p){
    pair_t q = NULL; 
    q = malloc(sizeof(pair_t)); 
 // aca se crea otro pair por que si swapeamos en la misma p, al ser memoria dinamica, p = swap(p) y no queremos eso, necesitamos p != swap(p)
    q->fst = p->snd;
    q->snd = p->fst;
    return q;
}

pair_t pair_destroy(pair_t p){
    free(p);
    return NULL;
}