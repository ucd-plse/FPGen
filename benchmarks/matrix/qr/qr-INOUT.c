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
#define N 16
#endif

#define K ((int)(sqrt(N)))

#ifndef FT
#define FT double
#endif

int main(int argc, char *argv[]){
  assert(sizeof(FT) == sizeof(float) ||
     sizeof(FT) == sizeof(double) ||
     sizeof(FT) == sizeof(__float128));
  assert(argc == 3);

  char *inname = argv[1];
  char *outname = argv[2];
  FILE *infile = fopen(inname, "r");
  FILE *outfile = fopen(outname, "w");

  MAT *A;
  A = m_get(K, K);

  float input[N];
  int i, j;
  
  for (i = 0 ; i < N ; i++) {
    __float128 in_data;
    fread(&in_data, sizeof(__float128), 1, infile);
    input[i] = (float) in_data;

    assert(input[i] == in_data);
  }
  fclose(infile);

  //read input
  for (i = 0; i < K; i++)
    for (j = 0; j < K; j++){
      A->me[i][j] = input[i*K+j];
    }

  //do QR
  VEC * diag = v_get(A->m);
  QRfactor(A,diag);

  fprintf(stdout, "A[%d][%d] = %le\n", K-1, K-1, A->me[K-1][K-1]);

  __float128 out_data = (__float128) A->me[0][0];
  fwrite(&out_data, sizeof(__float128), 1, outfile);
  fclose(outfile);

  return 0;
}
