#!/bin/bash

show_help()
{
    echo "./cmp_to_ref.sh [-m/g/s] myresult reference [test1 test2 ...]"
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

mine=$1
reference=$2

args=`echo $@ | sed "s/\//--/g"`
mine_str=`echo $mine | sed "s/\//--/g"`
reference_str=`echo $reference | sed "s/\//--/g"`
utests=`echo $args | sed -e "s/.*$mine_str $reference_str\(.*\)/\1/" -e "s/^ *//g"`
if [ "$utests" == "" ]; then
	utests=$tests
fi

echo $utests

cmp_item()
{ 
  tool=$1	
  con1=$2
  con2=$3

  err1=`echo $con1 | sed -n "s/.*Rel. Error: \([[:digit:]].[[:digit:]]*e[+-][[:digit:]]*\),.*/\1/p" | awk '{printf "%5.4e", $1}'`
  if [ "$err1" == "" ]; then
    err1=`echo $con1 | sed -n "s/.*Rel. Error: \([0-9.]*\),.*/\1/p" | awk '{printf "%5.4e", $1}'`
  fi
  err2=`echo $con2 | sed -n "s/.*Rel. Error: \([[:digit:]].[[:digit:]]*e[+-][[:digit:]]*\),.*/\1/p" | awk '{printf "%5.4e", $1}'`
  if [ "$err2" == "" ]; then
    err2=`echo $con2 | sed -n "s/.*Rel. Error: \([0-9.]*\),.*/\1/p" | awk '{printf "%5.4e", $1}'`
  fi

  ord1=`echo $err1 | sed -n "s/[0-9.]*\(.*\)/\1/p"`
  ord1=`echo $((ord1))`

  ord2=`echo $err2 | sed -n "s/[0-9.]*\(.*\)/\1/p"`
  ord2=`echo $((ord2))`

  edif=`expr $ord1 - $ord2`
    
  inputs1=`echo $con1 | sed "s/.*Inputs: \([0-9]*\).*/\1/"`
  ttime1=`echo $con1 | sed "s/.*time: \([0-9][0-9]:[0-9][0-9]:[0-9][0-9]\).*/\1/"` 

  inputs2=`echo $con2 | sed "s/.*Inputs: \([0-9]*\).*/\1/"`
  ttime2=`echo $con2 | sed "s/.*time: \([0-9][0-9]:[0-9][0-9]:[0-9][0-9]\).*/\1/"` 

  nzerr2=`echo $err2 | awk '{if ($1!=0) print "1"; else print "0"}'`
  nzerr1=`echo $err1 | awk '{if ($1!=0) print "1"; else print "0"}'`
  if [ $((nzerr2)) -ne 0 ] ; then 
	 if [ $edif -le -2 -o $((nzerr1)) -eq 0 ] ; then
	  echo "  check failed."
	  echo "  $mine -- $err1 $inputs1 $ttime1"
	  echo "  $reference -- $err2 $inputs2 $ttime2"
	  return
  	  fi
  fi

  echo "  check passed."
}

for utest in $utests; do 
  mine_num=`cat $mine | grep -n "$utest:" | tail -n 1 | cut -d ":" -f 1`
  if [ "$mine_num" != "" ]; then	  
    mine_item=`sed -n "$((mine_num+1))p" $mine`
  fi
  
  reference_num=`cat $reference | grep -n "$utest:" | tail -n 1 | cut -d ":" -f 1`
  if [ "$reference_num" != "" ]; then	  
    reference_item=`sed -n "$((reference_num+1))p" $reference`
  fi

  if [ "$mine_num" != "" ] && [ "$reference_num" != "" ]; then
    echo -e "\ncompare $utest:"
    cmp_item "FPGen" "$mine_item" "$reference_item"   
  else
    echo -e "\n$utest not found"
  fi

done
