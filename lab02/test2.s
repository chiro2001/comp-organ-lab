	.file	"test2.c"
	.option nopic
	.attribute arch, "rv64i2p0_f2p0_d2p0"
	.attribute unaligned_access, 0
	.attribute stack_align, 16
	.text
	.align	2
	.globl	test
	.type	test, @function
test:
	addi	sp,sp,-16
	sd	s0,8(sp)
	addi	s0,sp,16
	nop
	ld	s0,8(sp)
	addi	sp,sp,16
	jr	ra
	.size	test, .-test
	.align	2
	.globl	main
	.type	main, @function
main:
	addi	sp,sp,-32
	sd	s0,24(sp)
	addi	s0,sp,32
	lui	a5,%hi(test)
	addi	a5,a5,%lo(test)
	sd	a5,-24(s0)
	li	a5,0
	mv	a0,a5
	ld	s0,24(sp)
	addi	sp,sp,32
	jr	ra
	.size	main, .-main
	.ident	"GCC: (gca312387a) 10.2.0"
