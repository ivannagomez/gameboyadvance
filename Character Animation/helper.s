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
	.file	"helper.c"
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
	.global	drawSq
	.syntax unified
	.arm
	.fpu softvfp
	.type	drawSq, %function
drawSq:
	@ Function supports interworking.
	@ args = 4, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, lr}
	subs	r4, r3, #0
	ldrh	ip, [sp, #8]
	ble	.L5
	ldr	lr, .L13
	add	r3, r1, r2
	rsb	r3, r3, r3, lsl #4
	ldr	r1, [lr]
	add	r3, r0, r3, lsl #4
	sub	lr, r2, r2, lsl #4
	add	r4, r4, r0
	add	r1, r1, r3, lsl #1
	lsl	lr, lr, #5
.L7:
	cmp	r2, #0
	addgt	r3, r1, lr
	ble	.L10
.L8:
	strh	ip, [r3]	@ movhi
	add	r3, r3, #480
	cmp	r3, r1
	bne	.L8
.L10:
	add	r0, r0, #1
	cmp	r0, r4
	add	r1, r1, #2
	bne	.L7
.L5:
	pop	{r4, lr}
	bx	lr
.L14:
	.align	2
.L13:
	.word	.LANCHOR0
	.size	drawSq, .-drawSq
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
	ldr	r2, .L22
	ldr	ip, [r2]
.L20:
	cmp	r3, #239
	ble	.L21
.L16:
	cmp	r3, #240
	bne	.L20
	add	r1, r1, #1
	rsb	r3, r1, r1, lsl #4
	lsl	r3, r3, #5
	cmp	r1, #160
	strh	r0, [ip, r3]	@ movhi
	lsl	r2, r1, #4
	bxeq	lr
	strh	r0, [ip, r3]	@ movhi
	mov	r3, #1
.L19:
	sub	r2, r2, r1
	add	r2, r3, r2, lsl #4
	add	r3, r3, #1
	lsl	r2, r2, #1
	cmp	r3, #239
	strh	r0, [ip, r2]	@ movhi
	bgt	.L16
.L21:
	lsl	r2, r1, #4
	b	.L19
.L23:
	.align	2
.L22:
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
.L25:
	ldrh	r3, [r2, #6]
	cmp	r3, #160
	bhi	.L25
	mov	r2, #67108864
.L26:
	ldrh	r3, [r2, #6]
	cmp	r3, #159
	bls	.L26
	bx	lr
	.size	waitForVBlank, .-waitForVBlank
	.align	2
	.global	drawDragon
	.syntax unified
	.arm
	.fpu softvfp
	.type	drawDragon, %function
drawDragon:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 80
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, r7, r8, r9, r10, fp, lr}
	mov	fp, r0
	add	r0, r2, r2, lsl #1
	sub	sp, sp, #84
	cmp	r0, #0
	lsl	ip, r2, #3
	add	r10, r2, r2, lsl #3
	str	r0, [sp]
	str	ip, [sp, #12]
	add	r0, fp, r10
	lslle	ip, r2, #4
	str	r0, [sp, #16]
	strle	ip, [sp, #4]
	lsl	r0, r2, #1
	ble	.L31
	mov	r7, fp
	mov	r6, #0
	ldr	ip, .L322
	ldr	lr, [ip]
	ldr	ip, [sp]
	add	r4, r1, r2
	rsb	r4, r4, r4, lsl #4
	add	r9, fp, ip
	lsl	ip, r2, #4
	add	r5, fp, r4, lsl #4
	sub	r8, r2, r2, lsl #4
	str	ip, [sp, #4]
	lsl	r4, r4, #4
	add	r5, lr, r5, lsl #1
	lsl	r8, r8, #5
.L32:
	cmp	r2, #0
	addgt	ip, r5, r8
	ble	.L36
.L33:
	strh	r6, [ip]	@ movhi
	add	ip, ip, #480
	cmp	ip, r5
	bne	.L33
.L36:
	add	r7, r7, #1
	cmp	r7, r9
	add	r5, r5, #2
	bne	.L32
	ldr	ip, [sp, #16]
	add	r4, ip, r4
	add	lr, lr, r4, lsl #1
	ldr	r4, [sp]
	mov	r5, ip
	add	r6, ip, r4
	mov	r4, #0
.L34:
	cmp	r2, #0
	addgt	ip, lr, r8
	ble	.L39
.L37:
	strh	r4, [ip]	@ movhi
	add	ip, ip, #480
	cmp	ip, lr
	bne	.L37
.L39:
	add	r5, r5, #1
	cmp	r5, r6
	add	lr, lr, #2
	bne	.L34
.L31:
	ldr	ip, [sp, #4]
	sub	lr, r2, ip
	ldr	ip, [sp, #12]
	add	r7, r0, r2
	lsl	r7, r7, #2
	sub	r4, ip, r2
	lsl	r9, r4, #1
	cmp	r7, #0
	str	r9, [sp, #68]
	add	lr, lr, r1
	ble	.L40
	ldr	r5, .L322
	sub	r4, r9, r4, lsl #5
	ldr	ip, [r5]
	lsl	r6, r4, #5
	mov	r5, fp
	mov	r4, #0
	add	r1, lr, r9
	rsb	r1, r1, r1, lsl #4
	add	r1, fp, r1, lsl #4
	add	ip, ip, r1, lsl #1
	add	r8, r7, fp
.L41:
	cmp	r9, #0
	addgt	r1, ip, r6
	ble	.L44
.L42:
	strh	r4, [r1]	@ movhi
	add	r1, r1, #480
	cmp	r1, ip
	bne	.L42
.L44:
	add	r5, r5, #1
	cmp	r5, r8
	add	ip, ip, #2
	bne	.L41
.L40:
	ldr	ip, [sp, #12]
	ldr	r1, [sp, #16]
	add	r9, r2, r2, lsl #2
	lsl	r8, r9, #1
	sub	r6, r1, ip
	cmp	r8, #0
	str	r8, [sp, #76]
	str	r6, [sp, #8]
	lsl	ip, r2, #2
	ble	.L45
	ldr	r5, .L322
	ldr	r4, [r5]
	mov	r5, r6
	ldr	r9, [sp, #68]
	add	r1, lr, r9
	rsb	r1, r1, r1, lsl #4
	add	r1, r6, r1, lsl #4
	add	r4, r4, r1, lsl #1
	mov	r1, r5
	sub	r6, r9, r9, lsl #4
	lsl	r6, r6, #5
	add	r8, r8, r5
.L46:
	cmp	r9, #0
	addgt	r1, r4, r6
	ble	.L49
.L47:
	strh	r3, [r1]	@ movhi
	add	r1, r1, #480
	cmp	r1, r4
	bne	.L47
.L49:
	add	r5, r5, #1
	cmp	r5, r8
	add	r4, r4, #2
	bne	.L46
.L45:
	add	r1, r0, r2
	add	r1, r2, r1, lsl #2
	str	r1, [sp, #32]
	ldr	r4, [sp, #8]
	add	lr, lr, r1
	ldr	r1, [sp]
	cmp	ip, #0
	add	r6, r1, r4
	str	r6, [sp, #60]
	ble	.L50
	ldr	r5, .L322
	ldr	r4, [r5]
	mov	r5, r6
	add	r1, lr, r2
	rsb	r1, r1, r1, lsl #4
	add	r1, r6, r1, lsl #4
	ldr	r6, [sp, #4]
	add	r9, ip, r5
	sub	r8, r2, r6
	mov	r6, r5
	mov	r5, #0
	add	r4, r4, r1, lsl #1
	lsl	r8, r8, #5
.L51:
	cmp	r2, #0
	addgt	r1, r4, r8
	ble	.L54
.L52:
	strh	r5, [r1]	@ movhi
	add	r1, r1, #480
	cmp	r1, r4
	bne	.L52
.L54:
	add	r6, r6, #1
	cmp	r6, r9
	add	r4, r4, #2
	bne	.L51
.L50:
	ldr	r1, [sp]
	cmp	r7, #0
	sub	r1, lr, r1
	addle	r1, r1, r0
	strle	r1, [sp, #24]
	ble	.L55
	mov	r5, fp
	ldr	r4, .L322
	add	r1, r1, r0
	str	r1, [sp, #24]
	ldr	r4, [r4]
	rsb	r1, r1, r1, lsl #4
	add	r1, fp, r1, lsl #4
	sub	r6, r0, r0, lsl #4
	add	r7, r7, fp
	add	r4, r4, r1, lsl #1
	lsl	r6, r6, #5
.L56:
	cmp	r0, #0
	addgt	r1, r4, r6
	ble	.L59
.L57:
	strh	r3, [r1]	@ movhi
	add	r1, r1, #480
	cmp	r1, r4
	bne	.L57
.L59:
	add	r5, r5, #1
	cmp	r5, r7
	add	r4, r4, #2
	bne	.L56
.L55:
	ldr	r1, [sp]
	cmp	r1, #0
	ble	.L61
	mov	r6, fp
	ldr	r1, .L322
	add	r4, lr, r0
	ldr	r9, [r1]
	rsb	r4, r4, r4, lsl #4
	ldr	r1, [sp]
	add	r5, fp, r4, lsl #4
	sub	r7, r0, r0, lsl #4
	lsl	r4, r4, #4
	add	r5, r9, r5, lsl #1
	lsl	r7, r7, #5
	add	r8, fp, r1
.L63:
	cmp	r0, #0
	addgt	r1, r5, r7
	ble	.L66
.L62:
	strh	r3, [r1]	@ movhi
	add	r1, r1, #480
	cmp	r1, r5
	bne	.L62
.L66:
	add	r6, r6, #1
	cmp	r6, r8
	add	r5, r5, #2
	bne	.L63
	ldr	r1, [sp, #16]
	add	r4, r1, r4
	add	r9, r9, r4, lsl #1
	mov	r4, r1
	ldr	r5, [sp]
	add	r5, r1, r5
.L64:
	cmp	r0, #0
	addgt	r1, r9, r7
	ble	.L69
.L67:
	strh	r3, [r1]	@ movhi
	add	r1, r1, #480
	cmp	r1, r9
	bne	.L67
.L69:
	add	r4, r4, #1
	cmp	r4, r5
	add	r9, r9, #2
	bne	.L64
.L61:
	ldr	r4, [sp, #60]
	add	r1, ip, r2
	sub	r4, r4, r1
	str	r1, [sp, #56]
	add	r1, ip, r4
	str	r1, [sp, #28]
	add	r1, r10, r1
	str	r1, [sp, #44]
	cmp	r2, #0
	sub	r1, r1, r2
	str	r4, [sp, #52]
	str	r1, [sp, #20]
	ble	.L70
	ldr	r1, .L322
	ldr	r10, [r1]
	mov	r1, r4
	mov	r5, #0
	mov	r7, r1
	add	lr, lr, r0
	rsb	lr, lr, lr, lsl #4
	add	r4, r4, lr, lsl #4
	sub	r6, r0, r0, lsl #4
	lsl	lr, lr, #4
	add	r4, r10, r4, lsl #1
	lsl	r6, r6, #5
	add	r8, r1, r2
.L71:
	cmp	r0, #0
	addgt	r1, r4, r6
	ble	.L75
.L72:
	strh	r5, [r1]	@ movhi
	add	r1, r1, #480
	cmp	r1, r4
	bne	.L72
.L75:
	add	r7, r7, #1
	cmp	r7, r8
	add	r4, r4, #2
	bne	.L71
	ldr	r1, [sp, #44]
	mov	r4, #0
	mov	r5, r1
	add	lr, r1, lr
	add	lr, r10, lr, lsl #1
	add	r7, r1, r2
.L73:
	cmp	r0, #0
	addgt	r1, lr, r6
	ble	.L79
.L76:
	strh	r4, [r1]	@ movhi
	add	r1, r1, #480
	cmp	r1, lr
	bne	.L76
.L79:
	add	r5, r5, #1
	cmp	r5, r7
	add	lr, lr, #2
	bne	.L73
	ldr	r1, [sp, #24]
	ldr	r5, [sp, #4]
	add	lr, r0, r1
	ldr	r1, [sp, #28]
	sub	r7, r2, r5
	mov	r8, r1
	mov	r5, #0
	add	lr, lr, r2
	rsb	lr, lr, lr, lsl #4
	add	r4, r1, lr, lsl #4
	add	r4, r10, r4, lsl #1
	lsl	lr, lr, #4
	lsl	r7, r7, #5
	add	r9, r1, r2
.L225:
	add	r1, r4, r7
.L80:
	strh	r5, [r1]	@ movhi
	add	r1, r1, #480
	cmp	r1, r4
	bne	.L80
	add	r8, r8, #1
	cmp	r8, r9
	add	r4, r1, #2
	bne	.L225
	ldr	r4, [sp]
	ldr	r1, [sp, #20]
	sub	r5, r1, r4
	mov	r4, #0
	add	lr, r5, lr
	add	lr, r10, lr, lsl #1
	add	r8, r5, r2
.L224:
	add	r1, lr, r7
.L82:
	strh	r4, [r1]	@ movhi
	add	r1, r1, #480
	cmp	r1, lr
	bne	.L82
	add	r5, r5, #1
	cmp	r5, r8
	add	lr, r1, #2
	bne	.L224
	mov	r4, #0
	ldr	r1, [sp, #24]
	add	lr, r1, r2
	rsb	lr, lr, lr, lsl #4
	add	lr, fp, lr, lsl #4
	rsb	r5, r1, r1, lsl #4
	add	lr, r10, lr, lsl #1
	add	r8, fp, r2
	lsl	r5, r5, #4
.L85:
	add	r1, lr, r7
.L84:
	strh	r4, [r1]	@ movhi
	add	r1, r1, #480
	cmp	r1, lr
	bne	.L84
	add	fp, fp, #1
	cmp	fp, r8
	add	lr, r1, #2
	bne	.L85
	mov	r7, #0
	mov	r4, r7
	ldr	r1, [sp, #20]
	add	r5, r1, r5
	add	r5, r10, r5, lsl #1
.L86:
	mov	lr, r5
	mov	r1, #0
.L87:
	add	r1, r1, #1
	cmp	r2, r1
	strh	r4, [lr]	@ movhi
	add	lr, lr, #480
	bgt	.L87
	add	r7, r7, #1
	cmp	r2, r7
	add	r5, r5, #2
	bgt	.L86
	mov	r7, #0
	mov	r5, r7
	ldr	r1, [sp, #24]
	rsb	lr, r1, r1, lsl #4
	ldr	r1, [sp, #52]
	add	r4, r1, lr, lsl #4
	add	r4, r10, r4, lsl #1
	lsl	lr, lr, #4
.L90:
	cmp	r0, #0
	addgt	r1, r4, r6
	ble	.L93
.L89:
	strh	r5, [r1]	@ movhi
	add	r1, r1, #480
	cmp	r1, r4
	bne	.L89
.L93:
	add	r7, r7, #1
	cmp	r2, r7
	add	r4, r4, #2
	bgt	.L90
	mov	r4, #0
	ldr	r1, [sp, #44]
	add	lr, lr, r1
	add	r10, r10, lr, lsl #1
	mov	lr, r4
.L91:
	cmp	r0, #0
	addgt	r1, r10, r6
	ble	.L96
.L94:
	strh	lr, [r1]	@ movhi
	add	r1, r1, #480
	cmp	r1, r10
	bne	.L94
.L96:
	add	r4, r4, #1
	cmp	r2, r4
	add	r10, r10, #2
	bgt	.L91
.L70:
	ldr	r1, [sp]
	ldr	r4, [sp, #32]
	ldr	lr, [sp, #20]
	cmp	r1, #0
	sub	lr, lr, r4
	add	r1, r0, r2
	str	lr, [sp, #32]
	lsl	lr, r1, #1
	str	lr, [sp, #48]
	ldr	lr, [sp, #24]
	sub	r1, lr, r1, lsl #1
	str	r1, [sp, #36]
	ble	.L98
	ldr	r4, [sp, #32]
	mov	r6, r4
	mov	r5, #0
	ldr	lr, [sp, #36]
	ldr	r1, .L322
	add	lr, lr, ip
	ldr	r9, [r1]
	rsb	lr, lr, lr, lsl #4
	ldr	r8, [sp]
	mov	r1, r4
	sub	r7, ip, ip, lsl #4
	add	r4, r4, lr, lsl #4
	add	r4, r9, r4, lsl #1
	lsl	lr, lr, #4
	lsl	r7, r7, #5
	add	r8, r6, r8
.L100:
	cmp	ip, #0
	addgt	r1, r4, r7
	ble	.L103
.L99:
	strh	r5, [r1]	@ movhi
	add	r1, r1, #480
	cmp	r1, r4
	bne	.L99
.L103:
	add	r6, r6, #1
	cmp	r6, r8
	add	r4, r4, #2
	bne	.L100
	ldr	r1, [sp, #20]
	add	lr, r1, lr
	add	r9, r9, lr, lsl #1
	ldr	lr, [sp]
	mov	r4, r1
	add	r5, r1, lr
	mov	lr, #0
.L101:
	cmp	ip, #0
	addgt	r1, r9, r7
	ble	.L106
.L104:
	strh	lr, [r1]	@ movhi
	add	r1, r1, #480
	cmp	r1, r9
	bne	.L104
.L106:
	add	r4, r4, #1
	cmp	r4, r5
	add	r9, r9, #2
	bne	.L101
.L98:
	ldr	r1, [sp, #36]
	sub	r1, r1, r2
	str	r1, [sp, #72]
	add	r1, r0, r1
	str	r1, [sp, #64]
	ldr	r1, [sp, #32]
	cmp	r2, #0
	sub	r1, r1, r2
	str	r1, [sp, #40]
	ldrle	r1, [sp, #64]
	addle	r9, r1, r0
	ble	.L108
	ldr	r4, [sp, #52]
	mov	r6, r4
	mov	r5, #0
	ldr	lr, [sp, #72]
	ldr	r1, .L322
	ldr	r7, [sp, #4]
	add	lr, lr, r2
	rsb	lr, lr, lr, lsl #4
	ldr	r10, [r1]
	add	r4, r4, lr, lsl #4
	sub	r7, r2, r7
	lsl	lr, lr, #4
	add	r4, r10, r4, lsl #1
	lsl	r7, r7, #5
	add	r8, r6, r2
.L110:
	add	r1, r4, r7
.L109:
	strh	r5, [r1]	@ movhi
	add	r1, r1, #480
	cmp	r1, r4
	bne	.L109
	add	r6, r6, #1
	cmp	r6, r8
	add	r4, r1, #2
	bne	.L110
	ldr	r1, [sp, #44]
	mov	r4, #0
	mov	r5, r1
	add	lr, r1, lr
	add	lr, r10, lr, lsl #1
	add	r6, r1, r2
.L113:
	add	r1, lr, r7
.L112:
	strh	r4, [r1]	@ movhi
	add	r1, r1, #480
	cmp	r1, lr
	bne	.L112
	add	r5, r5, #1
	cmp	r5, r6
	add	lr, r1, #2
	bne	.L113
	ldr	r1, [sp, #64]
	add	r9, r1, r0
	ldr	r1, [sp, #40]
	mov	r5, #0
	mov	r6, r1
	rsb	lr, r9, r9, lsl #4
	add	r4, r1, lr, lsl #4
	sub	r7, r0, r0, lsl #4
	add	r4, r10, r4, lsl #1
	lsl	lr, lr, #4
	lsl	r7, r7, #5
	add	r8, r1, r2
.L114:
	cmp	r0, #0
	addgt	r1, r4, r7
	ble	.L118
.L115:
	strh	r5, [r1]	@ movhi
	add	r1, r1, #480
	cmp	r1, r4
	bne	.L115
.L118:
	add	r6, r6, #1
	cmp	r6, r8
	add	r4, r4, #2
	bne	.L114
	ldr	r1, [sp, #4]
	add	r4, r1, r2
	ldr	r1, [sp, #40]
	add	r4, r4, r1
	add	lr, r4, lr
	add	r10, r10, lr, lsl #1
	mov	lr, #0
	add	r5, r4, r2
.L223:
	cmp	r0, #0
	addgt	r1, r10, r7
	ble	.L121
.L119:
	strh	lr, [r1]	@ movhi
	add	r1, r1, #480
	cmp	r1, r10
	bne	.L119
.L121:
	add	r4, r4, #1
	cmp	r4, r5
	add	r10, r10, #2
	bne	.L223
.L108:
	cmp	r0, #0
	ble	.L122
	ldr	r4, [sp, #32]
	mov	r7, r4
	ldr	r1, .L322
	rsb	lr, r9, r9, lsl #4
	ldr	r6, [r1]
	add	r4, r4, lr, lsl #4
	sub	r5, r0, r0, lsl #4
	add	r4, r6, r4, lsl #1
	lsl	lr, lr, #4
	lsl	r5, r5, #5
	add	r8, r7, r0
.L124:
	add	r1, r4, r5
.L123:
	strh	r3, [r1]	@ movhi
	add	r1, r1, #480
	cmp	r1, r4
	bne	.L123
	add	r7, r7, #1
	cmp	r7, r8
	add	r4, r1, #2
	bne	.L124
	ldr	r4, [sp, #44]
	add	lr, r4, lr
	add	lr, r6, lr, lsl #1
	add	r7, r4, r0
.L125:
	add	r1, lr, r5
.L126:
	strh	r3, [r1]	@ movhi
	add	r1, r1, #480
	cmp	r1, lr
	bne	.L126
	add	r4, r4, #1
	cmp	r4, r7
	add	lr, r1, #2
	bne	.L125
	ldr	r1, [sp, #36]
	ldr	r7, [sp, #52]
	add	lr, r1, r0
	rsb	lr, lr, lr, lsl #4
	add	r4, r7, lr, lsl #4
	add	r4, r6, r4, lsl #1
	lsl	lr, lr, #4
	add	r8, r7, r0
.L129:
	add	r1, r4, r5
.L128:
	strh	r3, [r1]	@ movhi
	add	r1, r1, #480
	cmp	r4, r1
	bne	.L128
	add	r7, r7, #1
	cmp	r8, r7
	add	r4, r4, #2
	bne	.L129
	ldr	r4, [sp, #20]
	add	lr, lr, r4
	add	r6, r6, lr, lsl #1
	add	lr, r4, r0
.L130:
	add	r1, r6, r5
.L131:
	strh	r3, [r1]	@ movhi
	add	r1, r1, #480
	cmp	r1, r6
	bne	.L131
	add	r4, r4, #1
	cmp	r4, lr
	add	r6, r6, #2
	bne	.L130
.L122:
	ldr	r1, [sp, #12]
	ldr	lr, [sp, #40]
	cmp	r1, #0
	ldr	r1, [sp, #56]
	add	fp, r1, lr
	ble	.L319
	mov	r6, fp
	mvn	r5, #64512
	ldr	lr, .L322
	add	r1, r9, r0
	str	r1, [sp, #20]
	ldr	lr, [lr]
	rsb	r1, r1, r1, lsl #4
	add	r1, fp, r1, lsl #4
	add	lr, lr, r1, lsl #1
	ldr	r1, [sp, #12]
	sub	r7, r0, r0, lsl #4
	lsl	r7, r7, #5
	add	r4, r1, fp
.L133:
	cmp	r0, #0
	addgt	r1, r7, lr
	ble	.L136
.L134:
	strh	r5, [r1]	@ movhi
	add	r1, r1, #480
	cmp	lr, r1
	bne	.L134
.L136:
	add	r6, r6, #1
	cmp	r6, r4
	add	lr, lr, #2
	bne	.L133
.L132:
	ldr	r8, [sp, #48]
	cmp	r8, #0
	ble	.L137
	ldr	r5, .L322
	ldr	r1, [sp, #20]
	ldr	lr, [r5]
	ldr	r6, [sp, #4]
	ldr	r5, [sp, #28]
	add	r1, r1, r2
	rsb	r1, r1, r1, lsl #4
	add	r1, r5, r1, lsl #4
	sub	r7, r2, r6
	add	r8, r8, r5
	mov	r6, r5
	mvn	r5, #64512
	add	lr, lr, r1, lsl #1
	lsl	r7, r7, #5
.L138:
	cmp	r2, #0
	addgt	r1, r7, lr
	ble	.L141
.L139:
	strh	r5, [r1]	@ movhi
	add	r1, r1, #480
	cmp	lr, r1
	bne	.L139
.L141:
	add	r6, r6, #1
	cmp	r8, r6
	add	lr, lr, #2
	bne	.L138
.L137:
	cmp	ip, #0
	ble	.L142
	ldr	r5, .L322
	ldr	lr, [r5]
	ldr	r5, [sp, #4]
	sub	r7, r2, r5
	mvn	r5, #64512
	ldr	r1, [sp, #24]
	ldr	r6, [sp, #60]
	add	r1, r1, r2
	rsb	r1, r1, r1, lsl #4
	add	r1, r6, r1, lsl #4
	add	lr, lr, r1, lsl #1
	add	r8, ip, r6
	lsl	r7, r7, #5
.L143:
	cmp	r2, #0
	addgt	r1, r7, lr
	ble	.L146
.L144:
	strh	r5, [r1]	@ movhi
	add	r1, r1, #480
	cmp	lr, r1
	bne	.L144
.L146:
	add	r6, r6, #1
	cmp	r8, r6
	add	lr, lr, #2
	bne	.L143
.L142:
	cmp	r2, #0
	ble	.L147
	ldr	r1, .L322
	ldr	r7, [r1]
	ldr	r1, [sp, #8]
	mov	r8, #0
	mov	r9, r1
	ldr	lr, [sp, #36]
	ldr	r6, [sp, #4]
	add	lr, lr, r2
	rsb	lr, lr, lr, lsl #4
	add	r5, r1, lr, lsl #4
	sub	r6, r2, r6
	lsl	lr, lr, #4
	add	r5, r7, r5, lsl #1
	lsl	r6, r6, #5
	add	r10, r2, r1
.L148:
	add	r1, r6, r5
.L149:
	strh	r8, [r1]	@ movhi
	add	r1, r1, #480
	cmp	r5, r1
	bne	.L149
	add	r9, r9, #1
	cmp	r10, r9
	add	r5, r5, #2
	bne	.L148
	mov	r8, r4
	mov	r5, #0
	add	lr, lr, r4
	add	lr, r7, lr, lsl #1
	add	r9, r2, r4
.L150:
	add	r1, r6, lr
.L151:
	strh	r5, [r1]	@ movhi
	add	r1, r1, #480
	cmp	lr, r1
	bne	.L151
	add	r8, r8, #1
	cmp	r9, r8
	add	lr, lr, #2
	bne	.L150
	mov	r9, fp
	mov	r8, #0
	ldr	r1, [sp, #64]
	add	lr, r1, r2
	rsb	lr, lr, lr, lsl #4
	add	r5, fp, lr, lsl #4
	add	r5, r7, r5, lsl #1
	lsl	lr, lr, #4
	add	r10, r2, fp
.L154:
	add	r1, r6, r5
.L153:
	strh	r8, [r1]	@ movhi
	add	r1, r1, #480
	cmp	r1, r5
	bne	.L153
	add	r9, r9, #1
	cmp	r10, r9
	add	r5, r1, #2
	bne	.L154
	ldr	r1, [sp, #16]
	add	lr, r1, lr
	add	r7, r7, lr, lsl #1
	mov	r5, r1
	mov	lr, #0
	add	r8, r1, r2
.L155:
	add	r1, r7, r6
.L156:
	strh	lr, [r1]	@ movhi
	add	r1, r1, #480
	cmp	r7, r1
	bne	.L156
	add	r5, r5, #1
	cmp	r8, r5
	add	r7, r7, #2
	bne	.L155
.L147:
	ldr	r9, [sp, #48]
	ldr	r1, [sp, #20]
	ldr	lr, [sp]
	cmp	r9, #0
	sub	lr, r1, lr
	ble	.L157
	ldr	r6, .L322
	ldr	r7, [sp, #4]
	ldr	r5, [r6]
	add	r1, lr, r2
	ldr	r6, [sp, #28]
	rsb	r1, r1, r1, lsl #4
	add	r1, r6, r1, lsl #4
	sub	r8, r2, r7
	add	r9, r9, r6
	mov	r7, r6
	mov	r6, #0
	add	r5, r5, r1, lsl #1
	lsl	r8, r8, #5
.L158:
	cmp	r2, #0
	addgt	r1, r8, r5
	ble	.L161
.L159:
	strh	r6, [r1]	@ movhi
	add	r1, r1, #480
	cmp	r5, r1
	bne	.L159
.L161:
	add	r7, r7, #1
	cmp	r9, r7
	add	r5, r5, #2
	bne	.L158
.L157:
	ldr	r7, [sp, #76]
	cmp	r7, #0
	sub	lr, lr, r7
	ble	.L162
	ldr	r6, .L322
	ldr	r5, [r6]
	mov	r6, r7
	ldr	r9, [sp, #8]
	add	r1, lr, r0
	rsb	r1, r1, r1, lsl #4
	add	r1, r9, r1, lsl #4
	mov	r7, r9
	add	r9, r6, r9
	mov	r6, #0
	sub	r8, r0, r0, lsl #4
	add	r5, r5, r1, lsl #1
	lsl	r8, r8, #5
.L163:
	cmp	r0, #0
	addgt	r1, r8, r5
	ble	.L166
.L164:
	strh	r6, [r1]	@ movhi
	add	r1, r1, #480
	cmp	r5, r1
	bne	.L164
.L166:
	add	r7, r7, #1
	cmp	r9, r7
	add	r5, r5, #2
	bne	.L163
.L162:
	ldr	r1, [sp, #12]
	cmp	r1, #0
	sub	r6, lr, r2
	ble	.L167
	mov	r5, fp
	mov	r7, fp
	ldr	r1, .L322
	add	lr, lr, r0
	ldr	r9, [r1]
	rsb	lr, lr, lr, lsl #4
	add	lr, fp, lr, lsl #4
	sub	r8, r0, r0, lsl #4
	add	lr, r9, lr, lsl #1
	lsl	r8, r8, #5
.L168:
	cmp	r0, #0
	addgt	r1, r8, lr
	ble	.L172
.L169:
	strh	r3, [r1]	@ movhi
	add	r1, r1, #480
	cmp	lr, r1
	bne	.L169
.L172:
	add	r7, r7, #1
	cmp	r4, r7
	add	lr, lr, #2
	bne	.L168
	mov	lr, #0
	add	r1, r6, r2
	rsb	r1, r1, r1, lsl #4
	add	fp, fp, r1, lsl #4
	ldr	r1, [sp, #4]
	sub	r7, r2, r1
	add	r9, r9, fp, lsl #1
	lsl	r7, r7, #5
.L170:
	cmp	r2, #0
	addgt	r1, r7, r9
	ble	.L175
.L173:
	strh	lr, [r1]	@ movhi
	add	r1, r1, #480
	cmp	r9, r1
	bne	.L173
.L175:
	add	r5, r5, #1
	cmp	r4, r5
	add	r9, r9, #2
	bne	.L170
.L167:
	ldr	r5, [sp, #48]
	cmp	r5, #0
	ble	.L176
	ldr	r1, .L322
	ldr	r7, [sp, #4]
	ldr	r10, [r1]
	ldr	r1, [sp, #28]
	sub	r8, r2, r7
	add	r9, r5, r1
	mov	r7, r1
	mov	r5, r1
	add	lr, r6, r2
	rsb	lr, lr, lr, lsl #4
	add	lr, r1, lr, lsl #4
	add	lr, r10, lr, lsl #1
	lsl	r8, r8, #5
.L177:
	cmp	r2, #0
	addgt	r1, r8, lr
	ble	.L181
.L178:
	strh	r3, [r1]	@ movhi
	add	r1, r1, #480
	cmp	lr, r1
	bne	.L178
.L181:
	add	r7, r7, #1
	cmp	r9, r7
	add	lr, lr, #2
	bne	.L177
	ldr	lr, [sp, #28]
	rsb	r1, r6, r6, lsl #4
	add	r1, lr, r1, lsl #4
	mov	lr, #0
	add	r10, r10, r1, lsl #1
.L222:
	cmp	r2, #0
	addgt	r1, r8, r10
	ble	.L184
.L182:
	strh	lr, [r1]	@ movhi
	add	r1, r1, #480
	cmp	r10, r1
	bne	.L182
.L184:
	add	r5, r5, #1
	cmp	r9, r5
	add	r10, r10, #2
	bne	.L222
.L176:
	ldr	r1, [sp, #56]
	cmp	r0, #0
	add	r1, r1, r6
	str	r1, [sp, #12]
	ble	.L186
	ldr	r5, [sp, #8]
	mov	r7, r5
	mov	r6, #0
	ldr	fp, [sp]
	ldr	lr, [sp, #12]
	ldr	r1, .L322
	add	lr, lr, fp
	ldr	r10, [r1]
	rsb	lr, lr, lr, lsl #4
	mov	r1, r5
	sub	r8, fp, fp, lsl #4
	add	r5, r5, lr, lsl #4
	add	r5, r10, r5, lsl #1
	lsl	lr, lr, #4
	lsl	r8, r8, #5
	add	r9, r0, r7
.L188:
	cmp	fp, #0
	addgt	r1, r8, r5
	ble	.L191
.L187:
	strh	r6, [r1]	@ movhi
	add	r1, r1, #480
	cmp	r5, r1
	bne	.L187
.L191:
	add	r7, r7, #1
	cmp	r9, r7
	add	r5, r5, #2
	bne	.L188
	ldr	r5, [sp, #16]
	add	lr, lr, r5
	add	r10, r10, lr, lsl #1
	mov	lr, #0
	ldr	r7, [sp]
	add	r6, r0, r5
.L189:
	cmp	r7, #0
	addgt	r1, r8, r10
	ble	.L194
.L192:
	strh	lr, [r1]	@ movhi
	add	r1, r1, #480
	cmp	r10, r1
	bne	.L192
.L194:
	add	r5, r5, #1
	cmp	r6, r5
	add	r10, r10, #2
	bne	.L189
.L186:
	ldr	r1, [sp, #12]
	add	r0, r0, r1
	ldr	r1, [sp, #68]
	cmp	r2, #0
	sub	r1, r4, r1
	str	r1, [sp, #16]
	ble	.L320
	ldr	r1, [sp, #8]
	mov	r6, #31744
	mov	r5, r1
	mov	r8, r1
	ldr	lr, .L322
	add	r10, r0, r2
	ldr	r0, [sp, #4]
	ldr	r9, [lr]
	rsb	r10, r10, r10, lsl #4
	str	lr, [sp, #20]
	sub	lr, r2, r0
	add	r0, r1, r10, lsl #4
	lsl	lr, lr, #5
	lsl	r10, r10, #4
	add	r0, r9, r0, lsl #1
	add	r7, r2, r1
.L198:
	add	r1, lr, r0
.L197:
	strh	r6, [r1]	@ movhi
	add	r1, r1, #480
	cmp	r0, r1
	bne	.L197
	add	r8, r8, #1
	cmp	r7, r8
	add	r0, r0, #2
	bne	.L198
	add	r0, r10, r4
	mov	r6, r4
	mov	fp, r4
	mov	r10, #31744
	add	r0, r9, r0, lsl #1
	add	r8, r2, r4
.L199:
	add	r1, lr, r0
.L200:
	strh	r10, [r1]	@ movhi
	add	r1, r1, #480
	cmp	r0, r1
	bne	.L200
	add	fp, fp, #1
	cmp	r8, fp
	add	r0, r0, #2
	bne	.L199
	mvn	fp, #32768
	ldr	r1, [sp, #12]
	add	r0, r1, r2
	ldr	r1, [sp, #8]
	rsb	r0, r0, r0, lsl #4
	add	r10, r1, r0, lsl #4
	add	r10, r9, r10, lsl #1
	lsl	r0, r0, #4
.L203:
	add	r1, lr, r10
.L202:
	strh	fp, [r1]	@ movhi
	add	r1, r1, #480
	cmp	r10, r1
	bne	.L202
	add	r5, r5, #1
	cmp	r7, r5
	add	r10, r10, #2
	bne	.L203
	add	r0, r4, r0
	mvn	r4, #32768
	add	r0, r9, r0, lsl #1
.L204:
	add	r1, lr, r0
.L205:
	strh	r4, [r1]	@ movhi
	add	r1, r1, #480
	cmp	r0, r1
	bne	.L205
	add	r6, r6, #1
	cmp	r8, r6
	add	r0, r0, #2
	bne	.L204
	ldr	r1, [sp]
	cmp	r1, #0
	ble	.L321
	b	.L323
.L324:
	.align	2
.L322:
	.word	.LANCHOR0
.L323:
.L220:
	mov	lr, #0
	ldr	r1, [sp, #12]
	ldr	r4, [sp, #16]
	add	r0, r1, ip
	rsb	r1, r0, r0, lsl #4
	add	r1, r4, r1, lsl #4
	mov	r4, lr
	sub	r6, ip, ip, lsl #4
	ldr	r7, [sp]
	add	r9, r9, r1, lsl #1
	lsl	r6, r6, #5
	lsl	r5, ip, #4
.L207:
	cmp	ip, #0
	addgt	r1, r6, r9
	ble	.L211
.L208:
	strh	r4, [r1]	@ movhi
	add	r1, r1, #480
	cmp	r9, r1
	bne	.L208
.L211:
	add	lr, lr, #1
	cmp	r7, lr
	add	r9, r9, #2
	bgt	.L207
	cmp	r2, #0
	ble	.L30
	ldr	r1, [sp, #20]
	ldr	r9, [r1]
.L221:
	mov	r6, #0
	ldr	r1, [sp, #72]
	rsb	r4, r1, r1, lsl #4
	ldr	r1, [sp, #32]
	add	r4, r1, r4, lsl #4
	add	r4, r9, r4, lsl #1
.L215:
	mov	lr, r4
	mov	r1, #0
.L214:
	add	r1, r1, #1
	cmp	r2, r1
	strh	r3, [lr]	@ movhi
	add	lr, lr, #480
	bgt	.L214
	add	r6, r6, #1
	cmp	r2, r6
	add	r4, r4, #2
	bgt	.L215
	ldr	r1, [sp, #40]
	rsb	r0, r0, r0, lsl #4
	add	r1, r1, r0, lsl #4
	mov	r0, #0
	sub	lr, ip, r5
	add	r9, r9, r1, lsl #1
	lsl	lr, lr, #5
.L216:
	cmp	ip, #0
	addgt	r1, r9, lr
	ble	.L219
.L217:
	strh	r3, [r1]	@ movhi
	add	r1, r1, #480
	cmp	r1, r9
	bne	.L217
.L219:
	add	r0, r0, #1
	cmp	r2, r0
	add	r9, r9, #2
	bgt	.L216
.L30:
	add	sp, sp, #84
	@ sp needed
	pop	{r4, r5, r6, r7, r8, r9, r10, fp, lr}
	bx	lr
.L319:
	add	r1, r9, r0
	str	r1, [sp, #20]
	ldr	r1, [sp, #12]
	add	r4, r1, fp
	b	.L132
.L320:
	ldr	r1, [sp]
	cmp	r1, #0
	ble	.L30
	ldr	r1, .L322
	str	r1, [sp, #20]
	ldr	r9, [r1]
	b	.L220
.L321:
	ldr	r1, [sp, #12]
	lsl	r5, ip, #4
	add	r0, r1, ip
	b	.L221
	.size	drawDragon, .-drawDragon
	.align	2
	.global	drawDragonFire
	.syntax unified
	.arm
	.fpu softvfp
	.type	drawDragonFire, %function
drawDragonFire:
	@ Function supports interworking.
	@ args = 8, pretend = 0, frame = 8
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, r7, r8, r9, r10, fp, lr}
	rsb	ip, r2, r2, lsl #28
	add	r7, r2, r2, lsl #1
	rsb	ip, r2, ip, lsl #3
	sub	sp, sp, #12
	add	ip, r1, ip, lsl #1
	cmp	r7, #0
	lsl	r1, r2, #2
	sub	r5, r0, r2, lsl #2
	str	r1, [sp, #4]
	ldrh	r0, [sp, #48]
	ldrh	r4, [sp, #52]
	add	r9, r2, r2, lsl #2
	lsl	r6, r2, #1
	ble	.L326
	mov	r8, r5
	ldr	lr, .L366
	add	r1, ip, r9
	ldr	lr, [lr]
	rsb	r1, r1, r1, lsl #4
	add	r1, r5, r1, lsl #4
	sub	r10, r9, r9, lsl #4
	add	lr, lr, r1, lsl #1
	lsl	r10, r10, #5
	add	fp, r7, r5
.L327:
	cmp	r9, #0
	addgt	r1, lr, r10
	ble	.L330
.L328:
	strh	r3, [r1]	@ movhi
	add	r1, r1, #480
	cmp	r1, lr
	bne	.L328
.L330:
	add	r8, r8, #1
	cmp	r8, fp
	add	lr, lr, #2
	bne	.L327
.L326:
	cmp	r9, #0
	add	ip, ip, r2
	sub	r10, r5, r2
	ble	.L331
	mov	r8, r10
	ldr	lr, .L366
	add	r1, ip, r7
	ldr	lr, [lr]
	rsb	r1, r1, r1, lsl #4
	add	r1, r10, r1, lsl #4
	sub	fp, r7, r7, lsl #4
	add	r9, r9, r10
	add	lr, lr, r1, lsl #1
	lsl	fp, fp, #5
.L332:
	cmp	r7, #0
	addgt	r1, lr, fp
	ble	.L335
.L333:
	strh	r3, [r1]	@ movhi
	add	r1, r1, #480
	cmp	r1, lr
	bne	.L333
.L335:
	add	r8, r8, #1
	cmp	r8, r9
	add	lr, lr, #2
	bne	.L332
.L331:
	cmp	r2, #0
	add	r10, r10, r6
	sub	ip, ip, r6
	ble	.L341
	mov	r8, r10
	ldr	lr, .L366
	add	r1, ip, r2
	ldr	lr, [lr]
	rsb	r1, r1, r1, lsl #4
	add	r1, r10, r1, lsl #4
	sub	r9, r2, r2, lsl #4
	add	lr, lr, r1, lsl #1
	lsl	r9, r9, #5
	add	fp, r10, r2
.L340:
	add	r1, lr, r9
.L339:
	strh	r3, [r1]	@ movhi
	add	r1, r1, #480
	cmp	r1, lr
	bne	.L339
	add	r8, r8, #1
	cmp	r8, fp
	add	lr, lr, #2
	bne	.L340
.L341:
	ldr	r3, [sp, #4]
	cmp	r7, #0
	add	ip, r3, ip
	ble	.L338
	ldr	r1, .L366
	add	r3, ip, r6
	ldr	r1, [r1]
	rsb	r3, r3, r3, lsl #4
	add	r3, r5, r3, lsl #4
	sub	lr, r6, r6, lsl #4
	add	r7, r7, r5
	add	r1, r1, r3, lsl #1
	lsl	lr, lr, #5
.L342:
	cmp	r6, #0
	addgt	r3, r1, lr
	ble	.L345
.L343:
	strh	r0, [r3]	@ movhi
	add	r3, r3, #480
	cmp	r3, r1
	bne	.L343
.L345:
	add	r5, r5, #1
	cmp	r5, r7
	add	r1, r1, #2
	bne	.L342
.L338:
	cmp	r2, #0
	sub	r3, ip, r2
	ble	.L325
	mov	lr, r10
	mov	r5, r10
	ldr	r1, .L366
	add	r3, r3, r2
	ldr	r7, [r1]
	rsb	r3, r3, r3, lsl #4
	sub	r8, r2, r2, lsl #4
	add	r1, r10, r3, lsl #4
	add	r1, r7, r1, lsl #1
	lsl	r8, r8, #5
	add	r2, r2, r10
.L349:
	add	r3, r8, r1
.L348:
	strh	r0, [r3]	@ movhi
	add	r3, r3, #480
	cmp	r1, r3
	bne	.L348
	add	r5, r5, #1
	cmp	r2, r5
	add	r1, r1, #2
	bne	.L349
	add	ip, ip, r6
	rsb	ip, ip, ip, lsl #4
	add	r10, r10, ip, lsl #4
	sub	r0, r6, r6, lsl #4
	add	r1, r7, r10, lsl #1
	lsl	r0, r0, #5
.L350:
	cmp	r6, #0
	addgt	r3, r0, r1
	ble	.L353
.L351:
	strh	r4, [r3]	@ movhi
	add	r3, r3, #480
	cmp	r3, r1
	bne	.L351
.L353:
	add	lr, lr, #1
	cmp	r2, lr
	add	r1, r1, #2
	bne	.L350
.L325:
	add	sp, sp, #12
	@ sp needed
	pop	{r4, r5, r6, r7, r8, r9, r10, fp, lr}
	bx	lr
.L367:
	.align	2
.L366:
	.word	.LANCHOR0
	.size	drawDragonFire, .-drawDragonFire
	.global	videoBuffer
	.data
	.align	2
	.set	.LANCHOR0,. + 0
	.type	videoBuffer, %object
	.size	videoBuffer, 4
videoBuffer:
	.word	100663296
	.ident	"GCC: (devkitARM release 53) 9.1.0"
