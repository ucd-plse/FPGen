CC=gcc

all: show_best print-error

show_best: show_best.c
	$(CC) -o show_best show_best.c

print-error: show_best.c
	$(CC) -o print_error print_error.c

write-quads: quads-python.c
	gcc -c -fPIC quads-python.c -o write-quads.o
	gcc -shared -Wl,-soname,libwquads-ivy.so -o libwquads-ivy.so write-quads.o -lquadmath

clean-tmp:
	-rm -f tmp*

clean: clean-tmp
	-rm -f show_best
	-rm -f print-error
