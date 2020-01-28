#!/bin/bash

klee=/home/fptesting/klee-float
fptesting=/home/fptesting/FPTesting
meschach=/home/fptesting/FPTesting/benchmark-configs/matrix/meschach-injected
#meschach=/home/fptesting/FPTesting/benchmark-configs/matrix/meschach
meschach64=/home/fptesting/FPTesting/benchmark-configs/matrix/meschach
meschach128=/home/fptesting/FPTesting/benchmark-configs/matrix/meschach-ld

N=2
K=4

show_help()
{
    echo "./sample_run.sh [-m] testprogram testinput"
}

has_m_option=false
while getopts :hm opt; do
    case $opt in 
        h) show_help; exit ;;
        m) has_m_option=true ;;
        *) echo "Unknown option -$OPTARG"; exit 1;;
    esac
done

# remove the parsed options from the positional params
shift $(( OPTIND - 1 ))

test=$1
input128=$2

#####################################
## compile
#####################################
compile()
{
    seed=$1
    if [ ! $has_m_option ]
    then 
        clang-3.4 -I$klee/include -emit-llvm -c -g $test.c -o $test-tmp.bc
    else
        clang-3.4 -I$klee/include -I$meschach -emit-llvm -c -g -DSEED=$seed $test.c -o $test-tmp.bc
        llvm-link-3.4 $test-tmp.bc $meschach/meschach.a.bc -o $test-tmp-1.bc
        mv $test-tmp-1.bc $test-tmp.bc
    fi

    llvm-link-3.4 $test-tmp.bc $fptesting/utils/injections.bc -o $test.bc

    rm $test-tmp.bc
}

#####################################
## run
#####################################
run()
{
    input=$1
    echo "time klee --allow-external-sym-calls --max-solver-time=3600 --max-time=7200 --search=nurs:covnew $test.bc"
    #time klee -allow-external-sym-calls --max-solver-time=3600 --max-time=7200 --search=nurs:covnew $test.bc $input
    time klee -allow-external-sym-calls --max-solver-time=3600 --max-time=3600 --search=nurs:covnew $test.bc $input
}

inputtxt=myinput
$fptesting/utils/input128-reader $input128 $inputtxt
rm -f tuning-errors
RANDOM=$$
for nsample in `seq $N $N`
do

    for nseed in `seq 1 2`
    do
        seed=`echo $RANDOM`
        #seed=$(($seed%1000))

        #compile and run klee-float
        compile $seed
        run $inputtxt

        #generate 64/128 tests
        testinout=`echo $test | sed "s/SYMBOLIC/INOUT/"`
        path=`pwd`
        cd ../test-sample
        rm sequential*
        gcc -o sequential-64 -DFT=double -DSEED=$seed -I$meschach64 $testinout.c $meschach64/meschach.a -lm
        gcc -o sequential-128 -DFT=__float128 -DSEED=$seed -I$meschach128 $testinout.c $meschach128/meschach.a -lm
        cd $path

        #measure error
        $fptesting/scripts/show_tests.sh
        $fptesting/scripts/compute_error.sh "klee-last/test*-input" ../test-sample/sequential-64 ../test-sample/sequential-128 $inputtxt
        sort -k 3 -g -r rel-errors | head -n 3 | sed -n "s/^/[seed:$seed] /p" >> tuning-errors
        mv rel-errors rel-errors-$seed
    done 
    
done

sort -k 3 -g -r tuning-errors | head -n 3
