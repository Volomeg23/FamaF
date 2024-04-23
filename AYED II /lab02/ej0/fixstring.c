#include <stdbool.h>
#include <assert.h>

#include "fixstring.h"

unsigned int fstring_length(fixstring s) {
    int length=0;
    int i=0;
    while (s[i] != '\0'){
        length++;
        i++;
    }
    return length;

}

bool fstring_eq(fixstring s1, fixstring s2) {
    bool equal = true;
    if((fstring_length(s1) != fstring_length(s2)) ){equal = false;}
    int i = 0;
    while (s1[i] != '\0' && s2[i] != '\0'){
        if(s1[i] != s2[i]){
            equal = false;return equal;
        }
        i++;
    }

    return equal;
}


bool fstring_less_eq(fixstring s1, fixstring s2) {
    bool less_eq = true;
    int i = 0;
    while (s1[i] != '\0' && s2[i] != '\0'){
        if(s1[i] == s2[i]){
            if (fstring_length(s1)>fstring_length(s2)){
            less_eq = false;
            return less_eq;
        }
            i++;
        }
        if(s1[i] <= s2[i]){
            less_eq = true; 
            return less_eq;
        }
        if(s1[i] > s2[i]){
            less_eq = false; 
            return less_eq;
        }
    }
    return less_eq;
}
//encuentro !!la primera!!! letra que no es igual y si son iguales avanzo entre mismos indices y sigo comprobando 
