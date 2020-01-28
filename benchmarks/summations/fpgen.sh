#!/bin/bash
benchPath=/home/fptesting/FPTesting/benchmarks/summations
klee=/home/fptesting/klee-float
S3FP_DIR=/home/fptesting/s3fp-v0.1
export LD_LIBRARY_PATH=${S3FP_DIR}:${LD_LIBRARY_PATH}

FLOG=$benchPath/result-fpgen.txt

NN=32
TIMEBUDGET=7200

#initial setting 
SS=16
SSEED=-1

TSymbolic=1800
RANDOM=818

run_fpgen()
{
  test=$1
  N=$2
  S=$3
  S_MIN=$4
  SEED=$5

  timebudget=$TIMEBUDGET
 
  # create configuration files
  pwd
  rm -rf $benchPath/$test/fptest; mkdir $benchPath/$test/fptest; cd $benchPath/$test/fptest
  cp ../$test-SYMBOLIC-sample.c .
  rm -rf $benchPath/$test/test-sample; mkdir $benchPath/$test/test-sample; cd $benchPath/$test/test-sample
  cp ../$test-INOUT-sample.c . 
  cd $benchPath/$test 
  
  # symbolic execution 
  cd $benchPath/$test/fptest; touch myinput
  
  err=0
  num=0
  S_opt=-1
  SEED_opt=$SEED
  reduce_S=false
  use_restTime=false
  count=0

  rm -rf fpgen.log

  while true; do
    if [ "$reduce_S" = "true" ]; then
      S=$((S/2))		
      reduce_S=false
    fi
    SEED=$(($RANDOM%1000))

    if [ "$use_restTime" = "true" ]; then
      Stime=$timebudget
    else
      Stime=$TSymbolic
    fi

    count=$((count+1))
    echo -e "\nStart symbolic execution $count:"
    clang-3.4 -DN=$N -DS=$S -DSEED=$SEED -I$klee/include -emit-llvm -c -g $test-SYMBOLIC-sample.c -o $test-tmp.bc
    llvm-link-3.4 $test-tmp.bc $benchPath/../../utils/injections.bc -o $test-SYMBOLIC-sample.bc
    rm $test-tmp.bc

    echo "time klee --allow-external-sym-calls --max-solver-time=$Stime --max-time=$Stime --search=nurs:covnew $test-SYMBOLIC-sample.bc myinput"
    time klee -allow-external-sym-calls --max-solver-time=$Stime --max-time=$Stime --search=nurs:covnew $test-SYMBOLIC-sample.bc myinput
    
    $benchPath/../../scripts/show_tests.sh &>/dev/null
    cd $benchPath/$test/test-sample; rm -rf sequential-* 
    g++ -o sequential-64 -DFT=double -DN=$N -DS=$S -DSEED=$SEED $test-INOUT-sample.c -lm
    g++ -o sequential-80 -DFT=__float128 -DN=$N -DS=$S -DSEED=$SEED $test-INOUT-sample.c -lm
    cd $benchPath/$test/fptest
    $benchPath/../../scripts/compute_error.sh "klee-last/test*-input" ../test-sample/sequential-64 ../test-sample/sequential-80 myinput
    err2=`sort -k 3 -g -r rel-errors | head -n 1 | cut -d " " -f 3 | awk '{printf "%5.4e", $1}'`
    num2=`cat klee-last/info | grep "generated tests" | cut -d "=" -f 2 | sed "s/ *//"`
    time2=`date -u -d @${Stime} +"%T"`
    time2r=`cat klee-last/info | grep "Elapsed" | cut -d " " -f 2`

    mv rel-errors rel-errors-$count-$N-$S-$SEED
    echo "N=$N, S=$S, SEED=$SEED : best relative error:$err2, number of tests:$num2, time:$time2 [$time2r]">>fpgen.log

    err_tmp=$err
    err=`echo $err_tmp $err2 | awk '{if ($1>=$2) printf "%5.4e", $1; else printf "%5.4e", $2;}'`
    num=`expr ${num} + ${num2}`
    S_opt=`echo $err_tmp $err2 $S_opt $S | awk '{if ($1>=$2) print $3; else print $4;}'`
    SEED_opt=`echo $err_tmp $err2 $SEED_opt $SEED | awk '{if ($1>=$2) print $3; else print $4;}'`
 
    timebudget=$((timebudget-Stime))
    if [ $timebudget -le 0 ]; then
      echo "Time Out [$timebudget]"
      break
    fi

    reduce=`echo $err2 1e-12 | awk '{if ($1>=$2) print "false"; else print "true";}'`

    if [ $S -ge $((S_MIN*2)) ] && [ "$reduce" = "true" ]; then
      reduce_S=true
    elif [ $S -eq $N ]; then
      use_restTime=true
    fi  

  done

  time_all=`date -u -d @${TIMEBUDGET} +"%T"`
  echo -e "\n\n Best Relative Error:  $err; Number of tests: $num, time: $time_all [S:$S_opt, SEED:$SEED_opt]" >>fpgen.log
  echo "  -FPGen   Rel. Error: $err, #Inputs: $num, time: $time_all"  >> $FLOG 
  cd $benchPath
}

tests="recursive-summation pairwise-summation compensated-summation"

if [ $# -gt 0 ]; then
  tests=$@
fi

for test in $tests; do
  echo "fpgen $test"

  TN=$NN
  TS=$SS
  S_MIN=4
  RANDOM=818
 
  echo "Test $test:">>$FLOG
  run_fpgen $test $TN $TS $S_MIN $SSEED >$benchPath/$test.out 2>/dev/null
  echo -e "\n\n FPGen log:" >>$benchPath/$test.out
  cat $benchPath/$test/fptest/fpgen.log >>$benchPath/$test.out
done
