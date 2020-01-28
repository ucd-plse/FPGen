#!/bin/sh

klee=/home/fptesting/klee-float
fptesting=/home/fptesting/FPTesting
meschach=/home/fptesting/FPTesting/benchmarks/matrix/meschach-injected
gsl=$GSL_PATH-fp

show_help()
{
    echo "./compile.sh [-m/g] testprogram"
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

test=$1

if [ "$is_meschach" != true -a "$is_gsl" != true ]
then 
	clang-3.4 -I$klee/include -emit-llvm -c -g $test.c -o $test-tmp.bc
elif [ "$is_meschach" = true ]
then
	clang-3.4 -I$klee/include -I$meschach -emit-llvm -c -g $test.c -o $test-tmp.bc
	llvm-link-3.4 $test-tmp.bc $meschach/meschach.a.bc -o $test-tmp-1.bc
	mv $test-tmp-1.bc $test-tmp.bc
elif [ "$is_gsl" = true ]
then
    clang-3.4 -I$klee/include -I$gsl/include -emit-llvm -c $test.c -o $test-tmp.bc
    llvm-link-3.4 $test-tmp.bc $gsl/lib/libgsl.so.bc $gsl/lib/libgslcblas.so.bc -o $test-tmp-1.bc
	mv $test-tmp-1.bc $test-tmp.bc
fi

llvm-link-3.4 $test-tmp.bc $fptesting/utils/injections.bc -o $test.bc
#echo "time klee --allow-external-sym-calls --max-solver-time=60 --max-time=60 --search=nurs:covnew $test.bc"
#time klee -allow-external-sym-calls --max-solver-time=60 --max-time=60 --search=nurs:covnew $test.bc
echo "time klee --allow-external-sym-calls --search=nurs:covnew $test.bc"
time klee -allow-external-sym-calls --search=nurs:covnew $test.bc

rm $test-tmp.bc
