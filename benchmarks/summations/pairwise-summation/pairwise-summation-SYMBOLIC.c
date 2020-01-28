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

  FT arr[2][N];
  unsigned int curra = 0;
  unsigned int copya = 1;
  unsigned alen = N;
  unsigned index[2];
  int i;

  // read input
  for (i = N-1 ; i >= 0; i--){
    arr[curra][i] = input[i] / FLT_MAX * 100;
  }

  // summation
  while (alen > 1) {
    index[0] = index[1] = 0;

    for (index[curra] = 0 ; index[curra] < alen ; index[curra]=index[curra] + 2) {
      if (index[curra] + 2 > alen) {
        arr[copya][index[copya]] = arr[curra][index[curra]];
        index[copya]++;
      }
      else {
        arr[copya][index[copya]] = arr[curra][index[curra]] + arr[curra][index[curra]+1];
        index[copya]++;
      }
    }

    alen = (alen % 2 == 1) ? (alen / 2 + 1) : (alen / 2);
    curra = (curra + 1) % 2;
    copya = (copya + 1) % 2;
  }

  fprintf(stdout, "%lf\n", arr[curra][0]);

  return 0;
}
