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

  FT arr[2][N];
  unsigned int curra = 0;
  unsigned int copya = 1;
  unsigned alen = N;
  unsigned index[2];
  int i;

  srand(SEED);

  // read symbolic input
  for (i = 0 ; i < S ; i++) {
    arr[curra][i] = input[i] / FLT_MAX * 100;
  }

  // read rand input
  for (i = N-1 ; i >= S; i--){
    arr[curra][i] = rand() / FLT_MAX * 100;
  }

  // summation
  FT tmp;
  int counter=0;
  while (alen > 1) {
    index[0] = index[1] = 0;

    for (index[curra] = 0 ; index[curra] < alen ; index[curra]=index[curra] + 2) {
      if (index[curra] + 2 > alen) {
        arr[copya][index[copya]] = arr[curra][index[curra]];
        index[copya]++;
      }
      else {
        tmp = arr[curra][index[curra]] + arr[curra][index[curra]+1];
        
        uniform_sampled_fp_injection((void *)(arr[0]+curra*N+index[curra]), (void *)(arr[0]+curra*N+index[curra]+1), (void *)&tmp, &counter, 4, ALL_FP);
        
        arr[copya][index[copya]] = tmp;
        index[copya]++;
      }
    }

    alen = (alen % 2 == 1) ? (alen / 2 + 1) : (alen / 2);
    curra = (curra + 1) % 2;
    copya = (copya + 1) % 2;
  }

  fprintf(stdout, "  sum=%le\n", arr[curra][0]);

  return 0;
}
