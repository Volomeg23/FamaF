#include <assert.h>
#include <stdbool.h>
#include <stdio.h>
#include <stdlib.h>
#include "array_helpers.h"

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
