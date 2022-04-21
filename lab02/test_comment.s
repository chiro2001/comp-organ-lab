   1              		.file	"test.c"
   2              		.option nopic
   3              		.attribute arch, "rv64i2p0_f2p0_d2p0"
   4              		.attribute unaligned_access, 0
   5              		.attribute stack_align, 16
   6              		.text
   7              	.Ltext0:
   8              		.cfi_sections	.debug_frame
   9              		.align	2
  10              		.globl	get_hex
  12              	get_hex:
  13              	.LFB3:
  14              		.file 1 "test.c"
   1:test.c        **** #include <stdio.h>
   2:test.c        **** #include <stdint.h>
   3:test.c        **** 
   4:test.c        **** // 200110619 -> 0xBED721B
   5:test.c        **** 
   6:test.c        **** uint32_t get_hex(uint32_t value) {
  15              		.loc 1 6 34
  16              		.cfi_startproc
  17 0000 130101FB 		addi	sp,sp,-80
  18              		.cfi_def_cfa_offset 80
  19 0004 23348104 		sd	s0,72(sp)
  20              		.cfi_offset 8, -8
  21 0008 13040105 		addi	s0,sp,80
  22              		.cfi_def_cfa 8, 0
  23 000c 93070500 		mv	a5,a0
  24 0010 232EF4FA 		sw	a5,-68(s0)
   7:test.c        ****   uint32_t count[8];
   8:test.c        ****   uint32_t *p = count;
  25              		.loc 1 8 13
  26 0014 930704FC 		addi	a5,s0,-64
  27 0018 2334F4FE 		sd	a5,-24(s0)
   9:test.c        ****   while (value > 0) {
  28              		.loc 1 9 9
  29 001c 6F000003 		j	.L2
  30              	.L3:
  10:test.c        ****     *p = value % 16;
  31              		.loc 1 10 16
  32 0020 8327C4FB 		lw	a5,-68(s0)
  33 0024 93F7F700 		andi	a5,a5,15
  34 0028 1B870700 		sext.w	a4,a5
  35              		.loc 1 10 8
  36 002c 833784FE 		ld	a5,-24(s0)
  37 0030 23A0E700 		sw	a4,0(a5)
  11:test.c        ****     // value /= 16;
  12:test.c        ****     value >>= 4;
  38              		.loc 1 12 11
  39 0034 8327C4FB 		lw	a5,-68(s0)
  40 0038 9BD74700 		srliw	a5,a5,4
  41 003c 232EF4FA 		sw	a5,-68(s0)
  13:test.c        ****     p++;
  42              		.loc 1 13 6
  43 0040 833784FE 		ld	a5,-24(s0)
  44 0044 93874700 		addi	a5,a5,4
  45 0048 2334F4FE 		sd	a5,-24(s0)
  46              	.L2:
   9:test.c        ****     *p = value % 16;
  47              		.loc 1 9 9
  48 004c 8327C4FB 		lw	a5,-68(s0)
  49 0050 9B870700 		sext.w	a5,a5
  50 0054 E39607FC 		bne	a5,zero,.L3
  14:test.c        ****   }
  15:test.c        ****   uint32_t result = 0;
  51              		.loc 1 15 12
  52 0058 232204FE 		sw	zero,-28(s0)
  16:test.c        ****   // for (int i = 0; i < 8; i++) {
  17:test.c        ****   //   printf("%1x", count[i]);
  18:test.c        ****   // }
  19:test.c        ****   // puts("");
  20:test.c        ****   while (p != count - 1) {
  53              		.loc 1 20 9
  54 005c 6F000003 		j	.L4
  55              	.L5:
  21:test.c        ****     result <<= 4;
  56              		.loc 1 21 12
  57 0060 832744FE 		lw	a5,-28(s0)
  58 0064 9B974700 		slliw	a5,a5,4
  59 0068 2322F4FE 		sw	a5,-28(s0)
  22:test.c        ****     result += *p;
  60              		.loc 1 22 15
  61 006c 833784FE 		ld	a5,-24(s0)
  62 0070 83A70700 		lw	a5,0(a5)
  63              		.loc 1 22 12
  64 0074 032744FE 		lw	a4,-28(s0)
  65 0078 BB07F700 		addw	a5,a4,a5
  66 007c 2322F4FE 		sw	a5,-28(s0)
  23:test.c        ****     p--;
  67              		.loc 1 23 6
  68 0080 833784FE 		ld	a5,-24(s0)
  69 0084 9387C7FF 		addi	a5,a5,-4
  70 0088 2334F4FE 		sd	a5,-24(s0)
  71              	.L4:
  20:test.c        ****     result <<= 4;
  72              		.loc 1 20 21
  73 008c 930704FC 		addi	a5,s0,-64
  74 0090 9387C7FF 		addi	a5,a5,-4
  20:test.c        ****     result <<= 4;
  75              		.loc 1 20 9
  76 0094 033784FE 		ld	a4,-24(s0)
  77 0098 E314F7FC 		bne	a4,a5,.L5
  24:test.c        ****   }
  25:test.c        ****   return result;
  78              		.loc 1 25 10
  79 009c 832744FE 		lw	a5,-28(s0)
  26:test.c        **** }
  80              		.loc 1 26 1
  81 00a0 13850700 		mv	a0,a5
  82 00a4 03348104 		ld	s0,72(sp)
  83              		.cfi_restore 8
  84              		.cfi_def_cfa 2, 80
  85 00a8 13010105 		addi	sp,sp,80
  86              		.cfi_def_cfa_offset 0
  87 00ac 67800000 		jr	ra
  88              		.cfi_endproc
  89              	.LFE3:
  91              		.align	2
  92              		.globl	main
  94              	main:
  95              	.LFB4:
  27:test.c        **** 
  28:test.c        **** int main() {
  96              		.loc 1 28 12
  97              		.cfi_startproc
  98 00b0 130101FE 		addi	sp,sp,-32
  99              		.cfi_def_cfa_offset 32
 100 00b4 233C1100 		sd	ra,24(sp)
 101 00b8 23388100 		sd	s0,16(sp)
 102              		.cfi_offset 1, -8
 103              		.cfi_offset 8, -16
 104 00bc 13040102 		addi	s0,sp,32
 105              		.cfi_def_cfa 8, 0
  29:test.c        ****   // uint32_t code = 200110619;
  30:test.c        ****   // uint32_t res = get_hex(code);
  31:test.c        ****   // printf("res = 0x%08x; code = 0x%08x\n", res, code);
  32:test.c        **** 
  33:test.c        ****   uint32_t res = get_hex(200110619);
 106              		.loc 1 33 18
 107 00c0 B777ED0B 		li	a5,200110080
 108 00c4 1385B721 		addi	a0,a5,539
 109 00c8 97000000 		call	get_hex
 109      E7800000 
 110 00d0 93070500 		mv	a5,a0
 111 00d4 2326F4FE 		sw	a5,-20(s0)
  34:test.c        ****   asm volatile (
 112              		.loc 1 34 3
 113              	 #APP
 114              	# 34 "test.c" 1
  35              	    "addi s3, %[r], 0"
 115              		addi s3, a5, 0
 116              	# 0 "" 2
 117              	 #NO_APP
 118 00dc 2326F4FE 		sw	a5,-20(s0)
  36:test.c        ****     :[r]"=r"(res)
  37:test.c        ****   );
  38:test.c        ****   return 0;
 119              		.loc 1 38 10
 120 00e0 93070000 		li	a5,0
  39:test.c        **** }...
 121              		.loc 1 39 1
 122 00e4 13850700 		mv	a0,a5
 123 00e8 83308101 		ld	ra,24(sp)
 124              		.cfi_restore 1
 125 00ec 03340101 		ld	s0,16(sp)
 126              		.cfi_restore 8
 127              		.cfi_def_cfa 2, 32
 128 00f0 13010102 		addi	sp,sp,32
 129              		.cfi_def_cfa_offset 0
 130 00f4 67800000 		jr	ra
 131              		.cfi_endproc
 132              	.LFE4:
 134              	.Letext0:
 135              		.file 2 "/home/chiro/riscv/riscv64-unknown-elf/include/machine/_default_types.h"
 136              		.file 3 "/home/chiro/riscv/riscv64-unknown-elf/include/sys/_stdint.h"
