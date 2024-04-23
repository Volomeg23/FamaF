
unsigned int array_from_file(int array[], unsigned int max_size, const char *filepath);

void array_dump(int a[], unsigned int length);


// array_helpers.h no se compila ya que en el .h contiene declaraciones de las funciones y no definiciones
//que es lo que el compilador necesita para usar las funciones en el main