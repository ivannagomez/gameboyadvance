	.cpu arm7tdmi
	.eabi_attribute 20, 1
	.eabi_attribute 21, 1
	.eabi_attribute 23, 3
	.eabi_attribute 24, 1
	.eabi_attribute 25, 1
	.eabi_attribute 26, 1
	.eabi_attribute 30, 2
	.eabi_attribute 34, 0
	.eabi_attribute 18, 4
	.file	"main.c"
	.text
	.align	2
	.global	initialize
	.arch armv4t
	.syntax unified
	.arm
	.fpu softvfp
	.type	initialize, %function
initialize:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	mov	r2, #67108864
	push	{r4, r5, r6, r7, r8, r9, r10, lr}
	mov	r4, #0
	mvn	r1, #32768
	ldr	r0, .L4
	ldr	r3, .L4+4
	strh	r0, [r2]	@ movhi
	ldrh	ip, [r3, #48]
	ldr	r3, .L4+8
	mov	r10, #60
	ldr	r2, .L4+12
	strh	ip, [r3]	@ movhi
	ldr	r3, .L4+16
	strh	r4, [r2]	@ movhi
	ldr	r0, .L4+20
	ldr	r5, .L4+24
	ldr	r2, .L4+28
	mov	r9, #25
	strh	r1, [r3]	@ movhi
	ldr	r3, .L4+32
	strh	r4, [r5]	@ movhi
	strh	r0, [r2]	@ movhi
	mov	lr, pc
	bx	r3
	mov	r2, #20
	mov	lr, #50
	mov	r8, #165
	mov	ip, #15
	mov	r7, #120
	mov	r3, #1
	mov	r6, #80
	mov	r0, #70
	mov	r1, #113
	strh	r4, [r5]	@ movhi
	ldr	r4, .L4+36
	str	r10, [r4]
	ldr	r4, .L4+40
	str	r9, [r4]
	ldr	r4, .L4+44
	str	r2, [r4]
	ldr	r4, .L4+48
	str	r2, [r4]
	ldr	r4, .L4+52
	str	r2, [r4]
	ldr	r2, .L4+56
	str	lr, [r2]
	ldr	r2, .L4+60
	str	lr, [r2]
	ldr	r2, .L4+64
	str	r8, [r2]
	ldr	r2, .L4+68
	str	ip, [r2]
	ldr	r2, .L4+72
	str	ip, [r2]
	ldr	r2, .L4+76
	ldr	ip, .L4+80
	str	r7, [r2]
	ldr	r2, .L4+84
	str	r6, [ip]
	str	r3, [r2]
	ldr	lr, .L4+88
	ldr	ip, .L4+92
	ldr	r2, .L4+96
	str	r3, [lr]
	str	r3, [ip]
	str	r3, [r2]
	ldr	lr, .L4+100
	ldr	ip, .L4+104
	ldr	r2, .L4+108
	ldr	r3, .L4+112
	str	r0, [lr]
	str	r0, [ip]
	str	r1, [r2]
	str	r1, [r3]
	pop	{r4, r5, r6, r7, r8, r9, r10, lr}
	bx	lr
.L5:
	.align	2
.L4:
	.word	1027
	.word	67109120
	.word	buttons
	.word	oldButtons
	.word	eColor
	.word	32736
	.word	mColor
	.word	bgColor
	.word	fillScreen
	.word	eHeight
	.word	eWidth
	.word	eRow0
	.word	eRow1
	.word	bHeight
	.word	eCol0
	.word	mWidth
	.word	eCol1
	.word	mHeight
	.word	bWidth
	.word	mRow
	.word	mCol
	.word	mRDel
	.word	mCDel
	.word	bRDel
	.word	bCDel
	.word	bRow
	.word	bOldRow
	.word	bCol
	.word	bOldCol
	.size	initialize, .-initialize
	.align	2
	.global	update
	.syntax unified
	.arm
	.fpu softvfp
	.type	update, %function
update:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, r7, r8, r9, r10, fp, lr}
	ldr	r3, .L65
	ldrh	ip, [r3]
	tst	ip, #1
	sub	sp, sp, #20
	beq	.L7
	ldr	r3, .L65+4
	ldrh	r3, [r3]
	ands	r3, r3, #1
	beq	.L64
