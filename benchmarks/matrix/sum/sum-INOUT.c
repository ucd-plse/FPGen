#include <stdio.h>
#include <stdlib.h>
#include <float.h>
#include "matrix.h"
#include <assert.h>
//extern "C" {
#include <quadmath.h>
//}

#ifndef N
#define N 4
#endif

#define K N

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

  VEC *x;
  x = v_get(K);

  double sum;

  float input[N];
  int i;
  
  for (i = 0 ; i < N ; i++) {
    __float128 in_data;
    fread(&in_data, sizeof(__float128), 1, infile);
    input[i] = (float) in_data;

    assert(input[i] == in_data);
  }
  fclose(infile);

  //read input
  for (i = 0; i < K; i++)
      x->ve[i] = input[i];

  sum=v_sum(x);

  fprintf(stdout, "sum= %le\n", sum);

  __float128 out_data = (__float128) sum;
  fwrite(&out_data, sizeof(__float128), 1, outfile);
  fclose(outfile);

  return 0;
}
