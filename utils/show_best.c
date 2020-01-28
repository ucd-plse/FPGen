/**
 * Prints out the content of the given input file (e.g., best_input)
 */

#include <stdio.h>
#include <assert.h>
#include <float.h>
#include <quadmath.h>

int main(int argc, char *argv[])
{
  char *fname = "best_input";

  if (argc >= 2) {
    fname = argv[1];
  }

  FILE *in = fopen(fname, "r");
  if (!in) {
    printf("Input file %s doesn't exist\n", fname);
    return 1;
  }

  // Read input data
  __float128 data;
  int n = 0;
  int i = 0;

  fseek(in, 0, SEEK_END);
  n = ftell(in);
  fseek(in, 0, SEEK_SET);

  assert(n % sizeof(__float128) == 0);
  n /= sizeof(__float128);

  for (i = 0; i < n; i++) {
    fread(&data, sizeof(__float128), 1, in);
    printf("x[%d] = %.10e [%.10e]\n", i + 1, (double)data, (double)data/FLT_MAX*100);
  }

  fclose(in);
  return 0;
}
