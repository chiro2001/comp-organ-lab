include scripts/build.mk

LABS := lab01 lab02

all: $(LABS)

$(LABS):
	@echo "Making $@"
	make -C $@

clean:
	make -C lab01 clean
	make -C lab02 clean

.PHONY: $(LABS)