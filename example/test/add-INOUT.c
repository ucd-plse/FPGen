#include <stdio.h>
#include <assert.h>
#include <float.h>
extern "C" {
#include <quadmath.h>
}

#ifndef N
#define N 4
#endif

#ifndef FT
#define FT double
#endif

int main (int argc, char *argv[]) {
  assert(N >= 2);
  assert(sizeof(FT) == sizeof(float) ||
     sizeof(FT) == sizeof(double) ||
     sizeof(FT) == sizeof(__float128));
  assert(argc == 3);

  int i;
  char *inname = argv[1];
  char *outname = argv[2];
  FILE *infile = fopen(inname, "r");
  FILE *outfile = fopen(outname, "w");

  FT sum;
  FT L[N];

  for (i = 0 ; i < N ; i++) {
    __float128 in_data;
    fread(&in_data, sizeof(__float128), 1, infile);
    L[i] = (FT)in_data/FLT_MAX*100;
  }
  fclose(infile);

  __float128 out_data;

  for (i = N-1 ; i > 0 ; i--){
    L[i-1] += L[i];
  }

  out_data = (__float128) L[0];
  fwrite(&out_data, sizeof(__float128), 1, outfile);
  fclose(outfile);

  return 0;
}
