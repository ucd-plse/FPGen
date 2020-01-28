#include <stdio.h>
#include <stdlib.h>
#include <float.h>
#include "matrix.h"
#include <klee/klee.h>

#ifndef N
#define N 4
#endif

#define K N

#ifndef FT
#define FT double
#endif

int main(){
  VEC *x;
  x = v_get(K);

  double norm;

  float input[N];

  int i;

  klee_make_symbolic(&input, sizeof(input), "input"); 

  //read input
  for (i = 0; i < K; i++)
      x->ve[i] = input[i] /FLT_MAX * 100;

  norm=v_norm2(x);

  fprintf(stdout, "norm= %le\n", norm);

  return 0;
}
