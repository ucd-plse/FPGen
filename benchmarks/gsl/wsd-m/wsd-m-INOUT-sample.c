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
  FT wsd;

  // read concrete input file
  float cinput[N]; i=0;
  while(i<N && fscanf(cinfile, "%f", &cinput[i])>0){
      i++;
  }
  assert(i>=N);
  fclose(cinfile);

  for (i = 0; i < K-S; i++){
    w[index[i]]=cinput[index[i]];	
  }

  for (i = 0 ; i <K ; i++){
    data[i] = cinput[i+K];
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
    w[index[K-1-i]] = sinput[i] / FLT_MAX * 100;
  }
  
  // library call
  double wmean;

  #if(FB==64)
    wmean   = gsl_stats_wmean(w, 1, data, 1, K);
    wsd     = gsl_stats_wsd_m(w, 1, data, 1, K, wmean);
  #elif(FB==80)
    wmean   = gsl_stats_long_double_wmean(w, 1, data, 1, K);
    wsd     = gsl_stats_long_double_wsd_m(w, 1, data, 1, K, wmean);
  #else
    exit(-1);
  #endif


  __float128 out_data;
  out_data = (__float128) wsd;
  fwrite(&out_data, sizeof(__float128), 1, outfile);
  fclose(outfile);

  return 0;
}
