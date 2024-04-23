#include <stdio.h>
#include <stdlib.h>

#include "data.h"

void
print_data(data_t d) {
    printf("NOMBRE: %s\n"
           "EDAD  : %d años\n"
           "ALTURA: %d cm\n\n",
           d.name, d.age, d.height);
}

int main(void) {

    data_t messi = {"Leo Messi", 35, 169};
    print_data(messi);

    printf("name-size  : %lu bytes\n"
           "age-size   : %lu bytes\n"
           "height-size: %lu bytes\n"
           "data_t-size: %lu bytes\n", 
           sizeof(messi.name), sizeof(messi.age),
           sizeof(messi.height), sizeof(messi));

    return EXIT_SUCCESS;
}


// el tamaño del campo name esta limitado por NAME_MAXSIZE por lo tanto cualquier nombre que pongamos en este campo
//siempre va a tener longitud menor o igual a NAME_MAXSIZE

// la suma de los tamaños de los campos y el tamaño del campo es diferente ya que el tamaño del campo es mas grande debido a que tiene
//que contar tambien los bytes del "esqueleto" del struct