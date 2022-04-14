include ../scripts/build.mk

all: hello hello.txt hello_dump.txt

hello.i: hello.c
	$(CC) -E hello.c -o hello.i

hello.s: hello.i
	$(CC) -S hello.i -o hello.s

hello.o: hello.s
	$(CC) -c hello.s -o hello.o

hello: hello.o
	$(CC) hello.o -o hello

hello_dump.txt: hello.o
	$(OBJDUMP) -D hello.o > hello_dump.txt

hello.txt: hello
	$(OBJDUMP) -S hello > hello.txt

.PHONY: all