.L7:
	ldr	r4, .L65+8
	ldr	r0, [r4]
	cmp	r0, #0
	movlt	r3, #0
	ldrlt	r2, .L65+12
	strlt	r0, [r2]
	movlt	r0, r3
	ldr	r6, .L65+16
	ldr	r2, [r6]
	strlt	r3, [r4]
	add	r3, r2, r0
	cmp	r3, #240
	ldr	r5, .L65+20
	ldrgt	r3, .L65+12
	ldr	r1, [r5]
	strgt	r0, [r3]
	rsbgt	r0, r2, #240
	strgt	r0, [r4]
	cmp	r1, #0
	movlt	r3, #0
	ldrlt	lr, .L65+24
	strlt	r1, [lr]
	movlt	r1, r3
	ldr	r7, .L65+28
	strlt	r3, [r5]
	ldr	r3, [r7]
	add	lr, r3, r1
	cmp	lr, #160
	ldrgt	lr, .L65+24
	strgt	r1, [lr]
	rsbgt	r1, r3, #160
	strgt	r1, [r5]
	tst	ip, #16
	beq	.L13
	ldr	lr, .L65+4
	ldrh	lr, [lr]
	tst	lr, #16
	bne	.L13
	add	r0, r0, #1
	str	r0, [r4]
.L15:
	tst	ip, #32
	beq	.L16
	ldr	lr, .L65+4
	ldrh	lr, [lr]
	tst	lr, #32
	bne	.L16
	sub	r0, r0, #1
	str	r0, [r4]
.L18:
	tst	ip, #64
	beq	.L19
	ldr	lr, .L65+4
	ldrh	lr, [lr]
	tst	lr, #64
	bne	.L19
	sub	r1, r1, #1
	str	r1, [r5]
.L21:
	tst	ip, #128
	beq	.L22
	ldr	ip, .L65+4
	ldrh	ip, [ip]
	tst	ip, #128
	bne	.L22
	add	r1, r1, #1
	str	r1, [r5]
