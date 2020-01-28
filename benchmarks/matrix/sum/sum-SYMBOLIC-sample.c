#include <stdio.h>
#include <stdlib.h>
#include <float.h>
#include "matrix.h"
#include <klee/klee.h>
#include <assert.h>

#ifndef N
#define N 4
#endif

#define K N

#ifndef S
#define S K/2
#endif

#ifndef FT
#define FT double
#endif

#ifndef SEED
#define SEED 1
#endif
/* Arrange the N elements of ARRAY in random order.
   Only effective if N is much smaller than RAND_MAX;
   if this may not be the case, use a better random
   number generator. */
void shuffle(int *array, size_t n){
    if (n > 1)
    {
        size_t i;
        for (i = 0; i < n - 1; i++)
        {
          size_t j = i + rand() / (RAND_MAX / (n - i) + 1);
          int t = array[j];
          array[j] = array[i];
          array[i] = t;
        }
    }
}

void print_vec(VEC *array){
    int i;
    printf("vector=\n");
    for(i=0; i<K; i++)
        printf("%le\t", array->ve[i]);

    printf("\n");
}

void print_mat(MAT *mat){
    int i, j;
    printf("matrix=\n");
    for(i=0; i<K; i++){
        for(j=0; j<K; j++)
            printf("%le\t", mat->me[i][j]);
        printf("\n");
    }
    printf("\n");
}

int main(int argc, char *argv[]){
    VEC *x;
    x = v_get(K);

    double sum;

    srand(SEED);

    int index[K]; int i;

    for(i=0; i<K; i++)
        index[i] = i;

    shuffle(index, K);

    // concrete input values from a file
    char *inname = argv[1];
    FILE *infile = fopen(inname, "r");

    float cinput[K];
    // read concrete input
    i=0;
    while(i<K && fscanf(infile, "%f", &cinput[i])>0){
        i++;
    }
    assert(i>=K);
    fclose(infile);

    for (i = 0; i < K-S; i++)
        x->ve[index[i]] = cinput[index[i]];
    // declare symbolic input 
    float sinput[S];
    klee_make_symbolic(&sinput, sizeof(sinput), "sinput"); 
    // read symbolic input 
    for (i = 0; i < S; i++)
        x->ve[index[K-1-i]] = sinput[i] /FLT_MAX * 100;


    // 1sum
    sum=v_sum(x);


    return 0;
}
