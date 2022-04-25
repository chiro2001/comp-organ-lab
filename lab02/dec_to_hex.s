	.text
	.align	2
	.globl	_start
	.globl	main
	.globl	hex
_start:
	j main
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
	addi	a0,a5,0
	ld	s0,104(sp)
	addi	sp,sp,112
	jr	ra
main:
	addi	sp,sp,-32
	sd	ra,24(sp)
	sd	s0,16(sp)
	addi	s0,sp,32
	li	a5,200110080
	addi	a0,a5,539
	lui	t1,%hi(hex)
	addi	t1,t1,%lo(hex)
	jalr	ra,t1,0
	sd	a0,-24(s0)
 	addi s3,a5,0
	sd	a5,-24(s0)
	li	a5,0
	addi	a0,a5,0
	ld	ra,24(sp)
	ld	s0,16(sp)
	addi	sp,sp,32
_exit:
	addi zero,zero,0
	# j _exit
