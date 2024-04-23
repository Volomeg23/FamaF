#include <stdio.h>
#include <assert.h>
#include "APIG24.h"
#include "EstructuraGrafo24.h"
#include "API2024Parte2.h"
#include <time.h>

u32 minimo_entre_cinco(u32 a, u32 b, u32 c, u32 d, u32 e) {
    u32 min = a;
    u32 final = 1;

    if (b < min) {
        min = b;
        final = 2;
    }
    if (c < min) {
        min = c;
        final = 3;
    }
    if (d < min) {
        min = d;
        final = 4;
    }
    if (e < min) {
        min = e;
        final = 5;
    }

    return final;
}

int main(int argc, char *argv[]) {
    clock_t start_time, end_time;
    double total_time;

    start_time = clock(); // Inicia el temporizador
    if (argc != 2) {
        fprintf(stderr, "Error: Cantidad de argumentos invalida\n");
        return 1;
    }
    FILE *archivo = fopen(argv[1], "r");
    if (archivo == NULL) {
        fprintf(stderr, "Error: No se pudo abrir el archivo\n");
        return 1;
    }
    Grafo mi_grafo[10] = {NULL};
    int i = 0;
    while (!feof(archivo)) {
        mi_grafo[i] = ConstruirGrafo(archivo);
        i++;
    }
 
    for (u32 i = 0; i < 10; i++) {
        if (mi_grafo[i] != NULL) {
            u32 vertices = NumeroDeVertices(mi_grafo[i]);
            printf("Cantidad de vertices: %u\n", vertices);
            u32 lados = NumeroDeLados(mi_grafo[i]);
            printf("Cantidad de lados: %u\n", lados);
            u32 delta = Delta(mi_grafo[i]);
            printf("Delta: %u\n", delta);

            
            printf("\nINICIALIZANDO ALGORITMO GREEDY..\n");
            u32* Orden = calloc(vertices, sizeof(u32));
            u32* Orden_copy = calloc(vertices, sizeof(u32));
            u32 min_color_de_1 = MAX_U32 -1;
            u32 min_color_de_2 = MAX_U32 -1;
            u32 min_color_de_3 = MAX_U32 -1;
            u32 min_color_de_4 = MAX_U32 -1;
            u32 min_color_de_5 = MAX_U32 -1;

            color* Color_de_1 = calloc(vertices, sizeof(color));
            color* Color_de_2 = calloc(vertices, sizeof(color));
            color* Color_de_3 = calloc(vertices, sizeof(color));
            color* Color_de_4 = calloc(vertices, sizeof(color));
            color* Color_de_5 = calloc(vertices, sizeof(color));

            //PRIMER ORDEN
            u32 iteraciones = 0;
            u32 coloreo = 0;

            for (u32 j = 0; j < vertices; j++) {
                Orden[j] = j;
                Orden_copy[j] = j;
            }
            while(iteraciones < 50){
                coloreo = Greedy(mi_grafo[i], Orden);
                GulDukat(mi_grafo[i], Orden);
                coloreo = Greedy(mi_grafo[i], Orden);
                ElimGarak(mi_grafo[i], Orden);
                coloreo = Greedy(mi_grafo[i], Orden);
                if (coloreo < min_color_de_1){
                    min_color_de_1 = coloreo;
                    ExtraerColores(mi_grafo[i], Color_de_1);
                }
                iteraciones++;
                //print_orden(Orden, vertices);   

            }
            printf("Primer Coloreo: %u\n", min_color_de_1);
            // GulDukat(mi_grafo[i], Orden);
            // print_orden(Orden, vertices);
            // for (u32 j = 0; j < vertices; j++) {
            //     printf("el color de %u es %u y tiene grado %u\n", j, Color(j, mi_grafo[i]), Grado(j, mi_grafo[i]));
            // }

            // coloreo = Greedy(mi_grafo[i], Orden);
            // assert(coloreo <= delta +1);
            // print_orden(Orden, vertices);
            // printf("Coloreo: %u\n", coloreo);
            // ElimGarak(mi_grafo[i], Orden);
            // print_orden(Orden, vertices);
            // for (u32 j = 0; j < vertices; j++) {
            //     printf("el color de %u es %u y tiene grado %u\n", j, Color(j, mi_grafo[i]), Grado(j, mi_grafo[i]));
            // }
            // GulDukat(mi_grafo[i], Orden);
            // print_orden(Orden, vertices);
            // for (u32 j = 0; j < vertices; j++) {
            //     printf("el color de %u es %u y tiene grado %u\n", j, Color(j, mi_grafo[i]), Grado(j, mi_grafo[i]));
            // }
            


           // SEGUNDO ORDEN
            iteraciones = 0;
            for (u32 j = 0; j < vertices; j++) {
                Orden[j] = Orden_copy[vertices-j-1];
            }
            while(iteraciones < 50){
                coloreo = Greedy(mi_grafo[i], Orden);
                GulDukat(mi_grafo[i], Orden);
                coloreo = Greedy(mi_grafo[i], Orden);
                ElimGarak(mi_grafo[i], Orden);
                coloreo = Greedy(mi_grafo[i], Orden);
                if (coloreo < min_color_de_2){
                    min_color_de_2 = coloreo;
                    ExtraerColores(mi_grafo[i], Color_de_2);
                }
                iteraciones++;


            }
            printf("Segundo Coloreo: %u\n", min_color_de_2);

            


            //TERCER ORDEN
            iteraciones = 0;
            pares_dec_impares_crec(Orden, vertices);
            while(iteraciones < 50){
                coloreo = Greedy(mi_grafo[i], Orden);
                GulDukat(mi_grafo[i], Orden);
                coloreo = Greedy(mi_grafo[i], Orden);
                ElimGarak(mi_grafo[i], Orden);
                coloreo = Greedy(mi_grafo[i], Orden);
                if (coloreo < min_color_de_3){
                    min_color_de_3 = coloreo;
                    ExtraerColores(mi_grafo[i], Color_de_3);
                }
                iteraciones++;


            }
            printf("Tercer Coloreo: %u\n", min_color_de_3);

            //CUARTO ORDEN
            iteraciones = 0;
            mergeSort_by_Grade(Orden,0,vertices-1,mi_grafo[i]);
            while(iteraciones < 50){
                coloreo = Greedy(mi_grafo[i], Orden);
                GulDukat(mi_grafo[i], Orden);
                coloreo = Greedy(mi_grafo[i], Orden);
                ElimGarak(mi_grafo[i], Orden);
                coloreo = Greedy(mi_grafo[i], Orden);
                if (coloreo < min_color_de_4){
                    min_color_de_4 = coloreo;
                    ExtraerColores(mi_grafo[i], Color_de_4);
                }
                iteraciones++;


            }
            printf("Cuarto Coloreo: %u\n", min_color_de_4);

            // //QUINTO ORDEN
            iteraciones = 0;
            pares_crec_impares_dec(Orden, vertices);
            while(iteraciones < 50){
                coloreo = Greedy(mi_grafo[i], Orden);
                GulDukat(mi_grafo[i], Orden);
                coloreo = Greedy(mi_grafo[i], Orden);
                ElimGarak(mi_grafo[i], Orden);
                coloreo = Greedy(mi_grafo[i], Orden);
                if (coloreo < min_color_de_5){
                    min_color_de_5 = coloreo;
                    ExtraerColores(mi_grafo[i], Color_de_5);
                }
                iteraciones++;


            }
            printf("Quinto Coloreo: %u\n", min_color_de_5);

            //COLOREO FINAL
            u32 minimo_final= minimo_entre_cinco(min_color_de_1, min_color_de_2, min_color_de_3, min_color_de_4, min_color_de_5);
            switch (minimo_final){
                case 1:
                    ImportarColores(Color_de_1, mi_grafo[i]);
                    printf("El coloreo elegido es el primero\n");
                    break;
                case 2:
                    ImportarColores(Color_de_2, mi_grafo[i]);
                    printf("El coloreo elegido es el segundo\n");
                    break;
                case 3:
                    ImportarColores(Color_de_3, mi_grafo[i]);
                    printf("El coloreo elegido es el tercero\n");
                    break;
                case 4:
                    ImportarColores(Color_de_4, mi_grafo[i]);
                    printf("El coloreo elegido es el cuarto\n");
                    break;
                case 5:
                    ImportarColores(Color_de_5, mi_grafo[i]);
                    printf("El coloreo elegido es el quinto\n");
                    break;
            }
            iteraciones = 0;
            srand(time(NULL));
            u32 coloreo_final;
            while(iteraciones < 500){
                int eleccion = rand() % 2;
                if (eleccion == 0){
                    GulDukat(mi_grafo[i], Orden);
                    coloreo_final = Greedy(mi_grafo[i], Orden);
                } else {
                    ElimGarak(mi_grafo[i], Orden);
                    coloreo_final = Greedy(mi_grafo[i], Orden);
                }
                iteraciones++;
            }


            printf("El coloreo final es: %u\n", coloreo_final);




            DestruirGrafo(mi_grafo[i]);
            free(Orden);
            free(Orden_copy);
            free(Color_de_1);
            free(Color_de_2);
            free(Color_de_3);
            free(Color_de_4);
            free(Color_de_5);
        }
    }
    end_time = clock(); // Detiene el temporizador
    total_time = ((double)(end_time - start_time)) / CLOCKS_PER_SEC; // Calcula el tiempo total en segundos

    printf("El tiempo total de ejecución fue: %f segundos\n", total_time);
    fclose(archivo);

    
    

    return 0;
}
