	.text
	.align	2
	.globl	_start
	.globl	main
	.globl	hex
_start:
	j main
hex:
	addi	sp,sp,-80
	sd	s0,72(sp)
	addi	s0,sp,80
	addi	a5,a0,0
	sw	a5,-68(s0)
	addi	a5,s0,-64
	sd	a5,-24(s0)
	j	.L2
.L3:
	lw	a5,-68(s0)
	andi	a5,a5,15
	sext.w	a4,a5
	ld	a5,-24(s0)
	sw	a4,0(a5)
	lw	a5,-68(s0)
	srliw	a5,a5,4
	sw	a5,-68(s0)
	ld	a5,-24(s0)
	addi	a5,a5,4
	sd	a5,-24(s0)
.L2:
	lw	a5,-68(s0)
	sext.w	a5,a5
	bne	a5,zero,.L3
	ld	a5,-24(s0)
	addi	a5,a5,-4
	sd	a5,-24(s0)
	sw	zero,-28(s0)
	j	.L4
.L5:
	lw	a5,-28(s0)
	slliw	a5,a5,4
	sw	a5,-28(s0)
	ld	a5,-24(s0)
	lw	a5,0(a5)
	lw	a4,-28(s0)
	addw	a5,a4,a5
	sw	a5,-28(s0)
	ld	a5,-24(s0)
	addi	a5,a5,-4
	sd	a5,-24(s0)
.L4:
	addi	a5,s0,-64
	addi	a5,a5,-4
	ld	a4,-24(s0)
	bne	a4,a5,.L5
	lw	a5,-28(s0)
	addi	a0,a5,0
	ld	s0,72(sp)
	addi	sp,sp,80
	jalr	zero,ra,0
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
	addi	a5,a0,0
	sw	a5,-20(s0)
	addi	s3,a5,0
	sw	a5,-20(s0)
	li	a5,0
	addi	a0,a5,0
	ld	ra,24(sp)
	ld	s0,16(sp)
	addi	sp,sp,32
_exit:
	addi zero,zero,0
	# j _exit
