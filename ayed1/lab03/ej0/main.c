#include <stdlib.h>
#include <stdio.h>

#define MAX_SIZE 1000

static void dump(char a[], unsigned int length) {
    printf("\"");
    for (unsigned int j=0u; j < length; j++) {
        printf("%c", a[j]);
    }
    printf("\"");
    printf("\n\n");
}


unsigned int char_sorter(char sorted[] , unsigned int indexes[],char letters[], unsigned int max_size){
    for (unsigned int i = 0; i < max_size; i++){
        unsigned int n = 0;
        while(indexes[n] != i){  
         
        n++;
        }
        sorted[i]=letters[n];
    
    }
    return EXIT_SUCCESS;

}


unsigned int data_from_file(const char *path, unsigned int indexes[],char letters[], unsigned int max_size){
    FILE *file = fopen (path, "r");
    if (file == NULL){
        perror("Error opening file");
    }
    unsigned int length = 0u;
    unsigned int i = 0u;
    while (!feof(file) && i < max_size){  //feof comprueba que finalizo el archivo
        fscanf(file,"%u '%c' \n", &indexes[i], &letters[i]);
        i++;
    }
    length = i;
    return length;
}

int main(int argc, char *argv[]) {
    //FILE *file;
    unsigned int indexes[MAX_SIZE];
    char letters[MAX_SIZE];
    char sorted[MAX_SIZE];
    unsigned int length=0; 
    if (argc != 2){
        exit(EXIT_FAILURE);
    }
    length = data_from_file(argv[1],indexes,letters,MAX_SIZE);

    dump(letters,length);

    char_sorter(sorted,indexes,letters,length);

    dump(sorted,length);

    return EXIT_SUCCESS;

}

