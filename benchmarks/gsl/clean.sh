#!/bin/bash
benchPath=/home/fptesting/FPTesting/benchmarks/gsl

clean()
{
  test=$1
  
  ## clean random and s3fp
  rm -rf $benchPath/$test/s3fp

  ## clean klee
  rm -rf $benchPath/$test/klee
  cd $benchPath/$test/test; mv $test-INOUT.c .$test-INOUT.c; rm -rf ./*; mv .$test-INOUT.c $test-INOUT.c; cd - >/dev/null 
  
  # clean fptest
  rm -rf $benchPath/$test/fptest; 
  rm -rf $benchPath/$test/test-sample
}

tests="wmean wvariance wsd wvariance-w wsd-w wtss wtss-m wvariance-m wsd-m wabsdev wskew wkurtosis wabsdev-m wskew-m wkurtosis-m"

if [ $# -gt 0 ]; then
  tests=$@
fi

for test in $tests; do
    echo "clean $test"
    clean $test
done
