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
	.type	updateBall.part.0, %function
updateBall.part.0:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	ldr	r1, [r0]
	cmp	r1, #0
	push	{r4, r5, lr}
	ldr	lr, [r0, #16]
	ble	.L2
	ldr	r3, [r0, #24]
	add	r3, r1, r3
	cmp	r3, #120
	bgt	.L2
.L3:
	ldr	r3, [r0, #4]
	cmp	r3, #0
	ldr	r2, [r0, #20]
	ble	.L4
	ldr	ip, [r0, #28]
	add	ip, r3, ip
	cmp	ip, #239
	bgt	.L4
.L5:
	mov	ip, #0
	mov	r4, ip
	ldr	r5, .L21
	add	r2, r3, r2
	ldr	r3, .L21+4
	add	r1, r1, lr
	ldr	lr, [r5]
	stm	r0, {r1, r2}
	add	r1, r3, #200
.L7:
	ldr	r2, [r3, #32]
	cmp	r2, #0
	beq	.L6
	ldr	r2, [r3, #20]
	cmp	r2, #0
	movne	ip, #1
	strne	r4, [r3, #32]
	strne	r4, [r0, #36]
	subne	lr, lr, #1
.L6:
	add	r3, r3, #40
	cmp	r3, r1
	bne	.L7
	cmp	ip, #0
	strne	lr, [r5]
	pop	{r4, r5, lr}
	bx	lr
.L4:
	rsb	r2, r2, #0
	str	r2, [r0, #20]
	b	.L5
.L2:
	rsb	lr, lr, #0
	str	lr, [r0, #16]
	b	.L3
.L22:
	.align	2
.L21:
	.word	ballsRemaining
	.word	bullets
	.size	updateBall.part.0, .-updateBall.part.0
	.align	2
	.global	drawBar
	.syntax unified
	.arm
	.fpu softvfp
	.type	drawBar, %function
drawBar:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, lr}
	ldr	r2, .L25
	sub	sp, sp, #8
	str	r2, [sp]
	mov	r3, #3
	mov	r2, #240
	mov	r1, #120
	mov	r0, #0
	ldr	r4, .L25+4
	mov	lr, pc
	bx	r4
	add	sp, sp, #8
	@ sp needed
	pop	{r4, lr}
	bx	lr
.L26:
	.align	2
.L25:
	.word	26577
	.word	drawRect
	.size	drawBar, .-drawBar
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
	mov	r1, #140
	mov	r5, #1
	mov	r4, #10
	mov	lr, #5
	mov	r2, #118
	mvn	ip, #49664
	mov	r0, #20
	ldr	r3, .L29
	str	r5, [r3, #16]
	str	r4, [r3, #20]
	str	lr, [r3, #24]
	str	r1, [r3]
	str	r1, [r3, #8]
	strh	ip, [r3, #28]	@ movhi
	str	r0, [r3, #32]
	str	r2, [r3, #4]
	str	r2, [r3, #12]
	pop	{r4, r5, lr}
	bx	lr
.L30:
	.align	2
.L29:
	.word	player
	.size	initPlayer, .-initPlayer
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
	mov	r3, #0
	push	{r4, r5, lr}
	ldr	r4, .L33
	sub	sp, sp, #12
	str	r3, [sp]
	ldr	r2, [r4, #24]
	ldr	r3, [r4, #20]
	ldr	r1, [r4, #8]
	ldr	r0, [r4, #12]
	ldr	r5, .L33+4
	mov	lr, pc
	bx	r5
	ldrh	r2, [r4, #28]
	ldr	r3, [r4, #20]
	str	r2, [sp]
	ldr	r1, [r4]
	ldr	r2, [r4, #24]
	ldr	r0, [r4, #4]
	mov	lr, pc
	bx	r5
	ldm	r4, {r2, r3}
	str	r2, [r4, #8]
	str	r3, [r4, #12]
	add	sp, sp, #12
	@ sp needed
	pop	{r4, r5, lr}
	bx	lr
.L34:
	.align	2
.L33:
	.word	player
	.word	drawRect
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
	push	{r4, r5, r6, lr}
	mvn	r1, #1
	mov	r6, #2
	mov	r5, #1
	mov	r2, #0
	mvn	r4, #32768
	ldr	r0, .L39
	ldr	r3, .L39+4
	ldr	lr, [r0]
	ldr	ip, [r0, #4]
	add	r0, r3, #200
.L36:
	str	r6, [r3, #20]
	str	r5, [r3, #24]
	str	ip, [r3, #12]
	str	r1, [r3, #16]
	strh	r4, [r3, #28]	@ movhi
	str	r2, [r3, #32]
	stm	r3, {r1, r2, lr}
	add	r3, r3, #40
	cmp	r3, r0
	bne	.L36
	pop	{r4, r5, r6, lr}
	bx	lr
.L40:
	.align	2
.L39:
	.word	player
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
	ldr	r2, .L51
	mov	r3, #0
	mov	r1, r2
.L44:
	ldr	r0, [r1, #32]
	cmp	r0, #0
	bne	.L42
	str	lr, [sp, #-4]!
	mov	lr, #1
	ldr	r1, .L51+4
	add	r3, r3, r3, lsl #2
	add	r3, r2, r3, lsl #3
	ldr	r2, [r1, #24]
	ldr	ip, [r3, #24]
	ldr	r1, [r1, #4]
	add	r2, r2, r2, lsr #31
	add	r2, r1, r2, asr lr
	add	ip, ip, ip, lsr #31
	sub	r2, r2, ip, asr lr
	str	lr, [r3, #32]
	str	r0, [r3, #36]
	str	r2, [r3, #4]
	ldr	lr, [sp], #4
	bx	lr
.L42:
	add	r3, r3, #1
	cmp	r3, #5
	add	r1, r1, #40
	bne	.L44
	bx	lr
.L52:
	.align	2
.L51:
	.word	bullets
	.word	player
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
	ldr	r3, .L63
	ldrh	r3, [r3, #48]
	tst	r3, #32
	push	{r4, lr}
	ldr	r4, .L63+4
	bne	.L54
	ldr	r3, [r4, #4]
	ldr	r2, [r4, #16]
	cmp	r3, r2
	subge	r3, r3, r2
	strge	r3, [r4, #4]
	blt	.L54
.L55:
	ldr	r3, .L63
	ldrh	r3, [r3, #48]
	tst	r3, #64
	ldr	r3, [r4, #32]
	bne	.L62
	cmp	r3, #19
	bgt	.L58
.L62:
	add	r3, r3, #1
	str	r3, [r4, #32]
	pop	{r4, lr}
	bx	lr
.L54:
	ldr	r3, .L63
	ldrh	r3, [r3, #48]
	tst	r3, #16
	bne	.L55
	ldr	r2, [r4, #4]
	ldr	r1, [r4, #16]
	ldr	r3, [r4, #24]
	rsb	r0, r1, #240
	add	r3, r2, r3
	cmp	r3, r0
	addle	r2, r2, r1
	strle	r2, [r4, #4]
	b	.L55
.L58:
	bl	fireBullet
	mov	r3, #1
	str	r3, [r4, #32]
	pop	{r4, lr}
	bx	lr
.L64:
	.align	2
.L63:
	.word	67109120
	.word	player
	.size	updatePlayer, .-updatePlayer
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
	mov	ip, #0
	ldr	r3, .L80
	add	r0, r3, #200
.L68:
	ldr	r2, [r3, #32]
	cmp	r2, #0
	beq	.L66
	ldr	r2, [r3, #20]
	ldr	r1, [r3]
	sub	r2, r2, #1
	cmn	r2, r1
	ldrpl	r2, [r3, #16]
	addpl	r1, r2, r1
	strpl	r1, [r3]
	strmi	ip, [r3, #32]
.L66:
	add	r3, r3, #40
	cmp	r3, r0
	bne	.L68
	ldr	r0, .L80+4
	add	r4, r0, #220
.L70:
	ldr	r3, [r0, #36]
	cmp	r3, #0
	blne	updateBall.part.0
.L69:
	add	r0, r0, #44
	cmp	r0, r4
	bne	.L70
	pop	{r4, lr}
	bx	lr
.L81:
	.align	2
.L80:
	.word	bullets
	.word	balls
	.size	updateGame, .-updateGame
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
	ldr	r3, [r0, #32]
	cmp	r3, #0
	bxeq	lr
	ldr	r3, [r0, #20]
	ldr	r2, [r0]
	sub	r3, r3, #1
	cmn	r3, r2
	movmi	r3, #0
	ldrpl	r3, [r0, #16]
	addpl	r2, r3, r2
	strpl	r2, [r0]
	strmi	r3, [r0, #32]
	bx	lr
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
	ldr	r3, [r0, #32]
	cmp	r3, #0
	mov	r4, r0
	sub	sp, sp, #12
	bne	.L92
	ldr	r3, [r0, #36]
	cmp	r3, #0
	beq	.L93
.L90:
	ldm	r4, {r2, r3}
	str	r2, [r4, #8]
	str	r3, [r4, #12]
	add	sp, sp, #12
	@ sp needed
	pop	{r4, r5, lr}
	bx	lr
.L93:
	str	r3, [sp]
	ldr	r5, .L94
	ldr	r3, [r0, #20]
	ldr	r2, [r0, #24]
	ldr	r1, [r0, #8]
	ldr	r0, [r0, #12]
	mov	lr, pc
	bx	r5
	mov	r3, #1
	str	r3, [r4, #36]
	b	.L90
.L92:
	mov	r2, #0
	ldr	r3, [r0, #20]
	str	r2, [sp]
	ldr	r5, .L94
	ldr	r2, [r0, #24]
	ldr	r1, [r0, #8]
	ldr	r0, [r0, #12]
	mov	lr, pc
	bx	r5
	ldrh	r2, [r4, #28]
	ldr	r3, [r4, #20]
	str	r2, [sp]
	ldr	r2, [r4, #24]
	ldr	r1, [r4]
	ldr	r0, [r4, #4]
	mov	lr, pc
	bx	r5
	b	.L90
.L95:
	.align	2
.L94:
	.word	drawRect
	.size	drawBullet, .-drawBullet
	.align	2
	.global	initBalls
	.syntax unified
	.arm
	.fpu softvfp
	.type	initBalls, %function
initBalls:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, r7, r8, r9, r10, lr}
	mov	r9, #10
	ldr	r4, .L100
	ldr	r5, .L100+4
	ldr	r8, .L100+8
	ldr	r7, .L100+12
	add	r6, r4, #220
.L97:
	str	r9, [r4, #24]
	str	r9, [r4, #28]
	mov	lr, pc
	bx	r5
	smull	r3, r2, r8, r0
	asr	r3, r0, #31
	rsb	r3, r3, r2, asr #2
	rsb	r2, r3, r3, lsl #3
	rsb	r3, r3, r2, lsl #3
	sub	r0, r0, r3, lsl #1
	str	r0, [r4]
	mov	lr, pc
	bx	r5
	mov	r2, #1
	mov	ip, #31744
	mov	r1, #0
	smull	r3, lr, r7, r0
	asr	r3, r0, #31
	rsb	r3, r3, lr, asr #6
	add	r3, r3, r3, lsl #6
	sub	r0, r0, r3, lsl r2
	ldr	r3, [r4]
	add	r0, r0, #10
	str	r0, [r4, #4]
	str	r0, [r4, #12]
	str	r2, [r4, #16]
	str	r2, [r4, #20]
	str	r2, [r4, #36]
	strh	ip, [r4, #32]	@ movhi
	str	r1, [r4, #40]
	str	r3, [r4, #8]
	add	r4, r4, #44
	cmp	r4, r6
	bne	.L97
	pop	{r4, r5, r6, r7, r8, r9, r10, lr}
	bx	lr
.L101:
	.align	2
.L100:
	.word	balls
	.word	rand
	.word	156180629
	.word	2114445439
	.size	initBalls, .-initBalls
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
	push	{r3, r4, r5, r6, r7, r8, r9, r10, fp, lr}
	mov	r7, #140
	mov	r8, #1
	ldr	r1, .L106
	mov	r6, #118
	str	r7, [r1]
	str	r7, [r1, #8]
	mov	fp, #10
	mov	r10, #5
	mvn	r9, #49664
	mov	r5, r7
	mov	r7, #20
	mov	lr, r8
	mov	ip, #2
	mvn	r2, #1
	mov	r3, #0
	mvn	r0, #32768
	str	r6, [r1, #4]
	str	r6, [r1, #12]
	mov	r4, r6
	ldr	r6, .L106+4
	str	fp, [r1, #20]
	str	r10, [r1, #24]
	strh	r9, [r1, #28]	@ movhi
	str	r7, [r1, #32]
	str	r8, [r1, #16]
	add	r1, r6, #200
.L103:
	str	ip, [r6, #20]
	str	lr, [r6, #24]
	str	r4, [r6, #12]
	str	r2, [r6, #16]
	strh	r0, [r6, #28]	@ movhi
	str	r3, [r6, #32]
	stm	r6, {r2, r3, r5}
	add	r6, r6, #40
	cmp	r6, r1
	bne	.L103
	bl	initBalls
	mov	r2, #5
	ldr	r3, .L106+8
	str	r2, [r3]
	pop	{r3, r4, r5, r6, r7, r8, r9, r10, fp, lr}
	bx	lr
.L107:
	.align	2
.L106:
	.word	player
	.word	bullets
	.word	ballsRemaining
	.size	initGame, .-initGame
	.align	2
	.global	updateBall
	.syntax unified
	.arm
	.fpu softvfp
	.type	updateBall, %function
updateBall:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	ldr	r3, [r0, #36]
	cmp	r3, #0
	bxeq	lr
	b	updateBall.part.0
	.size	updateBall, .-updateBall
	.align	2
	.global	drawBall
	.syntax unified
	.arm
	.fpu softvfp
	.type	drawBall, %function
drawBall:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, lr}
	ldr	r3, [r0, #36]
	cmp	r3, #0
	mov	r4, r0
	sub	sp, sp, #12
	bne	.L114
	ldr	r3, [r0, #40]
	cmp	r3, #0
	beq	.L115
.L112:
	ldm	r4, {r2, r3}
	str	r2, [r4, #8]
	str	r3, [r4, #12]
	add	sp, sp, #12
	@ sp needed
	pop	{r4, r5, lr}
	bx	lr
.L115:
	str	r3, [sp]
	ldr	r5, .L116
	ldr	r3, [r0, #24]
	ldr	r2, [r0, #28]
	ldr	r1, [r0, #8]
	ldr	r0, [r0, #12]
	mov	lr, pc
	bx	r5
	mov	r3, #1
	str	r3, [r4, #40]
	b	.L112
.L114:
	mov	r2, #0
	ldr	r3, [r0, #24]
	str	r2, [sp]
	ldr	r5, .L116
	ldr	r2, [r0, #28]
	ldr	r1, [r0, #8]
	ldr	r0, [r0, #12]
	mov	lr, pc
	bx	r5
	ldrh	r2, [r4, #32]
	ldr	r3, [r4, #24]
	str	r2, [sp]
	ldr	r2, [r4, #28]
	ldr	r1, [r4]
	ldr	r0, [r4, #4]
	mov	lr, pc
	bx	r5
	b	.L112
.L117:
	.align	2
.L116:
	.word	drawRect
	.size	drawBall, .-drawBall
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
	push	{r4, r5, lr}
	sub	sp, sp, #12
	bl	drawPlayer
	ldr	r3, .L120
	ldr	r5, .L120+4
	mov	r2, #240
	mov	r1, #120
	str	r3, [sp]
	mov	r0, #0
	mov	r3, #3
	ldr	r4, .L120+8
	mov	lr, pc
	bx	r4
	mov	r0, r5
	bl	drawBullet
	add	r0, r5, #40
	bl	drawBullet
	add	r0, r5, #80
	ldr	r4, .L120+12
	bl	drawBullet
	add	r0, r5, #120
	bl	drawBullet
	add	r0, r5, #160
	bl	drawBullet
	mov	r0, r4
	bl	drawBall
	add	r0, r4, #44
	bl	drawBall
	add	r0, r4, #88
	bl	drawBall
	add	r0, r4, #132
	bl	drawBall
	add	r0, r4, #176
	add	sp, sp, #12
	@ sp needed
	pop	{r4, r5, lr}
	b	drawBall
.L121:
	.align	2
.L120:
	.word	26577
	.word	bullets
	.word	drawRect
	.word	balls
	.size	drawGame, .-drawGame
	.comm	ballsRemaining,4,4
	.comm	balls,220,4
	.comm	bullets,200,4
	.comm	player,36,4
	.ident	"GCC: (devkitARM release 53) 9.1.0"
