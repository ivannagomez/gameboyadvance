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
	.file	"myLib.c"
	.text
	.align	2
	.global	setPixel
	.arch armv4t
	.syntax unified
	.arm
	.fpu softvfp
	.type	setPixel, %function
setPixel:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	ldr	r3, .L3
	rsb	r1, r1, r1, lsl #4
	ldr	r3, [r3]
	add	r0, r0, r1, lsl #4
	lsl	r0, r0, #1
	strh	r2, [r3, r0]	@ movhi
	bx	lr
.L4:
	.align	2
.L3:
	.word	.LANCHOR0
	.size	setPixel, .-setPixel
	.align	2
	.global	drawRect
	.syntax unified
	.arm
	.fpu softvfp
	.type	drawRect, %function
drawRect:
	@ Function supports interworking.
	@ args = 4, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, lr}
	subs	r4, r2, #0
	ldrh	ip, [sp, #16]
	ble	.L11
	ldr	r2, .L19
	rsb	lr, r1, r1, lsl #4
	ldr	r5, [r2]
	add	lr, r0, lr, lsl #4
	add	r2, lr, r4
	add	r2, r5, r2, lsl #1
	add	lr, r5, lr, lsl #1
.L9:
	strh	ip, [lr], #2	@ movhi
	cmp	lr, r2
	bne	.L9
	add	r2, r3, r1
	rsb	r6, r2, r2, lsl #4
	add	r2, r0, r4
	add	lr, r0, r6, lsl #4
	add	r2, r2, r6, lsl #4
	add	lr, r5, lr, lsl #1
	add	r2, r5, r2, lsl #1
.L10:
	strh	ip, [lr], #2	@ movhi
	cmp	lr, r2
	bne	.L10
.L11:
	cmp	r3, #0
	ble	.L5
	ldr	r2, .L19
	add	lr, r1, r3
	ldr	r2, [r2]
	rsb	lr, lr, lr, lsl #4
	rsb	r1, r1, r1, lsl #4
	add	r5, r0, lr, lsl #4
	add	r3, r0, r1, lsl #4
	lsl	lr, lr, #4
	add	r5, r2, r5, lsl #1
	add	r3, r2, r3, lsl #1
	lsl	r1, r1, #4
.L12:
	strh	ip, [r3]	@ movhi
	add	r3, r3, #480
	cmp	r3, r5
	bne	.L12
	add	r0, r4, r0
	add	r3, r1, r0
	add	lr, r0, lr
	add	r3, r2, r3, lsl #1
	add	r2, r2, lr, lsl #1
.L13:
	strh	ip, [r3]	@ movhi
	add	r3, r3, #480
	cmp	r2, r3
	bne	.L13
.L5:
	pop	{r4, r5, r6, lr}
	bx	lr
.L20:
	.align	2
.L19:
	.word	.LANCHOR0
	.size	drawRect, .-drawRect
	.align	2
	.global	fillScreen
	.syntax unified
	.arm
	.fpu softvfp
	.type	fillScreen, %function
fillScreen:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	mov	r1, #0
	mov	r3, r1
	ldr	r2, .L28
	ldr	ip, [r2]
.L26:
	cmp	r3, #239
	ble	.L27
.L22:
	cmp	r3, #240
	bne	.L26
	add	r1, r1, #1
	rsb	r3, r1, r1, lsl #4
	lsl	r3, r3, #5
	cmp	r1, #160
	strh	r0, [ip, r3]	@ movhi
	lsl	r2, r1, #4
	bxeq	lr
	strh	r0, [ip, r3]	@ movhi
	mov	r3, #1
.L25:
	sub	r2, r2, r1
	add	r2, r3, r2, lsl #4
	add	r3, r3, #1
	lsl	r2, r2, #1
	cmp	r3, #239
	strh	r0, [ip, r2]	@ movhi
	bgt	.L22
.L27:
	lsl	r2, r1, #4
	b	.L25
.L29:
	.align	2
.L28:
	.word	.LANCHOR0
	.size	fillScreen, .-fillScreen
	.align	2
	.global	waitForVBlank
	.syntax unified
	.arm
	.fpu softvfp
	.type	waitForVBlank, %function
waitForVBlank:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	mov	r2, #67108864
.L31:
	ldrh	r3, [r2, #6]
	cmp	r3, #160
	bhi	.L31
	mov	r2, #67108864
.L32:
	ldrh	r3, [r2, #6]
	cmp	r3, #159
	bls	.L32
	bx	lr
	.size	waitForVBlank, .-waitForVBlank
	.align	2
	.global	collision
	.syntax unified
	.arm
	.fpu softvfp
	.type	collision, %function
collision:
	@ Function supports interworking.
	@ args = 16, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	ldr	ip, [sp, #4]
	add	r3, r1, r3
	sub	r3, r3, #1
	cmp	r3, ip
	ble	.L40
	ldr	r3, [sp, #12]
	add	ip, ip, r3
	sub	ip, ip, #1
	cmp	ip, r1
	ble	.L40
	ldr	r3, [sp]
	add	r2, r0, r2
	sub	r2, r2, #1
	cmp	r2, r3
	ble	.L40
	ldr	r2, [sp, #8]
	add	r3, r3, r2
	sub	r3, r3, #1
	cmp	r3, r0
	movle	r0, #0
	movgt	r0, #1
	bx	lr
.L40:
	mov	r0, #0
	bx	lr
	.size	collision, .-collision
	.global	videoBuffer
	.data
	.align	2
	.set	.LANCHOR0,. + 0
	.type	videoBuffer, %object
	.size	videoBuffer, 4
videoBuffer:
	.word	100663296
	.ident	"GCC: (devkitARM release 53) 9.1.0"
