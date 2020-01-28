#!/bin/bash
benchPath=/home/fptesting/FPTesting/benchmarks/gsl
S3FP_DIR=/home/fptesting/s3fp-v0.1
export LD_LIBRARY_PATH=${S3FP_DIR}:${LD_LIBRARY_PATH}

FLOG=$benchPath/result-fpgen.txt

NN=8
TIMEBUDGET=7200

#initial setting 
SS=4
SSEED=-1

Tbase=1200
Tse=2000
RANDOM=903

run_fpgen()
{
  test=$1
  N=$2
  S=$3
  SEED=$4

  timebudget=$TIMEBUDGET
  
  # create configuration files
  gsl=${GSL_PATH}-inout
  rm -rf $benchPath/$test/fptest; mkdir $benchPath/$test/fptest; rm -rf $benchPath/$test/test-sample; mkdir $benchPath/$test/test-sample
  cd $benchPath/$test/fptest
  cp ../$test-SYMBOLIC-sample.c .
  cd ../test-sample; cp ../$test-INOUT-sample.c .
  cd $benchPath/$test 
  
  # base random search
  echo -e "\nStart base search:"
  gsl=${GSL_PATH}-inout
  cd $benchPath/$test/test; cp $test-INOUT.c $test-INOUT.c.bck; sed -i '/FLT_MAX/s/\/ *FLT_MAX.*$/;/' $test-INOUT.c; rm -rf sequential-*
  g++ -o sequential-64 -DFB=64 -DN=$N -I${gsl}/include -L${gsl}/lib $test-INOUT.c -lgsl -lgslcblas
  g++ -o sequential-80 -DFB=80 -DN=$N -I${gsl}/include -L${gsl}/lib $test-INOUT.c -lgsl -lgslcblas
  echo TIMEOUT = $Tbase > s3fp_setting
  echo RESOURCE = TIME >> s3fp_setting
  echo RSEED = 0 >> s3fp_setting
  echo FTERROR = REL >> s3fp_setting
  echo REL_DELTA = 1.175494351e-38F >> s3fp_setting
  echo UNIFORM_INPUT = true >> s3fp_setting
  echo UNIFORM_INPUTLB = -100.0 >> s3fp_setting
  echo UNIFORM_INPUTUB = 100.0  >> s3fp_setting
  echo RT = URT >> s3fp_setting
  echo PARALLELRT = false >> s3fp_setting
  #${S3FP_DIR}/s3fp 32 $N test_input ./sequential-64 test_output_64 ./sequential-80 test_output_80 &> urt-out	
  mv $test-INOUT.c.bck $test-INOUT.c; cd $benchPath/$test
  timebudget=$((timebudget-$Tbase))

  # symbolic execution 
  klee=/home/fptesting/klee-float
  gsl=$GSL_PATH-fp
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
      Stime=$Tse
    fi

    count=$((count+1))
    echo -e "\nStart symbolic execution $count:"
    clang-3.4 -o temp_$test.bc -DN=$N -DS=$S -DSEED=$SEED -I$klee/include -I$gsl/include -emit-llvm -c $test-SYMBOLIC-sample.c
    llvm-link-3.4 -o $test-SYMBOLIC-sample.bc temp_$test.bc $gsl/lib/libgsl.so.bc $gsl/lib/libgslcblas.so.bc
    rm temp_$test.bc

    echo "time klee --allow-external-sym-calls --max-solver-time=$Stime --max-time=$Stime --search=nurs:covnew $test-SYMBOLIC-sample.bc myinput"
    time klee -allow-external-sym-calls --max-solver-time=$Stime --max-time=$Stime --search=nurs:covnew $test-SYMBOLIC-sample.bc myinput
    
    $benchPath/../../scripts/show_tests.sh &>/dev/null
    cd $benchPath/$test/test-sample; rm -rf sequential-* 
    g++ -o sequential-64 -DFB=64 -DN=$N -DS=$S -DSEED=${SEED} -I${gsl}/include -L${gsl}/lib $test-INOUT-sample.c -lgsl -lgslcblas
    g++ -o sequential-80 -DFB=80 -DN=$N -DS=$S -DSEED=${SEED} -I${gsl}/include -L${gsl}/lib $test-INOUT-sample.c -lgsl -lgslcblas
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

    reduce=`echo $err2 1e-5 | awk '{if ($1>=$2) print "false"; else print "true";}'`

    #if [ $S -ge 4 ] && [ "$S_opt" = "-1" ]; then
    if [ $S -ge 4 ] && [ "$reduce" = "true" ]; then
      reduce_S=true
    elif [ $S -eq $((N/2)) ]; then
      use_restTime=true
    fi  

  done

  time_all=`date -u -d @${TIMEBUDGET} +"%T"`
  echo -e "\n\n Best Relative Error:  $err; Number of tests: $num, time: $time_all [S:$S_opt, SEED:$SEED_opt]" >>fpgen.log
  echo "  -FPGen   Rel. Error: $err, #Inputs: $num, time: $time_all"  >> $FLOG 
  cd $benchPath
}

tests="wmean wvariance wsd wvariance-w wsd-w wtss wtss-m wvariance-m wsd-m wabsdev wskew wkurtosis wabsdev-m wskew-m wkurtosis-m"

if [ $# -gt 0 ]; then
  tests=$@
fi

for test in $tests; do
  echo "fpgen $test"

  Tbase=1200
  Tse=2000
  case $test in
    "wmean")
      RANDOM=818
      ;;
    "wvariance")
      RANDOM=818
      ;;
    "wsd")
      RANDOM=818
      ;;
    "wvariance-w")
      RANDOM=818
      ;;
    "wsd-w")
      RANDOM=818
      ;;
    "wtss")
      RANDOM=818
      ;;
    "wtss-m")
      RANDOM=818
      ;;
    "wvariance-m")
      RANDOM=818
      ;;
    "wsd-m")
      RANDOM=818
      ;;
    "wabsdev")
      RANDOM=903
      Tbase=600
      Tse=2200
      ;;
    "wskew")
      RANDOM=903
      ;;
    "wkurtosis")
      RANDOM=903
      ;;
    "wabsdev-m")
      RANDOM=903
      Tbase=600
      Tse=2200
      ;;
    "wskew-m")
      RANDOM=903
      ;;
    "wkurtosis-m")
      RANDOM=903
      ;;
    *)
  esac

   
  echo "Test $test:">>$FLOG
  run_fpgen $test $NN $SS $SSEED >$benchPath/$test.out 2>/dev/null
  echo -e "\n\n FPGen log:" >>$benchPath/$test.out
  cat $benchPath/$test/fptest/fpgen.log >>$benchPath/$test.out
done
