/*  Autor: Luis Enrique Hernández Hernández
*   Fecha de creación: 25/02/23
*   @args n tamaño del arreglo
*   @args dos arreglos de enteros de tamaño n
*   Este programa invertira los elementos de un arreglo
*/
//#include <stdio.h>
#define n 5

void invierte(int a[], int tam){
    
    int b[n] = {};
    int m = 0, i;
    for (i = tam-1; i > -1; i--)
    {
        b[m] = a[i];
        m++;
    }
    for (i = 0; i < tam; i++)
    {
        // aqui se imprimira el arreglo invertido
    }
    return;
}

int main(){
    int a[n] = {};
    for (int i = 0; i < n; i++)
    {
        // aqui se pediran los numeros para llenar el arreglo
    }
    invierte(a, n);
    return 0;
}