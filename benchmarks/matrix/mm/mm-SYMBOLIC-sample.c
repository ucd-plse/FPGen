#include <math.h>
#include <stdio.h>
#include <stdlib.h>
#include <float.h>
#include "matrix.h"
#include <klee/klee.h>
#include <assert.h>

#ifndef N
#define N 32 
#endif

#define K ((int)(sqrt(N/2)))

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
    MAT *A, *B, *C;
    A = m_get(K, K);
    B = m_get(K, K); 
    C = m_get(K, K);

    int i, j;
   
    srand(SEED);

    int index[K];

    for(i=0; i<K; i++)
        index[i] = i;

    shuffle(index, K);


    // concrete input values from a file
    char *inname = argv[1];
    FILE *infile = fopen(inname, "r");

    float cinput[N];
    // read concrete input
    i=0;
    while(i<N && fscanf(infile, "%f", &cinput[i])>0){
        i++;
    }
    assert(i>=N);
    fclose(infile);
    for (i = 0; i < K; i++)
        for (j = S/K; j < K; j++)
            A->me[i][index[j]] = cinput[i*K+index[j]];
    for (i = 0; i < K; i++)
        for (j = 0; j < K; j++)
            B->me[i][j] = cinput[i*K+j+K*K];

    // declare symbolic input 
    float input[S];
    klee_make_symbolic(&input, sizeof(input), "input"); 
    // read symbolic input 
    for (i = 0; i < K; i++)
        for (j = 0; j < S/K; j++)
            A->me[i][index[j]] = input[i*S/K+j] /FLT_MAX * 100;

    //print_mat(A);
    //printf("matrix B\n");
    //print_mat(B);

    // multiply
    m_mlt(A, B, C);

    fprintf(stdout, "C[0][0] = %le\n", C->me[0][0]);

    return 0;
}
