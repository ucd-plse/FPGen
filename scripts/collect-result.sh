#!/bin/bash
export FPGen=/home/fptesting/FPTesting
benchPath=$FPGen/benchmarks/gsl
perror=$FPGen/utils/print_error

test=$1

echo "Test $test:"

case $test in
  "wmean")
    test=mean
    ;;
  "wvariance")
    test=variance
    ;;
  "wvariance-m")
    test=variance-m
    ;;
  "wvariance-w")
    test=variance-w
    ;;
  *)
esac

## collect random results
pushd $test/s3fp &>/dev/null
./sequential-64 urt-input urt-out-64 &>/dev/null
./sequential-80 urt-input urt-out-80 &>/dev/null
$perror urt-out-64 urt-out-80 > outs 
err=`cat outs | grep "relative" | cut -d ":" -f 2 | sed "s/^ *//" | awk '{printf "%5.4e", $1}'`
secs=`cat urt-out | grep "TIMEOUT" | cut -d " " -f 2`
time=`date -u -d @${secs} +"%T"`
num=`cat urt-out | grep "N PLAIN TESTS" | cut -d ":" -f 2 | sed "s/^ *//"`
echo "  -RANDOM      Rel. Error: $err, time: $time, #Inputs: $num"
rm -f outs
popd &>/dev/null

## collect s3fp results
pushd $test/s3fp $>/dev/null
./sequential-64 bgrt-input bgrt-out-64 &>/dev/null
./sequential-80 bgrt-input bgrt-out-80 &>/dev/null
$perror bgrt-out-64 bgrt-out-80 > outs 
err=`cat outs | grep "relative" | cut -d ":" -f 2 | sed "s/^ *//" | awk '{printf "%5.4e", $1}'`
secs=`cat bgrt-out | grep "TIMEOUT" | cut -d " " -f 2`
time=`date -u -d @${secs} +"%T"`
num=`cat bgrt-out | grep "N BGRT TESTS" | cut -d ":" -f 2 | sed "s/^ *//"`
echo "  -S3FP        Rel. Error: $err, time: $time, #Inputs: $num" 
rm -f outs
popd &>/dev/null

## collect klee-float results
secs1=`tail -n 1 compile-klee.sh | cut -d " " -f 5 | cut -d "=" -f 2`
pushd $test/klee $>/dev/null
err=`sort -k 3 -g -r rel-errors | head -n 1 | cut -d " " -f 3 | awk '{printf "%5.4e", $1}'`
time1=`cat klee-last/info | grep "Elapsed" | cut -d " " -f 2`
secb=`date +%s -d 00:00:00`
sece=`date +%s -d ${time1}`
secs2=`expr ${sece} - ${secb}`
secs=$(( secs1 < secs2 ? secs1 : secs2 ))
time=`date -u -d @${secs} +"%T"`
num=`cat klee-last/info | grep "generated tests" | cut -d "=" -f 2 | sed "s/ *//"`
echo "  -KLEE-FLOAT  Rel. Error: $err, time: $time, #Inputs: $num" 
popd &>/dev/null

## collect fpgen results
secs1=`tail -n 1 compile.sh | cut -d " " -f 5 | cut -d "=" -f 2`
pushd $test/fptest $>/dev/null
time1=`cat klee-last/info | grep "Elapsed" | cut -d " " -f 2`
secb=`date +%s -d 00:00:00`
sece=`date +%s -d ${time1}`
secs2=`expr ${sece} - ${secb}`
secs=$(( secs1 < secs2 ? secs1 : secs2 ))
time=`date -u -d @${secs} +"%T"`
secs_urt=`cat ../test/urt-out | grep "TIMEOUT" | cut -d " " -f 2`
time_urt=`date -u -d @${secs_urt} +"%T"`
err1=`sort -k 3 -g -r rel-errors | head -n 1 | cut -d " " -f 3`
err2=`cat ../test/urt-out | grep "Best Relative Error" | cut -d " " -f 4`
err=`echo $err1 $err2 | awk '{if ($1>=$2) printf "%5.4e", $1; else print $2;}'`
num1=`cat klee-last/info | grep "generated tests" | cut -d "=" -f 2 | sed "s/ *//"`
num2=`cat ../test/urt-out | grep "N PLAIN TESTS" | cut -d ":" -f 2 | sed "s/^ *//"`
num=`expr ${num1} + ${num2}`
echo "  -FPGEN       Rel. Error: $err, time: $time_urt+$time*k, #Inputs: $num" 
popd &>/dev/null
