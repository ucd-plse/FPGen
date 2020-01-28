#include <stdio.h>
#include <gsl/gsl_statistics.h>
#include <stdlib.h>
#include <float.h>
#include <assert.h>

#ifndef N
#define N 64
#endif

#define K N/2

#ifndef S
#define S K/2
#endif

#ifndef SEED
#define SEED 1
#endif

#include <klee/klee.h>
int
main(int argc, char* argv[])
{
  double data[K], w[K];
  int i, j;

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
 
  // read concrete input file
  char *inname = argv[1];
  FILE *infile = fopen(inname, "r");
  float cinput[N]; i=0;
  while(i<N && fscanf(infile, "%f", &cinput[i])>0){
      i++;
  }
  assert(i>=N);
  fclose(infile);
  // read concrete inputs
  for (i = 0; i < K-S; i++){
    w[index[i]]=cinput[index[i]];	
  }
  for (i = 0; i<K; i++){
    data[i] = cinput[i+K];
  }

  // read symbolic inputs 
  float sinput[K];
  klee_make_symbolic(&sinput, sizeof(sinput), "sinput");

  for (i = 0 ; i <S ; i++){
    w[index[K-1-i]] = sinput[i] / FLT_MAX * 100;
  }

  double wsd, wmean;

  wmean   = gsl_stats_wmean(w, 1, data, 1, K);
  wsd     = gsl_stats_wsd_m(w, 1, data, 1, K, wmean);

  return 0;
}
