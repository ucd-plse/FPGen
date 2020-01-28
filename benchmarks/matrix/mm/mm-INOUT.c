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
#define N 32 
#endif

#define K ((int)(sqrt(N/2)))

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

  MAT *A, *B, *C;
  A = m_get(K, K);
  B = m_get(K, K);
  C = m_get(K, K);

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
  for (i = 0; i < K; i++)
    for (j = 0; j < K; j++){
      B->me[i][j] = input[i*K+j+K*K];
    }

  //do MM
  m_mlt(A, B, C);

  __float128 out_data = (__float128) C->me[0][0];
  fwrite(&out_data, sizeof(__float128), 1, outfile);
  fclose(outfile);

  return 0;
}
