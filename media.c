/*
    Promedio de un arreglo de enteros en C
    @author leonardo duran burguete
*/

#define tam 5
 

double promedioDeArreglo(int arreglo[], int cantidadDeElementos);
 
int main(){
    
    int arreglo[]={};
    int i;
     for(i=0; i<tam; i++){
        
    }
    int cantidadDeElementos = tam;
    double promedio = promedioDeArreglo(arreglo, cantidadDeElementos);
    
}
 
double promedioDeArreglo(int arreglo[] , int cantidadDeElementos){
    double suma = 0;
    for (int x = 0; x < cantidadDeElementos; x++){
        suma = suma + arreglo[x];
    }
    return suma / cantidadDeElementos;
}
