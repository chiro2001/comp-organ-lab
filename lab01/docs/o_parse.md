## 机器码注释

```
calc:     file format elf64-littleriscv

Disassembly of section .text:

00000000000100b0 <_start>:

  0: addi sp,sp,-32                     fe010113 rs1: sp, imm: -32, rd: sp
  4: sd s0,24(sp)                       00813c23 rs1: sp, rs2: s0, imm: 24
  8: addi s0,sp,32                      02010413 rs1: sp, imm: 32, rd: s0
  c: li a5,19                           01300793 imm: 19, rd: a5
 10: sb a5,-25(s0)                      fef403a3 rs1: s0, rs2: a5, imm: 6
 14: sb zero,-17(s0)                    fe0407a3 rs1: s0, imm: 14
 18: sw zero,-24(s0)                    fe042423 rs1: s0, imm: 8
 1c: j 10128 <_start+0x78>              05c0006f imm: 92(0x5c)
 20: lbu a5,-25(s0)                     fe744783 rs1: s0, imm: -25, rd: a5
 24: sext.w a4,a5                       0007871b rs1: a5, imm: 0, rd: a4
 28: lbu a5,-17(s0)                     fef44783 rs1: s0, imm: -17, rd: a5
 2c: sext.w a5,a5                       0007879b rs1: a5, imm: 0, rd: a5
 30: sraw a5,a4,a5                      40f757bb rs1: a4, imm: 1039, rd: a5
 34: sext.w a5,a5                       0007879b rs1: a5, imm: 0, rd: a5
 38: andi a5,a5,1                       0017f793 rs1: a5, imm: 1, rd: a5
 3c: sext.w a5,a5                       0007879b rs1: a5, imm: 0, rd: a5
 40: beqz a5,1011c <_start+0x6c>        02078663 rs1: a5, imm: 44(0x2c)
 44: lbu a5,-25(s0)                     fe744783 rs1: s0, imm: -25, rd: a5
 48: sext.w a4,a5                       0007871b rs1: a5, imm: 0, rd: a4
 4c: lbu a5,-17(s0)                     fef44783 rs1: s0, imm: -17, rd: a5
 50: sext.w a5,a5                       0007879b rs1: a5, imm: 0, rd: a5
 54: sllw a5,a4,a5                      00f717bb rs1: a4, imm: 15, rd: a5
 58: sext.w a5,a5                       0007879b rs1: a5, imm: 0, rd: a5
 5c: sext.w a5,a5                       0007879b rs1: a5, imm: 0, rd: a5
 60: lw a4,-24(s0)                      fe842703 rs1: s0, imm: -24, rd: a4
 64: addw a5,a4,a5                      00f707bb rs1: a4, imm: 15, rd: a5
 68: sw a5,-24(s0)                      fef42423 rs1: s0, rs2: a5, imm: 8
 6c: lbu a5,-17(s0)                     fef44783 rs1: s0, imm: -17, rd: a5
 70: addiw a5,a5,1                      0017879b rs1: a5, imm: 1, rd: a5
 74: sb a5,-17(s0)                      fef407a3 rs1: s0, rs2: a5, imm: 14
 78: lbu a5,-17(s0)                     fef44783 rs1: s0, imm: -17, rd: a5
 7c: andi a4,a5,255                     0ff7f713 rs1: a5, imm: 255, rd: a4
 80: li a5,8                            00800793 imm: 8, rd: a5
 84: bne a4,a5,100d0 <_start+0x20>      f8f71ee3 rs1: a4, rs2: a5, imm: -100(0xffffff9c)
 88: lw a5,-24(s0)                      fe842783 rs1: s0, imm: -24, rd: a5
 8c: sw a5,-32(s0)                      fef42023 rs1: s0, rs2: a5, imm: 0
 90: sb zero,-17(s0)                    fe0407a3 rs1: s0, imm: 14
 94: sw zero,-24(s0)                    fe042423 rs1: s0, imm: 8
 98: j 101a0 <_start+0xf0>              0580006f imm: 88(0x58)
 9c: lbu a5,-25(s0)                     fe744783 rs1: s0, imm: -25, rd: a5
 a0: sext.w a4,a5                       0007871b rs1: a5, imm: 0, rd: a4
 a4: lbu a5,-17(s0)                     fef44783 rs1: s0, imm: -17, rd: a5
 a8: sext.w a5,a5                       0007879b rs1: a5, imm: 0, rd: a5
 ac: sraw a5,a4,a5                      40f757bb rs1: a4, imm: 1039, rd: a5
 b0: sext.w a5,a5                       0007879b rs1: a5, imm: 0, rd: a5
 b4: andi a5,a5,1                       0017f793 rs1: a5, imm: 1, rd: a5
 b8: sext.w a5,a5                       0007879b rs1: a5, imm: 0, rd: a5
 bc: beqz a5,10194 <_start+0xe4>        02078463 rs1: a5, imm: 40(0x28)
 c0: lbu a5,-17(s0)                     fef44783 rs1: s0, imm: -17, rd: a5
 c4: sext.w a5,a5                       0007879b rs1: a5, imm: 0, rd: a5
 c8: mv a4,a5                           00078713 rs1: a5, imm: 0, rd: a4
 cc: lw a5,-32(s0)                      fe042783 rs1: s0, imm: -32, rd: a5
 d0: sllw a5,a5,a4                      00e797bb rs1: a5, imm: 14, rd: a5
 d4: sext.w a5,a5                       0007879b rs1: a5, imm: 0, rd: a5
 d8: lw a4,-24(s0)                      fe842703 rs1: s0, imm: -24, rd: a4
 dc: addw a5,a4,a5                      00f707bb rs1: a4, imm: 15, rd: a5
 e0: sw a5,-24(s0)                      fef42423 rs1: s0, rs2: a5, imm: 8
 e4: lbu a5,-17(s0)                     fef44783 rs1: s0, imm: -17, rd: a5
 e8: addiw a5,a5,1                      0017879b rs1: a5, imm: 1, rd: a5
 ec: sb a5,-17(s0)                      fef407a3 rs1: s0, rs2: a5, imm: 14
 f0: lbu a5,-17(s0)                     fef44783 rs1: s0, imm: -17, rd: a5
 f4: andi a4,a5,255                     0ff7f713 rs1: a5, imm: 255, rd: a4
 f8: li a5,16                           01000793 imm: 16, rd: a5
 fc: bne a4,a5,1014c <_start+0x9c>      faf710e3 rs1: a4, rs2: a5, imm: -96(0xffffffa0)
100: lw a5,-24(s0)                      fe842783 rs1: s0, imm: -24, rd: a5
104: mv a0,a5                           00078513 rs1: a5, imm: 0, rd: a0
108: ld s0,24(sp)                       01813403 rs1: sp, imm: 24, rd: s0
10c: addi sp,sp,32                      02010113 rs1: sp, imm: 32, rd: sp
110: ret                                00008067 rs1: ra, imm: 0
```