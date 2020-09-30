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
	.arch armv4t
	.syntax unified
	.arm
	.fpu softvfp
	.type	pauseState.part.0, %function
pauseState.part.0:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, lr}
	mov	r4, #0
	ldr	r2, .L4
	ldr	r3, .L4+4
	ldr	r0, .L4+8
	str	r4, [r2]
	mov	lr, pc
	bx	r3
	ldr	r3, .L4+12
	str	r4, [r3]
	pop	{r4, lr}
	bx	lr
.L5:
	.align	2
.L4:
	.word	state
	.word	fillScreen
	.word	31775
	.word	seed
	.size	pauseState.part.0, .-pauseState.part.0
	.set	loseState.part.0,pauseState.part.0
	.set	winState.part.0,pauseState.part.0
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
	mov	r3, #67108864
	push	{r4, lr}
	mov	r4, #0
	ldr	r1, .L8
	ldr	r2, .L8+4
	strh	r1, [r3]	@ movhi
	ldr	r0, .L8+8
	ldr	r3, .L8+12
	str	r4, [r2]
	mov	lr, pc
	bx	r3
	ldr	r3, .L8+16
	str	r4, [r3]
	pop	{r4, lr}
	bx	lr
.L9:
	.align	2
.L8:
	.word	1027
	.word	state
	.word	31775
	.word	fillScreen
	.word	seed
	.size	initialize, .-initialize
	.align	2
	.global	goToStart
	.syntax unified
	.arm
	.fpu softvfp
	.type	goToStart, %function
goToStart:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, lr}
	mov	r4, #0
	ldr	r2, .L12
	ldr	r3, .L12+4
	ldr	r0, .L12+8
	str	r4, [r2]
	mov	lr, pc
	bx	r3
	ldr	r3, .L12+12
	str	r4, [r3]
	pop	{r4, lr}
	bx	lr
.L13:
	.align	2
.L12:
	.word	state
	.word	fillScreen
	.word	31775
	.word	seed
	.size	goToStart, .-goToStart
	.align	2
	.global	startState
	.syntax unified
	.arm
	.fpu softvfp
	.type	startState, %function
startState:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, lr}
	ldr	r4, .L21
	ldr	r3, [r4]
	ldr	r2, .L21+4
	add	r3, r3, #1
	str	r3, [r4]
	mov	lr, pc
	bx	r2
	ldr	r3, .L21+8
	ldrh	r3, [r3]
	tst	r3, #8
	beq	.L14
	ldr	r3, .L21+12
	ldrh	r0, [r3]
	ands	r5, r0, #8
	beq	.L20
.L14:
	pop	{r4, r5, r6, lr}
	bx	lr
.L20:
	ldr	r0, [r4]
	ldr	r3, .L21+16
	mov	lr, pc
	bx	r3
	mov	r0, r5
	ldr	r3, .L21+20
	mov	lr, pc
	bx	r3
	mov	r1, #1
	ldr	r2, .L21+24
	ldr	r3, .L21+28
	str	r1, [r2]
	mov	lr, pc
	bx	r3
	pop	{r4, r5, r6, lr}
	bx	lr
.L22:
	.align	2
.L21:
	.word	seed
	.word	waitForVBlank
	.word	oldButtons
	.word	buttons
	.word	srand
	.word	fillScreen
	.word	state
	.word	initGame
	.size	startState, .-startState
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
	push	{r4, lr}
	ldr	r3, .L25
	mov	r0, #0
	mov	lr, pc
	bx	r3
	mov	r2, #1
	ldr	r3, .L25+4
	pop	{r4, lr}
	str	r2, [r3]
	bx	lr
.L26:
	.align	2
.L25:
	.word	fillScreen
	.word	state
	.size	goToGame, .-goToGame
	.align	2
	.global	gameState
	.syntax unified
	.arm
	.fpu softvfp
	.type	gameState, %function
gameState:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, lr}
	ldr	r3, .L39
	mov	lr, pc
	bx	r3
	ldr	r3, .L39+4
	mov	lr, pc
	bx	r3
	ldr	r3, .L39+8
	mov	lr, pc
	bx	r3
	ldr	r3, .L39+12
	ldrh	r3, [r3]
	tst	r3, #8
	beq	.L28
	ldr	r2, .L39+16
	ldrh	r2, [r2]
	tst	r2, #8
	beq	.L37
.L28:
	tst	r3, #2
	beq	.L27
	ldr	r3, .L39+16
	ldrh	r3, [r3]
	tst	r3, #2
	beq	.L38
.L27:
	pop	{r4, lr}
	bx	lr
.L37:
	ldr	r3, .L39+20
	mov	r0, #31744
	mov	lr, pc
	bx	r3
	mov	r2, #2
	ldr	r3, .L39+24
	pop	{r4, lr}
	str	r2, [r3]
	bx	lr
.L38:
	ldr	r3, .L39+20
	mov	r0, #31
	mov	lr, pc
	bx	r3
	mov	r2, #4
	ldr	r3, .L39+24
	pop	{r4, lr}
	str	r2, [r3]
	bx	lr
.L40:
	.align	2
.L39:
	.word	updateGame
	.word	waitForVBlank
	.word	drawGame
	.word	oldButtons
	.word	buttons
	.word	fillScreen
	.word	state
	.size	gameState, .-gameState
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
	push	{r4, lr}
	ldr	r3, .L43
	mov	r0, #31744
	mov	lr, pc
	bx	r3
	mov	r2, #2
	ldr	r3, .L43+4
	pop	{r4, lr}
	str	r2, [r3]
	bx	lr
