/*
 * FPGen tutorial: recursive summation with input array of size 3
 */
#include <stdio.h>
#include <float.h>
#include <assert.h>
#include <klee/klee.h>

#ifndef N
#define N 3
#endif

#ifndef FT
#define FT double
#endif

int main (int argc, char *argv[]) { 
  assert(N >= 2);
  float input[N];   
  klee_make_symbolic(&input, sizeof(input), "input");

  FT L[N];
  int i;

  // read input
  for (i = N-1 ; i >= 0; i--){
    L[i] = input[i] / FLT_MAX * 100;
  }

  // summation
  FT tmp;
  for (i = N-1 ; i > 0 ; i--){
    tmp = L[i-1] + L[i];

    fp_injection((void *)(L+i-1), (void *)(L+i), (void *)&tmp);

    L[i-1] = tmp;
  }

  fprintf(stdout, "%lf\n", L[0]);

  return 0;
}
