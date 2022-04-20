include ../scripts/build.mk

ALL := hello

CFLAGS := -static

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

clean:
	-rm -rf *.s *.i *.o *.txt $(ALL)

run:
	$(SPIKE) $(PK) hello

.PHONY: all clean
