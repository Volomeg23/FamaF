#include <assert.h>
#include <stdbool.h>
#include <stdlib.h>
#include <stdio.h>

#include "array_helpers.h"
#include "sort_helpers.h"
#include "sort.h"


static unsigned int partition(int a[], unsigned int izq, unsigned int der) {
    unsigned int i,j;
    unsigned int pivot;
    pivot = izq;
    i = izq +1;
    j = der;
    while (i <= j){
        if (goes_before(a[i], a[pivot])){
            i++;   
            } else if (goes_before(a[pivot],a[j])){
                j--;
            } else if (goes_before(a[pivot],a[i]) && goes_before(a[j],a[pivot])){
                swap(a,i,j);
            }
    }
    swap(a,pivot,j);
    pivot = j;
    return pivot;
    
}

static void quick_sort_rec(int a[], unsigned int izq, unsigned int der) {
  if (izq < der) {
        unsigned int ppiv = partition(a,izq,der);
        quick_sort_rec(a,izq,((ppiv == 0u) ? 0u : ppiv - 1u));
        quick_sort_rec(a,ppiv +1u ,der);
    }

}

void quick_sort(int a[], unsigned int length) {
    quick_sort_rec(a, 0, (length == 0) ? 0 : length - 1);
}

