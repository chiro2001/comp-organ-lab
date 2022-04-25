# s3 -> 1a6d
	.data
N:
	.word	20
	.text
	.align	2
	.globl	fib
	.globl	_start
_start:
	addi	sp,sp,-32
	sd	ra,24(sp)
	sd	s0,16(sp)
	lui	t1,%hi(N)
	addi	t1,t1,%lo(N)
	lw	a0,0(t1)
	li	a5,20
	addi	a0,a5,0
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
	sd	a0,-40(s0)
	ld	a4,-40(s0)
	li	a5,1
	beq	a4,a5,.L2
	ld	a4,-40(s0)
	li	a5,2
	bne	a4,a5,.L3
.L2:
	li	a5,1
	j	.L4
.L3:
	ld	a5,-40(s0)
	addi	a5,a5,-1
	addi	a0,a5,0
	call	fib
	addi	s1,a0,0
	ld	a5,-40(s0)
	addi	a5,a5,-2
	addi	a0,a5,0
	call	fib
	addi	a5,a0,0
	add	a5,s1,a5
.L4:
	addi	a0,a5,0
	ld	ra,40(sp)
	ld	s0,32(sp)
	ld	s1,24(sp)
	addi	sp,sp,48
	jr	ra
_exit:
	nop
