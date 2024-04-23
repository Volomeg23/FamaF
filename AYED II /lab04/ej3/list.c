#include <stdlib.h>
#include <stdbool.h>
#include <assert.h>
#include "list.h"

struct _list {
    list_elem elem;
    list next;
};

typedef struct _list node;

static list create_node() {
    list p;
    p = malloc(sizeof(node));
    p->elem = 0;
    p->next = NULL;
    return p;
}

list empty(){
    return NULL;
}

list addl(list l, list_elem e){
    list p = create_node();
    p->elem = e;
    p->next = l;
    return p;
}

list destroy(list l){
    list p =l, q =l;
    while (q != NULL){
        q = q->next;
        free(p);
        p = q;
    }
    return NULL;
}

bool is_empty(list l){
    return (l == NULL);

}

list_elem head(list l){
    assert(!is_empty(l));
    return l->elem;
}

list tail(list l){
    assert(!is_empty(l));
    list p = l;
    l = l->next;
    free(p);
    return l;
}

list addr(list l, list_elem e){
    list p = l, q =create_node();
    q->elem = e;
    q->next = NULL;
    if(!is_empty(l)){
        while(p->next != NULL){
            p = p->next;
        }
        p->next = q;
    }else {l = q;}
    return l;
}

unsigned int length(list l){
    list p = l;
    unsigned int n = 0;
    while (p != NULL){
        n++;
        p = p->next;
    }
    return n;
}

list concat(list l, list lp) {
    list p = l;
    if (!is_empty(l)){
        while(p->next != NULL){
            p = p->next;
        }
        p->next = lp;
    }else {l = lp;}
    return l;
}

list_elem index(list l, unsigned int i) {
    assert(length(l)>i);
    list p = l;
    for (unsigned int j = 0; j < i; ++j) {
        p = p->next;
    }
    return p->elem;
}

list drop(list l, unsigned int d) {
    list p = l;
    unsigned int i = 0;
    while (i < d && p != NULL) {
        p = p->next;
        free(l);
        l = p;
    }
    return l;
}


list copylist(list l){
       list copy = NULL, p = l, q = NULL;
    if (l != NULL) {
        q = create_node();
        copy = q;
        q->elem = p->elem;
        q->next = NULL;
        p = p->next;
        while (p != NULL) {
            q->next = create_node();
            q = q->next;
            q->elem = p->elem;
            q->next = NULL;
            p = p->next;
        }
    }
    return copy;
}

list take(list l, unsigned int t) {
    list p = l, q, r;
    unsigned int i = 0;
    while (i < t && p != NULL) {
        p = p->next;
        ++i;
    }
    if (p->next != NULL){
        q = p;
        p= p->next;
        q->next = NULL;
        while (p != NULL){
            r = p;
            p = p->next;
            free(r);
        }
    }
    return l;
}