0000000000000000 <main>:
   0:	1101                	addi	sp,sp,-32
   2:	ec06                	sd	ra,24(sp)
   4:	e822                	sd	s0,16(sp)
   6:	1000                	addi	s0,sp,32
   8:	47cd                	li	a5,19
   a:	fef403a3          	sb	a5,-25(s0)
   e:	fe040323          	sb	zero,-26(s0)
  12:	fe042423          	sw	zero,-24(s0)
  16:	a099                	j	5c <.L2>

0000000000000018 <.L4>:
  18:	fe744783          	lbu	a5,-25(s0)
  1c:	0007871b          	sext.w	a4,a5
  20:	fe644783          	lbu	a5,-26(s0)
  24:	2781                	sext.w	a5,a5
  26:	40f757bb          	sraw	a5,a4,a5
  2a:	2781                	sext.w	a5,a5
  2c:	8b85                	andi	a5,a5,1
  2e:	2781                	sext.w	a5,a5
  30:	c38d                	beqz	a5,52 <.L3>
  32:	fe744783          	lbu	a5,-25(s0)
  36:	0007871b          	sext.w	a4,a5
  3a:	fe644783          	lbu	a5,-26(s0)
  3e:	2781                	sext.w	a5,a5
  40:	00f717bb          	sllw	a5,a4,a5
  44:	2781                	sext.w	a5,a5
  46:	2781                	sext.w	a5,a5
  48:	fe842703          	lw	a4,-24(s0)
  4c:	9fb9                	addw	a5,a5,a4
  4e:	fef42423          	sw	a5,-24(s0)

0000000000000052 <.L3>:
  52:	fe644783          	lbu	a5,-26(s0)
  56:	2785                	addiw	a5,a5,1
  58:	fef40323          	sb	a5,-26(s0)

000000000000005c <.L2>:
  5c:	fe644783          	lbu	a5,-26(s0)
  60:	0ff7f713          	zext.b	a4,a5
  64:	47a1                	li	a5,8
  66:	faf719e3          	bne	a4,a5,18 <.L4>
  6a:	fe842783          	lw	a5,-24(s0)
  6e:	fef42623          	sw	a5,-20(s0)
  72:	fe040323          	sb	zero,-26(s0)
  76:	fe042423          	sw	zero,-24(s0)
  7a:	a089                	j	bc <.L5>

000000000000007c <.L7>:
  7c:	fe744783          	lbu	a5,-25(s0)
  80:	0007871b          	sext.w	a4,a5
  84:	fe644783          	lbu	a5,-26(s0)
  88:	2781                	sext.w	a5,a5
  8a:	40f757bb          	sraw	a5,a4,a5
  8e:	2781                	sext.w	a5,a5
  90:	8b85                	andi	a5,a5,1
  92:	2781                	sext.w	a5,a5
  94:	cf99                	beqz	a5,b2 <.L6>
  96:	fe644783          	lbu	a5,-26(s0)
  9a:	2781                	sext.w	a5,a5
  9c:	873e                	mv	a4,a5
  9e:	fec42783          	lw	a5,-20(s0)
  a2:	00e797bb          	sllw	a5,a5,a4
  a6:	2781                	sext.w	a5,a5
  a8:	fe842703          	lw	a4,-24(s0)
  ac:	9fb9                	addw	a5,a5,a4
  ae:	fef42423          	sw	a5,-24(s0)

00000000000000b2 <.L6>:
  b2:	fe644783          	lbu	a5,-26(s0)
  b6:	2785                	addiw	a5,a5,1
  b8:	fef40323          	sb	a5,-26(s0)

00000000000000bc <.L5>:
  bc:	fe644783          	lbu	a5,-26(s0)
  c0:	0ff7f713          	zext.b	a4,a5
  c4:	47c1                	li	a5,16
  c6:	faf71be3          	bne	a4,a5,7c <.L7>
  ca:	fe842783          	lw	a5,-24(s0)
  ce:	85be                	mv	a1,a5
  d0:	00000517          	auipc	a0,0x0
  d4:	00050513          	mv	a0,a0
  d8:	00000097          	auipc	ra,0x0
  dc:	000080e7          	jalr	ra # d8 <.L5+0x1c>
  e0:	4781                	li	a5,0
  e2:	853e                	mv	a0,a5
  e4:	60e2                	ld	ra,24(sp)
  e6:	6442                	ld	s0,16(sp)
  e8:	6105                	addi	sp,sp,32
  ea:	8082                	ret
