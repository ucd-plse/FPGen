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
#define N 20
#endif

#define K ((int)((sqrt(4*N+1)-1)/2))

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

  VEC *x, *out;
  MAT *A;
  x = v_get(K);
  out = v_get(K);
  A = m_get(K, K);  

  float input[N];

  int i, j;

  //read input
  for (i = 0 ; i < N ; i++) {
    __float128 in_data;
    fread(&in_data, sizeof(__float128), 1, infile);
    input[i] = (float) in_data;
    assert(input[i] == in_data);
  }
  fclose(infile);

  for (i = 0; i < K; i++)
      //x->ve[i] = input[i] /FLT_MAX * 100;
      x->ve[i] = input[i];

  for (i = 0; i < K; i++)
    for (j = 0; j < K; j++)
      //A->me[i][j] = input[i*K+j+K] /FLT_MAX * 100;
      A->me[i][j] = input[i*K+j+K];

  mv_mlt(A, x, out);

  fprintf(stdout, "(A*x)[0]= %le\n", out->ve[0]);

  __float128 out_data = (__float128) out->ve[0];
  fwrite(&out_data, sizeof(__float128), 1, outfile);
  fclose(outfile);

  return 0;
}
