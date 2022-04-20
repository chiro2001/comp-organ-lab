include scripts/build.mk

LABS := lab01

all: $(LABS)

$(LABS):
	@echo "Making $@"
	make -C $@

clean:
	make -C lab01 clean

.PHONY: $(LABS)