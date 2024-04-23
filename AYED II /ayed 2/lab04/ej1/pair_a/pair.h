#ifndef _PAIR_H
#define _PAIR_H

typedef struct s_pair_t pair_t;

struct s_pair_t {
    int fst;
    int snd;
};

pair_t pair_new(int x, int y){
    pair_t p ;
    p.fst = x;
    p.snd = y;
    return p;
}

int pair_first(pair_t p){
    int x = 0;
    x = p.fst;
    return x;
}


int pair_second(pair_t p){
    int y = 0;
    y = p.snd;
    return y;

}


pair_t pair_swapped(pair_t p){
    pair_t s;
    s.fst = p.snd;
    s.snd = p.fst;
    return s;
}


pair_t pair_destroy(pair_t p){
    int *r, *x;
    r = NULL;
    x = NULL;
    *r = p.fst;
    free (r);
    *x = p.snd;
    free (x);
 return p;
}




#endif
