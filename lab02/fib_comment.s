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
   2:fib.c         **** 
   3:fib.c         **** int fib(int n) {
  15              		.loc 1 3 16
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
  27 0014 93070500 		mv	a5,a0
  28 0018 232EF4FC 		sw	a5,-36(s0)
   4:fib.c         ****   if (n == 1 || n == 2) return 1;
  29              		.loc 1 4 6
  30 001c 8327C4FD 		lw	a5,-36(s0)
  31 0020 1B870700 		sext.w	a4,a5
  32 0024 93071000 		li	a5,1
  33 0028 630AF700 		beq	a4,a5,.L2
  34              		.loc 1 4 14 discriminator 2
  35 002c 8327C4FD 		lw	a5,-36(s0)
  36 0030 1B870700 		sext.w	a4,a5
  37 0034 93072000 		li	a5,2
  38 0038 6316F700 		bne	a4,a5,.L3
  39              	.L2:
  40              		.loc 1 4 32 discriminator 3
  41 003c 93071000 		li	a5,1
  42 0040 6F008004 		j	.L4
  43              	.L3:
   5:fib.c         ****   return fib(n - 1) + fib(n - 2);
  44              		.loc 1 5 10
  45 0044 8327C4FD 		lw	a5,-36(s0)
  46 0048 9B87F7FF 		addiw	a5,a5,-1
  47 004c 9B870700 		sext.w	a5,a5
  48 0050 13850700 		mv	a0,a5
  49 0054 97000000 		call	fib
  49      E7800000 
  50 005c 93070500 		mv	a5,a0
  51 0060 93840700 		mv	s1,a5
  52              		.loc 1 5 23
  53 0064 8327C4FD 		lw	a5,-36(s0)
  54 0068 9B87E7FF 		addiw	a5,a5,-2
  55 006c 9B870700 		sext.w	a5,a5
  56 0070 13850700 		mv	a0,a5
  57 0074 97000000 		call	fib
  57      E7800000 
  58 007c 93070500 		mv	a5,a0
  59              		.loc 1 5 21
  60 0080 BB87F400 		addw	a5,s1,a5
  61 0084 9B870700 		sext.w	a5,a5
  62              	.L4:
   6:fib.c         **** }
  63              		.loc 1 6 1
  64 0088 13850700 		mv	a0,a5
  65 008c 83308102 		ld	ra,40(sp)
  66              		.cfi_restore 1
  67 0090 03340102 		ld	s0,32(sp)
  68              		.cfi_restore 8
  69              		.cfi_def_cfa 2, 48
  70 0094 83348101 		ld	s1,24(sp)
  71              		.cfi_restore 9
  72 0098 13010103 		addi	sp,sp,48
  73              		.cfi_def_cfa_offset 0
  74 009c 67800000 		jr	ra
  75              		.cfi_endproc
  76              	.LFE3:
  78              		.section	.srodata,"a"
  79              		.align	2
  82              	N:
  83 0000 14000000 		.word	20
  84              		.section	.rodata
  85              		.align	3
  86              	.LC0:
  87 0000 66696228 		.string	"fib(%d) = %d (%08x)\n"
  87      25642920 
  87      3D202564 
  87      20282530 
  87      3878290A 
  88              		.text
  89              		.align	2
  90              		.globl	main
  92              	main:
  93              	.LFB4:
   7:fib.c         **** 
   8:fib.c         **** static const int N = 20;
   9:fib.c         **** 
  10:fib.c         **** int main() {
  94              		.loc 1 10 12
  95              		.cfi_startproc
  96 00a0 130101FE 		addi	sp,sp,-32
  97              		.cfi_def_cfa_offset 32
  98 00a4 233C1100 		sd	ra,24(sp)
  99 00a8 23388100 		sd	s0,16(sp)
 100              		.cfi_offset 1, -8
 101              		.cfi_offset 8, -16
 102 00ac 13040102 		addi	s0,sp,32
 103              		.cfi_def_cfa 8, 0
  11:fib.c         ****   int r = fib(N);
 104              		.loc 1 11 11
 105 00b0 93074001 		li	a5,20
 106 00b4 13850700 		mv	a0,a5
 107 00b8 97000000 		call	fib
 107      E7800000 
 108 00c0 93070500 		mv	a5,a0
 109 00c4 2326F4FE 		sw	a5,-20(s0)
  12:fib.c         ****   printf("fib(%d) = %d (%08x)\n", N, r, r);
 110              		.loc 1 12 3
 111 00c8 93074001 		li	a5,20
 112 00cc 8326C4FE 		lw	a3,-20(s0)
 113 00d0 0327C4FE 		lw	a4,-20(s0)
 114 00d4 13060700 		mv	a2,a4
 115 00d8 93850700 		mv	a1,a5
 116 00dc B7070000 		lui	a5,%hi(.LC0)
 117 00e0 13850700 		addi	a0,a5,%lo(.LC0)
 118 00e4 97000000 		call	printf
 118      E7800000 
  13:fib.c         ****   return 0;
 119              		.loc 1 13 10
 120 00ec 93070000 		li	a5,0
  14:fib.c         **** }...
 121              		.loc 1 14 1
 122 00f0 13850700 		mv	a0,a5
 123 00f4 83308101 		ld	ra,24(sp)
 124              		.cfi_restore 1
 125 00f8 03340101 		ld	s0,16(sp)
 126              		.cfi_restore 8
 127              		.cfi_def_cfa 2, 32
 128 00fc 13010102 		addi	sp,sp,32
 129              		.cfi_def_cfa_offset 0
 130 0100 67800000 		jr	ra
 131              		.cfi_endproc
 132              	.LFE4:
 134              	.Letext0:
