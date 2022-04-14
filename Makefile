include scripts/build.mk

LABS := lab01

all: $(LABS)

$(LABS):
	@echo "Making $@"
	make -C $@

.PHONY: $(LABS)