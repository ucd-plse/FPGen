#!/bin/bash
curPath=/home/fptesting/FPTesting/benchmarks
sumPath=/home/fptesting/FPTesting/benchmarks/summations
meschachPath=/home/fptesting/FPTesting/benchmarks/matrix
gslPath=/home/fptesting/FPTesting/benchmarks/gsl

rm -f result-fpgen.txt; touch result-fpgen.txt
cd $sumPath; rm -f result-fpgen.txt; ./fpgen.sh; cat result-fpgen.txt >> $curPath/result-fpgen.txt
cd $meschachPath; rm -f result-fpgen.txt; ./fpgen.sh; cat result-fpgen.txt >> $curPath/result-fpgen.txt
cd $gslPath; rm -f result-fpgen.txt; ./fpgen.sh; cat result-fpgen.txt >> $curPath/result-fpgen.txt
cd $curPath
