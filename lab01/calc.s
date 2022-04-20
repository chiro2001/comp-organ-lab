	.file	"calc.c"
	.option pic
	.text
	.align	1
	.globl	times
	.type	times, @function
times:
	addi	sp,sp,-48
	sd	s0,40(sp)
	addi	s0,sp,48
	mv	a5,a0
	mv	a4,a1
	sb	a5,-33(s0)
	mv	a5,a4
	sb	a5,-34(s0)
	sb	zero,-21(s0)
	sw	zero,-20(s0)
	j	.L2
.L4:
	lbu	a5,-34(s0)
	sext.w	a4,a5
	lbu	a5,-21(s0)
	sext.w	a5,a5
	sraw	a5,a4,a5
	sext.w	a5,a5
	andi	a5,a5,1
	sext.w	a5,a5
	beqz	a5,.L3
	lbu	a5,-33(s0)
	sext.w	a4,a5
	lbu	a5,-21(s0)
	sext.w	a5,a5
	sllw	a5,a4,a5
	sext.w	a5,a5
	sext.w	a5,a5
	lw	a4,-20(s0)
	addw	a5,a4,a5
	sw	a5,-20(s0)
.L3:
	lbu	a5,-21(s0)
	addiw	a5,a5,1
	sb	a5,-21(s0)
.L2:
	lbu	a5,-21(s0)
	andi	a4,a5,0xff
	li	a5,8
	bne	a4,a5,.L4
	lw	a5,-20(s0)
	mv	a0,a5
	ld	s0,40(sp)
	addi	sp,sp,48
	jr	ra
	.size	times, .-times
	.align	1
	.globl	square
	.type	square, @function
square:
	addi	sp,sp,-32
	sd	ra,24(sp)
	sd	s0,16(sp)
	addi	s0,sp,32
	mv	a5,a0
	sb	a5,-17(s0)
	lbu	a4,-17(s0)
	lbu	a5,-17(s0)
	mv	a1,a4
	mv	a0,a5
	call	times
	mv	a5,a0
	sext.w	a5,a5
	mv	a0,a5
	ld	ra,24(sp)
	ld	s0,16(sp)
	addi	sp,sp,32
	jr	ra
	.size	square, .-square
	.align	1
	.globl	cube
	.type	cube, @function
cube:
	addi	sp,sp,-32
	sd	ra,24(sp)
	sd	s0,16(sp)
	addi	s0,sp,32
	mv	a5,a0
	sb	a5,-17(s0)
	lbu	a4,-17(s0)
	lbu	a5,-17(s0)
	mv	a1,a4
	mv	a0,a5
	call	times
	mv	a5,a0
	sext.w	a5,a5
	andi	a4,a5,0xff
	lbu	a5,-17(s0)
	mv	a1,a4
	mv	a0,a5
	call	times
	mv	a5,a0
	sext.w	a5,a5
	mv	a0,a5
	ld	ra,24(sp)
	ld	s0,16(sp)
	addi	sp,sp,32
	jr	ra
	.size	cube, .-cube
	.section	.rodata
	.align	3
.LC0:
	.string	"%d\n"
	.text
	.align	1
	.globl	main
	.type	main, @function
main:
	addi	sp,sp,-32
	sd	ra,24(sp)
	sd	s0,16(sp)
	addi	s0,sp,32
	li	a5,19
	sb	a5,-17(s0)
	lbu	a5,-17(s0)
	mv	a0,a5
	call	cube
	mv	a5,a0
	sext.w	a5,a5
	mv	a1,a5
	lla	a0,.LC0
	call	printf@plt
	li	a5,0
	mv	a0,a5
	ld	ra,24(sp)
	ld	s0,16(sp)
	addi	sp,sp,32
	jr	ra
	.size	main, .-main
	.ident	"GCC: (Ubuntu 9.4.0-1ubuntu1~20.04) 9.4.0"
	.section	.note.GNU-stack,"",@progbits
