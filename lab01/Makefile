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
	$(OBJDUMP) -D $< > $@

%.txt: %
	$(OBJDUMP) -S $< > $@


%.bin: %
	$(OBJCOPY) -O binary $< $@

clean:
	-rm -rf *.s *.i *.o *.txt $(ALL)

run: $(ALL)
	$(SPIKE) $(PK) hello
	$(SPIKE) $(PK) calc

.PHONY: all clean