.L44:
	.align	2
.L43:
	.word	fillScreen
	.word	state
	.size	goToPause, .-goToPause
	.align	2
	.global	pauseState
	.syntax unified
	.arm
	.fpu softvfp
	.type	pauseState, %function
pauseState:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	ldr	r3, .L57
	push	{r4, lr}
	mov	lr, pc
	bx	r3
	ldr	r3, .L57+4
	ldrh	r3, [r3]
	tst	r3, #8
	beq	.L46
	ldr	r2, .L57+8
	ldrh	r0, [r2]
	ands	r0, r0, #8
	beq	.L55
.L46:
	tst	r3, #4
	beq	.L45
	ldr	r3, .L57+8
	ldrh	r3, [r3]
	tst	r3, #4
	beq	.L56
.L45:
	pop	{r4, lr}
	bx	lr
.L55:
	ldr	r3, .L57+12
	mov	lr, pc
	bx	r3
	mov	r2, #1
	ldr	r3, .L57+16
	pop	{r4, lr}
	str	r2, [r3]
	bx	lr
.L56:
	pop	{r4, lr}
	b	pauseState.part.0
.L58:
	.align	2
.L57:
	.word	waitForVBlank
	.word	oldButtons
	.word	buttons
	.word	fillScreen
	.word	state
	.size	pauseState, .-pauseState
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
	push	{r4, lr}
	ldr	r3, .L61
	mov	r0, #992
	mov	lr, pc
	bx	r3
	mov	r2, #3
	ldr	r3, .L61+4
	pop	{r4, lr}
	str	r2, [r3]
	bx	lr
.L62:
	.align	2
.L61:
	.word	fillScreen
	.word	state
	.size	goToWin, .-goToWin
	.align	2
	.global	winState
	.syntax unified
	.arm
	.fpu softvfp
	.type	winState, %function
winState:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	ldr	r3, .L70
	push	{r4, lr}
	mov	lr, pc
	bx	r3
	ldr	r3, .L70+4
	ldrh	r3, [r3]
	tst	r3, #8
	beq	.L63
	ldr	r3, .L70+8
	ldrh	r3, [r3]
	tst	r3, #8
	beq	.L69
.L63:
	pop	{r4, lr}
	bx	lr
.L69:
	pop	{r4, lr}
	b	winState.part.0
.L71:
	.align	2
.L70:
	.word	waitForVBlank
	.word	oldButtons
	.word	buttons
	.size	winState, .-winState
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
	push	{r4, lr}
	ldr	r3, .L74
	mov	r0, #31
	mov	lr, pc
	bx	r3
	mov	r2, #4
	ldr	r3, .L74+4
	pop	{r4, lr}
	str	r2, [r3]
	bx	lr
.L75:
	.align	2
.L74:
	.word	fillScreen
	.word	state
	.size	goToLose, .-goToLose
	.align	2
	.global	loseState
	.syntax unified
	.arm
	.fpu softvfp
	.type	loseState, %function
loseState:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	ldr	r3, .L81
	ldrh	r3, [r3]
	tst	r3, #8
	bxeq	lr
	ldr	r3, .L81+4
	ldrh	r3, [r3]
	tst	r3, #8
	bxne	lr
	b	loseState.part.0
.L82:
	.align	2
.L81:
	.word	oldButtons
	.word	buttons
	.size	loseState, .-loseState
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
	mov	r3, #67108864
	mov	r5, #0
	ldr	r2, .L95
	push	{r4, r7, fp, lr}
	ldr	r4, .L95+4
	strh	r2, [r3]	@ movhi
	ldr	r0, .L95+8
	ldr	r3, .L95+12
	str	r5, [r4]
	mov	lr, pc
	bx	r3
	ldr	r3, .L95+16
	ldr	r7, .L95+20
	str	r5, [r3]
	ldr	r6, .L95+24
	ldr	fp, .L95+28
	ldr	r10, .L95+32
	ldr	r9, .L95+36
	ldr	r8, .L95+40
	ldr	r5, .L95+44
.L84:
	ldr	r2, [r4]
	ldrh	r3, [r7]
.L85:
	strh	r3, [r6]	@ movhi
	ldrh	r3, [r5, #48]
	strh	r3, [r7]	@ movhi
	cmp	r2, #4
	ldrls	pc, [pc, r2, asl #2]
	b	.L85
.L87:
	.word	.L91
	.word	.L90
	.word	.L89
	.word	.L88
	.word	.L86
.L86:
	ldr	r3, .L95+48
	mov	lr, pc
	bx	r3
	b	.L84
.L88:
	mov	lr, pc
	bx	r8
	b	.L84
.L89:
	mov	lr, pc
	bx	r9
	b	.L84
.L90:
	mov	lr, pc
	bx	r10
	b	.L84
.L91:
	mov	lr, pc
	bx	fp
	b	.L84
.L96:
	.align	2
.L95:
	.word	1027
	.word	state
	.word	31775
	.word	fillScreen
	.word	seed
	.word	buttons
	.word	oldButtons
	.word	startState
	.word	gameState
	.word	pauseState
	.word	winState
	.word	67109120
	.word	loseState
	.size	main, .-main
	.comm	seed,4,4
	.comm	oldButtons,2,2
	.comm	buttons,2,2
	.comm	state,4,4
	.ident	"GCC: (devkitARM release 53) 9.1.0"
