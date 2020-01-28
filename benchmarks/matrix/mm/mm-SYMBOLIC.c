#include <math.h>
#include <stdio.h>
#include <stdlib.h>
#include <float.h>
#include "matrix.h"
#include <klee/klee.h>

#ifndef N
#define N 32
#endif

#define K ((int)(sqrt(N/2)))

#ifndef FT
#define FT double
#endif

int main(){
  MAT *A, *B, *C;
  A = m_get(K, K);
  B = m_get(K, K);
  C = m_get(K, K);

  float input[N];

  int i, j;

  klee_make_symbolic(&input, sizeof(input), "input"); 

  //read input
  for (i = 0; i < K; i++)
    for (j = 0; j < K; j++){
      A->me[i][j] = input[i*K+j] /FLT_MAX * 100;
    }
  for (i = 0; i < K; i++)
    for (j = 0; j < K; j++){
      B->me[i][j] = input[i*K+j+K*K] /FLT_MAX * 100;
    }

  m_mlt(A, B, C);

  fprintf(stdout, "C[0][0] = %le\n", C->me[0][0]);

  return 0;
}
