include ../scripts/build.mk

ALL := test test.s test_comment.s dec_to_hex test2.s

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

dec_to_hex: dec_to_hex.s
	$(CC) $(CFLAGS) -nostdlib dec_to_hex.s -o dec_to_hex

clean:
	-rm -rf *.i *.o $(ALL)

run: $(ALL)
	$(SPIKE) $(PK) test
	-$(SPIKE) $(PK) dec_to_hex

.PHONY: all clean
