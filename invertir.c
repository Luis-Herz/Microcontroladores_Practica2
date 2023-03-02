/*  Autor: Luis Enrique Hernández Hernández
*   Fecha de creación: 25/02/23
*   @args n tamaño del arreglo
*   @args dos arreglos de enteros de tamaño n
*   Este programa invertira los elementos de un arreglo
*/
//#include <stdio.h>
/*
int invierte(){
    int b[5] = {};
    for (int i = n-1; i > -1; i--)
    {
        b[m] = a[i];
        m++;
    }
    for (int i = 0; i < n; i++)
    {
        //printf("%i",b[i]);
    }
    return 0;
}*/

int invierte(int arreglo[], int n){
    int b[5] = {};
    int m = 0;
    for (int i = n-1; i > -1; i--)
    {
        b[m] = arreglo[i];
        m++;
    }
    for (int i = 0; i < n; i++)
    {
        return b[i];
    }
    
}

int main(){
    int a[5] = {1,2,3,4,5};
    return invierte(a, 5);
    return 0;
}

/*  falta leer el arreglo desde la terminal
*   imprimir resultado desde la terminal
*/