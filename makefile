#create lib.o
lib.o:	lib.c lib.h
	@echo "creating lib.o"
	gcc -c -fPIC lib.c

#create libcalc.a
libcalc.a:	lib.o
	@echo "creating libcalc.a"
	ar rcs -o libcalc.a lib.o

#create libcalc.so
libcalc.so:	lib.o
	@echo "creating libcalc.so"
	gcc -shared -o libcalc.so lib.o

#create test.o
test.o:	test.c lib.h
	@echo "creating test.o"
	gcc -c test.c

#create test_a1 (uses static linking with libcalc.a only)
test_a1:	test.o libcalc.a
	@echo "creating test_a1"
	gcc -o test_a1 test.o ./libcalc.a

#create test_a2 (uses static linking with all libraries, its size will be greater than the size of test_a1)
test_a2:        test.o libcalc.a
	@echo "creating test_a2"
	gcc -static -o test_a2 test.o ./libcalc.a

#create test_a3
test_a3:	test.o libcalc.a
	@echo "creating test_a3"
	gcc -static -o test_a3 test.o -L. -lcalc

#create test_s1
test_s1:	test.o
	@echo "creating test_s1"
	gcc -o test_s1 test.o ./libcalc.so

#create test_s2
#LD_LIBRARY_PATH=.:/home
#export LD_LIBRARY_PATH
test_s2:	test.o
	@echo "creating test_s2"
	gcc -o test_s2 test.o -L. -lcalc


#clean
clean:
	rm -f lib.o test.o libcalc.a libcalc.so test_a* test_s*
