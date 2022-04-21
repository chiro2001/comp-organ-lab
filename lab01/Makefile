include ../scripts/build.mk

ALL := hello calc hello.bin calc.bin

CFLAGS := -static -nostdlib -march=rv64i -mabi=lp64

all: $(ALL)

%.i: %.c
	$(CC) -E $< -o $@

%.s: %.i
	$(CC) -S $< -o $@

%.o: %.s
	$(CC) -c $< -o $@

%: %.o
	$(CC) $< -o $@

%_dump.txt: %.o
	$(OBJDUMP) -j .text -d $< > $@

%.txt: %
	$(OBJDUMP) -S $< > $@

%_print: %
	$(CC) -o $@ $@.c

%.bin: %
	$(OBJCOPY) -O binary $< $@

clean:
	-rm -rf *.s *.i *.o *.txt $(ALL)

run: $(ALL) calc_print hello_print
	$(SPIKE) $(PK) hello_print
	$(SPIKE) $(PK) calc_print

.PHONY: all clean
