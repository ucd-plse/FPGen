#include <stdio.h>
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
#define SEED 23
#endif

int main (int argc, char *argv[]) {
  assert(S >= 2);
  assert(sizeof(FT) == sizeof(float) ||
     sizeof(FT) == sizeof(double) ||
     sizeof(FT) == sizeof(__float128));
  assert(argc >= 4);

  int i;
  char *inname = argv[2];
  char *outname = argv[3];
  FILE *infile = fopen(inname, "r");
  FILE *outfile = fopen(outname, "w");

  FT L[N];

  srand(SEED);

  for (i = 0 ; i < S ; i++) {
    __float128 in_data;
    fread(&in_data, sizeof(__float128), 1, infile);
    L[i] = (float) in_data / FLT_MAX*100;
  }
  fclose(infile);

 // read rand input
  for (i = N-1 ; i >= S; i--){
    L[i] = rand() / FLT_MAX * 100;
  }

  __float128 out_data;

  FT sum, value, e=0;
  for (i = N-1 ; i > 0 ; i--){
    sum = L[i];
    value = L[i-1] + e;
    L[i-1] = sum + value;
    e = (sum - L[i-1]) + value;
  }

  out_data = (__float128) L[0];
  fwrite(&out_data, sizeof(__float128), 1, outfile);
  fclose(outfile);

  return 0;
}
