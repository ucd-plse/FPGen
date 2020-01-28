#include <stdio.h>
#include <gsl/gsl_statistics.h>
#include <stdlib.h>
#include <float.h>
#include <assert.h>

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

#include <klee/klee.h>
int
main(int argc, char* argv[])
{
  double data[K], w[K];
  int i, j; 
  // read concrete input file
  char *inname = argv[1];
  FILE *infile = fopen(inname, "r");
  float cinput[K]; i=0;
  while(i<K && fscanf(infile, "%f", &cinput[i])>0){
      i++;
  }
  assert(i>=K);
  fclose(infile);

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
 
   // read concrete inputs
  for (i = 0 ; i <K-S ; i++){
    data[index[i]] = cinput[index[i]];
  }

  // random inputs
  for (i = 0; i < K; i++){
     if (i<2) w[i] = 1; else w[i] = 2*w[i-1];
  }

  // read symbolic inputs 
  float sinput[S];
  klee_make_symbolic(&sinput, sizeof(sinput), "sinput");

  for (i = 0 ; i<S; i++){
    data[index[K-1-i]] = sinput[i] / FLT_MAX * 100;
  }

  double wskew;

  wskew     = gsl_stats_wskew(w, 1, data, 1, K);

  return 0;
}
