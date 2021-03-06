# cross-compiler settings
# CROSS_COMPILE := riscv64-linux-gnu-
CROSS_COMPILE := riscv64-unknown-elf-
AS        = $(CROSS_COMPILE)gcc
CC        = $(CROSS_COMPILE)gcc
CXX       = $(CROSS_COMPILE)g++
LD        = $(CROSS_COMPILE)ld
OBJDUMP   = $(CROSS_COMPILE)objdump
OBJCOPY   = $(CROSS_COMPILE)objcopy
READELF   = $(CROSS_COMPILE)readelf
RISCV			= $(HOME)/riscv
PK				= $(RISCV)/riscv64-linux-gnu/bin/pk
SPIKE  		= spike
