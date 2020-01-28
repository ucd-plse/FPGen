CC=g++

N=4

all: add-32 add-64 add-128

add-32: 
	$(CC) -o add-32 -DFT=float -DN=$(N) add-INOUT.c
add-64:
	$(CC) -o add-64 -DFT=double -DN=$(N) add-INOUT.c
add-128:
	$(CC) -o add-128 -DFT=__float128 -DN=$(N) add-INOUT.c 

clean:
	-rm -f add-32 add-64 add-128
