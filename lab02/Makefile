include ../scripts/build.mk

ALL := test test.s test_comment.s

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

clean:
	-rm -rf *.s *.i *.o $(ALL)

run: $(ALL)
	$(SPIKE) $(PK) test

.PHONY: all clean
