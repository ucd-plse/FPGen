#!/bin/bash

klee=/home/fptesting/klee-float
fptesting=/home/fptesting/FPTesting
meschach=/home/fptesting/FPTesting/benchmarks/matrix/meschach-injected
gsl=$GSL_PATH-fp

echo $gsl

show_help()
{
    echo "./replay.sh [-m/g] testprogram [arg]"
}

is_meschach=false
is_gsl=false
while getopts :hmg opt; do
    case $opt in
        h) show_help; exit ;;
        m) is_meschach=true ;;
        g) is_gsl=true ;;
        *) echo "Unknown option -$OPTARG"; exit 1;;
    esac
done

# remove the parsed options from the positional params
shift $(( OPTIND - 1 ))

echo $is_meschach $is_gsl

test=$1
arg=$2

if [ "$is_meschach" != true -a "$is_gsl" != true ]
then
	echo "gcc -I$klee/include -L $klee/build/lib $test.c $fptesting/utils/injections.c -o $test -lkleeRuntest -lm"
	gcc -I$klee/include -L $klee/build/lib $test.c $fptesting/utils/injections.c -o $test -lkleeRuntest -lm
elif [ "$is_meschach" = true ]
then
	echo "gcc -I$klee/include -I$meschach -L $klee/build/lib $test.c $fptesting/utils/injections.c $meschach/meschach.a -o $test -lkleeRuntest -lm"
	gcc -I$klee/include -I$meschach -L $klee/build/lib $test.c $fptesting/utils/injections.c $meschach/meschach.a -o $test -lkleeRuntest -lm
elif [ "$is_gsl" = true ]
then
	echo "gcc -I$klee/include -I$gsl/include -L $klee/build/lib -L $gsl/lib $test.c $fptesting/utils/injections.c -o $test -lkleeRuntest -lm -lgsl -lgslcblas"
	#gcc -I$klee/include -I$gsl/include -L $klee/build/lib -L $gsl/lib $test.c $fptesting/utils/injections.c -o $test -lkleeRuntest -lm -lgsl -lgslcblas
	gcc -I$klee/include -I$gsl/include -L $klee/build/lib $test.c $fptesting/utils/injections.c $gsl/lib/libgsl.a -o $test -lkleeRuntest -lm #-lgsl -lgslcblas
fi


for testcase in `ls klee-last/test*.ktest`; do
	echo "KTEST_FILE=$testcase ./$test $arg"
	out="`KTEST_FILE=$testcase ./$test $arg`"
	echo "$out"
	#echo "${out:0:1}${out:4:1}${out:8:1}${out:11}" # ${out:15}"
done
