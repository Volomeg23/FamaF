

## HECHO POR:
- Bruno Volpini
- bruno.volpini@mi.unc.edu.ar

## COMPILACIÓN
Para compilar, simplemente:

    make
   Y para correr un ejemplo:
   

    ./exec *ejemplo*.txt
   
   Para limpiar:
  

    make clean
## ACLARACIONES

El quinto orden elegido es:
primero se colocan todos los vértices con numeración par, de mayor a menor, y luego los vértices con numeración impar, de menor a mayor

Flags de compilacion:
El archivo Makefile incluye flags que iban a tenerse en cuenta a la hora de compilar el proyecto. En cualquier caso, si se necesita agregar/eliminar flags, modifique el archivo Makefile directamente

## OUTPUT
El output estándar entregado imprime:

 - Cantidad de vértices
 - Cantidad de lados
 - Delta
 - Coloreo propio para cada orden inicial
 - Elección del coloreo propio mínimo entre los 5 ordenes iniciales
 - Coloreo final
 - Tiempo total de ejecución del programa completo

Existen otras cosas que se pueden imprimir. Algunas de estas cosas están dentro de las funciones implementadas, otras son funciones diseñadas específicamente para imprimir algo

