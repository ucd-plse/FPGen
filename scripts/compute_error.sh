#!/bin/bash

rootpath=/home/fptesting/FPTesting
perror=$rootpath/utils/print_error

tstring=$1
exe64=$2
exe128=$3

cinput=$4

echo "compute_error.sh $tstring $exe64 $exe128"

maxrel=0.0
best_test=none
echo "" >rel-errors
for test in $(ls $tstring); do
  #echo $test
  cp $test test_input
  $exe64 $cinput test_input out-64
  $exe128 $cinput test_input out-128
  $perror out-64 out-128 > out--
  rel=`grep "relative" out-- | cut -d ":" -f 2 | sed "s/ //g"`
  echo "$test -- $rel" >> rel-errors

  a=`printf "%.20f" $maxrel`
  b=`printf "%.20f" $rel`
  if [ $(echo "$b > $a" | bc -l) == 1 ]; then
    maxrel=$rel
    cp $test best_input
    best_test=$test
  fi
done
echo "Maximum relative error: $maxrel [$best_test]."

echo "---top 10 inputs"
sort -k 3 -g -r rel-errors | head -n 10 

rm -f out-* test_input
