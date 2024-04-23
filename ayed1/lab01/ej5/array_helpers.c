#include <assert.h>
#include <stdio.h>
#include <stdlib.h>
#include "array_helpers.h"
#include "boolean.h"

boolean array_is_sorted(int a[], unsigned int length){
boolean r = true;
for (unsigned int i=0;i<length-1;i++){
r = r && (a[i]<=a[i+1]);
}
if (r){
        printf("el array esta ordenado ascendentemente\n"); 
        }else{
            printf("el array no esta ordenado\n");
        }

return r;
}

unsigned int array_from_file(int array[],
           unsigned int max_size,
           const char *filepath) {
    FILE *input_file;
    input_file = fopen(filepath, "r");
    fscanf(input_file,"%u",&max_size);
    for(unsigned int i=0; i < max_size; i++){
        fscanf(input_file,"%d",&array[i]);
    }
    fclose(input_file);

    return max_size;
}

void array_dump(int a[], unsigned int length) {
    printf("[");
    for(unsigned int i=0; i<length; i++){
        printf("%d,",a[i]);
    }
    printf("]\n");
}
