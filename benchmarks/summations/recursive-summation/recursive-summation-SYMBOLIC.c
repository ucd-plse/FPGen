#include <stdio.h>
#include <float.h>
#include <assert.h>
#include <klee/klee.h>

#ifndef N
#define N 32
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
  for (i = N-1 ; i > 0 ; i--){
    L[i-1] += L[i];
  }

  fprintf(stdout, "%lf\n", L[0]);

  return 0;
}
