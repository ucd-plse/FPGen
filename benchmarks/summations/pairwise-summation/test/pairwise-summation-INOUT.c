#include <stdio.h>
#include <assert.h>
#include <float.h>
extern "C" {
#include <quadmath.h>
}


#ifndef N
#define N 4
#endif 

#ifndef FT
#define FT double
#endif 

int main (int argc, char *argv[]) {
  assert(N >= 2);
  assert(sizeof(FT) == sizeof(float) ||
	 sizeof(FT) == sizeof(double) || 
	 sizeof(FT) == sizeof(__float128));
  assert(argc == 3);
  char *inname = argv[1];
  char *outname = argv[2];

  FT arr[2][N];
  unsigned int curra = 0;
  unsigned int copya = 1;
  unsigned alen = N;
  unsigned index[2];
  unsigned int i;
  __float128 data;

  FILE *infile = fopen(inname, "r"); 
  FILE *outfile = fopen(outname, "w");
  assert(infile != NULL && outfile != NULL); 

  // read input
  for (i = 0 ; i < N ; i++) {
    arr[curra][i] = 0.1;
    fread(&data, sizeof(__float128), 1, infile);
    arr[curra][i] = (float)data/FLT_MAX*100;
  }
  fclose(infile);
  
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

  data = (__float128) arr[curra][0];
  fwrite(&data, sizeof(__float128), 1, outfile);
  fclose(outfile);

  return 0;
}
