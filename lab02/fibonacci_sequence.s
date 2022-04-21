# s3 -> 1a6d
	.data
N:
	.word	20
	.text
	.align	2
	.globl	fib
	.globl	_start
_start:
	# addi	sp,sp,-48
	# lui	t1,%hi(N)
	# addi	t1,t1,%lo(N)
	# lw	a0,0(t1)
	addi	sp,sp,-32
	sd	ra,24(sp)
	sd	s0,16(sp)
	addi	s0,sp,32
	li	a5,20
	mv	a0,a5
	
	call	fib
	addi	s3,a0,0
	j _exit
fib:
	addi	sp,sp,-48
	sd	ra,40(sp)
	sd	s0,32(sp)
	sd	s1,24(sp)
	addi	s0,sp,48
	addi	a5,a0,0
	sw	a5,-36(s0)
	lw	a5,-36(s0)
	sext.w	a4,a5
	li	a5,1
	beq	a4,a5,.L2
	lw	a5,-36(s0)
	sext.w	a4,a5
	li	a5,2
	bne	a4,a5,.L3
.L2:
	li	a5,1
	j	.L4
.L3:
	lw	a5,-36(s0)
	addiw	a5,a5,-1
	sext.w	a5,a5
	addi	a0,a5,0
	call	fib
	addi	a5,a0,0
	addi	s1,a5,0
	lw	a5,-36(s0)
	addiw	a5,a5,-2
	sext.w	a5,a5
	addi	a0,a5,0
	call	fib
	addi	a5,a0,0
	addw	a5,s1,a5
	sext.w	a5,a5
.L4:
	addi	a0,a5,0
	ld	ra,40(sp)
	ld	s0,32(sp)
	ld	s1,24(sp)
	addi	sp,sp,48
	jr	ra
_exit:
	nop
