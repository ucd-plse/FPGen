#!/bin/bash
benchPath=/home/fptesting/FPTesting/benchmarks/gsl

tests="wmean wvariance wsd wvariance-w wsd-w wtss wtss-m wvariance-m wsd-m wabsdev wskew wkurtosis wabsdev-m wskew-m wkurtosis-m"

if [ $# -gt 0 ]; then
  tests=$@
fi

for test in $tests; do
  echo "fpgen $test:"
  
  cat $benchPath/$test/fptest/fpgen.log
  echo -e "\r\n"
done
