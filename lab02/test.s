	.file	"test.c"
	.option nopic
	.attribute arch, "rv64i2p0_f2p0_d2p0"
	.attribute unaligned_access, 0
	.attribute stack_align, 16
	.text
	.align	2
	.globl	hex
	.type	hex, @function
hex:
	addi	sp,sp,-112
	sd	s0,104(sp)
	addi	s0,sp,112
	sd	a0,-104(s0)
	addi	a5,s0,-96
	sd	a5,-24(s0)
	j	.L2
.L3:
	ld	a5,-104(s0)
	andi	a4,a5,15
	ld	a5,-24(s0)
	sd	a4,0(a5)
	ld	a5,-104(s0)
	srli	a5,a5,4
	sd	a5,-104(s0)
	ld	a5,-24(s0)
	addi	a5,a5,8
	sd	a5,-24(s0)
.L2:
	ld	a5,-104(s0)
	bne	a5,zero,.L3
	ld	a5,-24(s0)
	addi	a5,a5,-8
	sd	a5,-24(s0)
	sd	zero,-32(s0)
	j	.L4
.L5:
	ld	a5,-32(s0)
	slli	a5,a5,4
	sd	a5,-32(s0)
	ld	a5,-24(s0)
	ld	a5,0(a5)
	ld	a4,-32(s0)
	add	a5,a4,a5
	sd	a5,-32(s0)
	ld	a5,-24(s0)
	addi	a5,a5,-8
	sd	a5,-24(s0)
.L4:
	addi	a5,s0,-96
	addi	a5,a5,-8
	ld	a4,-24(s0)
	bne	a4,a5,.L5
	ld	a5,-32(s0)
	mv	a0,a5
	ld	s0,104(sp)
	addi	sp,sp,112
	jr	ra
	.size	hex, .-hex
	.align	2
	.globl	main
	.type	main, @function
main:
	addi	sp,sp,-32
	sd	ra,24(sp)
	sd	s0,16(sp)
	addi	s0,sp,32
	li	a5,200110080
	addi	a0,a5,539
	call	hex
	sd	a0,-24(s0)
 #APP
# 24 "test.c" 1
	addi s3, a5, 0
# 0 "" 2
 #NO_APP
	sd	a5,-24(s0)
	li	a5,0
	mv	a0,a5
	ld	ra,24(sp)
	ld	s0,16(sp)
	addi	sp,sp,32
	jr	ra
	.size	main, .-main
	.ident	"GCC: (gca312387a) 10.2.0"
