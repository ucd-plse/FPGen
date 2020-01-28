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

#ifndef S
#define S K/2 
#endif

#ifndef SEED
#define SEED 1
#endif

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
  assert(argc == 4);

  int i, j;
  char *cinname = argv[1];
  char *sinname = argv[2];
  char *outname = argv[3];
  FILE *cinfile = fopen(cinname, "r");
  FILE *infile = fopen(sinname, "r");
  FILE *outfile = fopen(outname, "w");

  srand(SEED);

  int index[K];
  for (i=0; i<K; i++)
    index[i]=i;
  for (i=0; i<K-1; i++){
    j = rand()%(K-1);
    int tmp = index[i];
    index[i] = index[j];
    index[j] = tmp;
  }
 
  FT data[K], w[K];
  FT wmean, wsd, wskew;

  // random inputs
  for (i = 0; i < K; i++){
    if (i<2) w[i] = 1; else w[i] = 2*w[i-1];
  }

  // read concrete input file
  float cinput[K]; i=0;
  while(i<K && fscanf(cinfile, "%f", &cinput[i])>0){
      i++;
  }
  assert(i>=K);
  fclose(cinfile);

  for (i = 0 ; i <K-S ; i++){
    data[index[i]] = cinput[index[i]];
  }

  // read symbolic input data
  float sinput[S];
  for (i = 0 ; i < S ; i++) {
    __float128 in_data;
    fread(&in_data, sizeof(__float128), 1, infile);
    sinput[i] = (float) in_data;
  }
  fclose(infile);

  for (i = 0 ; i<S; i++){
    data[index[K-1-i]] = sinput[i] / FLT_MAX * 100;
  }
  
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


  __float128 out_data;
  out_data = (__float128) wskew;
  fwrite(&out_data, sizeof(__float128), 1, outfile);
  fclose(outfile);

  return 0;
}
