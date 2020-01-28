#include <math.h>
#include <stdio.h>
#include <stdlib.h>
#include <float.h>
#include "matrix.h"
#include <klee/klee.h>

#ifndef N
#define N 20
#endif

#define K ((int)((sqrt(4*N+1)-1)/2))

#ifndef FT
#define FT double
#endif

int main(){
  VEC *x, *out;
  MAT *A;
  x = v_get(K);
  out = v_get(K);
  A = m_get(K, K);  

  float input[N];

  int i, j;

  klee_make_symbolic(&input, sizeof(input), "input"); 

  //read input
  for (i = 0; i < K; i++)
      x->ve[i] = input[i] /FLT_MAX * 100;

  for (i = 0; i < K; i++)
    for (j = 0; j < K; j++)
      A->me[i][j] = input[i*K+j+K] /FLT_MAX * 100;

  mv_mlt(A, x, out);

  fprintf(stdout, "(A*x)[0]= %le\n", out->ve[0]);

  return 0;
}
