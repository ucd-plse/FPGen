/**
 * Prints out the content of the given input file (e.g., best_input)
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
  n = ftell(in);
  fseek(in, 0, SEEK_SET);

  //assert(n % sizeof(__float128) == 0);
  //n /= sizeof(__float128);

  //double* x = calloc(n, sizeof(double));
  double* x = calloc(100, sizeof(double));

  /*
  for (i = 0; i < n; i++) {
    fread(&data, sizeof(__float128), 1, in);
    x[i] = (double)data;
    printf("x[%d] = %f\n", i + 1, x[i]);
  }*/
  while(fscanf(in, "%le", &x[i])>0){
    printf("x[%d] = %le\n", i, x[i]);
    i++;
  }

  fclose(in);

  // Write output data
  /*
  for (i=n-1; i>=3; i=i-4){
    //x[i] = 1.734272; 
    x[i] = 0.000005*0.01; 
    x[i-1] = 95.681671*0.01;
    x[i-2] = 0.000005*0.01; 
    x[i-3] = -95.681671*0.01;
  } 
  //x[18] = 0.000005f; 
  //x[2] = 0.000005*0.01; 
  //x[0] = 95.681671*0.01;
  */

  n = i; 
  for (i=0; i<n; i++){
    data = (__float128)x[i];
    fwrite(&data, sizeof(__float128), 1, out);
  }

  fclose(out);

  return 0;
}
