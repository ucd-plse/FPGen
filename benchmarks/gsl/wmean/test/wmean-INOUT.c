#include <stdio.h>
#include <stdlib.h>
#include <gsl/gsl_statistics.h>
#include <assert.h>
#include <float.h>

extern "C" {
#include <quadmath.h>
}

#ifndef N
#define N 32
#endif

#define K N/2

#ifndef FB
#define FB 64
#endif

#if(FB==64)
#define FT double
#elif(FB==80)
#define FT long double
#endif

int
main(int argc, char *argv[])
{
  assert(argc == 3);

  int i;
  char *inname = argv[1];
  char *outname = argv[2];
  FILE *infile = fopen(inname, "r");
  FILE *outfile = fopen(outname, "w");

  FT data[K], w[K];
  FT wmean;

  // random inputs
  for (i = 0; i < K; i++){
    if (i<2) w[i] = 1; else w[i] = 2*w[i-1];
  }

  // read input data
  for (i = 0 ; i < K ; i++) {
    __float128 in_data;
    fread(&in_data, sizeof(__float128), 1, infile);
    data[i] = (float) in_data / FLT_MAX * 100;
  }

  fclose(infile);

  // library call
  #if(FB==64)
    wmean     = gsl_stats_wmean(w, 1, data, 1, K);
  #elif(FB==80)
    wmean     = gsl_stats_long_double_wmean(w, 1, data, 1, K);
  #else
    exit(-1);
  #endif

  __float128 out_data;
  out_data = (__float128) wmean;
  fwrite(&out_data, sizeof(__float128), 1, outfile);
  fclose(outfile);

  return 0;
}
