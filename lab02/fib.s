	.file	"fib.c"
	.option nopic
	.attribute arch, "rv64i2p0_f2p0_d2p0"
	.attribute unaligned_access, 0
	.attribute stack_align, 16
	.text
	.align	2
	.globl	fib
	.type	fib, @function
fib:
	addi	sp,sp,-48
	sd	ra,40(sp)
	sd	s0,32(sp)
	sd	s1,24(sp)
	addi	s0,sp,48
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
	mv	a0,a5
	call	fib
	mv	s1,a0
	ld	a5,-40(s0)
	addi	a5,a5,-2
	mv	a0,a5
	call	fib
	mv	a5,a0
	add	a5,s1,a5
.L4:
	mv	a0,a5
	ld	ra,40(sp)
	ld	s0,32(sp)
	ld	s1,24(sp)
	addi	sp,sp,48
	jr	ra
	.size	fib, .-fib
	.section	.srodata,"a"
	.align	3
	.type	N, @object
	.size	N, 8
N:
	.dword	20
	.section	.rodata
	.align	3
.LC0:
	.string	"fib(%d) = %d (%08x)\n"
	.text
	.align	2
	.globl	main
	.type	main, @function
main:
	addi	sp,sp,-32
	sd	ra,24(sp)
	sd	s0,16(sp)
	addi	s0,sp,32
	li	a5,20
	mv	a0,a5
	call	fib
	sd	a0,-24(s0)
	li	a5,20
	ld	a3,-24(s0)
	ld	a2,-24(s0)
	mv	a1,a5
	lui	a5,%hi(.LC0)
	addi	a0,a5,%lo(.LC0)
	call	printf
	li	a5,0
	mv	a0,a5
	ld	ra,24(sp)
	ld	s0,16(sp)
	addi	sp,sp,32
	jr	ra
	.size	main, .-main
	.ident	"GCC: (gca312387a) 10.2.0"
