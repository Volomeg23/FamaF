#ifndef MYBOOL_H
#define MYBOOL_H

#define true 1
#define false 0

typedef int mybool;


#endif
//la directiva #define incluye todo el contenido de un .h en el archivo que hizo la llamada a #define
// como array_helpers.c y array_helpers.h hacen llamada a la libreria mybool, el contenido de mybool
//se estaria definiendo dos veces, algo que no lo permite el compilador, para eso usamos ifndef
//que solo define una vez el mybool para todos los archivos que hagan #define "mybool.h"