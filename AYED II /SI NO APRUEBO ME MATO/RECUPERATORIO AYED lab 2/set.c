#include <stdlib.h>
#include <stdbool.h>
#include <assert.h>
#include "set.h"

struct s_node {
    set_elem elem;
    struct s_node *next;
};

typedef struct s_node * node_t;

struct s_set {
    unsigned int size;
    node_t first;
};

static bool
invrep(set s) {
    assert(s != NULL);
    assert((s->size == 0) == (s->first == NULL));
    bool status = true;
    struct s_node *ptr1,*ptr2;
    if (s->first != NULL){
        ptr1 = s->first;
    
    
        while (ptr1->next != NULL){
            ptr2 = ptr1->next;
            status = status && (ptr1->elem < ptr2->elem) ? true : false;
            ptr1 = ptr2;
        }
    }
    return status;
}

static struct s_node *
create_node(set_elem e) {
    struct s_node *new_node = NULL;
    new_node = malloc(sizeof(struct s_node));
    assert(new_node != NULL);
    new_node->elem = e;
    new_node->next = NULL;
    return new_node;

}

static struct s_node *
destroy_node(struct s_node *node) {
    assert(node != NULL);
    node->next = NULL;
    free(node);
    node = NULL;
    return node;


}

/* CONSTRUCTORS */

set set_empty(void) {
    set s = NULL;
    s = malloc(sizeof(struct s_set));
    assert (s != NULL);
    s->first = NULL;
    s->size = 0;
    assert(set_is_empty(s) && invrep(s));
    return s;
}

set set_add(set s, set_elem e) {
    struct s_node *ptr1, *ptr2, *aux;

    bool found = false;

    if(set_is_empty(s)){ // lo mismo, no recomiendan usar otras ops del tad USAR s->first == NULL
        struct s_node *new_node = create_node(e); // ojo con esto, podria crear nodos de mas si el elemento ya esta en el set
        s->first = new_node;
        s->size = s->size +1;

    }else{
        
        if(!set_member(e,s)){ // no recomiendan usar otras funciones del tad, recorre dos veces el arreglo asi
            struct s_node *new_node = create_node(e);
            s->size = s->size+1;
            ptr1 = s->first;
            if(s->first->elem > e){ // el elemento va al principio
                aux = s->first;
                s->first = new_node;
                new_node->next = aux;
                return s;
            }else{
                
                while(found == false || ptr1->next != NULL ){  // esto deberia usar &&
                ptr2 = ptr1->next;
                if (ptr2 == NULL){  // guarda si el elemento va al final del set
                    //assert(e > ptr1->elem);
                    ptr1->next = new_node;
                    found = true;
                    return s;
                }else if (ptr2->elem > e){ // el elemento esta en alguna parte dentro del set
                    found = true;
                    aux = ptr1->next;
                    ptr1->next = new_node;
                    new_node->next = aux;
                    return s;  // tratar de no usar puntos de retorno fuera del final del op
                    }else {
                        ptr1 = ptr2;
                    }
                    

                }
            }
        }
    }
    // FALTA chequeo !is_empty
    return s;
}

/* OPERATIONS   */
unsigned int set_cardinal(set s) {
    assert(invrep(s));
    unsigned int size = s->size;
    return size;
}

bool set_is_empty(set s) {
    bool empty = (s->first == NULL) ? true : false;
    return empty;
}

bool set_member(set_elem e, set s) {
    assert(invrep(s));
    node_t node=s->first;
    while (node!=NULL && node->elem < e) {
        node = node->next;
    }
    return node!=NULL && node->elem==e;
}


set set_elim(set s, set_elem e) {
    assert(invrep(s) && !set_is_empty(s)); // no hace falta especificar !set_is_empty
    struct s_node *ptr1, *ptr2;
    bool found = false;
    if(set_member(e,s)){ // tratar de no usar
        s->size = s->size - 1;
        ptr1 = s->first;
        if(ptr1->elem == e){
            s->first = s->first->next;
            destroy_node(ptr1);
            assert(invrep(s)); // falta post-condicion  !set_member
            return s;  // punto de retorno extra
        }else{
            while(found == false || ptr1->next != NULL ){  // aca tambien falta &&
                ptr2 = ptr1->next;
                if(ptr2->elem == e){
                    found = true;
                    ptr1->next = ptr2->next;
                    destroy_node(ptr2);
                    assert(invrep(s));
                    return s;
                }else{
                    ptr1 = ptr2;
                }
            }
        }

    }
    assert(invrep(s));
    return s;

}

set_elem set_get(set s) {
    assert(invrep(s) && !set_is_empty(s));
    return s->first->elem;
}

set_elem*
set_to_array(set s) {
    assert(s != NULL);
    set_elem *new = NULL;
    struct s_node *ptr1;
    ptr1 = s->first;
    unsigned int i = 0;
    new = calloc(s->size, sizeof(set_elem));
    while(i < s->size){
        new[i] = ptr1->elem;
        ptr1 = ptr1->next;
        i++;
    } // falta verificar la invariante como pre-condición y la post-condición `!set_is_empty(s) ==> (array!=NULL)`

    return new;
}

set set_destroy(set s) {
    assert(invrep(s));
    struct s_node *ptr1, *ptr2;
    if(!set_is_empty(s)){ // ojo, el if esta mal identado, esta destruyendo solo si no es vacio, pero cuando lo es? memory leak CORREGIDO
      ptr1 = s->first;
        while(ptr1 != NULL){ // estaba como ptr1->next != NULL pero esto saltea el ultimo nodo OJO
            ptr2 = ptr1->next;
            destroy_node(ptr1);
            ptr1 = ptr2;
        } 
        s->first = NULL;
        s->size = 0;
    }
    free(s);
    s = NULL;
    assert(s == NULL);
    return s;

}
