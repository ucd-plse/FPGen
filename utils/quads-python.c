
#include <stdio.h>
#include <quadmath.h>
#include <float.h>
#include <assert.h>

void write_quads(double data)
{
  char *fname = "test-inputs";

  FILE *out = fopen(fname, "a+");

  // Read input data
  //__float128 qdata = strtoflt128(strdata, NULL);
  //printf("From write-quads: %.10e\n", data);
  __float128 qdata = data;

  // Write to the outfile
  fwrite(&qdata, sizeof(__float128), 1, out);

  fclose(out);
}


void read_quads_to_file(char* fname)
{
  char *foname = "input-w100.txt";

  FILE *in = fopen(fname, "r");
  if (!in) {
    printf("Input file %s doesn't exist\n", fname);
    return;
  }

  FILE *out = fopen(foname, "w");

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
    //printf("x[%d] = %.10e [%.10e]\n", i + 1, (double)data, (double)data/FLT_MAX*100);
    if (i != 0)
      fprintf(out, " ");

    fprintf(out, "%.10e", (double)data/FLT_MAX*100);
  }

  fclose(in);
  fclose(out);
}
