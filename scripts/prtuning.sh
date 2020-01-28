#!/bin/bash

## grid search for parameters: cancel_delta_e [4, 52], round_delta_e [30, 52]

fptesting=/home/fptesting/FPTesting
test_program=$1

test_parameters()
{
	pround=$1
	pcancel=$2
	
	path=`pwd`
	cd $fptesting/utils
	clang-3.4 -emit-llvm -c -Dround_delta_e=$pround -Dcancel_delta_e=$pcancel -O2 injections.c -o injections.bc
	cd $path

	$fptesting/scripts/compile.sh -m $test_program
	$fptesting/scripts/show_tests.sh
	$fptesting/scripts/compute_error.sh "klee-last/test*-input" ../test/sequential-64 ../test/sequential-128 
	sort -k 3 -g -r rel-errors | head -n 3 | sed -n "s/^/[pround:$pround pcancel:$pcancel] /p" >> tuning-errors
	mv rel-errors rel-errors-$pround-$pcancel
}

cancel_delta_e=4
rm -f tuning-errors
while [ "$cancel_delta_e" -le 52 ]; do
	
	round_delta_e=28
	while [ "$round_delta_e" -le 52 ]; do
		echo "--------------------------------------------------------------------"
		echo "round_delta_e = $round_delta_e, cancel_delta_e = $cancel_delta_e"	
		test_parameters $round_delta_e $cancel_delta_e		
		round_delta_e=$((round_delta_e + 4))
	done
	cancel_delta_e=$((cancel_delta_e + 4))
done 
