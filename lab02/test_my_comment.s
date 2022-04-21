  12              	hex:
  13              	.LFB3:
  14              		.file 1 "test.c"
   4:test.c        **** uint32_t hex(uint32_t value) {
  16              		.cfi_startproc
  17 0000 130101FB 		addi	sp,sp,-80         // stack size: 10
  18              		.cfi_def_cfa_offset 80
  19 0004 23348104 		sd	s0,72(sp)            // sp[72] = s0
  20              		.cfi_offset 8, -8
  21 0008 13040105 		addi	s0,sp,80          // s0 = stack
  22              		.cfi_def_cfa 8, 0
  23 000c 93070500 		mv	a5,a0                // a5 = s0
  24 0010 232EF4FA 		sw	a5,-68(s0)           // s0[-68] = a5
   5:test.c        ****   uint32_t stack[8];
   6:test.c        ****   uint32_t *p = stack;
  26 0014 930704FC 		addi	a5,s0,-64         // a5 = s0 - 64 = stack
  27 0018 2334F4FE 		sd	a5,-24(s0)           // s0[-24] = a5
   7:test.c        ****   while (value > 0) {
  29 001c 6F000003 		j	.L2
  30              	.L3:
   8:test.c        ****     *p = value % 16;
  32 0020 8327C4FB 		lw	a5,-68(s0)
  33 0024 93F7F700 		andi	a5,a5,15
  34 0028 1B870700 		sext.w	a4,a5
  36 002c 833784FE 		ld	a5,-24(s0)
  37 0030 23A0E700 		sw	a4,0(a5)
   9:test.c        ****     value >>= 4;
  39 0034 8327C4FB 		lw	a5,-68(s0)
  40 0038 9BD74700 		srliw	a5,a5,4
  41 003c 232EF4FA 		sw	a5,-68(s0)
  10:test.c        ****     p++;
  43 0040 833784FE 		ld	a5,-24(s0)
  44 0044 93874700 		addi	a5,a5,4
  45 0048 2334F4FE 		sd	a5,-24(s0)
  46              	.L2:
   7:test.c        ****     *p = value % 16;
  48 004c 8327C4FB 		lw	a5,-68(s0)
  49 0050 9B870700 		sext.w	a5,a5
  50 0054 E39607FC 		bne	a5,zero,.L3
  11:test.c        ****   }
  12:test.c        ****   --p;
  52 0058 833784FE 		ld	a5,-24(s0)
  53 005c 9387C7FF 		addi	a5,a5,-4
  54 0060 2334F4FE 		sd	a5,-24(s0)
  13:test.c        ****   uint32_t result = 0;
  56 0064 232204FE 		sw	zero,-28(s0)
  14:test.c        ****   while (p != stack - 1) {
  58 0068 6F000003 		j	.L4
  59              	.L5:
  15:test.c        ****     result <<= 4;
  61 006c 832744FE 		lw	a5,-28(s0)
  62 0070 9B974700 		slliw	a5,a5,4
  63 0074 2322F4FE 		sw	a5,-28(s0)
  16:test.c        ****     result += *p;
  65 0078 833784FE 		ld	a5,-24(s0)
  66 007c 83A70700 		lw	a5,0(a5)
  68 0080 032744FE 		lw	a4,-28(s0)
  69 0084 BB07F700 		addw	a5,a4,a5
  70 0088 2322F4FE 		sw	a5,-28(s0)
  17:test.c        ****     p--;
  72 008c 833784FE 		ld	a5,-24(s0)
  73 0090 9387C7FF 		addi	a5,a5,-4
  74 0094 2334F4FE 		sd	a5,-24(s0)
  75              	.L4:
  14:test.c        ****     result <<= 4;
  77 0098 930704FC 		addi	a5,s0,-64
  78 009c 9387C7FF 		addi	a5,a5,-4
  14:test.c        ****     result <<= 4;
  80 00a0 033784FE 		ld	a4,-24(s0)
  81 00a4 E314F7FC 		bne	a4,a5,.L5
  18:test.c        ****   }
  19:test.c        ****   return result;
  83 00a8 832744FE 		lw	a5,-28(s0)
  20:test.c        **** }
  85 00ac 13850700 		mv	a0,a5
  86 00b0 03348104 		ld	s0,72(sp)
  87              		.cfi_restore 8
  88              		.cfi_def_cfa 2, 80
  89 00b4 13010105 		addi	sp,sp,80
  90              		.cfi_def_cfa_offset 0
  91 00b8 67800000 		jr	ra
  92              		.cfi_endproc
  93              	.LFE3:
  95              		.align	2
  96              		.globl	main
  98              	main:
  99              	.LFB4:
  21:test.c        **** 
  22:test.c        **** int main() {
 101              		.cfi_startproc
 102 00bc 130101FE 		addi	sp,sp,-32
 103              		.cfi_def_cfa_offset 32
 104 00c0 233C1100 		sd	ra,24(sp)
 105 00c4 23388100 		sd	s0,16(sp)
 106              		.cfi_offset 1, -8
 107              		.cfi_offset 8, -16
 108 00c8 13040102 		addi	s0,sp,32
 109              		.cfi_def_cfa 8, 0
  23:test.c        ****   uint32_t res = hex(200110619);
 111 00cc B777ED0B 		li	a5,200110080
 112 00d0 1385B721 		addi	a0,a5,539
 113 00d4 97000000 		call	hex
 113      E7800000 
 114 00dc 93070500 		mv	a5,a0
 115 00e0 2326F4FE 		sw	a5,-20(s0)
  
  19              		addi s3, a5, 0
 
 122 00e8 2326F4FE 		sw	a5,-20(s0)
  29:test.c        ****   return 0;
 124 00ec 93070000 		li	a5,0
  30:test.c        **** }...
 126 00f0 13850700 		mv	a0,a5
 127 00f4 83308101 		ld	ra,24(sp)
 128              		.cfi_restore 1
 129 00f8 03340101 		ld	s0,16(sp)
 130              		.cfi_restore 8
 131              		.cfi_def_cfa 2, 32
 132 00fc 13010102 		addi	sp,sp,32
 133              		.cfi_def_cfa_offset 0
 134 0100 67800000 		jr	ra
 135              		.cfi_endproc
