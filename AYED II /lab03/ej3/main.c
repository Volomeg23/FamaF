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
        while(indexes[n] != i){   // ciclo que compara i con n para reconstruir los indicies de char en orden
        
        n++;
        if(n >= max_size){
            printf("el archivo contiene indices no permitidos\n");
            return EXIT_FAILURE;
        }
        }
        sorted[i]=letters[n]; // copia las letters en sorted pero con los indices ordenados
    
    }
    return EXIT_SUCCESS;
}


unsigned int data_from_file(const char *path, unsigned int indexes[],char letters[], unsigned int max_size){
    //variable puntero a un file
    FILE *file = fopen(path, "r");
    if (file == NULL){
        perror("El archivo no existe");
    }
    unsigned int length = 0u;
    unsigned int i = 0u;
    //ciclo que itera hasta final del archivo o  array supero max_size
    while(!feof(file) && i < max_size){
        fscanf(file,"%u -> *%c*\n",&indexes[i],&letters[i]);
        i++;
    }
    length = i;
    return length;
}

int main(int argc, char *argv[]) {  // argc, numero de argumentos(incluido el ejecutable), argv, vector de argumentos, argv[0]=./reconstruccion y argv[1] ya es el argumento, en este caso file que le pasamos
    //FILE *file;
    unsigned int code;
    unsigned int indexes[MAX_SIZE];
    char letters[MAX_SIZE];
    char sorted[MAX_SIZE];
    unsigned int length=0; 
    if (argc != 2){  //argc=1 ejecutable,argc=2,file (argv[argc] == NULL, ya que argv va hasta argv[argc-1])
        exit(EXIT_FAILURE);
    }
    length = data_from_file(argv[1],indexes,letters,MAX_SIZE);

    dump(letters, length);

    code = char_sorter(sorted,indexes,letters,length);
    if(code == 0){
    dump(sorted,length);
    }
    return EXIT_SUCCESS;
}

