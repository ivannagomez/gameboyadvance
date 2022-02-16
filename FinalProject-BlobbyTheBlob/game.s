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
	.file	"game.c"
	.text
	.align	2
	.arch armv4t
	.syntax unified
	.arm
	.fpu softvfp
	.type	drawPlayer.part.0, %function
drawPlayer.part.0:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	ldr	r0, .L4
	ldr	r2, .L4+4
	ldr	r3, [r0, #4]
	ldr	r1, [r2]
	ldr	r2, .L4+8
	str	lr, [sp, #-4]!
	ldr	ip, [r0, #28]
	ldr	lr, [r2]
	sub	r3, r3, r1
	ldr	r2, [r0, #20]
	ldr	r1, [r0]
	lsl	r3, r3, #23
	ldr	r0, .L4+12
	sub	r1, r1, lr
	lsr	r3, r3, #23
	add	r2, r2, ip, lsl #5
	orr	r3, r3, #16384
	and	r1, r1, #255
	lsl	r2, r2, #1
	strh	r3, [r0, #2]	@ movhi
	strh	r1, [r0]	@ movhi
	strh	r2, [r0, #4]	@ movhi
	ldr	lr, [sp], #4
	bx	lr
.L5:
	.align	2
.L4:
	.word	blob
	.word	hOff
	.word	vOff
	.word	shadowOAM
	.size	drawPlayer.part.0, .-drawPlayer.part.0
	.align	2
	.syntax unified
	.arm
	.fpu softvfp
	.type	updateBullet.part.0, %function
updateBullet.part.0:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	ldr	r3, [r0]
	ldr	r2, [r0, #16]
	add	r3, r3, r2
	cmp	r3, #0
	ble	.L7
	ldr	r2, [r0, #4]
	ldr	r3, [r0, #12]
	add	r3, r2, r3
	sub	r3, r3, #1
	cmp	r3, #237
	bls	.L9
.L7:
	mov	r3, #0
	str	r3, [r0, #24]
	bx	lr
.L9:
	add	r2, r2, #1
	str	r2, [r0, #4]
	bx	lr
	.size	updateBullet.part.0, .-updateBullet.part.0
	.align	2
	.syntax unified
	.arm
	.fpu softvfp
	.type	drawCheat.part.0, %function
drawCheat.part.0:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	ldr	r0, .L11
	ldrb	r2, [r0]	@ zero_extendqisi2
	mvn	r2, r2, lsl #17
	mvn	r2, r2, lsr #17
	ldr	r3, [r0, #4]
	ldr	r1, .L11+4
	ldr	r0, [r0, #32]
	lsl	r3, r3, #23
	add	ip, r1, #272
	lsr	r3, r3, #23
	add	r1, r1, #276
	add	r0, r0, #384
	strh	r2, [ip]	@ movhi
	strh	r3, [ip, #2]	@ movhi
	strh	r0, [r1]	@ movhi
	bx	lr
.L12:
	.align	2
.L11:
	.word	cheat
	.word	shadowOAM
	.size	drawCheat.part.0, .-drawCheat.part.0
	.align	2
	.global	initGame
	.syntax unified
	.arm
	.fpu softvfp
	.type	initGame, %function
initGame:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	mov	r2, #0
	push	{r4, r5, r6, r7, r8, r9, r10, lr}
	mov	lr, #1
	mov	r4, #16
	mov	r10, #10
	mov	r9, #60
	mov	r8, #3
	mov	r7, #2560
	mov	r6, #9
	mov	r5, #5
	mov	r0, #4
	mov	r1, #6
	ldr	r3, .L19
	str	r2, [r3]
	ldr	r3, .L19+4
	str	r2, [r3]
	ldr	r3, .L19+8
	str	r2, [r3]
	ldr	r3, .L19+12
	str	r2, [r3, #16]
	str	r2, [r3, #28]
	str	r2, [r3, #20]
	str	r2, [r3, #48]
	str	r10, [r3]
	str	r9, [r3, #4]
	str	r8, [r3, #32]
	str	r7, [r3, #52]
	str	r4, [r3, #12]
	str	r4, [r3, #8]
	str	lr, [r3, #36]
	str	lr, [r3, #40]
	str	lr, [r3, #56]
	ldr	r3, .L19+16
	mov	ip, r2
	str	r6, [r3]
	ldr	r2, .L19+20
	ldr	r3, .L19+24
	str	r5, [r2]
	add	r2, r3, #140
.L14:
	str	r0, [r3, #16]
	str	r1, [r3, #20]
	str	ip, [r3, #24]
	add	r3, r3, #28
	cmp	r3, r2
	bne	.L14
	mov	r1, #16
	mov	r5, #119
	mov	r2, #0
	mov	r0, #4
	mov	ip, #1
	ldr	r3, .L19+28
	ldr	lr, .L19+32
	add	r4, r3, #220
.L15:
	str	r1, [r3, #8]
	str	r1, [r3, #12]
	str	r2, [r3, #24]
	str	r0, [r3, #28]
	str	r2, [r3, #20]
	str	r2, [r3, #16]
	str	ip, [r3, #32]
	str	r2, [r3, #36]
	stm	r3, {r5, lr}
	add	r3, r3, #44
	cmp	r3, r4
	bne	.L15
	mov	r4, #6
	mov	r1, #90
	ldr	r3, .L19+36
	str	r4, [r3, #20]
	str	lr, [r3, #4]
	str	r0, [r3, #16]
	str	ip, [r3, #8]
	str	ip, [r3, #12]
	str	r2, [r3, #40]
	str	r2, [r3, #24]
	str	r2, [r3, #32]
	str	r0, [r3, #36]
	str	r1, [r3]
	pop	{r4, r5, r6, r7, r8, r9, r10, lr}
	bx	lr
.L20:
	.align	2
.L19:
	.word	vOff
	.word	loserState
	.word	score
	.word	blob
	.word	hOff
	.word	bCounter
	.word	bullets
	.word	doggo
	.word	498
	.word	cheat
	.size	initGame, .-initGame
	.align	2
	.global	initPlayer
	.syntax unified
	.arm
	.fpu softvfp
	.type	initPlayer, %function
initPlayer:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, lr}
	mov	r2, #0
	mov	r1, #1
	mov	r0, #16
	mov	r5, #10
	mov	r4, #60
	mov	lr, #3
	mov	ip, #2560
	ldr	r3, .L23
	str	r5, [r3]
	str	r4, [r3, #4]
	str	lr, [r3, #32]
	str	r0, [r3, #12]
	str	r0, [r3, #8]
	str	ip, [r3, #52]
	str	r1, [r3, #36]
	str	r1, [r3, #40]
	str	r1, [r3, #56]
	str	r2, [r3, #16]
	str	r2, [r3, #28]
	str	r2, [r3, #20]
	str	r2, [r3, #48]
	pop	{r4, r5, lr}
	bx	lr
.L24:
	.align	2
.L23:
	.word	blob
	.size	initPlayer, .-initPlayer
	.global	__aeabi_idivmod
	.align	2
	.global	animatePlayer
	.syntax unified
	.arm
	.fpu softvfp
	.type	animatePlayer, %function
animatePlayer:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	mov	r1, #4
	push	{r4, r5, r6, lr}
	ldr	r4, .L38
	ldr	r3, .L38+4
	ldr	r5, [r4, #16]
	smull	r0, r2, r3, r5
	asr	r3, r5, #31
	rsb	r3, r3, r2, asr #3
	ldr	r6, [r4, #20]
	add	r3, r3, r3, lsl #2
	cmp	r5, r3, lsl #2
	str	r6, [r4, #24]
	str	r1, [r4, #20]
	bne	.L26
	ldr	r0, [r4, #28]
	ldr	r3, .L38+8
	ldr	r1, [r4, #32]
	add	r0, r0, #1
	mov	lr, pc
	bx	r3
	str	r1, [r4, #28]
.L26:
	ldr	r3, .L38+12
	ldrh	r3, [r3, #48]
	tst	r3, #64
	moveq	r3, #1
	streq	r3, [r4, #20]
	ldr	r3, .L38+12
	ldrh	r3, [r3, #48]
	ands	r3, r3, #128
	streq	r3, [r4, #20]
	ldr	r3, .L38+12
	ldrh	r2, [r3, #48]
	tst	r2, #32
	bne	.L29
	mov	r2, #3
	ldrh	r3, [r3, #48]
	tst	r3, #16
	str	r2, [r4, #20]
	bne	.L31
.L32:
	mov	r3, #2
	str	r3, [r4, #20]
.L31:
	add	r5, r5, #1
	str	r5, [r4, #16]
	pop	{r4, r5, r6, lr}
	bx	lr
.L29:
	ldrh	r3, [r3, #48]
	tst	r3, #16
	beq	.L32
	ldr	r3, [r4, #20]
	cmp	r3, #4
	bne	.L31
	mov	r3, #0
	str	r6, [r4, #20]
	str	r3, [r4, #28]
	str	r3, [r4, #16]
	pop	{r4, r5, r6, lr}
	bx	lr
.L39:
	.align	2
.L38:
	.word	blob
	.word	1717986919
	.word	__aeabi_idivmod
	.word	67109120
	.size	animatePlayer, .-animatePlayer
	.align	2
	.global	drawPlayer
	.syntax unified
	.arm
	.fpu softvfp
	.type	drawPlayer, %function
drawPlayer:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	ldr	r3, .L44
	ldr	r3, [r3, #44]
	cmp	r3, #0
	beq	.L41
	ldr	r2, .L44+4
	ldrh	r3, [r2]
	orr	r3, r3, #512
	strh	r3, [r2]	@ movhi
	bx	lr
.L41:
	b	drawPlayer.part.0
.L45:
	.align	2
.L44:
	.word	blob
	.word	shadowOAM
	.size	drawPlayer, .-drawPlayer
	.align	2
	.global	initBullets
	.syntax unified
	.arm
	.fpu softvfp
	.type	initBullets, %function
initBullets:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	mov	ip, #4
	mov	r0, #6
	mov	r1, #0
	ldr	r3, .L50
	add	r2, r3, #140
.L47:
	str	ip, [r3, #16]
	str	r0, [r3, #20]
	str	r1, [r3, #24]
	add	r3, r3, #28
	cmp	r3, r2
	bne	.L47
	bx	lr
.L51:
	.align	2
.L50:
	.word	bullets
	.size	initBullets, .-initBullets
	.align	2
	.global	fireBullet
	.syntax unified
	.arm
	.fpu softvfp
	.type	fireBullet, %function
fireBullet:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	ldr	r0, .L64
	ldr	r1, [r0]
	cmp	r1, #0
	bxle	lr
	push	{r4, r5, r6, r7, r8, lr}
	ldr	lr, .L64+4
	ldr	r3, [lr, #56]
	cmp	r3, #1
	beq	.L62
.L52:
	pop	{r4, r5, r6, r7, r8, lr}
	bx	lr
.L62:
	ldr	r4, .L64+8
	mov	r3, #0
	mov	r2, r4
.L56:
	ldr	ip, [r2, #24]
	cmp	ip, #0
	beq	.L63
	add	r3, r3, #1
	cmp	r3, #5
	add	r2, r2, #28
	bne	.L56
	pop	{r4, r5, r6, r7, r8, lr}
	bx	lr
.L63:
	mov	r6, #1
	ldr	r2, [lr, #8]
	rsb	r3, r3, r3, lsl #3
	add	ip, r4, r3, lsl #2
	ldr	r5, .L64+12
	add	r8, r2, r2, lsr #31
	ldr	r2, [ip, #20]
	sub	r1, r1, #1
	ldr	r7, [r5]
	add	r5, r2, r2, lsr #31
	ldr	r2, [lr]
	str	r1, [r0]
	cmp	r1, #0
	ldr	r1, [lr, #4]
	add	r2, r2, r8, asr r6
	sub	r2, r2, r5, asr r6
	sub	r1, r1, r7
	str	r2, [r4, r3, lsl #2]
	str	r1, [ip, #4]
	str	r6, [ip, #12]
	str	r6, [ip, #24]
	ldreq	r3, .L64+16
	ldreq	r2, .L64+20
	streq	r6, [r3, #40]
	streq	r2, [r3, #4]
	b	.L52
.L65:
	.align	2
.L64:
	.word	bCounter
	.word	blob
	.word	bullets
	.word	hOff
	.word	cheat
	.word	498
	.size	fireBullet, .-fireBullet
	.align	2
	.global	updatePlayer
	.syntax unified
	.arm
	.fpu softvfp
	.type	updatePlayer, %function
updatePlayer:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	ldr	r3, .L106
	ldrh	r3, [r3, #48]
	tst	r3, #32
	push	{r4, r5, r6, lr}
	ldr	r4, .L106+4
	bne	.L67
	ldr	r3, [r4, #4]
	ldr	r2, .L106+8
	sub	r1, r3, #51
	cmp	r1, r2
	bhi	.L69
	ldr	r1, .L106+12
	ldr	r0, [r4, #40]
	ldr	r2, [r1]
	sub	r3, r3, r0
	cmp	r2, #0
	str	r3, [r4, #4]
	ble	.L69
	sub	r3, r3, r2
	cmp	r3, #120
	suble	r2, r2, r0
	strle	r2, [r1]
.L69:
	mov	r3, #0
	str	r3, [r4, #56]
.L67:
	ldr	r3, .L106
	ldrh	r3, [r3, #48]
	tst	r3, #16
	bne	.L71
	ldr	r2, [r4, #4]
	ldr	r3, [r4, #12]
	ldr	r1, .L106+16
	add	r3, r2, r3
	cmp	r3, r1
	bgt	.L73
	ldr	r1, .L106+12
	ldr	ip, .L106+20
	ldr	r0, [r1]
	ldr	r3, [r4, #40]
	cmp	r0, ip
	add	r2, r2, r3
	addle	r3, r3, r0
	str	r2, [r4, #4]
	strle	r3, [r1]
.L73:
	mov	r3, #1
	str	r3, [r4, #56]
.L71:
	ldr	r3, .L106
	ldrh	r3, [r3, #48]
	tst	r3, #64
	bne	.L75
	ldr	r3, [r4]
	cmp	r3, #0
	ldrgt	r2, [r4, #36]
	subgt	r3, r3, r2
	strgt	r3, [r4]
.L75:
	ldr	r3, .L106
	ldrh	r3, [r3, #48]
	tst	r3, #128
	bne	.L76
	ldr	r3, [r4]
	cmp	r3, #159
	ldrle	r2, [r4, #36]
	addle	r3, r2, r3
	strle	r3, [r4]
.L76:
	ldr	r6, .L106+24
	ldrh	r3, [r6]
	tst	r3, #1
	beq	.L77
	ldr	r3, .L106+28
	ldrh	r2, [r3]
	ands	r5, r2, #1
	beq	.L105
.L77:
	ldr	r1, [r4, #36]
	ldr	r0, [r4, #52]
	add	r2, r1, r0
	cmp	r2, #30720
	asr	r3, r2, #8
	bge	.L78
	ldrh	r0, [r6]
	add	r1, r1, #111
	tst	r0, #2
	str	r1, [r4, #36]
	str	r2, [r4, #52]
	ldr	r0, [r4, #48]
	bne	.L79
.L80:
	ldr	r3, [r4, #52]
	ldr	r1, [r4, #4]
	ldr	r2, [r4, #12]
	asr	r3, r3, #8
	cmp	r0, #0
	str	r3, [r4]
	add	r2, r1, r2
	beq	.L86
.L85:
	sub	r3, r3, #1
	rsb	r0, r3, r3, lsl #5
	add	r3, r3, r0, lsl #3
	add	r1, r1, r3, lsl #1
	ldr	r0, .L106+32
	lsl	r1, r1, #1
	ldrh	r1, [r0, r1]
	cmp	r1, #0
	lsl	r3, r3, #1
	beq	.L87
	add	r3, r3, r2
	add	r3, r0, r3, lsl #1
	ldrh	r3, [r3, #-2]
	cmp	r3, #0
	bne	.L86
.L87:
	mov	r3, #0
	str	r3, [r4, #48]
.L86:
	ldr	r3, .L106+16
	cmp	r2, r3
	mvneq	r2, #0
	ldreq	r3, .L106+36
	pop	{r4, r5, r6, lr}
	streq	r2, [r3]
	b	animatePlayer
.L79:
	ldr	r2, .L106+28
	ldrh	r2, [r2]
	tst	r2, #2
	bne	.L80
	cmp	r0, #0
	beq	.L82
	ldr	r1, [r4, #4]
	ldr	r2, [r4, #12]
	str	r3, [r4]
	add	r2, r1, r2
	b	.L85
.L78:
	mov	r2, #0
	mov	r3, #111
	ldrh	r1, [r6]
	tst	r1, #2
	str	r2, [r4, #48]
	str	r3, [r4, #36]
	beq	.L103
	ldr	r3, .L106+28
	ldrh	r3, [r3]
	tst	r3, #2
	bne	.L103
.L82:
	ldr	r3, .L106+40
	mov	r2, #0
	ldr	r1, [r3]
	ldr	r0, .L106+44
	ldr	r3, .L106+48
	mov	lr, pc
	bx	r3
	mov	ip, #1
	ldr	r0, [r4, #36]
	ldr	r3, [r4, #52]
	ldr	r1, [r4, #4]
	ldr	r2, [r4, #12]
	sub	r0, r0, #1600
	asr	r3, r3, #8
	str	r0, [r4, #36]
	str	r3, [r4]
	str	ip, [r4, #48]
	add	r2, r1, r2
	b	.L85
.L103:
	ldr	r1, [r4, #4]
	ldr	r2, [r4, #12]
	asr	r3, r0, #8
	str	r3, [r4]
	add	r2, r1, r2
	b	.L86
.L105:
	bl	fireBullet
	ldr	r3, .L106+52
	mov	r2, r5
	ldr	r1, [r3]
	ldr	r0, .L106+56
	ldr	r3, .L106+48
	mov	lr, pc
	bx	r3
	b	.L77
.L107:
	.align	2
.L106:
	.word	67109120
	.word	blob
	.word	446
	.word	hOff
	.word	497
	.word	257
	.word	oldButtons
	.word	buttons
	.word	collisionmapBitmap
	.word	loserState
	.word	jumpSfx_length
	.word	jumpSfx_data
	.word	playSoundB
	.word	dripdrip_length
	.word	dripdrip_data
	.size	updatePlayer, .-updatePlayer
	.align	2
	.global	updateBullet
	.syntax unified
	.arm
	.fpu softvfp
	.type	updateBullet, %function
updateBullet:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	ldr	r3, [r0, #24]
	cmp	r3, #0
	bxeq	lr
	b	updateBullet.part.0
	.size	updateBullet, .-updateBullet
	.align	2
	.global	drawBullet
	.syntax unified
	.arm
	.fpu softvfp
	.type	drawBullet, %function
drawBullet:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, lr}
	mov	r5, #512
	mov	r4, #8
	ldr	r3, .L116
	ldr	r2, .L116+4
	ldr	lr, .L116+8
	add	r0, r3, #140
.L113:
	ldr	r1, [r3, #24]
	cmp	r1, #0
	ldrne	r1, [r3, #4]
	ldrbne	ip, [r3]	@ zero_extendqisi2
	andne	r1, r1, lr
	add	r3, r3, #28
	strhne	r4, [r2, #60]	@ movhi
	strhne	r1, [r2, #58]	@ movhi
	strhne	ip, [r2, #56]	@ movhi
	strheq	r5, [r2, #56]	@ movhi
	cmp	r3, r0
	add	r2, r2, #8
	bne	.L113
	pop	{r4, r5, lr}
	bx	lr
.L117:
	.align	2
.L116:
	.word	bullets
	.word	shadowOAM
	.word	511
	.size	drawBullet, .-drawBullet
	.align	2
	.global	drawAmount
	.syntax unified
	.arm
	.fpu softvfp
	.type	drawAmount, %function
drawAmount:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	str	lr, [sp, #-4]!
	mov	lr, #21
	mov	r1, #5
	mov	ip, #37
	ldr	r3, .L120
	ldr	r3, [r3]
	add	r3, r3, #1
	lsl	r3, r3, lr
	ldr	r2, .L120+4
	lsr	r3, r3, #16
	add	r0, r3, #8
	strh	r0, [r2, #252]	@ movhi
	strh	r1, [r2, #250]	@ movhi
	add	r0, r3, #10
	add	r1, r2, #260
	strh	r0, [r1]	@ movhi
	add	r3, r3, #12
	ldr	r1, .L120+8
	add	r0, r2, #268
	strh	r3, [r0]	@ movhi
	add	r0, r2, #256
	add	r3, r2, #264
	strh	lr, [r0, #2]	@ movhi
	strh	r1, [r0]	@ movhi
	strh	r1, [r2, #248]	@ movhi
	strh	r1, [r3]	@ movhi
	strh	ip, [r3, #2]	@ movhi
	ldr	lr, [sp], #4
	bx	lr
.L121:
	.align	2
.L120:
	.word	bCounter
	.word	shadowOAM
	.word	16389
	.size	drawAmount, .-drawAmount
	.align	2
	.global	initCheat
	.syntax unified
	.arm
	.fpu softvfp
	.type	initCheat, %function
initCheat:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	mov	r0, #4
	str	lr, [sp, #-4]!
	mov	r2, #0
	mov	lr, #6
	mov	r1, #1
	mov	ip, #90
	ldr	r3, .L124
	str	r0, [r3, #16]
	str	r0, [r3, #36]
	ldr	r0, .L124+4
	str	lr, [r3, #20]
	stmib	r3, {r0, r1}
	str	ip, [r3]
	str	r1, [r3, #12]
	str	r2, [r3, #40]
	str	r2, [r3, #24]
	str	r2, [r3, #32]
	ldr	lr, [sp], #4
	bx	lr
.L125:
	.align	2
.L124:
	.word	cheat
	.word	498
	.size	initCheat, .-initCheat
	.align	2
	.global	launchCheat
	.syntax unified
	.arm
	.fpu softvfp
	.type	launchCheat, %function
launchCheat:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	ldr	r3, .L128
	ldr	r3, [r3]
	cmp	r3, #0
	moveq	r1, #1
	ldreq	r3, .L128+4
	ldreq	r2, .L128+8
	streq	r1, [r3, #40]
	streq	r2, [r3, #4]
	bx	lr
.L129:
	.align	2
.L128:
	.word	bCounter
	.word	cheat
	.word	498
	.size	launchCheat, .-launchCheat
	.align	2
	.global	updateCheat
	.syntax unified
	.arm
	.fpu softvfp
	.type	updateCheat, %function
updateCheat:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, lr}
	ldr	r4, .L143
	ldr	r3, [r4, #40]
	cmp	r3, #1
	sub	sp, sp, #20
	beq	.L142
.L130:
	add	sp, sp, #20
	@ sp needed
	pop	{r4, r5, lr}
	bx	lr
.L142:
	ldr	r2, [r4, #4]
	cmp	r2, #0
	movle	r3, #0
	ldr	r1, .L143+4
	strle	r3, [r4, #40]
	ldr	r3, .L143+8
	ldr	r0, [r1]
	ldr	lr, [r3, #8]
	ldr	ip, [r3, #12]
	ldm	r3, {r1, r3}
	subgt	r2, r2, #1
	strgt	r2, [r4, #4]
	stmib	sp, {r1, ip, lr}
	str	r3, [sp]
	ldr	r1, [r4]
	ldr	r3, [r4, #16]
	add	r0, r2, r0
	ldr	r5, .L143+12
	ldr	r2, [r4, #20]
	mov	lr, pc
	bx	r5
	cmp	r0, #0
	movne	r2, #5
	movne	r1, #0
	ldrne	r3, .L143+16
	strne	r2, [r3]
	ldr	r2, [r4, #24]
	ldr	r3, .L143+20
	add	r2, r2, #1
	strne	r1, [r4, #40]
	smull	r0, r1, r3, r2
	asr	r3, r2, #31
	rsb	r3, r3, r1, asr #2
	add	r3, r3, r3, lsl #2
	subs	r3, r2, r3, lsl #1
	str	r2, [r4, #24]
	bne	.L130
	add	r1, r4, #32
	ldm	r1, {r1, r2}
	sub	r2, r2, #1
	cmp	r1, r2
	addlt	r1, r1, #1
	strlt	r1, [r4, #32]
	strge	r3, [r4, #32]
	add	sp, sp, #20
	@ sp needed
	pop	{r4, r5, lr}
	bx	lr
.L144:
	.align	2
.L143:
	.word	cheat
	.word	hOff
	.word	blob
	.word	collision
	.word	bCounter
	.word	1717986919
	.size	updateCheat, .-updateCheat
	.align	2
	.global	drawCheat
	.syntax unified
	.arm
	.fpu softvfp
	.type	drawCheat, %function
drawCheat:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	ldr	r3, .L148
	ldr	r3, [r3, #40]
	cmp	r3, #1
	beq	.L147
	mov	r2, #512
	ldr	r3, .L148+4
	strh	r2, [r3]	@ movhi
	bx	lr
.L147:
	b	drawCheat.part.0
.L149:
	.align	2
.L148:
	.word	cheat
	.word	shadowOAM+272
	.size	drawCheat, .-drawCheat
	.align	2
	.global	initDoggo
	.syntax unified
	.arm
	.fpu softvfp
	.type	initDoggo, %function
initDoggo:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, lr}
	mov	r1, #16
	mov	r5, #119
	mov	r2, #0
	mov	r4, #4
	mov	lr, #1
	ldr	r3, .L154
	ldr	ip, .L154+4
	add	r0, r3, #220
.L151:
	str	r1, [r3, #8]
	str	r1, [r3, #12]
	str	r2, [r3, #24]
	str	r4, [r3, #28]
	str	r2, [r3, #20]
	str	r2, [r3, #16]
	str	lr, [r3, #32]
	str	r2, [r3, #36]
	stm	r3, {r5, ip}
	add	r3, r3, #44
	cmp	r3, r0
	bne	.L151
	pop	{r4, r5, lr}
	bx	lr
.L155:
	.align	2
.L154:
	.word	doggo
	.word	498
	.size	initDoggo, .-initDoggo
	.align	2
	.global	updateDoggo
	.syntax unified
	.arm
	.fpu softvfp
	.type	updateDoggo, %function
updateDoggo:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, r7, r8, r9, r10, fp, lr}
	ldr	r3, .L179
	mov	r5, r0
	sub	sp, sp, #20
	mov	r0, #250
	mov	lr, pc
	bx	r3
	cmp	r0, #1
	streq	r0, [r5, #36]
	beq	.L158
	ldr	r3, [r5, #36]
	cmp	r3, #0
	bne	.L158
.L156:
	add	sp, sp, #20
	@ sp needed
	pop	{r4, r5, r6, r7, r8, r9, r10, fp, lr}
	bx	lr
.L158:
	ldr	r3, [r5, #4]
	cmp	r3, #1
	ble	.L160
	sub	r3, r3, #1
	cmp	r3, #2
	moveq	r2, #0
	str	r3, [r5, #4]
	addeq	r3, r3, #496
	streq	r2, [r5, #36]
	streq	r3, [r5, #4]
.L160:
	mov	r10, #0
	ldr	r4, .L179+4
	ldr	r1, [r5]
	ldr	r2, [r5, #12]
	ldr	r3, [r5, #8]
	ldr	r7, .L179+8
	ldr	r8, .L179+12
	ldr	r9, .L179+16
	add	r6, r4, #140
.L163:
	ldr	r0, [r4, #24]
	cmp	r0, #0
	bne	.L178
.L161:
	add	r4, r4, #28
	cmp	r4, r6
	bne	.L163
	ldr	r0, [r5, #32]
	cmp	r0, #0
	movle	lr, #1
	movle	r4, #0
	ldrle	ip, .L179+20
	strle	ip, [r5, #4]
	movle	r0, ip
	ldr	ip, .L179+24
	strle	lr, [r5, #32]
	ldr	lr, [ip, #8]
	strle	r4, [r5, #36]
	ldrgt	r0, [r5, #4]
	ldr	r4, [ip, #12]
	str	lr, [sp, #12]
	ldr	lr, [ip]
	ldr	ip, [ip, #4]
	str	r4, [sp, #8]
	stm	sp, {ip, lr}
	mov	lr, pc
	bx	r7
	cmp	r0, #0
	movne	r2, #1
	ldrne	r3, .L179+28
	strne	r2, [r3]
	ldr	r2, [r5, #16]
	ldr	r3, .L179+32
	add	r2, r2, #1
	smull	r0, r1, r3, r2
	asr	r3, r2, #31
	rsb	r3, r3, r1, asr #3
	add	r3, r3, r3, lsl #2
	subs	r3, r2, r3, lsl #2
	str	r2, [r5, #16]
	bne	.L156
	add	r1, r5, #24
	ldm	r1, {r1, r2}
	sub	r2, r2, #1
	cmp	r1, r2
	addlt	r1, r1, #1
	strlt	r1, [r5, #24]
	strge	r3, [r5, #24]
	add	sp, sp, #20
	@ sp needed
	pop	{r4, r5, r6, r7, r8, r9, r10, fp, lr}
	bx	lr
.L178:
	ldr	ip, [r4, #16]
	ldr	lr, [r5, #4]
	ldr	fp, [r4, #20]
	ldr	r0, [r8]
	str	ip, [sp, #12]
	sub	r0, lr, r0
	ldr	lr, [r4]
	str	fp, [sp, #8]
	ldr	ip, [r4, #4]
	stm	sp, {ip, lr}
	mov	lr, pc
	bx	r7
	cmp	r0, #0
	ldrne	r3, [r9]
	strne	r10, [r4, #24]
	addne	r3, r3, #1
	strne	r3, [r9]
	strne	r10, [r5, #32]
	ldr	r1, [r5]
	ldr	r2, [r5, #12]
	ldr	r3, [r5, #8]
	b	.L161
.L180:
	.align	2
.L179:
	.word	getRandNum
	.word	bullets
	.word	collision
	.word	hOff
	.word	score
	.word	498
	.word	blob
	.word	loserState
	.word	1717986919
	.size	updateDoggo, .-updateDoggo
	.align	2
	.global	updateGame
	.syntax unified
	.arm
	.fpu softvfp
	.type	updateGame, %function
updateGame:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, lr}
	bl	updatePlayer
	bl	updateCheat
	ldr	r0, .L189
	add	r1, r0, #140
.L183:
	ldr	r3, [r0, #24]
	cmp	r3, #0
	blne	updateBullet.part.0
.L182:
	add	r0, r0, #28
	cmp	r0, r1
	bne	.L183
	ldr	r0, .L189+4
	bl	updateDoggo
	ldr	r0, .L189+8
	bl	updateDoggo
	ldr	r0, .L189+12
	bl	updateDoggo
	ldr	r0, .L189+16
	bl	updateDoggo
	ldr	r0, .L189+20
	pop	{r4, lr}
	b	updateDoggo
.L190:
	.align	2
.L189:
	.word	bullets
	.word	doggo
	.word	doggo+44
	.word	doggo+88
	.word	doggo+132
	.word	doggo+176
	.size	updateGame, .-updateGame
	.align	2
	.global	drawDoggo
	.syntax unified
	.arm
	.fpu softvfp
	.type	drawDoggo, %function
drawDoggo:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, r7, lr}
	mov	r6, #512
	ldr	r2, .L197
	ldr	r1, .L197+4
	ldr	r3, .L197+8
	ldrh	r4, [r2]
	ldrh	r5, [r1]
	ldr	r2, .L197+12
	ldr	lr, .L197+16
	add	ip, r3, #220
.L194:
	ldr	r1, [r3, #36]
	cmp	r1, #0
	strheq	r6, [r2, #16]	@ movhi
	beq	.L193
	ldr	r1, [r3, #4]
	ldr	r7, [r3]
	ldr	r0, [r3, #24]
	sub	r1, r1, r4
	and	r1, r1, lr
	sub	r7, r7, r5
	add	r0, r0, #96
	orr	r1, r1, #16384
	and	r7, r7, #255
	lsl	r0, r0, #1
	strh	r1, [r2, #18]	@ movhi
	strh	r7, [r2, #16]	@ movhi
	strh	r0, [r2, #20]	@ movhi
.L193:
	add	r3, r3, #44
	cmp	r3, ip
	add	r2, r2, #8
	bne	.L194
	pop	{r4, r5, r6, r7, lr}
	bx	lr
.L198:
	.align	2
.L197:
	.word	hOff
	.word	vOff
	.word	doggo
	.word	shadowOAM
	.word	511
	.size	drawDoggo, .-drawDoggo
	.align	2
	.global	drawGame
	.syntax unified
	.arm
	.fpu softvfp
	.type	drawGame, %function
drawGame:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	ldr	r3, .L211
	ldr	r3, [r3, #44]
	cmp	r3, #0
	push	{r4, r5, r6, lr}
	beq	.L200
	ldr	r1, .L211+4
	ldrh	r3, [r1]
	orr	r3, r3, #512
	strh	r3, [r1]	@ movhi
.L201:
	mov	r5, #21
	ldr	r3, .L211+8
	ldr	r3, [r3]
	ldr	ip, .L211+12
	add	r3, r3, #1
	ldr	r2, .L211+16
	lsl	r3, r3, r5
	lsr	r3, r3, #16
	ldr	r6, [ip, #40]
	mov	r0, r2
	add	ip, r3, #8
	cmp	r6, #1
	strh	ip, [r1, #252]	@ movhi
	add	ip, r3, #10
	add	r3, r3, #12
	mov	r4, #37
	mov	lr, #5
	strh	r3, [r2, #12]	@ movhi
	movne	r3, #512
	strh	ip, [r2, #4]	@ movhi
	ldr	ip, .L211+20
	strh	ip, [r0, #8]!	@ movhi
	strh	r5, [r2, #2]	@ movhi
	strh	ip, [r1, #248]	@ movhi
	strh	ip, [r2]	@ movhi
	strh	r4, [r0, #2]	@ movhi
	strh	lr, [r1, #250]	@ movhi
	strhne	r3, [r2, #16]	@ movhi
	bleq	drawCheat.part.0
.L203:
	mov	lr, #5
	ldr	r2, .L211+24
	ldr	r3, .L211+28
	ldr	r2, [r2]
	smull	r1, r3, r2, r3
	asr	ip, r2, #31
	rsb	r3, ip, r3, asr lr
	add	r3, r3, r3, lsl #2
	ldr	r4, .L211+32
	add	r3, r3, r3, lsl #2
	sub	r3, r2, r3, lsl #2
	smull	r6, r5, r4, r2
	smull	r6, r4, r3, r4
	ldr	r0, .L211+36
	mov	r1, r0
	asr	r3, r3, #31
	rsb	r3, r3, r4, asr #2
	mov	r6, #512
	mov	r4, #8
	rsb	ip, ip, r5, asr #2
	add	ip, ip, ip, lsl #2
	add	r3, r3, #224
	sub	r2, r2, ip, lsl #1
	lsl	r3, r3, #1
	strh	r3, [r0, #4]	@ movhi
	strh	lr, [r1, #8]!	@ movhi
	ldr	ip, .L211+40
	ldr	r3, .L211+44
	add	r2, r2, #224
	lsl	r2, r2, #1
	strh	r2, [r0, #12]	@ movhi
	strh	ip, [r0, #2]	@ movhi
	strh	lr, [r0]	@ movhi
	strh	r3, [r1, #2]	@ movhi
	ldr	r0, .L211+48
	ldr	r5, .L211+52
.L204:
	ldr	r3, .L211+56
	ldr	r2, .L211+4
.L207:
	ldr	r1, [r3, #24]
	cmp	r1, #0
	ldrne	r1, [r3, #4]
	ldrbne	ip, [r3]	@ zero_extendqisi2
	andne	r1, r1, r5
	add	r3, r3, #28
	strhne	r4, [r2, #60]	@ movhi
	strhne	r1, [r2, #58]	@ movhi
	strhne	ip, [r2, #56]	@ movhi
	strheq	r6, [r2, #56]	@ movhi
	cmp	r0, r3
	add	r2, r2, #8
	bne	.L207
	subs	lr, lr, #1
	bne	.L204
	ldr	r0, .L211+60
	bl	drawDoggo
	ldr	r0, .L211+64
	bl	drawDoggo
	ldr	r0, .L211+68
	bl	drawDoggo
	ldr	r0, .L211+72
	bl	drawDoggo
	ldr	r0, .L211+76
	bl	drawDoggo
	ldr	r0, .L211+80
	bl	drawDoggo
	ldr	r3, .L211+84
	mov	lr, pc
	bx	r3
	ldr	r4, .L211+88
	mov	r3, #512
	mov	r2, #117440512
	ldr	r1, .L211+4
	mov	r0, #3
	mov	lr, pc
	bx	r4
	mov	r3, #67108864
	ldr	r2, .L211+92
	ldrh	r1, [r2]
	ldr	r2, .L211+96
	ldrh	r2, [r2]
	strh	r1, [r3, #16]	@ movhi
	pop	{r4, r5, r6, lr}
	strh	r2, [r3, #18]	@ movhi
	bx	lr
.L200:
	bl	drawPlayer.part.0
	ldr	r1, .L211+4
	b	.L201
.L212:
	.align	2
.L211:
	.word	blob
	.word	shadowOAM
	.word	bCounter
	.word	cheat
	.word	shadowOAM+256
	.word	16389
	.word	score
	.word	1374389535
	.word	1717986919
	.word	shadowOAM+296
	.word	16574
	.word	16588
	.word	bullets+140
	.word	511
	.word	bullets
	.word	doggo
	.word	doggo+44
	.word	doggo+88
	.word	doggo+132
	.word	doggo+176
	.word	doggo+220
	.word	waitForVBlank
	.word	DMANow
	.word	hOff
	.word	vOff
	.size	drawGame, .-drawGame
	.align	2
	.global	drawScore
	.syntax unified
	.arm
	.fpu softvfp
	.type	drawScore, %function
drawScore:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	ldr	r2, .L215
	ldr	r3, .L215+4
	ldr	r2, [r2]
	smull	r1, r3, r2, r3
	mov	r1, #5
	asr	r0, r2, #31
	ldr	ip, .L215+8
	rsb	r3, r0, r3, asr r1
	add	r3, r3, r3, lsl #2
	push	{r4, lr}
	add	r3, r3, r3, lsl #2
	smull	r4, lr, ip, r2
	sub	r3, r2, r3, lsl #2
	smull	r4, ip, r3, ip
	rsb	r0, r0, lr, asr #2
	add	r0, r0, r0, lsl #2
	asr	r3, r3, #31
	rsb	r3, r3, ip, asr #2
	sub	r2, r2, r0, lsl #1
	ldr	r0, .L215+12
	add	r3, r3, #224
	add	ip, r0, #300
	lsl	r3, r3, #1
	add	r2, r2, #224
	ldr	lr, .L215+16
	strh	r3, [ip]	@ movhi
	lsl	r2, r2, #1
	add	r3, r0, #308
	ldr	ip, .L215+20
	strh	r2, [r3]	@ movhi
	add	r3, r0, #296
	add	r0, r0, #304
	strh	lr, [r3, #2]	@ movhi
	strh	r1, [r3]	@ movhi
	strh	r1, [r0]	@ movhi
	strh	ip, [r0, #2]	@ movhi
	pop	{r4, lr}
	bx	lr
.L216:
	.align	2
.L215:
	.word	score
	.word	1374389535
	.word	1717986919
	.word	shadowOAM
	.word	16574
	.word	16588
	.size	drawScore, .-drawScore
	.comm	doggo,220,4
	.comm	cheat,44,4
	.comm	blob,60,4
	.comm	shadowOAM,1024,4
	.comm	score,4,4
	.comm	bCounter,4,4
	.comm	gravity,4,4
	.comm	loserState,4,4
	.comm	vOff,4,4
	.comm	hOff,4,4
	.comm	bullets,140,4
	.comm	soundB,32,4
	.comm	soundA,32,4
	.ident	"GCC: (devkitARM release 53) 9.1.0"
