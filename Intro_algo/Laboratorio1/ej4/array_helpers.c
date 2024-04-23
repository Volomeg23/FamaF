#include "array_helpers.h"
#include <stdio.h>
#include <stdbool.h>

unsigned int array_from_file(int array[],
           unsigned int max_size,
           const char *filepath) {
            FILE *abrir;
            abrir = fopen(filepath, "r+");
            fscanf(abrir, "%u", &max_size );
            for (unsigned int i = 0; i < max_size; i++)
                {
                fscanf(abrir, "%i", &array[i]);
                }            
            fclose(abrir);
        return max_size;
}

void array_dump(int a[], unsigned int length) {
          unsigned int i ;
            i = 0;
            printf("[");
            while (i < length)
                {
                printf(" %d," , a[i]);
                i = i + 1;
                }
            printf("\b");
            printf("]");
}


bool array_is_sorted(int a[], unsigned int length) {
    unsigned int i = 0 ;
    bool p = true;
    while ((i < length - 1 ) && p)
    {
        if (a[i] >= a[i+1])
        {
            p = false;
        }
        i = i +1;
    }
    
    

    return p;
}
