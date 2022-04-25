   1              		.file	"fib.c"
   2              		.option nopic
   3              		.attribute arch, "rv64i2p0_f2p0_d2p0"
   4              		.attribute unaligned_access, 0
   5              		.attribute stack_align, 16
   6              		.text
   7              	.Ltext0:
   8              		.cfi_sections	.debug_frame
   9              		.align	2
  10              		.globl	fib
  12              	fib:
  13              	.LFB3:
  14              		.file 1 "fib.c"
   1:fib.c         **** #include <stdio.h>
   2:fib.c         **** #include <stdint.h>
   3:fib.c         **** 
   4:fib.c         **** uint64_t fib(uint64_t n) {
  15              		.loc 1 4 26
  16              		.cfi_startproc
  17 0000 130101FD 		addi	sp,sp,-48
  18              		.cfi_def_cfa_offset 48
  19 0004 23341102 		sd	ra,40(sp)
  20 0008 23308102 		sd	s0,32(sp)
  21 000c 233C9100 		sd	s1,24(sp)
  22              		.cfi_offset 1, -8
  23              		.cfi_offset 8, -16
  24              		.cfi_offset 9, -24
  25 0010 13040103 		addi	s0,sp,48
  26              		.cfi_def_cfa 8, 0
  27 0014 233CA4FC 		sd	a0,-40(s0)
   5:fib.c         ****   if (n == 1 || n == 2) return 1;
  28              		.loc 1 5 6
  29 0018 033784FD 		ld	a4,-40(s0)
  30 001c 93071000 		li	a5,1
  31 0020 6308F700 		beq	a4,a5,.L2
  32              		.loc 1 5 14 discriminator 2
  33 0024 033784FD 		ld	a4,-40(s0)
  34 0028 93072000 		li	a5,2
  35 002c 6316F700 		bne	a4,a5,.L3
  36              	.L2:
  37              		.loc 1 5 32 discriminator 3
  38 0030 93071000 		li	a5,1
  39 0034 6F008003 		j	.L4
  40              	.L3:
   6:fib.c         ****   return fib(n - 1) + fib(n - 2);
  41              		.loc 1 6 10
  42 0038 833784FD 		ld	a5,-40(s0)
  43 003c 9387F7FF 		addi	a5,a5,-1
  44 0040 13850700 		mv	a0,a5
  45 0044 97000000 		call	fib
  45      E7800000 
  46 004c 93040500 		mv	s1,a0
  47              		.loc 1 6 23
  48 0050 833784FD 		ld	a5,-40(s0)
  49 0054 9387E7FF 		addi	a5,a5,-2
  50 0058 13850700 		mv	a0,a5
  51 005c 97000000 		call	fib
  51      E7800000 
  52 0064 93070500 		mv	a5,a0
  53              		.loc 1 6 21
  54 0068 B387F400 		add	a5,s1,a5
  55              	.L4:
   7:fib.c         **** }
  56              		.loc 1 7 1
  57 006c 13850700 		mv	a0,a5
  58 0070 83308102 		ld	ra,40(sp)
  59              		.cfi_restore 1
  60 0074 03340102 		ld	s0,32(sp)
  61              		.cfi_restore 8
  62              		.cfi_def_cfa 2, 48
  63 0078 83348101 		ld	s1,24(sp)
  64              		.cfi_restore 9
  65 007c 13010103 		addi	sp,sp,48
  66              		.cfi_def_cfa_offset 0
  67 0080 67800000 		jr	ra
  68              		.cfi_endproc
  69              	.LFE3:
  71              		.section	.srodata,"a"
  72              		.align	3
  75              	N:
  76 0000 14000000 		.dword	20
  76      00000000 
  77              		.section	.rodata
  78              		.align	3
  79              	.LC0:
  80 0000 66696228 		.string	"fib(%d) = %d (%08x)\n"
  80      25642920 
  80      3D202564 
  80      20282530 
  80      3878290A 
  81              		.text
  82              		.align	2
  83              		.globl	main
  85              	main:
  86              	.LFB4:
   8:fib.c         **** 
   9:fib.c         **** static const uint64_t N = 20;
  10:fib.c         **** 
  11:fib.c         **** int main() {
  87              		.loc 1 11 12
  88              		.cfi_startproc
  89 0084 130101FE 		addi	sp,sp,-32
  90              		.cfi_def_cfa_offset 32
  91 0088 233C1100 		sd	ra,24(sp)
  92 008c 23388100 		sd	s0,16(sp)
  93              		.cfi_offset 1, -8
  94              		.cfi_offset 8, -16
  95 0090 13040102 		addi	s0,sp,32
  96              		.cfi_def_cfa 8, 0
  12:fib.c         ****   uint64_t r = fib(N);
  97              		.loc 1 12 16
  98 0094 93074001 		li	a5,20
  99 0098 13850700 		mv	a0,a5
 100 009c 97000000 		call	fib
 100      E7800000 
 101 00a4 2334A4FE 		sd	a0,-24(s0)
  13:fib.c         ****   printf("fib(%d) = %d (%08x)\n", N, r, r);
 102              		.loc 1 13 3
 103 00a8 93074001 		li	a5,20
 104 00ac 833684FE 		ld	a3,-24(s0)
 105 00b0 033684FE 		ld	a2,-24(s0)
 106 00b4 93850700 		mv	a1,a5
 107 00b8 B7070000 		lui	a5,%hi(.LC0)
 108 00bc 13850700 		addi	a0,a5,%lo(.LC0)
 109 00c0 97000000 		call	printf
 109      E7800000 
  14:fib.c         ****   return 0;
 110              		.loc 1 14 10
 111 00c8 93070000 		li	a5,0
  15:fib.c         **** }...
 112              		.loc 1 15 1
 113 00cc 13850700 		mv	a0,a5
 114 00d0 83308101 		ld	ra,24(sp)
 115              		.cfi_restore 1
 116 00d4 03340101 		ld	s0,16(sp)
 117              		.cfi_restore 8
 118              		.cfi_def_cfa 2, 32
 119 00d8 13010102 		addi	sp,sp,32
 120              		.cfi_def_cfa_offset 0
 121 00dc 67800000 		jr	ra
 122              		.cfi_endproc
 123              	.LFE4:
 125              	.Letext0:
 126              		.file 2 "/home/chiro/riscv/riscv64-unknown-elf/include/machine/_default_types.h"
 127              		.file 3 "/home/chiro/riscv/riscv64-unknown-elf/include/sys/_stdint.h"
