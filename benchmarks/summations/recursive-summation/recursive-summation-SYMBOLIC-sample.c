#include <stdio.h>
#include <stdlib.h>
#include <float.h>
#include <assert.h>
#include <klee/klee.h>
#include "/home/fptesting/FPTesting/utils/injections.h"

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
  float input[S];
  klee_make_symbolic(&input, sizeof(input), "input");

  FT L[N];
  int i;

  srand(SEED);

  // read input
  for (i = 0 ; i < S; i++){
    L[i] = input[i] / FLT_MAX * 100;
  }

  // read rand input
  for (i = N-1 ; i >= S; i--){
    L[i] = (float)rand() / FLT_MAX * 100;
  }

  // summation
  FT tmp;
  for (i = N-1 ; i > 0 ; i--){
    tmp = L[i-1] + L[i];

    fp_injection((void *)(L+i-1), (void *)(L+i), (void *)&tmp);

    L[i-1] = tmp;
  }

  fprintf(stdout, "  sum=%le\n", L[0]);

  return 0;
}
