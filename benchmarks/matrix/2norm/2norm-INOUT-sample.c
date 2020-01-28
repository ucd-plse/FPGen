#include <math.h>
#include <stdio.h>
#include <stdlib.h>
#include <float.h>
#include "matrix.h"
#include <assert.h>
//extern "C" {
#include <quadmath.h>
//}

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

void print_vec(VEC *array, size_t n){
    int i;
    printf("vector=\n");
    for(i=0; i<K; i++)
        printf("%le\t", array->ve[i]);

    printf("\n");
}

int main(int argc, char *argv[]){
    VEC *x;
    x = v_get(K);

    double norm;

    //symbolic input: S<=K*K
    float sinput[S];
    //concrete input values from a file
    float cinput[K];

    //read input
    char *cinname = argv[1];
    FILE *cinfile = fopen(cinname, "r");
    char *sinname = argv[2];
    FILE *sinfile = fopen(sinname, "r");
    char *outname = argv[3];
    FILE *outfile = fopen(outname, "w");

    int i, j;
    for (i = 0 ; i < S ; i++) {
        __float128 in_data;
        fread(&in_data, sizeof(__float128), 1, sinfile);
        sinput[i] = (float) in_data;
    }
    fclose(sinfile);

    //read symbolic input
    srand(SEED);

    int index[K];

    for(i=0; i<K; i++)
        index[i] = i;

    shuffle(index, K);

    for (i = 0; i < S; i++)
        x->ve[index[K-1-i]] = sinput[i] /FLT_MAX * 100;

    //read concrete input
    i=0;
    while(i<K && fscanf(cinfile, "%f", &cinput[i])>0){
        i++;
    }
    assert(i>=K);
    fclose(cinfile);

    for (i = 0; i < K-S; i++)
        x->ve[index[i]] = cinput[index[i]];

    // 1norm
    norm=v_norm2(x);



    __float128 out_data = (__float128)norm;
    fwrite(&out_data, sizeof(__float128), 1, outfile);

    fclose(outfile);

    return 0;
}
