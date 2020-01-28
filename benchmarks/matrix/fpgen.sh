#!/bin/bash
benchPath=/home/fptesting/FPTesting/benchmarks/matrix
klee=/home/fptesting/klee-float
S3FP_DIR=/home/fptesting/s3fp-v0.1
export LD_LIBRARY_PATH=${S3FP_DIR}:${LD_LIBRARY_PATH}
Meschach=/home/fptesting/FPTesting/benchmarks/matrix/meschach-injected
Meschach64=/home/fptesting/FPTesting/benchmarks/matrix/meschach
Meschach128=/home/fptesting/FPTesting/benchmarks/matrix/meschach-ld

FLOG=$benchPath/result-fpgen.txt

NN=16
TIMEBUDGET=7200

TSearch=600
TSymbolic=3300

RANDOM=901

#initial setting 
SS=16
SSEED=-1

run_fpgen()
{
  test=$1
  N=$2
  S=$3
  S_MIN=$4
  SEED=$5

  timebudget=$TIMEBUDGET
 
  # create configuration files
  rm -rf $benchPath/$test/fptest; mkdir $benchPath/$test/fptest; cd $benchPath/$test/fptest
  cp ../$test-SYMBOLIC-sample.c .
  rm -rf $benchPath/$test/test-sample; mkdir $benchPath/$test/test-sample; cd $benchPath/$test/test-sample
  cp ../$test-INOUT-sample.c . 
  cd $benchPath/$test 
  
  # base random search
  echo -e "\nStart base search:"
  cd $benchPath/$test/test; cp $test-INOUT.c $test-INOUT.c.bck; sed -i '/FLT_MAX/s/\/FLT_MAX/;\/\/\/FLT_MAX/' $test-INOUT.c; rm -rf sequential-*
  gcc -o sequential-64 -DFT=double -DN=$N -I${Meschach64} $test-INOUT.c ${Meschach64}/meschach.a -lm 
  gcc -o sequential-80 -DFT=__float128 -DN=$N -I${Meschach128} $test-INOUT.c ${Meschach128}/meschach.a -lm
  echo TIMEOUT = $TSearch > s3fp_setting
  echo RESOURCE = TIME >> s3fp_setting
  echo RSEED = 0 >> s3fp_setting
  echo FTERROR = REL >> s3fp_setting
  echo REL_DELTA = 1.175494351e-38F >> s3fp_setting
  echo UNIFORM_INPUT = true >> s3fp_setting
  echo UNIFORM_INPUTLB = -100.0 >> s3fp_setting
  echo UNIFORM_INPUTUB = 100.0  >> s3fp_setting
  echo RT = URT >> s3fp_setting
  echo PARALLELRT = false >> s3fp_setting
  echo "==== run s3fp ====" 
  #${S3FP_DIR}/s3fp 32 $N test_input ./sequential-64 test_output_64 ./sequential-80 test_output_80 &> urt-out	
  mv $test-INOUT.c.bck $test-INOUT.c; cd $benchPath/$test
  timebudget=$((timebudget-TSearch))

  # symbolic execution
  cp $benchPath/$test/base-out  $benchPath/$test/test/urt-out
  err1=`cat $benchPath/$test/test/urt-out | grep "Best Relative Error" | cut -d " " -f 4 | awk '{printf "%5.4e", $1}'`
  num1=`cat $benchPath/$test/test/urt-out | grep "N PLAIN TESTS" | cut -d ":" -f 2 | sed "s/^ *//"`
  secs1=`cat $benchPath/$test/test/urt-out | grep "TIMEOUT" | cut -d " " -f 2`
  time1=`date -u -d @${secs1} +"%T"`
 
  cd $benchPath/$test/fptest; cp ../base_input .
  #cp ../test/best_input base_input 
  $benchPath/../../utils/input128-reader base_input myinput

  rm -rf fpgen.log
  echo "base search : best relative error:$err1, number of tests:$num1, time:$time1">fpgen.log
  echo "base values = " >>fpgen.log
  cat myinput >>fpgen.log
  echo -e "\n" >>fpgen.log
 
  err=$err1
  num=$num1
  S_opt=-1
  SEED_opt=$SEED
  reduce_S=false
  use_restTime=false
  count=0

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
    clang-3.4 -DN=$N -DS=$S -DSEED=$SEED -I$klee/include -I$Meschach -emit-llvm -c -g $test-SYMBOLIC-sample.c -o $test-tmp.bc
    llvm-link-3.4 $test-tmp.bc $Meschach/meschach.a.bc -o $test-tmp-1.bc
    mv $test-tmp-1.bc $test-tmp.bc
    llvm-link-3.4 $test-tmp.bc $benchPath/../../utils/injections.bc -o $test-SYMBOLIC-sample.bc
    rm $test-tmp.bc

    echo "time klee --allow-external-sym-calls --max-solver-time=$Stime --max-time=$Stime --search=nurs:covnew $test-SYMBOLIC-sample.bc myinput"
    time klee -allow-external-sym-calls --max-solver-time=$Stime --max-time=$Stime --search=nurs:covnew $test-SYMBOLIC-sample.bc myinput
    
    $benchPath/../../scripts/show_tests.sh &>/dev/null
    cd $benchPath/$test/test-sample; rm -rf sequential-* 
    gcc -o sequential-64 -DFT=double -DN=$N -DS=$S -DSEED=$SEED -I${Meschach64} $test-INOUT-sample.c ${Meschach64}/meschach.a -lm
    gcc -o sequential-80 -DFT=__float128 -DN=$N -DS=$S -DSEED=$SEED -I${Meschach128} $test-INOUT-sample.c ${Meschach128}/meschach.a -lm
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

tests="sum 1norm 2norm dot conv mv mm lu qr"

if [ $# -gt 0 ]; then
  tests=$@
fi

for test in $tests; do
  echo "fpgen $test"

  case $test in
    "sum")
      TN=4
      TS=4
      S_MIN=2 
      RANDOM=901
      ;;
    "1norm")
      TN=4
      TS=4
      S_MIN=2
      RANDOM=901
      ;;
    "2norm")
      TN=4
      TS=4
      S_MIN=2
      RANDOM=901
      ;;
    "dot")
      TN=8
      TS=4
      S_MIN=2
      RANDOM=901
      ;;
    "conv")
      TN=8
      TS=2
      S_MIN=2
      RANDOM=901
      ;;
    "mv")
      TN=20
      TS=4
      S_MIN=2
      RANDOM=901
      ;;
    "mm")
      TN=32
      TS=8
      S_MIN=4
      RANDOM=901
      ;;
    "lu")
      TN=16
      TS=8
      S_MIN=4
      RANDOM=901
      ;;
    "qr")
      TN=16
      TS=8
      S_MIN=4
      RANDOM=901
      ;;
    *)
      TN=$NN
      TS=$SS
      S_MIN=1
      RANDOM=901
      ;;
  esac
 
  echo "Test $test:">>$FLOG
  run_fpgen $test $TN $TS $S_MIN $SSEED >$benchPath/$test.out 2>/dev/null
  echo -e "\n\n FPGen log:" >>$benchPath/$test.out
  cat $benchPath/$test/fptest/fpgen.log >>$benchPath/$test.out
done
