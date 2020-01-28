#include <stdio.h>
#include <stdlib.h>
#include <float.h>
#include "matrix.h"
#include <klee/klee.h>

#ifndef N
#define N 8
#endif

#define K (N/2) 

#ifndef FT
#define FT double
#endif

int main(){
  VEC *x, *y, *z;
  x = v_get(K);
  y = v_get(K);
  z = v_get(K*2-1);

  float input[N];

  int i;

  klee_make_symbolic(&input, sizeof(input), "input"); 

  //read input
  for (i = 0; i < K; i++)
      x->ve[i] = input[i] /FLT_MAX * 100;

  for (i = 0; i < K; i++)
      y->ve[i] = input[i+K] /FLT_MAX * 100;

  v_conv(x, y, z);

  fprintf(stdout, "convolutional product[%d]= %le\n", K, z->ve[K-1]);

  return 0;
}
