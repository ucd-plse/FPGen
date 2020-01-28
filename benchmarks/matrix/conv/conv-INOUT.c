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

#define K (N/2) 

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

  VEC *x, *y, *z;
  x = v_get(K);
  y = v_get(K);
  z = v_get(K*2-1);

  float input[N];

  int i;

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
      //y->ve[i] = input[i] /FLT_MAX * 100;
      y->ve[i] = input[i+K];

  v_conv(x, y, z);

  fprintf(stdout, "convolutional product[%d]= %le\n", K, z->ve[K-1]);

  __float128 out_data = (__float128) z->ve[K-1];
  fwrite(&out_data, sizeof(__float128), 1, outfile);
  fclose(outfile);

  return 0;
}
