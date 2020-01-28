/**
 * Prints out the content of the given input file (e.g., best_input)
 */

#include <stdio.h>
#include <assert.h>
#include <quadmath.h>
#include <math.h>
#include <float.h>

int main(int argc, char *argv[])
{
  char *fname = "out-32";
  char *hname = "out-128";

  if (argc >= 3) {
    fname = argv[1];
    hname = argv[2];
  }

  FILE *in;

  // Read low precision data
  in = fopen(fname, "r");
  if (!in) {
    printf("Input file %s doesn't exist\n", fname);
    return 1;
  }
  __float128 fdata[100];
  int n = 0;
  int i = 0;

  fseek(in, 0, SEEK_END);
  n = ftell(in);
  fseek(in, 0, SEEK_SET);

  assert((n % sizeof(__float128)==0)&&(n / sizeof(__float128)<100));

  for (i=0; i<n/sizeof(__float128); i++){
    fread(&fdata[i], sizeof(__float128), 1, in);
    printf("low precision output: %.10e\n", (double)fdata[i]);
  }
  fclose(in);


  // Read high precision data
  in = fopen(hname, "r");
  __float128 hdata[100];
  int m = 0;

  fseek(in, 0, SEEK_END);
  m = ftell(in);
  fseek(in, 0, SEEK_SET);

  assert(m==n);

  for (i=0; i<m/sizeof(__float128); i++){
    fread(&hdata[i], sizeof(__float128), 1, in);
    printf("high precision output: %.10e\n", (double)hdata[i]);
  }

  fclose(in);

  __float128 maxabs=0, maxrel=0;
  __float128 abs_err, abs_hdata, rel_err;

  for (i=0; i<m/sizeof(__float128); i++){
    // compute absolute error and relative error
    //abs_err = fabsq(hdata-fdata);
    //rel_err = abs_err/(fabsq(hdata)<1? 1:fabsq(hdata));
    abs_err = hdata[i]-fdata[i]<0?(fdata[i]-hdata[i]):(hdata[i]-fdata[i]);
    abs_hdata = hdata[i]<0? (-hdata[i]):hdata[i];
    rel_err = abs_err / (abs_hdata<FLT_MIN? FLT_MIN: abs_hdata);
    printf("%.10e, %.10e\n", (double)abs_err, (double)rel_err);
    //update maximum error
    maxabs = abs_err>maxabs?abs_err:maxabs;
    maxrel = rel_err>maxrel?rel_err:maxrel;
  }

  printf("----------\n -absolute error: %.10e\n -relative error: %.10e\n", (double)maxabs, (double)maxrel);

  return 0;
}
