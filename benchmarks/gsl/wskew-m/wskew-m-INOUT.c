#include <stdio.h>
#include <gsl/gsl_statistics.h>
#include <assert.h>

extern "C" {
#include <quadmath.h>
}

#ifndef N
#define N 64
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
  FT wmean, wsd, wskew;

  for (i = 0 ; i < K ; i++) {
    __float128 in_data;
    fread(&in_data, sizeof(__float128), 1, infile);
    data[i] = (float) in_data;
  }

  for (i = 0 ; i < K ; i++) {
    __float128 in_data;
    fread(&in_data, sizeof(__float128), 1, infile);
    w[i] = (float) in_data;
  }

  fclose(infile);

  // library call
  #if(FB==64)
    wmean     = gsl_stats_wmean(w, 1, data, 1, K);
    wsd     = gsl_stats_wsd(w, 1, data, 1, K);
    wskew     = gsl_stats_wskew_m_sd(w, 1, data, 1, K, wmean, wsd);
  #elif(FB==80)
    wmean     = gsl_stats_long_double_wmean(w, 1, data, 1, K);
    wsd     = gsl_stats_long_double_wsd(w, 1, data, 1, K);
    wskew     = gsl_stats_long_double_wskew_m_sd(w, 1, data, 1, K, wmean, wsd);
  #else
    exit(-1);
  #endif

  //printf ("The sample wskew is %g\n", wskew);

  __float128 out_data;
  out_data = (__float128) wskew;
  fwrite(&out_data, sizeof(__float128), 1, outfile);
  fclose(outfile);

  return 0;
}