.L24:
	ldr	ip, .L65+32
	ldr	r9, .L65+36
	ldr	r8, .L65+40
	ldr	lr, [ip]
	ldr	r8, [r8]
	ldr	ip, [r9]
	cmp	lr, #0
	rsble	ip, ip, #0
	add	r8, lr, r8
	strle	ip, [r9]
	cmp	r8, #240
	ldr	r8, .L65+44
	ldr	fp, [r8]
	ldr	r8, .L65+48
	ldr	r8, [r8]
	rsbgt	ip, ip, #0
	strgt	ip, [r9]
	stm	sp, {r8, fp}
	ldr	r10, .L65+52
	add	ip, lr, ip
	ldr	lr, [r10]
	ldr	r9, .L65+56
	str	lr, [sp, #12]
	ldr	lr, [r9]
	str	lr, [sp, #8]
	ldr	lr, .L65+32
	ldr	r8, .L65+60
	str	ip, [lr]
	mov	lr, pc
	bx	r8
	ldr	fp, .L65+64
	ldr	r3, [r7]
	ldr	r2, [r6]
	ldr	ip, .L65+68
	cmp	r0, #0
	addne	r1, r3, r3, lsr #31
	ldr	lr, [r10]
	addne	r0, r2, r2, lsr #31
	ldr	r9, [r9]
	ldr	ip, [ip]
	ldr	r10, [fp]
	asrne	r1, r1, #1
	asrne	r0, r0, #1
	rsbne	r1, r1, #80
	ldreq	r1, [r5]
	stm	sp, {r10, ip}
	rsbne	r0, r0, #120
	ldreq	r0, [r4]
	str	lr, [sp, #12]
	str	r9, [sp, #8]
	strne	r1, [r5]
	strne	r0, [r4]
	mov	lr, pc
	bx	r8
	ldr	r9, .L65+72
	ldr	r3, [r7]
	ldr	r2, [r6]
	ldr	ip, .L65+76
	ldr	lr, .L65+40
	ldr	r10, .L65+32
	cmp	r0, #0
	ldr	lr, [lr]
	ldr	r10, [r10]
	ldr	ip, [ip]
	ldr	r9, [r9]
	addne	r1, r3, r3, lsr #31
	addne	r0, r2, r2, lsr #31
	asrne	r1, r1, #1
	asrne	r0, r0, #1
	rsbne	r1, r1, #80
	rsbne	r0, r0, #120
	ldreq	r0, [r4]
	ldreq	r1, [r5]
	str	lr, [sp, #8]
	str	r10, [sp]
	str	ip, [sp, #12]
	str	r9, [sp, #4]
	strne	r1, [r5]
	strne	r0, [r4]
	mov	lr, pc
	bx	r8
	cmp	r0, #0
	beq	.L6
	ldr	r1, .L65+80
	ldr	r3, [r6]
	ldrh	r0, [r1]
	add	r3, r3, r3, lsr #31
	asr	r3, r3, #1
	rsb	r3, r3, #120
	cmp	r0, #0
	str	r3, [r4]
	movne	r3, #0
	moveq	r3, #31
	ldr	r2, [r7]
	add	r2, r2, r2, lsr #31
	asr	r2, r2, #1
	rsb	r2, r2, #80
	str	r2, [r5]
	strh	r3, [r1]	@ movhi
.L6:
	add	sp, sp, #20
	@ sp needed
	pop	{r4, r5, r6, r7, r8, r9, r10, fp, lr}
	bx	lr
.L13:
	ldr	lr, .L65+84
	ldrh	lr, [lr, #48]
	tst	lr, #16
	addeq	r0, r0, #1
	streq	r0, [r4]
	b	.L15
.L16:
	ldr	lr, .L65+84
	ldrh	lr, [lr, #48]
	tst	lr, #32
	subeq	r0, r0, #1
	streq	r0, [r4]
	b	.L18
.L19:
	ldr	lr, .L65+84
	ldrh	lr, [lr, #48]
	tst	lr, #64
	subeq	r1, r1, #1
	streq	r1, [r5]
	b	.L21
.L22:
	ldr	ip, .L65+84
	ldrh	ip, [ip, #48]
	tst	ip, #128
	addeq	r1, r1, #1
	streq	r1, [r5]
	b	.L24
.L64:
	ldr	r2, .L65+80
	ldr	r1, .L65+88
	ldrh	r0, [r2]
	cmp	r0, r1
	mvnne	r3, #32768
	strh	r3, [r2]	@ movhi
	b	.L7
.L66:
	.align	2
.L65:
	.word	oldButtons
	.word	buttons
	.word	bCol
	.word	bOldCol
	.word	bWidth
	.word	bRow
	.word	bOldRow
	.word	bHeight
	.word	mCol
	.word	mCDel
	.word	mWidth
	.word	eRow0
	.word	eCol0
	.word	eHeight
	.word	eWidth
	.word	collision
	.word	eCol1
	.word	eRow1
	.word	mRow
	.word	mHeight
	.word	eColor
	.word	67109120
	.word	32767
	.size	update, .-update
	.align	2
	.global	draw
	.syntax unified
	.arm
	.fpu softvfp
	.type	draw, %function
draw:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, r7, r8, r9, r10, fp, lr}
	ldr	r5, .L69
	ldrh	r3, [r5]
	sub	sp, sp, #12
	str	r3, [sp]
	ldr	r10, .L69+4
	ldr	r9, .L69+8
	ldr	r1, .L69+12
	ldr	r0, .L69+16
	ldr	r4, .L69+20
	ldr	r3, [r10]
	ldr	r2, [r9]
	ldr	r1, [r1]
	ldr	r0, [r0]
	mov	lr, pc
	bx	r4
	ldrh	r3, [r5]
	ldr	lr, .L69+24
	str	r3, [sp]
	ldr	r8, .L69+28
	ldr	r7, .L69+32
	ldr	r5, .L69+36
	ldr	r1, [lr]
	ldr	r3, [r8]
	ldr	r2, [r7]
	ldr	r0, [r5]
	mov	lr, pc
	bx	r4
	mov	r1, #31744
	ldr	r3, [r10]
	ldr	r2, [r9]
	ldr	r6, .L69+40
	str	r1, [sp]
	ldr	r5, .L69+44
	ldr	fp, .L69+48
	ldr	r1, [r6]
	ldr	r0, [r5]
	mov	lr, pc
	bx	r4
	ldrh	r3, [fp]
	ldr	r10, .L69+52
	str	r3, [sp]
	ldr	r9, .L69+56
	ldr	r1, .L69+60
	ldr	r0, .L69+64
	ldr	r3, [r10]
	ldr	r2, [r9]
	ldr	r1, [r1]
	ldr	r0, [r0]
	mov	lr, pc
	bx	r4
	ldrh	r3, [fp]
	ldr	r1, .L69+68
	str	r3, [sp]
	ldr	r0, .L69+72
	ldr	r3, [r10]
	ldr	r2, [r9]
	ldr	r1, [r1]
	ldr	r0, [r0]
	mov	lr, pc
	bx	r4
	ldr	r3, .L69+76
	ldrh	r1, [r3]
	ldr	r10, .L69+80
	str	r1, [sp]
	ldr	r9, .L69+84
	ldr	r3, [r8]
	ldr	r2, [r7]
	ldr	r1, [r10]
	ldr	r0, [r9]
	mov	lr, pc
	bx	r4
	ldr	r0, [r6]
	ldr	ip, .L69+12
	ldr	r1, [r5]
	ldr	r2, [r10]
	ldr	r3, [r9]
	str	r0, [ip]
	ldr	lr, .L69+24
	ldr	r0, .L69+16
	ldr	r5, .L69+36
	str	r1, [r0]
	str	r2, [lr]
	str	r3, [r5]
	add	sp, sp, #12
	@ sp needed
	pop	{r4, r5, r6, r7, r8, r9, r10, fp, lr}
	bx	lr
.L70:
	.align	2
.L69:
	.word	bgColor
	.word	bHeight
	.word	bWidth
	.word	bOldRow
	.word	bOldCol
	.word	drawRect
	.word	mOldRow
	.word	mHeight
	.word	mWidth
	.word	mOldCol
	.word	bRow
	.word	bCol
	.word	eColor
	.word	eHeight
	.word	eWidth
	.word	eRow0
	.word	eCol0
	.word	eRow1
	.word	eCol1
	.word	mColor
	.word	mRow
	.word	mCol
	.size	draw, .-draw
	.section	.text.startup,"ax",%progbits
	.align	2
	.global	main
	.syntax unified
	.arm
	.fpu softvfp
	.type	main, %function
main:
	@ Function supports interworking.
	@ Volatile: function does not return.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r7, lr}
	ldr	r3, .L74
	mov	lr, pc
	bx	r3
	ldr	r9, .L74+4
	ldr	r4, .L74+8
	ldr	r8, .L74+12
	ldr	r7, .L74+16
	ldr	r6, .L74+20
	ldr	r5, .L74+24
.L72:
	ldrh	r3, [r4]
	strh	r3, [r9]	@ movhi
	ldrh	r3, [r5, #48]
	strh	r3, [r4]	@ movhi
	mov	lr, pc
	bx	r8
	mov	lr, pc
	bx	r7
	mov	lr, pc
	bx	r6
	b	.L72
.L75:
	.align	2
.L74:
	.word	initialize
	.word	oldButtons
	.word	buttons
	.word	update
	.word	waitForVBlank
	.word	draw
	.word	67109120
	.size	main, .-main
	.comm	bWidth,4,4
	.comm	bHeight,4,4
	.comm	bCDel,4,4
	.comm	bRDel,4,4
	.comm	bOldCol,4,4
	.comm	bOldRow,4,4
	.comm	bCol,4,4
	.comm	bRow,4,4
	.comm	mColor,2,2
	.comm	mCDel,4,4
	.comm	mRDel,4,4
	.comm	mOldCol,4,4
	.comm	mOldRow,4,4
	.comm	mWidth,4,4
	.comm	mHeight,4,4
	.comm	mRow,4,4
	.comm	mCol,4,4
	.comm	eColor,2,2
	.comm	eWidth,4,4
	.comm	eHeight,4,4
	.comm	eCol1,4,4
	.comm	eCol0,4,4
	.comm	eRow1,4,4
	.comm	eRow0,4,4
	.comm	bgColor,2,2
	.comm	oldButtons,2,2
	.comm	buttons,2,2
	.ident	"GCC: (devkitARM release 53) 9.1.0"
