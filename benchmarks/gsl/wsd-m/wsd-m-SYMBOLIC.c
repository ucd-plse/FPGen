#include <stdio.h>
#include <gsl/gsl_statistics.h>
#include <stdlib.h>
#include <float.h>

#ifndef N
#define N 32 
#endif

#define K N/2

#include <klee/klee.h>
int
main(void)
{
  double data[K], w[K]; 
  float input[N];

  // symbolic inputs 
  klee_make_symbolic(&input, sizeof(input), "input");
  
  int i; 
  for (i = 0; i < K; i++){
    w[i] = input[i]  / FLT_MAX * 100;
  }
  for (i = 0; i < K; i++){
    data[i] = input[i+K]  / FLT_MAX * 100;
  }

  double wsd, wmean;

  wmean   = gsl_stats_wmean(w, 1, data, 1, K);
  wsd     = gsl_stats_wsd_m(w, 1, data, 1, K, wmean);

  printf ("The sample variance is %g\n", wsd);
  return 0;
}
