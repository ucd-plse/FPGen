#include <stdio.h>
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
    L[i] = rand() / FLT_MAX * 100;
  }

  // summation
  FT sum, value, e=0;
  for (i = N-1 ; i > 0 ; i--){
    sum = L[i];
    value = L[i-1] + e;
    L[i-1] = sum + value;
    fp_injection((void *)&sum, (void *)&value, (void *)(L+i-1));
    e = (sum - L[i-1]) + value;
  }

  fprintf(stdout, "  sum=%le\n", L[0]);

  return 0;
}
