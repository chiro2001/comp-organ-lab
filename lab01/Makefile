include ../scripts/build.mk

ALL := hello calc hello.bin calc.bin calc.s calc.o calc.i decoder

CFLAGS := -static -nostdlib -march=rv64i -mabi=lp64

all: $(ALL)

%.i: %.c
	$(CC) $(CFLAGS) -E $< -o $@

%.s: %.i
	$(CC) $(CFLAGS) -S $< -o $@

%.o: %.s
	$(CC) $(CFLAGS) -c $< -o $@

%: %.o
	$(CC) $(CFLAGS) $< -o $@

%_dump.txt: %.o
	$(OBJDUMP) -j .text -d $< > $@

%.txt: %
	$(OBJDUMP) -S $< > $@

%_print: %
	$(CC) -o $@ $@.c

%.bin: %
	$(OBJCOPY) -O binary $< $@

decoder: decoder.c
	gcc -o decoder decoder.c

clean:
	-rm -rf *.s *.i *.o *.txt $(ALL)

run: $(ALL) calc_print hello_print
	$(SPIKE) $(PK) hello_print
	$(SPIKE) $(PK) calc_print

.PHONY: all clean
