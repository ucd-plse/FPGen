#include <stdio.h>
#include <stdlib.h>
#include <float.h>
#include "matrix.h"
#include <assert.h>
//extern "C" {
#include <quadmath.h>
//}

#ifndef N
#define N 8
#endif

#define K N/2 

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

  VEC *x, *y;
  x = v_get(K);
  y = v_get(K);

  double product;

  float input[N];

  int i;

  //read input
  for (i = 0 ; i < N ; i++) {
    __float128 in_data;
    fread(&in_data, sizeof(__float128), 1, infile);
    input[i] = (float) in_data;
  }
  fclose(infile);

  for (i = 0; i < K; i++)
      x->ve[i] = input[i] /FLT_MAX * 100;

  for (i = 0; i < K; i++)
      y->ve[i] = input[i+K] /FLT_MAX * 100;

  // do inner product
  product=in_prod(x, y);

  //fprintf(stdout, "product = %le\n", product);

  __float128 out_data = (__float128) product;
  fwrite(&out_data, sizeof(__float128), 1, outfile);
  fclose(outfile);

  return 0;
}
