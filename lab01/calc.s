	.file	"calc.c"
	.option nopic
	.attribute arch, "rv64i2p0"
	.attribute unaligned_access, 0
	.attribute stack_align, 16
	.text
	.align	2
	.globl	_start
	.type	_start, @function
_start:
	addi	sp,sp,-32
	sd	s0,24(sp)
	addi	s0,sp,32
	li	a5,19
	sb	a5,-25(s0)
	sb	zero,-17(s0)
	sw	zero,-24(s0)
	j	.L2
.L4:
	lbu	a5,-25(s0)
	sext.w	a4,a5
	lbu	a5,-17(s0)
	sext.w	a5,a5
	sraw	a5,a4,a5
	sext.w	a5,a5
	andi	a5,a5,1
	sext.w	a5,a5
	beq	a5,zero,.L3
	lbu	a5,-25(s0)
	sext.w	a4,a5
	lbu	a5,-17(s0)
	sext.w	a5,a5
	sllw	a5,a4,a5
	sext.w	a5,a5
	sext.w	a5,a5
	lw	a4,-24(s0)
	addw	a5,a4,a5
	sw	a5,-24(s0)
.L3:
	lbu	a5,-17(s0)
	addiw	a5,a5,1
	sb	a5,-17(s0)
.L2:
	lbu	a5,-17(s0)
	andi	a4,a5,0xff
	li	a5,8
	bne	a4,a5,.L4
	lw	a5,-24(s0)
	sw	a5,-32(s0)
	sb	zero,-17(s0)
	sw	zero,-24(s0)
	j	.L5
.L7:
	lbu	a5,-25(s0)
	sext.w	a4,a5
	lbu	a5,-17(s0)
	sext.w	a5,a5
	sraw	a5,a4,a5
	sext.w	a5,a5
	andi	a5,a5,1
	sext.w	a5,a5
	beq	a5,zero,.L6
	lbu	a5,-17(s0)
	sext.w	a5,a5
	mv	a4,a5
	lw	a5,-32(s0)
	sllw	a5,a5,a4
	sext.w	a5,a5
	lw	a4,-24(s0)
	addw	a5,a4,a5
	sw	a5,-24(s0)
.L6:
	lbu	a5,-17(s0)
	addiw	a5,a5,1
	sb	a5,-17(s0)
.L5:
	lbu	a5,-17(s0)
	andi	a4,a5,0xff
	li	a5,16
	bne	a4,a5,.L7
	lw	a5,-24(s0)
	mv	a0,a5
	ld	s0,24(sp)
	addi	sp,sp,32
	jr	ra
	.size	_start, .-_start
	.ident	"GCC: (gca312387a) 10.2.0"
