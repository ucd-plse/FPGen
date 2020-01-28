/**
 * Transform float128 input data file to text input data file
 */

#include <stdio.h>
#include <assert.h>
#include <quadmath.h>

int main(int argc, char *argv[])
{
  char *fname = "best_input";
  char *foutname = "new_input";

  if (argc >= 3) {
    fname = argv[1];
    foutname = argv[2];
  }

  FILE *in = fopen(fname, "r");
  if (!in) {
    printf("Input file %s doesn't exist\n", fname);
    return 1;
  }
  FILE *out = fopen(foutname, "w");
  if (!out) {
    printf("Output file %s error\n", foutname);
    return 1;
  }

  // Read input data
  __float128 data;
  int n = 0;
  int i = 0;

  fseek(in, 0, SEEK_END);
  n = ftell(in)/sizeof(__float128);
  fseek(in, 0, SEEK_SET);

  double* x = calloc(100, sizeof(double));
 
  for (i=0; i<n; i++){
    fread(&data, sizeof(__float128), 1, in);
    x[i] = (double)data;
  }

  fclose(in);


  // Write data to out file
  for (i=0; i<n; i++){
    fprintf(out, "%le\n", x[i]);
  }

  fclose(out);

  return 0;
}
