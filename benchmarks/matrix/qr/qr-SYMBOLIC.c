#include <math.h>
#include <stdio.h>
#include <stdlib.h>
#include <float.h>
#include "matrix.h"
#include <klee/klee.h>

#ifndef N
#define N 16
#endif

#define K ((int)(sqrt(N)))

#ifndef FT
#define FT double
#endif

int main(){
  MAT *A;
  A = m_get(K, K);

  float input[N];

  int i, j;

  klee_make_symbolic(&input, sizeof(input), "input"); 

  //read input
  for (i = 0; i < K; i++)
    for (j = 0; j < K; j++){
      A->me[i][j] = input[i*K+j] /FLT_MAX * 100;
    }

  //do QR
  VEC * diag = v_get(A->m);
  QRfactor(A,diag);

  fprintf(stdout, "A[%d][%d] = %le\n", K-1, K-1, A->me[K-1][K-1]);

  return 0;
}
