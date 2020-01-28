#include <stdio.h>
#include <stdlib.h>
#include <assert.h>
#include <float.h>
extern "C" {
#include <quadmath.h>
}

#ifndef N
#define N 32
#endif

#ifndef S
#define S N/2
#endif

#ifndef FT
#define FT double
#endif

#ifndef SEED
#define SEED 10304
#endif

int main (int argc, char *argv[]) {
  assert(N >= 2);
  assert(sizeof(FT) == sizeof(float) ||
     sizeof(FT) == sizeof(double) ||
     sizeof(FT) == sizeof(__float128));
  assert(argc >= 4);

  int i;
  char *inname = argv[2];
  char *outname = argv[3];
  FILE *infile = fopen(inname, "r");
  FILE *outfile = fopen(outname, "w");

  FT sum;
  FT L[N];

  srand(SEED);

  for (i = 0 ; i < S; i++){
    __float128 in_data;
    fread(&in_data, sizeof(__float128), 1, infile);
    L[i] = (float)in_data/FLT_MAX*100;
    //printf("L[%d]=%.5g\n", i, L[i]);
  }
  fclose(infile);

  for (i=N-1; i>=S; i--) {
    L[i] = (float)rand()/FLT_MAX * 100;
    //printf("L[%d]=%.5g\n", i, L[i]);
  }

  __float128 out_data;

  for (i = N-1 ; i > 0 ; i--){
    L[i-1] += L[i];

    //out_data = (__float128) L[i-1];
    //fwrite(&out_data, sizeof(__float128), 1, outfile);
  }
  //printf("sum=%.5g\n", L[0]);

  out_data = (__float128) L[0];
  fwrite(&out_data, sizeof(__float128), 1, outfile);
  fclose(outfile);

  return 0;
}
