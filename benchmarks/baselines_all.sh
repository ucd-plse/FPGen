#!/bin/bash
curPath=/home/fptesting/FPTesting/benchmarks
sumPath=/home/fptesting/FPTesting/benchmarks/summations
meschachPath=/home/fptesting/FPTesting/benchmarks/matrix
gslPath=/home/fptesting/FPTesting/benchmarks/gsl

rm -f result-baselines.txt; touch result-baselines.txt
cd $sumPath; rm -f result-baselines.txt; ./baselines.sh; cat result-baselines.txt >> $curPath/result-baselines.txt
cd $meschachPath; rm -f result-baselines.txt; ./baselines.sh; cat result-baselines.txt >> $curPath/result-baselines.txt
cd $gslPath; rm -f result-baselines.txt; ./baselines.sh; cat result-baselines.txt >> $curPath/result-baselines.txt
cd $curPath
