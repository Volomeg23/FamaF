#include <assert.h>
#include <stdbool.h>
#include <stdio.h>
#include <stdlib.h>



bool array_is_sorted(int a[], unsigned int length) {
    unsigned int i = 0 ;
    bool p = true;
    while ((i < length - 1) && p)
    {
        if (a[i] >= a[i+1])
        {
            p = false;
        }
        i = i +1;
    }
    
    

    return p;

}



int main(void){


int array[] = {0};
unsigned int x = 5;
bool p ;
p = array_is_sorted(array, x);
/*int i = 0 ;
while (i < 5)
{
    printf("%d" , array[i]);
    i = i +1;
}*/
printf("%d", p);

return 0;

}