#!/bin/sh

rootpath=/home/fptesting/FPTesting

flist=$1
N=$2
exe64=$3
exe128=$4

count=100
echo "" >summary-errors
while IFS='' read -r line; do
	finput=`echo $line | awk -F ' -- ' '{print $1}'`
	merror=`echo $line | awk -F ' -- ' '{print $2}'`
	#echo "$finput -- $merror"
	fconstraint=`echo $finput | sed "s/-input/.cvc/"`

	echo "--------------------------------------------------------"
	echo "python z3-gen-inputs.py $fconstraint $N $count"
	python $rootpath/scripts/z3-gen-inputs.py $fconstraint $N $count
	
	finputstr=$finput*
	$rootpath/scripts/compute_error.sh "$finputstr" $exe64 $exe128
	
	prefix=`echo $finput | sed "s/\//-/g"`
	mv rel-errors $prefix-errors
	sort -k 3 -g -r $prefix-errors | head -n 1 >>summary-errors

done < $flist
