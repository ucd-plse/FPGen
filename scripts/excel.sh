#!/bin/bash

show_help()
{
    echo "./excel.sh [-s/m/g/a] fpgenResult baselineResult [test1 test2 ...]"
}

tests=""
while getopts :hsmga opt; do
    case $opt in
        h) show_help; exit ;;
    	s) tests="recursive-summation pairwise-summation compensated-summation" ;;
        m) tests="sum 1norm 2norm dot conv mv mm lu qr" ;;
        g) tests="wmean wvariance wsd wvariance-w wsd-w wtss wtss-m wvariance-m wsd-m wabsdev wskew wkurtosis wabsdev-m wskew-m wkurtosis-m" ;;
        a) tests="recursive-summation pairwise-summation compensated-summation sum 1norm 2norm dot conv mv mm lu qr wmean wvariance wsd wvariance-w wsd-w wtss wtss-m wvariance-m wsd-m wabsdev wskew wkurtosis wabsdev-m wskew-m wkurtosis-m" ;;
        *) echo "Unknown option -$OPTARG"; exit 1;;
    esac
done
# remove the parsed options from the positional params
shift $(( OPTIND - 1 ))

fpgen=$1
baselines=$2

print_item()
{ 
  tool=$1	
  con=$2
  #tool=`echo $con | sed "s/^ *//" | cut -d " " -f 1`
  err=`echo $con | sed -n "s/.*Rel. Error: \([[:digit:]].[[:digit:]]*e[+-][[:digit:]]*\),.*/\1/p" | awk '{printf "%5.4e", $1}'`
  if [ "$err" == "" ]; then
    err=`echo $con | sed -n "s/.*Rel. Error: \([0-9.]*\),.*/\1/p" | awk '{printf "%5.4e", $1}'`
  fi
  inputs=`echo $con | sed "s/.*Inputs: \([0-9]*\).*/\1/"`
  ttime=`echo $con | sed "s/.*time: \([0-9][0-9]:[0-9][0-9]:[0-9][0-9]\).*/\1/"` 
  echo " " $tool " " $err " " $inputs " " $ttime
}

for utest in $tests; do
  test=$utest
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

  echo "$utest"
  fpgen_num=`cat $fpgen | grep -n "$test:" | cut -d ":" -f 1`
  if [ "$fpgen_num" != "" ]; then	  
    fpgen_item=`sed -n "$((fpgen_num+1))p" $fpgen`
    print_item "FPGen" "$fpgen_item"
  fi
 
  base_num=`cat $baselines | grep -n "$test:" | cut -d ":" -f 1`
  if [ "$base_num" != "" ]; then
    random_item=`sed -n "$((base_num+1))p" $baselines`  
    s3fp_item=`sed -n "$((base_num+2))p" $baselines`  
    klee_item=`sed -n "$((base_num+3))p" $baselines`
    print_item "RANDOM" "$random_item"
    print_item "S3FP" "$s3fp_item"
    print_item "KLEE" "$klee_item"
  fi  
done
