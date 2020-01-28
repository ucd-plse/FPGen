#!/bin/sh

rootpath=/home/fptesting/FPTesting

num=0
## remove test input file if any
rm -f test-inputs
for test in `ls klee-last/test*.ktest`; do
	#echo "$rootpath/utils/ktest-tool --write-floats --assume-array $test"
	$rootpath/utils/ktest-tool --write-floats --assume-array $test >/dev/null 2>&1
	
	## save the test input file for the current test case
	tprefix=`echo $test | cut -d "." -f 1`
	mv test-inputs $tprefix-input
	echo "$tprefix-input"
	$rootpath/utils/show_best_w100 $tprefix-input
	
	num=$((num+1))
done
echo -e "\n $num tests generated."
