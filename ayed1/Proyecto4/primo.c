#include <stdlib.h>
#include <stdio.h>
#include <stdbool.h>
#include <assert.h>

int pedirEntero (void) {
    int n = 0;
    printf("Ingrese un numero entero\n");
    scanf("%d", &n);
    return n;
}

int check_primo (int n){
int i=2;
 	while (n%i!=0 && n>1){
  		i=i+1;
 	}
return (i==n);
}    

int nesimo_primo (int N){
    int i,p,c;
    i = 1;
    c = 0;
    while (c != N && i != N){
        if (check_primo(i)){
            p = i;
            i++;
            c++;
        } else {
            i++;
        }
        }
    if (N == 2 || N == 1){
        p = 1;
        printf("no hay numeros primos anteriores a %d\n",p);
        exit(p);
    }
    printf(" el ultimo numero primo hasta %d es %d\n",N,p);
    return p;
}

int main (void){
    int n = 0;
    n = pedirEntero();
    while (n<=0){
        printf("error, numero no valido, ingrese numero positivo\n");
        n = pedirEntero();
    }
    nesimo_primo(n);
}