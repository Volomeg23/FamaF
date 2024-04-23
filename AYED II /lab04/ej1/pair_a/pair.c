#include <stdio.h>
#include "pair.h"

pair_t pair_new(int x, int y){
    pair_t p;
    p.fst = x;
    p.snd = y;
    return p;
}

int pair_first(pair_t p){
    return p.fst;

}

int pair_second(pair_t p){
    return p.snd;
}

pair_t pair_swapped(pair_t p){
    int aux;
    aux = p.fst;
    p.fst = p.snd;
    p.snd = aux;
    return p;
}

pair_t pair_destroy(pair_t p){
    //no se usa memoria dinamica por lo que el stack lo va a destruir al terminar el programa
    return p;
}