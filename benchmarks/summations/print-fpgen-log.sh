#!/bin/bash
benchPath=/home/fptesting/FPTesting/benchmarks/summations

tests="recursive-summation pairwise-summation compensated-summation"

if [ $# -gt 0 ]; then
  tests=$@
fi

for test in $tests; do
  utest=$test
  echo "fpgen $utest:"
   
  cat $benchPath/$test/fptest/fpgen.log
  echo -e "\r\n"
done

