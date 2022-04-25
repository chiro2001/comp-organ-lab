   1              		.file	"test.c"
   2              		.option nopic
   3              		.attribute arch, "rv64i2p0_f2p0_d2p0"
   4              		.attribute unaligned_access, 0
   5              		.attribute stack_align, 16
   6              		.text
   7              	.Ltext0:
   8              		.cfi_sections	.debug_frame
   9              		.align	2
  10              		.globl	hex
  12              	hex:
  13              	.LFB3:
  14              		.file 1 "test.c"
   1:test.c        **** #include <stdio.h>
   2:test.c        **** #include <stdint.h>
   3:test.c        **** 
   4:test.c        **** uint64_t hex(uint64_t value) {
  15              		.loc 1 4 30
  16              		.cfi_startproc
  17 0000 130101F9 		addi	sp,sp,-112
  18              		.cfi_def_cfa_offset 112
  19 0004 23348106 		sd	s0,104(sp)
  20              		.cfi_offset 8, -8
  21 0008 13040107 		addi	s0,sp,112
  22              		.cfi_def_cfa 8, 0
  23 000c 233CA4F8 		sd	a0,-104(s0)
   5:test.c        ****   uint64_t stack[8];
   6:test.c        ****   uint64_t *p = stack;
  24              		.loc 1 6 13
  25 0010 930704FA 		addi	a5,s0,-96
  26 0014 2334F4FE 		sd	a5,-24(s0)
   7:test.c        ****   while (value > 0) {
  27              		.loc 1 7 9
  28 0018 6F00C002 		j	.L2
  29              	.L3:
   8:test.c        ****     *p = value % 16;
  30              		.loc 1 8 16
  31 001c 833784F9 		ld	a5,-104(s0)
  32 0020 13F7F700 		andi	a4,a5,15
  33              		.loc 1 8 8
  34 0024 833784FE 		ld	a5,-24(s0)
  35 0028 23B0E700 		sd	a4,0(a5)
   9:test.c        ****     value >>= 4;
  36              		.loc 1 9 11
  37 002c 833784F9 		ld	a5,-104(s0)
  38 0030 93D74700 		srli	a5,a5,4
  39 0034 233CF4F8 		sd	a5,-104(s0)
  10:test.c        ****     p++;
  40              		.loc 1 10 6
  41 0038 833784FE 		ld	a5,-24(s0)
  42 003c 93878700 		addi	a5,a5,8
  43 0040 2334F4FE 		sd	a5,-24(s0)
  44              	.L2:
   7:test.c        ****     *p = value % 16;
  45              		.loc 1 7 9
  46 0044 833784F9 		ld	a5,-104(s0)
  47 0048 E39A07FC 		bne	a5,zero,.L3
  11:test.c        ****   }
  12:test.c        ****   --p;
  48              		.loc 1 12 3
  49 004c 833784FE 		ld	a5,-24(s0)
  50 0050 938787FF 		addi	a5,a5,-8
  51 0054 2334F4FE 		sd	a5,-24(s0)
  13:test.c        ****   uint64_t result = 0;
  52              		.loc 1 13 12
  53 0058 233004FE 		sd	zero,-32(s0)
  14:test.c        ****   while (p != stack - 1) {
  54              		.loc 1 14 9
  55 005c 6F000003 		j	.L4
  56              	.L5:
  15:test.c        ****     result <<= 4;
  57              		.loc 1 15 12
  58 0060 833704FE 		ld	a5,-32(s0)
  59 0064 93974700 		slli	a5,a5,4
  60 0068 2330F4FE 		sd	a5,-32(s0)
  16:test.c        ****     result += *p;
  61              		.loc 1 16 15
  62 006c 833784FE 		ld	a5,-24(s0)
  63 0070 83B70700 		ld	a5,0(a5)
  64              		.loc 1 16 12
  65 0074 033704FE 		ld	a4,-32(s0)
  66 0078 B307F700 		add	a5,a4,a5
  67 007c 2330F4FE 		sd	a5,-32(s0)
  17:test.c        ****     p--;
  68              		.loc 1 17 6
  69 0080 833784FE 		ld	a5,-24(s0)
  70 0084 938787FF 		addi	a5,a5,-8
  71 0088 2334F4FE 		sd	a5,-24(s0)
  72              	.L4:
  14:test.c        ****     result <<= 4;
  73              		.loc 1 14 21
  74 008c 930704FA 		addi	a5,s0,-96
  75 0090 938787FF 		addi	a5,a5,-8
  14:test.c        ****     result <<= 4;
  76              		.loc 1 14 9
  77 0094 033784FE 		ld	a4,-24(s0)
  78 0098 E314F7FC 		bne	a4,a5,.L5
  18:test.c        ****   }
  19:test.c        ****   return result;
  79              		.loc 1 19 10
  80 009c 833704FE 		ld	a5,-32(s0)
  20:test.c        **** }
  81              		.loc 1 20 1
  82 00a0 13850700 		mv	a0,a5
  83 00a4 03348106 		ld	s0,104(sp)
  84              		.cfi_restore 8
  85              		.cfi_def_cfa 2, 112
  86 00a8 13010107 		addi	sp,sp,112
  87              		.cfi_def_cfa_offset 0
  88 00ac 67800000 		jr	ra
  89              		.cfi_endproc
  90              	.LFE3:
  92              		.align	2
  93              		.globl	main
  95              	main:
  96              	.LFB4:
  21:test.c        **** 
  22:test.c        **** int main() {
  97              		.loc 1 22 12
  98              		.cfi_startproc
  99 00b0 130101FE 		addi	sp,sp,-32
 100              		.cfi_def_cfa_offset 32
 101 00b4 233C1100 		sd	ra,24(sp)
 102 00b8 23388100 		sd	s0,16(sp)
 103              		.cfi_offset 1, -8
 104              		.cfi_offset 8, -16
 105 00bc 13040102 		addi	s0,sp,32
 106              		.cfi_def_cfa 8, 0
  23:test.c        ****   uint64_t res = hex(200110619);
 107              		.loc 1 23 18
 108 00c0 B777ED0B 		li	a5,200110080
 109 00c4 1385B721 		addi	a0,a5,539
 110 00c8 97000000 		call	hex
 110      E7800000 
 111 00d0 2334A4FE 		sd	a0,-24(s0)
  24:test.c        ****   asm volatile (
 112              		.loc 1 24 3
 113              	 #APP
 114              	# 24 "test.c" 1
  25              	    "addi s3, %[r], 0"
 115              		addi s3, a5, 0
 116              	# 0 "" 2
 117              	 #NO_APP
 118 00d8 2334F4FE 		sd	a5,-24(s0)
  26:test.c        ****     :[r]"=r"(res)
  27:test.c        ****   );
  28:test.c        ****   // printf("0x%08x\n", res);
  29:test.c        ****   return 0;
 119              		.loc 1 29 10
 120 00dc 93070000 		li	a5,0
  30:test.c        **** }...
 121              		.loc 1 30 1
 122 00e0 13850700 		mv	a0,a5
 123 00e4 83308101 		ld	ra,24(sp)
 124              		.cfi_restore 1
 125 00e8 03340101 		ld	s0,16(sp)
 126              		.cfi_restore 8
 127              		.cfi_def_cfa 2, 32
 128 00ec 13010102 		addi	sp,sp,32
 129              		.cfi_def_cfa_offset 0
 130 00f0 67800000 		jr	ra
 131              		.cfi_endproc
 132              	.LFE4:
 134              	.Letext0:
 135              		.file 2 "/home/chiro/riscv/riscv64-unknown-elf/include/machine/_default_types.h"
 136              		.file 3 "/home/chiro/riscv/riscv64-unknown-elf/include/sys/_stdint.h"
