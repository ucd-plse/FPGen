#!/bin/bash
benchPath=/home/fptesting/FPTesting/benchmarks/matrix

tests="sum 1norm 2norm dot conv mv mm lu qr"

if [ $# -gt 0 ]; then
  tests=$@
fi

for test in $tests; do
  utest=$test
  echo "fpgen $utest:"
  
  cat $benchPath/$test/fptest/fpgen.log
  echo -e "\r\n"
done

