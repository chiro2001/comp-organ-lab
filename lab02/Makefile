include ../scripts/build.mk

ALL := test test.s test_comment.s code test2.s

CFLAGS := -static -march=rv64id -mabi=lp64d

all: $(ALL)

%.i: %.c
	$(CC) $(CFLAGS) -E $< -o $@

%.s: %.i
	$(CC) $(CFLAGS) -S $< -o $@

%_comment.s: %.c
	$(CC) $(CFLAGS) -c -g -Wa,-adlhn $< > $@

%.o: %.s
	$(CC) $(CFLAGS) -c $< -o $@

%: %.o
	$(CC) $(CFLAGS) $< -o $@

%.bin: %
	$(OBJCOPY) -O binary $< $@

code: code.s
	$(CC) $(CFLAGS) -nostdlib code.s -o code

clean:
	-rm -rf *.i *.o $(ALL)

run: $(ALL)
	$(SPIKE) $(PK) test
	-$(SPIKE) $(PK) code

.PHONY: all clean
