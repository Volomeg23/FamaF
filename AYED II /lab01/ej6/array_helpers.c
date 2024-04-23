/* First, the standard lib includes, alphabetically ordered */
#include <assert.h>
#include <stdbool.h>
#include <stdio.h>
#include <stdlib.h>
#include "array_helpers.h"

/* Maximum allowed length of the array */
#define MAX_SIZE 100000


unsigned int array_from_file(int array[],
                             unsigned int max_size,
                             const char *filepath) {
    FILE *input_file;
    input_file = fopen(filepath,"r");
    unsigned int length = 0;
    if (input_file == NULL){printf("no se encontro el archivo\n"); exit(EXIT_FAILURE);}
    if (input_file != NULL){
        int fscanf_chk = fscanf(input_file, "%u",&length);
        if (length>max_size){printf("archivo demasiado grande"); exit(EXIT_FAILURE);}
        if (fscanf_chk<0){printf("lenght no valido"); return EXIT_FAILURE;}
        for (unsigned int i=0u; i <length; i++){
            int eof = feof(input_file);
            if(eof == 1){printf("Error en el largo del input\n");exit(EXIT_FAILURE);}  
            fscanf(input_file,"%d",&array[i]);
         }
    }
    fclose(input_file);
    return length;
    
}

void array_dump(int a[], unsigned int length) {
    if(length == 0){printf("[");printf(" ]\n");}
    if(length>0){
    printf("[");
    for (unsigned int i = 0 ;i<length-1;i++){
        printf(" %d,", a[i]);
    }
    int i = length-1;
    printf(" %d",a[i]);
    printf(" ]\n");
    }
}

bool array_is_sorted(int a[], unsigned int length){


    bool sorted = true;
    if(length==0){return sorted;}
    if(length>0){
        for (unsigned int i = 0; i<length-1; i++){
        sorted= sorted && (a[i]<=a[i+1]);
        }
    }
    return sorted;
}

void array_swap(int a[], unsigned int i, unsigned int j){
    int tmp;
    tmp = a[i];
    a[i] = a[j];
    a[j] = tmp;

}