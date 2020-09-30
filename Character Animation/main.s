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
	mov	r3, #67108864
	push	{r4, r5, r6, r7, lr}
	ldr	r1, .L4
	ldr	r0, .L4+4
	ldr	r2, .L4+8
	sub	sp, sp, #12
	strh	r1, [r3]	@ movhi
	ldr	r3, .L4+12
	strh	r0, [r2]	@ movhi
	mov	lr, pc
	bx	r3
	mov	r2, #5
	mov	r0, #90
	mov	r1, #155
	mov	r3, #992
	ldr	r6, .L4+16
	ldr	r4, .L4+20
	ldr	r5, .L4+24
	ldr	ip, .L4+28
	ldr	r7, .L4+32
	str	r2, [r6]
	str	r0, [r4]
	str	r1, [r5]
	strh	r3, [ip]	@ movhi
	mov	lr, pc
	bx	r7
	ldr	ip, .L4+36
	ldr	r3, .L4+40
	ldr	r0, [r4]
	ldr	r2, [r6]
	stm	sp, {r3, ip}
	ldr	r1, [r5]
	mov	r3, #31
	ldr	r4, .L4+44
	mov	lr, pc
	bx	r4
	add	sp, sp, #12
	@ sp needed
	pop	{r4, r5, r6, r7, lr}
	bx	lr
.L5:
	.align	2
.L4:
	.word	1027
	.word	32736
	.word	bgColor
	.word	fillScreen
	.word	dSize
	.word	dCol
	.word	dRow
	.word	dColor
	.word	drawDragon
	.word	32767
	.word	1023
	.word	drawDragonFire
	.size	initialize, .-initialize
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
	push	{r4, r5, r6, r7, r8, r9, lr}
	ldr	r3, .L8
	ldr	r9, .L8+4
	ldrh	r3, [r3]
	ldr	r4, .L8+8
	ldr	r5, .L8+12
	sub	sp, sp, #12
	str	r3, [sp, #4]
	str	r3, [sp]
	ldr	r2, [r9]
	ldr	r1, [r4]
	ldr	r0, [r5]
	ldr	r8, .L8+16
	mov	lr, pc
	bx	r8
	ldr	r6, .L8+20
	ldr	r7, .L8+24
	ldr	ip, .L8+28
	ldr	r3, .L8+32
	ldr	r2, [r9]
	stm	sp, {r3, ip}
	ldr	r1, [r6]
	mov	r3, #31
	ldr	r0, [r7]
	mov	lr, pc
	bx	r8
	ldr	r2, [r7]
	ldr	r3, [r6]
	str	r2, [r5]
	str	r3, [r4]
	add	sp, sp, #12
	@ sp needed
	pop	{r4, r5, r6, r7, r8, r9, lr}
	bx	lr
.L9:
	.align	2
.L8:
	.word	bgColor
	.word	dSize
	.word	dOldRow
	.word	dOldCol
	.word	drawDragonFire
	.word	dRow
	.word	dCol
	.word	32767
	.word	1023
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
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, r7, r8, lr}
	mov	r8, #0
	ldr	r3, .L21
	mov	lr, pc
	bx	r3
	mov	r2, r8
	ldr	r4, .L21+4
	ldr	r6, .L21+8
	ldr	r5, .L21+12
.L16:
	cmp	r8, #1
	beq	.L14
	ldr	r3, [r4]
	sub	r3, r3, #1
	str	r3, [r4]
	add	r7, r2, #1
	b	.L12
.L19:
	ldr	r3, [r4]
	add	r3, r3, #1
	str	r3, [r4]
	mov	lr, pc
	bx	r6
	mov	lr, pc
	bx	r5
	mov	r2, #9
.L14:
	mov	r8, #1
	ldr	r3, [r4]
	add	r3, r3, #1
	str	r3, [r4]
	sub	r7, r2, #1
.L12:
	mov	lr, pc
	bx	r6
	mov	lr, pc
	bx	r5
	cmp	r7, #10
	beq	.L19
	cmp	r7, #0
	bne	.L20
	ldr	r3, [r4]
	sub	r3, r3, #1
	str	r3, [r4]
	mov	lr, pc
	bx	r6
	mov	lr, pc
	bx	r5
	mov	r2, #1
.L17:
	mov	r8, r7
	b	.L16
.L20:
	mov	r2, r7
	mov	r7, r8
	b	.L17
.L22:
	.align	2
.L21:
	.word	initialize
	.word	dRow
	.word	waitForVBlank
	.word	draw
	.size	main, .-main
	.comm	dColor,2,2
	.comm	dRDel,4,4
	.comm	dOldCol,4,4
	.comm	dOldRow,4,4
	.comm	dSize,4,4
	.comm	dRow,4,4
	.comm	dCol,4,4
	.comm	bgColor,2,2
	.ident	"GCC: (devkitARM release 53) 9.1.0"
