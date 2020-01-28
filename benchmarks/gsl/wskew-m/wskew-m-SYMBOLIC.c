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
  float input[K];

  // random inputs
  int i; 
  for (i = 0; i < K; i++){
    if (i<2) w[i] = 1; else w[i] = 2*w[i-1];
  }

  // symbolic inputs 
  klee_make_symbolic(&input, sizeof(input), "input");
  
  for (i = 0; i < K; i++){
    data[i] = input[i]  / FLT_MAX * 100;
  }

  double wmean, wsd, wskew;

  wmean     = gsl_stats_wmean(w, 1, data, 1, K);
  wsd     = gsl_stats_wsd(w, 1, data, 1, K);
  wskew     = gsl_stats_wskew_m_sd(w, 1, data, 1, K, wmean, wsd);

  printf ("The sample wskew is %g\n", wskew);
  return 0;
}
