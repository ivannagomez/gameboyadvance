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
	.global	goToStart
	.arch armv4t
	.syntax unified
	.arm
	.fpu softvfp
	.type	goToStart, %function
goToStart:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, lr}
	ldr	r3, .L4
	ldr	r4, .L4+4
	mov	lr, pc
	bx	r3
	mov	r3, #512
	mov	r2, #117440512
	mov	r0, #3
	ldr	r1, .L4+8
	mov	lr, pc
	bx	r4
	mov	r5, #67108864
	mov	r6, #0
	mov	r0, #100
	mov	r1, #5888
	ldr	r2, .L4+12
	strh	r6, [r5, #18]	@ movhi
	mov	r3, #256
	str	r0, [r2]
	strh	r1, [r5]	@ movhi
	mov	r2, #83886080
	mov	r0, #3
	ldr	r1, .L4+16
	mov	lr, pc
	bx	r4
	ldr	r2, .L4+20
	mov	r0, #3
	strh	r2, [r5, #12]	@ movhi
	ldr	r3, .L4+24
	ldr	r2, .L4+28
	ldr	r1, .L4+32
	mov	lr, pc
	bx	r4
	mov	r3, #3072
	mov	r0, #3
	ldr	r2, .L4+36
	ldr	r1, .L4+40
	mov	lr, pc
	bx	r4
	ldr	r2, .L4+44
	mov	r3, #928
	strh	r2, [r5, #10]	@ movhi
	mov	r0, #3
	ldr	r2, .L4+48
	ldr	r1, .L4+52
	mov	lr, pc
	bx	r4
	mov	r3, #1024
	mov	r0, #3
	ldr	r2, .L4+56
	ldr	r1, .L4+60
	mov	lr, pc
	bx	r4
	mov	r2, #7168
	mov	r3, #864
	strh	r2, [r5, #8]	@ movhi
	mov	r0, #3
	mov	r2, #100663296
	ldr	r1, .L4+64
	mov	lr, pc
	bx	r4
	mov	r3, #1024
	mov	r0, #3
	ldr	r2, .L4+68
	ldr	r1, .L4+72
	mov	lr, pc
	bx	r4
	ldr	r3, .L4+76
	mov	lr, pc
	bx	r3
	ldr	r3, .L4+80
	str	r6, [r3]
	pop	{r4, r5, r6, lr}
	bx	lr
.L5:
	.align	2
.L4:
	.word	hideSprites
	.word	DMANow
	.word	shadowOAM
	.word	.LANCHOR0
	.word	spacePal
	.word	24328
	.word	9744
	.word	100696064
	.word	spaceTiles
	.word	100726784
	.word	spaceMap
	.word	7684
	.word	100679680
	.word	starsTiles
	.word	100724736
	.word	starsMap
	.word	startbgTiles
	.word	100720640
	.word	startbgMap
	.word	flipPage
	.word	state
	.size	goToStart, .-goToStart
	.align	2
	.global	initialize
	.syntax unified
	.arm
	.fpu softvfp
	.type	initialize, %function
initialize:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	mov	r2, #67108864
	mov	r1, #5888
	push	{r4, lr}
	ldr	r3, .L8
	strh	r1, [r2]	@ movhi
	mov	lr, pc
	bx	r3
	ldr	r3, .L8+4
	mov	r2, #1
	ldr	r1, [r3]
	ldr	r0, .L8+8
	ldr	r3, .L8+12
	mov	lr, pc
	bx	r3
	mov	r1, #0
	ldr	r3, .L8+16
	ldr	r0, .L8+20
	ldrh	ip, [r3, #48]
	ldr	r2, .L8+24
	ldr	r3, .L8+28
	strh	ip, [r0]	@ movhi
	strh	r1, [r2]	@ movhi
	mov	lr, pc
	bx	r3
	ldr	r3, .L8+32
	mov	lr, pc
	bx	r3
	pop	{r4, lr}
	b	goToStart
.L9:
	.align	2
.L8:
	.word	stopSound
	.word	gameSong_length
	.word	gameSong_data
	.word	playSoundA
	.word	67109120
	.word	buttons
	.word	oldButtons
	.word	setupSounds
	.word	setupInterrupts
	.size	initialize, .-initialize
	.align	2
	.global	goToGame
	.syntax unified
	.arm
	.fpu softvfp
	.type	goToGame, %function
goToGame:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, lr}
	mov	r5, #67108864
	ldr	r2, .L12
	ldr	r4, .L12+4
	strh	r2, [r5, #8]	@ movhi
	mov	r3, #256
	mov	r2, #83886080
	mov	r0, #3
	ldr	r1, .L12+8
	mov	lr, pc
	bx	r4
	mov	r2, #100663296
	mov	r0, #3
	ldr	r3, .L12+12
	ldr	r1, .L12+16
	mov	lr, pc
	bx	r4
	mov	r3, #2048
	mov	r0, #3
	ldr	r2, .L12+20
	ldr	r1, .L12+24
	mov	lr, pc
	bx	r4
	ldr	r3, .L12+28
	ldrh	r1, [r3]
	ldrh	r2, [r3, #4]
	mov	r0, #3
	strh	r1, [r5, #18]	@ movhi
	mov	r3, #16384
	strh	r2, [r5, #16]	@ movhi
	ldr	r1, .L12+32
	ldr	r2, .L12+36
	mov	lr, pc
	bx	r4
	mov	r0, #3
	ldr	r2, .L12+40
	ldr	r1, .L12+44
	mov	r3, #256
	mov	lr, pc
	bx	r4
	ldr	r3, .L12+48
	mov	lr, pc
	bx	r3
	mov	r3, #512
	mov	r2, #117440512
	mov	r0, #3
	ldr	r1, .L12+52
	mov	lr, pc
	bx	r4
	mov	r2, #2
	ldr	r3, .L12+56
	pop	{r4, r5, r6, lr}
	str	r2, [r3]
	bx	lr
.L13:
	.align	2
.L12:
	.word	23680
	.word	DMANow
	.word	gamebgPal
	.word	26048
	.word	gamebgTiles
	.word	100720640
	.word	gamebgMap
	.word	.LANCHOR1
	.word	spritesheetTiles
	.word	100728832
	.word	83886592
	.word	spritesheetPal
	.word	hideSprites
	.word	shadowOAM
	.word	state
	.size	goToGame, .-goToGame
	.align	2
	.global	goToPause
	.syntax unified
	.arm
	.fpu softvfp
	.type	goToPause, %function
goToPause:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, lr}
	mov	r3, #4352
	mov	r4, #67108864
	mov	r2, #7296
	strh	r3, [r4]	@ movhi
	ldr	r5, .L16
	strh	r2, [r4, #8]	@ movhi
	mov	r3, #512
	mov	r2, #83886080
	mov	r0, #3
	ldr	r1, .L16+4
	mov	lr, pc
	bx	r5
	mov	r3, #10368
	mov	r2, #100663296
	mov	r0, #3
	ldr	r1, .L16+8
	mov	lr, pc
	bx	r5
	mov	r3, #2048
	mov	r0, #3
	ldr	r2, .L16+12
	ldr	r1, .L16+16
	mov	lr, pc
	bx	r5
	mov	r2, #0
	ldr	r3, .L16+20
	strh	r2, [r4, #16]	@ movhi
	mov	lr, pc
	bx	r3
	mov	r2, #3
	ldr	r3, .L16+24
	pop	{r4, r5, r6, lr}
	str	r2, [r3]
	bx	lr
.L17:
	.align	2
.L16:
	.word	DMANow
	.word	pausebgPal
	.word	pausebgTiles
	.word	100720640
	.word	pausebgMap
	.word	flipPage
	.word	state
	.size	goToPause, .-goToPause
	.align	2
	.global	pause
	.syntax unified
	.arm
	.fpu softvfp
	.type	pause, %function
pause:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, lr}
	ldr	r4, .L30
	ldrh	r3, [r4]
	tst	r3, #4
	beq	.L19
	ldr	r2, .L30+4
	ldrh	r2, [r2]
	tst	r2, #4
	beq	.L28
.L19:
	tst	r3, #8
	beq	.L18
	ldr	r3, .L30+4
	ldrh	r3, [r3]
	tst	r3, #8
	beq	.L29
.L18:
	pop	{r4, lr}
	bx	lr
.L29:
	pop	{r4, lr}
	b	goToGame
.L28:
	bl	goToStart
	ldrh	r3, [r4]
	b	.L19
.L31:
	.align	2
.L30:
	.word	oldButtons
	.word	buttons
	.size	pause, .-pause
	.align	2
	.global	goToInstructions
	.syntax unified
	.arm
	.fpu softvfp
	.type	goToInstructions, %function
goToInstructions:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	mov	r2, #67108864
	mov	r3, #256
	mov	r1, #7040
	push	{r4, lr}
	mov	r0, #3
	strh	r3, [r2]	@ movhi
	ldr	r4, .L34
	strh	r1, [r2, #8]	@ movhi
	mov	r3, #512
	mov	r2, #83886080
	ldr	r1, .L34+4
	mov	lr, pc
	bx	r4
	mov	r3, #12544
	mov	r2, #100663296
	mov	r0, #3
	ldr	r1, .L34+8
	mov	lr, pc
	bx	r4
	ldr	r2, .L34+12
	mov	r3, #1024
	mov	r0, #3
	ldr	r1, .L34+16
	mov	lr, pc
	bx	r4
	ldr	r3, .L34+20
	mov	lr, pc
	bx	r3
	mov	r2, #1
	ldr	r3, .L34+24
	pop	{r4, lr}
	str	r2, [r3]
	bx	lr
.L35:
	.align	2
.L34:
	.word	DMANow
	.word	instrbgPal
	.word	instrbgTiles
	.word	100718592
	.word	instrbgMap
	.word	flipPage
	.word	state
	.size	goToInstructions, .-goToInstructions
	.align	2
	.global	start
	.syntax unified
	.arm
	.fpu softvfp
	.type	start, %function
start:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	ldr	r3, .L52
	ldrh	r3, [r3, #48]
	push	{r4, lr}
	ldr	r4, .L52+4
	tst	r3, #32
	ldreq	r3, [r4, #4]
	subeq	r3, r3, #1
	streq	r3, [r4, #4]
	ldr	r3, .L52
	ldrh	r3, [r3, #48]
	tst	r3, #16
	ldreq	r3, [r4, #4]
	addeq	r3, r3, #1
	streq	r3, [r4, #4]
	ldr	r3, .L52+8
	mov	lr, pc
	bx	r3
	mov	r1, #67108864
	ldr	r2, [r4, #4]
	add	r3, r2, r2, lsr #31
	asr	r3, r3, #1
	lsl	r3, r3, #16
	lsl	r2, r2, #16
	lsr	r3, r3, #16
	lsr	r2, r2, #16
	strh	r2, [r1, #20]	@ movhi
	ldr	r4, .L52+12
	strh	r3, [r1, #24]	@ movhi
	ldrh	r3, [r4]
	tst	r3, #8
	beq	.L39
	ldr	r2, .L52+16
	ldrh	r2, [r2]
	tst	r2, #8
	beq	.L50
.L39:
	tst	r3, #4
	beq	.L36
	ldr	r3, .L52+16
	ldrh	r3, [r3]
	tst	r3, #4
	beq	.L51
.L36:
	pop	{r4, lr}
	bx	lr
.L51:
	pop	{r4, lr}
	b	goToInstructions
.L50:
	bl	goToGame
	ldr	r3, .L52+20
	mov	lr, pc
	bx	r3
	ldrh	r3, [r4]
	b	.L39
.L53:
	.align	2
.L52:
	.word	67109120
	.word	.LANCHOR1
	.word	waitForVBlank
	.word	oldButtons
	.word	buttons
	.word	initGame
	.size	start, .-start
	.align	2
	.global	instructions
	.syntax unified
	.arm
	.fpu softvfp
	.type	instructions, %function
instructions:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, lr}
	ldr	r4, .L66
	ldrh	r3, [r4]
	tst	r3, #8
	beq	.L55
	ldr	r2, .L66+4
	ldrh	r2, [r2]
	tst	r2, #8
	beq	.L64
.L55:
	tst	r3, #4
	beq	.L54
	ldr	r3, .L66+4
	ldrh	r3, [r3]
	tst	r3, #4
	beq	.L65
.L54:
	pop	{r4, lr}
	bx	lr
.L65:
	pop	{r4, lr}
	b	goToStart
.L64:
	bl	goToStart
	ldrh	r3, [r4]
	b	.L55
.L67:
	.align	2
.L66:
	.word	oldButtons
	.word	buttons
	.size	instructions, .-instructions
	.align	2
	.global	goToWin
	.syntax unified
	.arm
	.fpu softvfp
	.type	goToWin, %function
goToWin:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, lr}
	ldr	r3, .L70
	ldr	r4, .L70+4
	mov	lr, pc
	bx	r3
	mov	r3, #512
	mov	r2, #117440512
	mov	r0, #3
	ldr	r1, .L70+8
	mov	lr, pc
	bx	r4
	mov	r5, #67108864
	mov	r2, #5888
	mov	r3, #256
	strh	r2, [r5]	@ movhi
	mov	r0, #3
	mov	r2, #83886080
	ldr	r1, .L70+12
	mov	lr, pc
	bx	r4
	ldr	r2, .L70+16
	mov	r0, #3
	strh	r2, [r5, #12]	@ movhi
	ldr	r3, .L70+20
	ldr	r2, .L70+24
	ldr	r1, .L70+28
	mov	lr, pc
	bx	r4
	mov	r3, #3072
	mov	r0, #3
	ldr	r2, .L70+32
	ldr	r1, .L70+36
	mov	lr, pc
	bx	r4
	ldr	r2, .L70+40
	mov	r3, #928
	strh	r2, [r5, #10]	@ movhi
	mov	r0, #3
	ldr	r2, .L70+44
	ldr	r1, .L70+48
	mov	lr, pc
	bx	r4
	mov	r3, #1024
	mov	r0, #3
	ldr	r2, .L70+52
	ldr	r1, .L70+56
	mov	lr, pc
	bx	r4
	mov	r2, #7168
	mov	r3, #272
	strh	r2, [r5, #8]	@ movhi
	mov	r0, #3
	mov	r2, #100663296
	ldr	r1, .L70+60
	mov	lr, pc
	bx	r4
	ldr	r2, .L70+64
	mov	r3, #1024
	mov	r0, #3
	ldr	r1, .L70+68
	mov	lr, pc
	bx	r4
	ldr	r3, .L70+72
	mov	lr, pc
	bx	r3
	mov	r2, #4
	ldr	r3, .L70+76
	pop	{r4, r5, r6, lr}
	str	r2, [r3]
	bx	lr
.L71:
	.align	2
.L70:
	.word	hideSprites
	.word	DMANow
	.word	shadowOAM
	.word	spacePal
	.word	24328
	.word	9744
	.word	100696064
	.word	spaceTiles
	.word	100726784
	.word	spaceMap
	.word	7684
	.word	100679680
	.word	starsTiles
	.word	100724736
	.word	starsMap
	.word	winbgTiles
	.word	100720640
	.word	winbgMap
	.word	flipPage
	.word	state
	.size	goToWin, .-goToWin
	.align	2
	.global	win
	.syntax unified
	.arm
	.fpu softvfp
	.type	win, %function
win:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, lr}
	ldr	r3, .L85
	mov	lr, pc
	bx	r3
	ldr	r2, .L85+4
	add	r1, r2, #8
	ldm	r1, {r1, ip}
	add	r1, r1, #1
	cmp	ip, #20
	str	r1, [r2, #8]
	beq	.L83
	cmn	ip, #20
	moveq	r3, #1
	ldreq	lr, .L85+8
	ldrne	lr, .L85+8
	streq	r3, [lr, #4]
.L74:
	ldr	r3, .L85+12
	smull	r0, r3, r1, r3
	sub	r3, r3, r1, asr #31
	add	r3, r3, r3, lsl #1
	cmp	r1, r3
	ldr	r0, [lr]
	ldr	r1, [r2]
	bne	.L75
	ldr	r3, [lr, #4]
	cmp	r0, #0
	add	ip, ip, r3
	add	r1, r1, r3
	subgt	r0, r0, #1
	str	ip, [r2, #12]
	str	r1, [r2]
	strgt	r0, [lr]
.L75:
	mov	lr, #67108864
	ldr	ip, [r2, #4]
	add	ip, ip, #1
	add	r3, ip, ip, lsr #31
	lsl	r1, r1, #16
	lsr	r1, r1, #16
	asr	r3, r3, #1
	strh	r1, [lr, #18]	@ movhi
	lsl	r0, r0, #16
	lsl	r3, r3, #16
	lsl	r1, ip, #16
	lsr	r3, r3, #16
	lsr	r1, r1, #16
	lsr	r0, r0, #16
	strh	r0, [lr, #16]	@ movhi
	strh	r1, [lr, #20]	@ movhi
	strh	r3, [lr, #24]	@ movhi
	ldr	r1, .L85+16
	ldrh	r3, [r1]
	tst	r3, #8
	str	ip, [r2, #4]
	beq	.L72
	ldr	r3, .L85+20
	ldrh	r3, [r3]
	tst	r3, #8
	beq	.L84
.L72:
	pop	{r4, lr}
	bx	lr
.L83:
	mvn	r3, #0
	ldr	lr, .L85+8
	str	r3, [lr, #4]
	b	.L74
.L84:
	pop	{r4, lr}
	b	goToStart
.L86:
	.align	2
.L85:
	.word	waitForVBlank
	.word	.LANCHOR1
	.word	.LANCHOR0
	.word	1431655766
	.word	oldButtons
	.word	buttons
	.size	win, .-win
	.align	2
	.global	goToLose
	.syntax unified
	.arm
	.fpu softvfp
	.type	goToLose, %function
goToLose:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, lr}
	mov	r3, #256
	mov	r4, #67108864
	mov	r2, #7296
	strh	r3, [r4]	@ movhi
	ldr	r5, .L89
	strh	r2, [r4, #8]	@ movhi
	mov	r0, #3
	mov	r2, #83886080
	ldr	r1, .L89+4
	mov	lr, pc
	bx	r5
	mov	r3, #22016
	mov	r2, #100663296
	mov	r0, #3
	ldr	r1, .L89+8
	mov	lr, pc
	bx	r5
	mov	r0, #3
	ldr	r2, .L89+12
	ldr	r1, .L89+16
	mov	r3, #2048
	mov	lr, pc
	bx	r5
	ldr	r3, .L89+20
	mov	lr, pc
	bx	r3
	mov	r3, #0
	ldr	r2, .L89+24
	strh	r3, [r4, #18]	@ movhi
	strh	r3, [r4, #16]	@ movhi
	mov	lr, pc
	bx	r2
	mov	r2, #5
	ldr	r3, .L89+28
	pop	{r4, r5, r6, lr}
	str	r2, [r3]
	bx	lr
.L90:
	.align	2
.L89:
	.word	DMANow
	.word	losebgPal
	.word	losebgTiles
	.word	100720640
	.word	losebgMap
	.word	hideSprites
	.word	flipPage
	.word	state
	.size	goToLose, .-goToLose
	.align	2
	.global	game
	.syntax unified
	.arm
	.fpu softvfp
	.type	game, %function
game:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, lr}
	ldr	r3, .L107
	ldr	r4, .L107+4
	mov	lr, pc
	bx	r3
	ldr	r3, .L107+8
	mov	lr, pc
	bx	r3
	ldr	r3, [r4]
	cmp	r3, #1
	beq	.L103
.L92:
	cmn	r3, #1
	beq	.L104
.L93:
	ldr	r4, .L107+12
	ldrh	r3, [r4]
	tst	r3, #8
	beq	.L94
	ldr	r2, .L107+16
	ldrh	r2, [r2]
	tst	r2, #8
	beq	.L105
.L94:
	tst	r3, #4
	beq	.L91
	ldr	r3, .L107+16
	ldrh	r3, [r3]
	tst	r3, #4
	beq	.L106
.L91:
	pop	{r4, lr}
	bx	lr
.L104:
	bl	goToWin
	b	.L93
.L103:
	bl	goToLose
	ldr	r3, [r4]
	b	.L92
.L106:
	pop	{r4, lr}
	b	goToLose
.L105:
	bl	goToPause
	ldrh	r3, [r4]
	b	.L94
.L108:
	.align	2
.L107:
	.word	updateGame
	.word	loserState
	.word	drawGame
	.word	oldButtons
	.word	buttons
	.size	game, .-game
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
	push	{r4, r7, fp, lr}
	ldr	r6, .L124
	ldr	fp, .L124+4
	ldr	r3, .L124+8
	mov	lr, pc
	bx	r3
	ldr	r5, .L124+12
	ldr	r2, [r6]
	ldrh	r0, [fp]
	ldr	r10, .L124+16
	ldr	r9, .L124+20
	ldr	r7, .L124+24
	ldr	r8, .L124+28
	ldr	r4, .L124+32
.L111:
	strh	r0, [r5]	@ movhi
	ldrh	r3, [r4, #48]
	strh	r3, [fp]	@ movhi
	cmp	r2, #5
	ldrls	pc, [pc, r2, asl #2]
	b	.L119
.L113:
	.word	.L117
	.word	.L115
	.word	.L116
	.word	.L115
	.word	.L114
	.word	.L112
.L115:
	mov	lr, pc
	bx	r7
	ldr	r2, [r6]
	ldrh	r0, [fp]
	b	.L111
.L117:
	mov	lr, pc
	bx	r10
	ldr	r2, [r6]
	ldrh	r0, [fp]
	b	.L111
.L112:
	tst	r0, #8
	beq	.L119
	tst	r3, #8
	beq	.L123
.L119:
	mov	r0, r3
	b	.L111
.L114:
	mov	lr, pc
	bx	r8
	ldr	r2, [r6]
	ldrh	r0, [fp]
	b	.L111
.L116:
	mov	lr, pc
	bx	r9
	ldr	r2, [r6]
	ldrh	r0, [fp]
	b	.L111
.L123:
	ldr	r3, .L124+36
	mov	lr, pc
	bx	r3
	ldr	r2, [r6]
	ldrh	r0, [fp]
	b	.L111
.L125:
	.align	2
.L124:
	.word	state
	.word	buttons
	.word	initialize
	.word	oldButtons
	.word	start
	.word	game
	.word	pause
	.word	win
	.word	67109120
	.word	goToStart
	.size	main, .-main
	.text
	.align	2
	.global	lose
	.syntax unified
	.arm
	.fpu softvfp
	.type	lose, %function
lose:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	ldr	r3, .L131
	ldrh	r3, [r3]
	tst	r3, #8
	bxeq	lr
	ldr	r3, .L131+4
	ldrh	r3, [r3]
	tst	r3, #8
	bxne	lr
	b	goToStart
.L132:
	.align	2
.L131:
	.word	oldButtons
	.word	buttons
	.size	lose, .-lose
	.comm	seed,4,4
	.comm	shadowOAM,1024,4
	.comm	oldButtons,2,2
	.comm	buttons,2,2
	.comm	state,4,4
	.global	winHOff
	.global	flyAniCounter
	.global	flyCounter
	.global	flyMode
	.comm	arr,140,4
	.global	vOff
	.global	hOff
	.comm	soundB,32,4
	.comm	soundA,32,4
	.data
	.align	2
	.set	.LANCHOR0,. + 0
	.type	winHOff, %object
	.size	winHOff, 4
winHOff:
	.word	100
	.type	flyMode, %object
	.size	flyMode, 4
flyMode:
	.word	1
	.bss
	.align	2
	.set	.LANCHOR1,. + 0
	.type	vOff, %object
	.size	vOff, 4
vOff:
	.space	4
	.type	hOff, %object
	.size	hOff, 4
hOff:
	.space	4
	.type	flyAniCounter, %object
	.size	flyAniCounter, 4
flyAniCounter:
	.space	4
	.type	flyCounter, %object
	.size	flyCounter, 4
flyCounter:
	.space	4
	.ident	"GCC: (devkitARM release 53) 9.1.0"
