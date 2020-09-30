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
	push	{r4, r5, r6, r7, r8, r9, r10, fp, lr}
	mov	r10, #0
	ldr	r1, .L4
	ldr	r3, .L4+4
	strh	r1, [r2]	@ movhi
	ldr	r0, .L4+8
	ldrh	lr, [r3, #48]
	ldr	ip, .L4+12
	ldr	r1, .L4+16
	ldr	r2, .L4+20
	sub	sp, sp, #20
	ldr	r3, .L4+24
	strh	lr, [ip]	@ movhi
	strh	r10, [r1]	@ movhi
	strh	r0, [r2]	@ movhi
	mov	lr, pc
	bx	r3
	mov	ip, #31744
	ldr	r9, .L4+28
	ldr	fp, .L4+32
	ldr	lr, .L4+36
	str	ip, [sp, #12]
	stmib	sp, {r9, lr}
	str	r10, [sp]
	strh	ip, [fp]	@ movhi
	mvn	fp, #64512
	ldr	ip, .L4+40
	mov	r4, #992
	mov	r5, #10
	mov	r2, #1
	mov	r1, #90
	strh	fp, [ip]	@ movhi
	mvn	ip, #32768
	ldr	r8, .L4+44
	ldr	r6, .L4+48
	ldr	r7, .L4+52
	ldr	lr, .L4+56
	ldr	r0, .L4+60
	ldr	r3, .L4+64
	strh	r10, [r0]	@ movhi
	str	r2, [r8]
	mov	r0, r5
	str	r5, [r6]
	str	r1, [r7]
	strh	r4, [r3]	@ movhi
	strh	ip, [lr]	@ movhi
	mov	r3, r4
	ldr	ip, .L4+68
	mov	lr, pc
	bx	ip
	ldr	lr, .L4+36
	stm	sp, {r9, lr}
	mov	r3, #31
	ldr	r2, [r8]
	ldr	r1, [r7]
	ldr	r0, [r6]
	ldr	r6, .L4+72
	mov	lr, pc
	bx	r6
	mov	lr, #20
	mov	ip, #31
	mov	r3, #5
	mov	r0, #50
	mov	r2, r5
	ldr	r5, .L4+76
	str	r4, [sp]
	ldr	r9, .L4+80
	strh	r4, [r5]	@ movhi
	ldr	r5, .L4+84
	str	lr, [r9]
	strh	r4, [r5]	@ movhi
	ldr	lr, .L4+88
	ldr	r5, .L4+92
	strh	ip, [lr]	@ movhi
	ldr	r6, .L4+96
	ldr	r8, .L4+100
	ldr	r7, .L4+104
	strh	r4, [r5]	@ movhi
	ldr	fp, .L4+108
	ldr	r5, .L4+112
	ldr	lr, .L4+116
	ldr	r1, .L4+120
	strh	ip, [lr]	@ movhi
	strh	ip, [r5]	@ movhi
	strh	r4, [r1]	@ movhi
	strh	r4, [fp]	@ movhi
	mov	r1, r10
	ldr	r4, .L4+124
	str	r3, [r8]
	str	r10, [r6]
	str	r0, [r7]
	mov	lr, pc
	bx	r4
	ldr	lr, .L4+88
	ldrh	r2, [lr]
	ldr	r3, [r8]
	ldr	r1, [r9]
	ldr	r0, [r7]
	str	r2, [sp]
	add	r0, r0, r1
	lsl	r2, r3, #1
	ldr	r1, [r6]
	mov	lr, pc
	bx	r4
	ldrh	r2, [fp]
	ldr	r3, [r8]
	ldr	r1, [r7]
	ldr	r0, [r9]
	str	r2, [sp]
	add	r0, r1, r0, lsl #1
	lsl	r2, r3, #1
	ldr	r1, [r6]
	mov	lr, pc
	bx	r4
	ldr	r3, .L4+76
	ldrh	r1, [r3]
	ldr	r2, [r9]
	ldr	r3, [r8]
	ldr	r0, [r7]
	str	r1, [sp]
	add	r2, r2, r2, lsl #1
	ldr	r1, [r6]
	add	r0, r2, r0
	lsl	r2, r3, #1
	mov	lr, pc
	bx	r4
	ldr	lr, .L4+116
	ldrh	r2, [lr]
	ldr	r3, [r8]
	ldr	r1, [r7]
	ldr	r0, [r9]
	str	r2, [sp]
	add	r0, r1, r0, lsl #2
	lsl	r2, r3, #1
	ldr	r1, [r6]
	mov	lr, pc
	bx	r4
	ldr	r3, .L4+84
	ldrh	r1, [r3]
	ldr	r2, [r9]
	ldr	r3, [r8]
	ldr	r0, [r7]
	str	r1, [sp]
	add	r2, r2, r2, lsl #2
	ldr	r1, [r6]
	add	r0, r2, r0
	lsl	r2, r3, #1
	mov	lr, pc
	bx	r4
	ldrh	r1, [r5]
	ldr	r2, [r9]
	ldr	r3, [r8]
	ldr	r0, [r7]
	str	r1, [sp]
	ldr	r5, .L4+92
	add	r2, r2, r2, lsl #1
	ldr	r1, [r6]
	add	r0, r0, r2, lsl #1
	lsl	r2, r3, #1
	mov	lr, pc
	bx	r4
	ldrh	r1, [r5]
	ldr	r2, [r9]
	ldr	r3, [r8]
	ldr	r0, [r7]
	str	r1, [sp]
	rsb	r2, r2, r2, lsl #3
	ldr	r1, [r6]
	add	r0, r2, r0
	lsl	r2, r3, #1
	mov	lr, pc
	bx	r4
	ldr	r3, .L4+128
	str	r10, [r3]
	add	sp, sp, #20
	@ sp needed
	pop	{r4, r5, r6, r7, r8, r9, r10, fp, lr}
	bx	lr
.L5:
	.align	2
.L4:
	.word	1027
	.word	67109120
	.word	32736
	.word	buttons
	.word	oldButtons
	.word	bgColor
	.word	fillScreen
	.word	1023
	.word	dEyeColor
	.word	32767
	.word	dTummy
	.word	dSize
	.word	dCol
	.word	dRow
	.word	dEyeEdge
	.word	dEdge
	.word	dColor
	.word	drawDragon
	.word	drawDragonFire
	.word	gameColor4
	.word	gaSpacing
	.word	gameColor6
	.word	gameColor2
	.word	gameColor8
	.word	gaRow
	.word	gaSize
	.word	gaCol
	.word	gameColor3
	.word	gameColor7
	.word	gameColor5
	.word	gameColor1
	.word	drawSq
	.word	winCounter
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
	ldr	r3, .L67
	ldrh	r3, [r3]
	ldr	r4, .L67+4
	tst	r3, #16
	ldr	r0, [r4]
	sub	sp, sp, #20
	beq	.L7
	ldr	r2, .L67+8
	ldrh	r2, [r2]
	tst	r2, #16
	bne	.L7
	add	r0, r0, #1
	str	r0, [r4]
.L9:
	tst	r3, #32
	beq	.L10
	ldr	r3, .L67+8
	ldrh	r3, [r3]
	tst	r3, #32
	bne	.L10
	sub	r0, r0, #1
	str	r0, [r4]
.L12:
	cmp	r0, #9
	bgt	.L13
	mov	r3, #10
	ldr	r2, .L67+12
	str	r0, [r2]
	mov	r0, r3
	str	r3, [r4]
.L14:
	mov	r1, #5
	mov	r2, #10
	ldr	r7, .L67+16
	ldr	r6, .L67+20
	ldr	r3, [r7]
	ldr	ip, [r6]
	add	r3, r3, #15
	str	r3, [sp, #4]
	str	r2, [sp, #8]
	str	ip, [sp]
	str	r1, [sp, #12]
	ldr	r8, .L67+24
	mov	r3, #20
	mov	r2, #12
	ldr	r1, [r8]
	ldr	r5, .L67+28
	mov	lr, pc
	bx	r5
	cmp	r0, #0
	ldr	r10, .L67+32
	beq	.L15
	ldrh	r3, [r10]
	cmp	r3, #992
	beq	.L58
.L15:
	mov	r1, #5
	mov	fp, #10
	ldr	r9, .L67+36
	ldr	r2, [r6]
	ldr	r0, [r9]
	ldr	r3, [r7]
	add	r2, r2, r0
	add	r3, r3, #15
	stm	sp, {r2, r3}
	str	r1, [sp, #12]
	str	fp, [sp, #8]
	mov	r3, #20
	mov	r2, #12
	ldr	r1, [r8]
	ldr	r0, [r4]
	mov	lr, pc
	bx	r5
	cmp	r0, #0
	beq	.L18
	ldr	r2, .L67+40
	ldr	r3, [r2]
	cmp	r3, #5
	ble	.L59
.L18:
	ldr	r0, [r4]
	ldr	r1, [r8]
.L17:
	mov	lr, #5
	mov	ip, #10
	ldr	r2, [r7]
	add	r2, r2, #15
	ldr	fp, [r9]
	str	r2, [sp, #4]
	ldr	r3, [r6]
	add	r3, r3, fp, lsl #1
	str	r3, [sp]
	mov	r2, #12
	mov	r3, #20
	str	lr, [sp, #12]
	str	ip, [sp, #8]
	mov	lr, pc
	bx	r5
	cmp	r0, #0
	beq	.L19
	ldr	r3, .L67+44
	ldrh	r2, [r3]
	cmp	r2, #992
	beq	.L60
.L19:
	mov	r0, #5
	mov	r1, #10
	ldr	r3, [r9]
	ldr	ip, [r6]
	ldr	r2, [r7]
	add	r3, r3, r3, lsl #1
	add	r3, r3, ip
	add	r2, r2, #15
	str	r3, [sp]
	str	r2, [sp, #4]
	str	r0, [sp, #12]
	str	r1, [sp, #8]
	mov	r3, #20
	mov	r2, #12
	ldr	r1, [r8]
	ldr	r0, [r4]
	mov	lr, pc
	bx	r5
	cmp	r0, #0
	beq	.L20
	ldr	r3, .L67+48
	ldrh	r2, [r3]
	cmp	r2, #992
	beq	.L61
.L20:
	mov	r1, #5
	mov	fp, #10
	ldr	r0, [r9]
	ldr	r2, [r7]
	ldr	r3, [r6]
	add	r2, r2, #15
	add	r3, r3, r0, lsl #2
	str	r2, [sp, #4]
	str	r3, [sp]
	str	r1, [sp, #12]
	str	fp, [sp, #8]
	mov	r3, #20
	mov	r2, #12
	ldr	r1, [r8]
	ldr	r0, [r4]
	mov	lr, pc
	bx	r5
	cmp	r0, #0
	beq	.L23
	ldr	r2, .L67+40
	ldr	r3, [r2]
	cmp	r3, #5
	ble	.L62
.L23:
	ldr	r0, [r4]
	ldr	r1, [r8]
.L22:
	mov	lr, #5
	mov	ip, #10
	ldr	r3, [r9]
	ldr	r2, [r6]
	add	r3, r3, r3, lsl #2
	add	r3, r3, r2
	ldr	r2, [r7]
	add	r2, r2, #15
	stmib	sp, {r2, ip, lr}
	str	r3, [sp]
	mov	r2, #12
	mov	r3, #20
	mov	lr, pc
	bx	r5
	cmp	r0, #0
	beq	.L24
	ldr	r3, .L67+52
	ldrh	r2, [r3]
	cmp	r2, #992
	beq	.L63
.L24:
	mov	r1, #5
	mov	fp, #10
	ldr	r3, [r9]
	ldr	r0, [r6]
	ldr	r2, [r7]
	add	r3, r3, r3, lsl #1
	add	r3, r0, r3, lsl #1
	add	r2, r2, #15
	str	r3, [sp]
	str	r2, [sp, #4]
	str	r1, [sp, #12]
	str	fp, [sp, #8]
	mov	r3, #20
	mov	r2, #12
	ldr	r1, [r8]
	ldr	r0, [r4]
	mov	lr, pc
	bx	r5
	cmp	r0, #0
	beq	.L27
	ldr	r2, .L67+40
	ldr	r3, [r2]
	cmp	r3, #5
	ble	.L64
.L27:
	ldr	r0, [r4]
	ldr	r1, [r8]
.L26:
	mov	ip, #5
	mov	r2, #10
	ldr	r3, [r9]
	ldr	lr, [r7]
	ldr	r4, [r6]
	rsb	r3, r3, r3, lsl #3
	add	lr, lr, #15
	add	r3, r3, r4
	stm	sp, {r3, lr}
	str	r2, [sp, #8]
	mov	r3, #20
	mov	r2, #12
	str	ip, [sp, #12]
	mov	lr, pc
	bx	r5
	cmp	r0, #0
	beq	.L28
	ldr	r3, .L67+56
	ldrh	r2, [r3]
	cmp	r2, #992
	beq	.L65
.L28:
	ldrh	r3, [r10]
	ldr	r2, .L67+60
	cmp	r3, r2
	beq	.L66
.L6:
	add	sp, sp, #20
	@ sp needed
	pop	{r4, r5, r6, r7, r8, r9, r10, fp, lr}
	bx	lr
.L7:
	ldr	r2, .L67+64
	ldrh	r2, [r2, #48]
	tst	r2, #16
	addeq	r0, r0, #1
	streq	r0, [r4]
	b	.L9
.L10:
	ldr	r3, .L67+64
	ldrh	r3, [r3, #48]
	tst	r3, #32
	subeq	r0, r0, #1
	streq	r0, [r4]
	b	.L12
.L13:
	cmp	r0, #225
	movgt	r3, #224
	ldrgt	r2, .L67+12
	strgt	r3, [r4]
	strgt	r0, [r2]
	movgt	r0, r3
	b	.L14
.L64:
	mov	ip, #90
	mov	r3, #992
	mov	lr, #0
	mov	r1, ip
	str	ip, [r8]
	ldr	ip, .L67+44
	str	fp, [r4]
	strh	r3, [ip]	@ movhi
	str	lr, [r2]
	ldr	r4, .L67+48
	ldr	ip, .L67+52
	ldr	r2, .L67+56
	mov	r0, fp
	strh	r3, [r10]	@ movhi
	strh	r3, [r4]	@ movhi
	strh	r3, [ip]	@ movhi
	strh	r3, [r2]	@ movhi
	b	.L26
.L62:
	mov	ip, #90
	mov	r3, #992
	mov	lr, #0
	mov	r1, ip
	str	ip, [r8]
	ldr	ip, .L67+44
	str	lr, [r2]
	strh	r3, [ip]	@ movhi
	ldr	lr, .L67+52
	ldr	ip, .L67+48
	ldr	r2, .L67+56
	mov	r0, fp
	str	fp, [r4]
	strh	r3, [r10]	@ movhi
	strh	r3, [ip]	@ movhi
	strh	r3, [lr]	@ movhi
	strh	r3, [r2]	@ movhi
	b	.L22
.L59:
	mov	ip, #90
	mov	r3, #992
	mov	lr, #0
	mov	r1, ip
	str	ip, [r8]
	ldr	ip, .L67+44
	str	lr, [r2]
	strh	r3, [ip]	@ movhi
	ldr	lr, .L67+52
	ldr	ip, .L67+48
	ldr	r2, .L67+56
	mov	r0, fp
	str	fp, [r4]
	strh	r3, [r10]	@ movhi
	strh	r3, [ip]	@ movhi
	strh	r3, [lr]	@ movhi
	strh	r3, [r2]	@ movhi
	b	.L17
.L66:
	ldr	r4, .L67+44
	ldrh	r2, [r4]
	cmp	r2, r3
	bne	.L6
	ldr	r5, .L67+48
	ldrh	r3, [r5]
	cmp	r3, r2
	bne	.L6
	ldr	r6, .L67+52
	ldrh	r2, [r6]
	cmp	r2, r3
	bne	.L6
	ldr	r7, .L67+56
	ldrh	r3, [r7]
	cmp	r3, r2
	bne	.L6
	ldr	r9, .L67+40
	ldr	r3, [r9]
	cmp	r3, #5
	bne	.L6
	mov	r8, #992
	ldr	r2, .L67+68
	mov	r0, r8
	ldr	r3, .L67+72
	strh	r8, [r2]	@ movhi
	mov	lr, pc
	bx	r3
	ldr	r3, [r9]
	ldr	r0, .L67+76
	ldr	r1, .L67+80
	ldr	r2, .L67+84
	add	r3, r3, #1
	strh	r8, [r10]	@ movhi
	strh	r8, [r4]	@ movhi
	strh	r8, [r5]	@ movhi
	strh	r8, [r6]	@ movhi
	strh	r8, [r7]	@ movhi
	strh	r8, [r0]	@ movhi
	strh	r8, [r1]	@ movhi
	strh	r8, [r2]	@ movhi
	str	r3, [r9]
	b	.L6
.L61:
	ldr	r1, .L67+40
	ldr	r2, [r1]
	cmp	r2, #5
	ldrle	r0, .L67+68
	ldrhle	r0, [r0]
	addle	r2, r2, #1
	strle	r2, [r1]
	strhle	r0, [r3]	@ movhi
	b	.L20
.L65:
	ldr	r1, .L67+40
	ldr	r2, [r1]
	cmp	r2, #5
	ldrle	r0, .L67+68
	ldrhle	r0, [r0]
	addle	r2, r2, #1
	strle	r2, [r1]
	strhle	r0, [r3]	@ movhi
	b	.L28
.L58:
	ldr	r2, .L67+40
	ldr	r3, [r2]
	cmp	r3, #5
	ldrle	r1, .L67+68
	ldrhle	r1, [r1]
	addle	r3, r3, #1
	strle	r3, [r2]
	strhle	r1, [r10]	@ movhi
	b	.L15
.L63:
	ldr	r1, .L67+40
	ldr	r2, [r1]
	cmp	r2, #5
	ldrle	r0, .L67+68
	ldrhle	r0, [r0]
	addle	r2, r2, #1
	strle	r2, [r1]
	strhle	r0, [r3]	@ movhi
	b	.L24
.L60:
	ldr	r1, .L67+40
	ldr	r2, [r1]
	cmp	r2, #5
	ldrle	r0, .L67+68
	ldrhle	r0, [r0]
	addle	r2, r2, #1
	strle	r2, [r1]
	strhle	r0, [r3]	@ movhi
	b	.L19
.L68:
	.align	2
.L67:
	.word	oldButtons
	.word	dCol
	.word	buttons
	.word	dOldCol
	.word	gaRow
	.word	gaCol
	.word	dRow
	.word	collision
	.word	gameColor1
	.word	gaSpacing
	.word	winCounter
	.word	gameColor3
	.word	gameColor4
	.word	gameColor6
	.word	gameColor8
	.word	32736
	.word	67109120
	.word	bgColor
	.word	fillScreen
	.word	gameColor2
	.word	gameColor5
	.word	gameColor7
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
	ldr	r7, .L71
	ldrh	r3, [r7]
	sub	sp, sp, #20
	str	r3, [sp, #12]
	str	r3, [sp, #8]
	str	r3, [sp, #4]
	str	r3, [sp]
	ldr	r8, .L71+4
	ldr	r6, .L71+8
	ldr	r10, .L71+12
	ldr	r2, [r8]
	ldr	r1, [r6]
	ldr	r0, [r10]
	ldr	r5, .L71+16
	mov	lr, pc
	bx	r5
	ldr	r0, .L71+20
	ldr	r1, .L71+24
	ldr	r2, .L71+28
	ldr	r3, .L71+32
	ldrh	ip, [r0]
	ldrh	r0, [r1]
	ldrh	r1, [r2]
	ldrh	r2, [r3]
	ldr	r4, .L71+36
	str	ip, [sp, #12]
	str	r0, [sp, #8]
	str	r1, [sp, #4]
	str	r2, [sp]
	ldr	fp, .L71+40
	ldr	r3, .L71+44
	ldr	r2, [r8]
	ldr	r1, [r4]
	ldr	r0, [fp]
	ldrh	r3, [r3]
	mov	lr, pc
	bx	r5
	ldrh	r3, [r7]
	ldr	r2, [r8]
	str	r3, [sp, #4]
	str	r3, [sp]
	ldr	r9, .L71+48
	ldr	r1, [r6]
	ldr	r0, [r10]
	mov	lr, pc
	bx	r9
	ldr	ip, .L71+52
	ldr	r3, .L71+56
	ldr	r2, [r8]
	ldr	r1, [r4]
	ldr	r0, [fp]
	stm	sp, {r3, ip}
	mov	r3, #31
	ldr	r5, .L71+60
	mov	lr, pc
	bx	r9
	ldrh	r2, [r7]
	ldr	lr, [fp]
	ldr	r8, .L71+64
	ldr	r9, .L71+68
	ldr	ip, [r4]
	ldr	r3, [r5]
	str	r2, [sp]
	ldr	r4, .L71+72
	str	lr, [r10]
	str	ip, [r6]
	ldr	r1, [r8]
	lsl	r2, r3, #1
	ldr	r0, [r9]
	mov	lr, pc
	bx	r4
	ldr	r2, .L71+76
	ldrh	r1, [r2]
	ldr	r10, .L71+80
	ldr	fp, .L71+84
	ldr	r3, [r5]
	str	r1, [sp]
	lsl	r2, r3, #1
	ldr	r1, [r10]
	ldr	r0, [fp]
	ldr	r6, .L71+88
	mov	lr, pc
	bx	r4
	ldrh	r1, [r7]
	ldr	r3, [r5]
	ldr	ip, [r9]
	ldr	r0, [r6]
	str	r1, [sp]
	lsl	r2, r3, #1
	ldr	r1, [r8]
	add	r0, ip, r0
	mov	lr, pc
	bx	r4
	ldr	r2, .L71+92
	ldrh	r1, [r2]
	ldr	r3, [r5]
	ldr	ip, [fp]
	ldr	r0, [r6]
	str	r1, [sp]
	lsl	r2, r3, #1
	ldr	r1, [r10]
	add	r0, ip, r0
	mov	lr, pc
	bx	r4
	ldrh	r1, [r7]
	ldr	r3, [r5]
	ldr	ip, [r6]
	ldr	r0, [r9]
	str	r1, [sp]
	lsl	r2, r3, #1
	ldr	r1, [r8]
	add	r0, r0, ip, lsl #1
	mov	lr, pc
	bx	r4
	ldr	r2, .L71+96
	ldrh	r1, [r2]
	ldr	ip, [r6]
	ldr	r3, [r5]
	ldr	r0, [fp]
	str	r1, [sp]
	add	r0, r0, ip, lsl #1
	ldr	r1, [r10]
	lsl	r2, r3, #1
	mov	lr, pc
	bx	r4
	ldrh	r1, [r7]
	ldr	r2, [r6]
	ldr	r3, [r5]
	ldr	r0, [r9]
	str	r1, [sp]
	add	r2, r2, r2, lsl #1
	ldr	r1, [r8]
	add	r0, r2, r0
	lsl	r2, r3, #1
	mov	lr, pc
	bx	r4
	ldr	r1, .L71+100
	ldrh	r1, [r1]
	ldr	r2, [r6]
	ldr	r3, [r5]
	ldr	r0, [fp]
	str	r1, [sp]
	add	r2, r2, r2, lsl #1
	ldr	r1, [r10]
	add	r0, r2, r0
	lsl	r2, r3, #1
	mov	lr, pc
	bx	r4
	ldrh	r1, [r7]
	ldr	r3, [r5]
	ldr	ip, [r6]
	ldr	r0, [r9]
	str	r1, [sp]
	lsl	r2, r3, #1
	ldr	r1, [r8]
	add	r0, r0, ip, lsl #2
	mov	lr, pc
	bx	r4
	ldr	r2, .L71+104
	ldrh	r1, [r2]
	ldr	ip, [r6]
	ldr	r3, [r5]
	ldr	r0, [fp]
	str	r1, [sp]
	add	r0, r0, ip, lsl #2
	ldr	r1, [r10]
	lsl	r2, r3, #1
	mov	lr, pc
	bx	r4
	ldrh	r1, [r7]
	ldr	r2, [r6]
	ldr	r3, [r5]
	ldr	r0, [r9]
	str	r1, [sp]
	add	r2, r2, r2, lsl #2
	ldr	r1, [r8]
	add	r0, r2, r0
	lsl	r2, r3, #1
	mov	lr, pc
	bx	r4
	ldr	r1, .L71+108
	ldrh	r1, [r1]
	ldr	r2, [r6]
	ldr	r3, [r5]
	ldr	r0, [fp]
	str	r1, [sp]
	add	r2, r2, r2, lsl #2
	ldr	r1, [r10]
	add	r0, r2, r0
	lsl	r2, r3, #1
	mov	lr, pc
	bx	r4
	ldrh	r1, [r7]
	ldr	r2, [r6]
	ldr	r3, [r5]
	ldr	r0, [r9]
	str	r1, [sp]
	add	r2, r2, r2, lsl #1
	ldr	r1, [r8]
	add	r0, r0, r2, lsl #1
	lsl	r2, r3, #1
	mov	lr, pc
	bx	r4
	ldr	r1, .L71+112
	ldrh	r1, [r1]
	ldr	r2, [r6]
	ldr	r3, [r5]
	ldr	r0, [fp]
	str	r1, [sp]
	add	r2, r2, r2, lsl #1
	ldr	r1, [r10]
	add	r0, r0, r2, lsl #1
	lsl	r2, r3, #1
	mov	lr, pc
	bx	r4
	ldrh	r1, [r7]
	ldr	r2, [r6]
	ldr	r3, [r5]
	ldr	r0, [r9]
	str	r1, [sp]
	rsb	r2, r2, r2, lsl #3
	ldr	r1, [r8]
	add	r0, r2, r0
	lsl	r2, r3, #1
	mov	lr, pc
	bx	r4
	ldr	r1, .L71+116
	ldrh	r1, [r1]
	ldr	r2, [r6]
	ldr	r3, [r5]
	ldr	r0, [fp]
	str	r1, [sp]
	rsb	r2, r2, r2, lsl #3
	ldr	r1, [r10]
	add	r0, r2, r0
	lsl	r2, r3, #1
	mov	lr, pc
	bx	r4
	ldr	r2, [fp]
	ldr	r3, [r10]
	str	r2, [r9]
	str	r3, [r8]
	add	sp, sp, #20
	@ sp needed
	pop	{r4, r5, r6, r7, r8, r9, r10, fp, lr}
	bx	lr
.L72:
	.align	2
.L71:
	.word	bgColor
	.word	dSize
	.word	dOldRow
	.word	dOldCol
	.word	drawDragon
	.word	dEyeColor
	.word	dEyeEdge
	.word	dTummy
	.word	dEdge
	.word	dRow
	.word	dCol
	.word	dColor
	.word	drawDragonFire
	.word	32767
	.word	1023
	.word	gaSize
	.word	gaOldRow
	.word	gaOldCol
	.word	drawSq
	.word	gameColor1
	.word	gaRow
	.word	gaCol
	.word	gaSpacing
	.word	gameColor2
	.word	gameColor3
	.word	gameColor4
	.word	gameColor5
	.word	gameColor6
	.word	gameColor7
	.word	gameColor8
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
	push	{r3, r4, r5, r6, r7, r8, r9, r10, fp, lr}
	mov	r6, #0
	ldr	r3, .L86
	mov	r4, r6
	mov	lr, pc
	bx	r3
	ldr	r7, .L86+4
	ldr	fp, .L86+8
	ldr	r5, .L86+12
	ldr	r10, .L86+16
	ldr	r9, .L86+20
	ldr	r8, .L86+24
.L78:
	cmp	r6, #1
	addne	r4, r4, #1
	bne	.L77
	b	.L84
.L85:
	cmp	r4, #0
	bne	.L78
	mov	r4, #1
.L77:
	mov	r6, #0
	ldr	r3, [r7]
	add	r3, r3, #1
	str	r3, [r7]
.L75:
	ldrh	r3, [r5]
	strh	r3, [fp]	@ movhi
	ldr	r3, .L86+28
	ldrh	r3, [r3, #48]
	strh	r3, [r5]	@ movhi
	mov	lr, pc
	bx	r10
	mov	lr, pc
	bx	r9
	mov	lr, pc
	bx	r8
	cmp	r4, #150
	mov	r3, #149
	bne	.L85
.L76:
	ldr	r1, [r7]
	sub	r1, r1, #1
	mov	r4, r3
	mov	r6, #1
	str	r1, [r7]
	b	.L75
.L84:
	sub	r3, r4, #1
	b	.L76
.L87:
	.align	2
.L86:
	.word	initialize
	.word	gaRow
	.word	oldButtons
	.word	buttons
	.word	update
	.word	waitForVBlank
	.word	draw
	.word	67109120
	.size	main, .-main
	.comm	gameColor8,2,2
	.comm	gameColor7,2,2
	.comm	gameColor6,2,2
	.comm	gameColor5,2,2
	.comm	gameColor4,2,2
	.comm	gameColor3,2,2
	.comm	gameColor2,2,2
	.comm	gameColor1,2,2
	.comm	winCounter,4,4
	.comm	gaSpacing,4,4
	.comm	gaRDel,4,4
	.comm	gaOldCol,4,4
	.comm	gaOldRow,4,4
	.comm	gaSize,4,4
	.comm	gaRow,4,4
	.comm	gaCol,4,4
	.comm	dEyeColor,2,2
	.comm	dEyeEdge,2,2
	.comm	dTummy,2,2
	.comm	dEdge,2,2
	.comm	dColor,2,2
	.comm	dRDel,4,4
	.comm	dOldCol,4,4
	.comm	dOldRow,4,4
	.comm	dSize,4,4
	.comm	dRow,4,4
	.comm	dCol,4,4
	.comm	bgColor,2,2
	.comm	oldButtons,2,2
	.comm	buttons,2,2
	.ident	"GCC: (devkitARM release 53) 9.1.0"
