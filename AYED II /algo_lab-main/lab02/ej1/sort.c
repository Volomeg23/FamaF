#include <assert.h>
#include <stdbool.h>
#include <stdio.h>
#include "array_helpers.h"
#include "sort_helpers.h"
#include "sort.h"

//static --> funciones locales solo para usar en sort.c  
static void insert(int a[], unsigned int i) {
    unsigned int j;
    j = i;
    while (j > 0 && goes_before(a[j],a[j-1])){ //abstrae orden, es decir se fija en abs para comparar
        swap(a,j,j-1);
        j = j-1;
    }
}

void insertion_sort(int a[], unsigned int length) {
    for (unsigned int i = 1u; i < length; ++i) {
        assert(array_is_sorted(a, i));
        insert(a, i);
    }
}
