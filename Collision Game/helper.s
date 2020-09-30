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
	@ args = 16, pretend = 0, frame = 96
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, r7, r8, r9, r10, fp, lr}
	add	ip, r2, r2, lsl #1
	sub	sp, sp, #100
	cmp	ip, #0
	str	ip, [sp, #4]
	add	ip, r2, r2, lsl #3
	str	r1, [sp, #12]
	add	r1, r0, ip
	str	r0, [sp, #32]
	str	r1, [sp, #36]
	lslle	r0, r2, #4
	lsl	r1, r2, #3
	str	ip, [sp, #40]
	str	r1, [sp, #28]
	ldrh	r5, [sp, #140]
	ldrh	r1, [sp, #136]
	ldrh	lr, [sp, #144]
	ldrh	r4, [sp, #148]
	strle	r0, [sp, #8]
	lsl	ip, r2, #1
	ble	.L31
	ldr	r0, .L329
	ldr	r6, [sp, #12]
	ldr	fp, [r0]
	ldr	r10, [sp, #4]
	ldr	r0, [sp, #32]
	add	r6, r6, r2
	rsb	r6, r6, r6, lsl #4
	add	r7, r0, r6, lsl #4
	mov	r8, r0
	add	r10, r0, r10
	lsl	r0, r2, #4
	sub	r9, r2, r2, lsl #4
	str	r0, [sp, #8]
	lsl	r6, r6, #4
	add	r7, fp, r7, lsl #1
	lsl	r9, r9, #5
.L32:
	cmp	r2, #0
	addgt	r0, r7, r9
	ble	.L36
.L33:
	strh	r1, [r0]	@ movhi
	add	r0, r0, #480
	cmp	r0, r7
	bne	.L33
.L36:
	add	r8, r8, #1
	cmp	r8, r10
	add	r7, r7, #2
	bne	.L32
	ldr	r0, [sp, #36]
	add	r6, r0, r6
	add	fp, fp, r6, lsl #1
	mov	r6, r0
	ldr	r7, [sp, #4]
	add	r7, r0, r7
.L34:
	cmp	r2, #0
	addgt	r0, fp, r9
	ble	.L39
.L37:
	strh	r1, [r0]	@ movhi
	add	r0, r0, #480
	cmp	r0, fp
	bne	.L37
.L39:
	add	r6, r6, #1
	cmp	r6, r7
	add	fp, fp, #2
	bne	.L34
.L31:
	ldr	r0, [sp, #8]
	sub	r10, r2, r0
	ldr	r0, [sp, #28]
	add	r8, ip, r2
	sub	r7, r0, r2
	lsl	fp, r8, #2
	ldr	r0, [sp, #12]
	lsl	r9, r7, #1
	cmp	fp, #0
	str	r9, [sp, #24]
	add	r10, r10, r0
	ble	.L40
	ldr	r8, .L329
	add	r0, r10, r9
	sub	r7, r9, r7, lsl #5
	ldr	r9, [sp, #32]
	ldr	r6, [r8]
	rsb	r0, r0, r0, lsl #4
	add	r0, r9, r0, lsl #4
	str	r10, [sp, #12]
	ldr	r10, [sp, #24]
	lsl	r8, r7, #5
	add	r6, r6, r0, lsl #1
	mov	r7, r9
	mov	r0, r9
	add	r9, fp, r9
.L41:
	cmp	r10, #0
	addgt	r0, r6, r8
	ble	.L44
.L42:
	strh	r1, [r0]	@ movhi
	add	r0, r0, #480
	cmp	r0, r6
	bne	.L42
.L44:
	add	r7, r7, #1
	cmp	r7, r9
	add	r6, r6, #2
	bne	.L41
	ldr	r10, [sp, #12]
.L40:
	add	r0, r2, r2, lsl #2
	lsl	r9, r0, #1
	ldr	r6, [sp, #28]
	ldr	r0, [sp, #36]
	cmp	r9, #0
	sub	r8, r0, r6
	lsl	r0, r2, #2
	str	r9, [sp, #92]
	str	r8, [sp, #20]
	str	r0, [sp, #16]
	ble	.L45
	ldr	r7, .L329
	ldr	r6, [r7]
	mov	r7, r8
	ldr	r0, [sp, #24]
	add	r0, r10, r0
	rsb	r0, r0, r0, lsl #4
	add	r0, r8, r0, lsl #4
	add	r6, r6, r0, lsl #1
	mov	r0, r7
	ldr	r8, [sp, #24]
	str	r10, [sp, #12]
	sub	r8, r8, r8, lsl #4
	ldr	r10, [sp, #24]
	lsl	r8, r8, #5
	add	r9, r9, r7
.L46:
	cmp	r10, #0
	addgt	r0, r6, r8
	ble	.L49
.L47:
	strh	r3, [r0]	@ movhi
	add	r0, r0, #480
	cmp	r0, r6
	bne	.L47
.L49:
	add	r7, r7, #1
	cmp	r7, r9
	add	r6, r6, #2
	bne	.L46
	ldr	r10, [sp, #12]
.L45:
	ldr	r9, [sp, #16]
	ldr	r6, [sp, #4]
	ldr	r7, [sp, #20]
	add	r0, ip, r2
	add	r0, r2, r0, lsl #2
	str	r0, [sp, #44]
	add	r8, r6, r7
	add	r0, r10, r0
	cmp	r9, #0
	str	r0, [sp, #12]
	str	r8, [sp, #76]
	ble	.L50
	ldr	r7, .L329
	ldr	r6, [r7]
	mov	r7, r8
	add	r0, r0, r2
	rsb	r0, r0, r0, lsl #4
	add	r0, r8, r0, lsl #4
	add	r6, r6, r0, lsl #1
	mov	r0, r7
	ldr	r8, [sp, #8]
	sub	r8, r2, r8
	lsl	r8, r8, #5
	add	r9, r9, r7
.L51:
	cmp	r2, #0
	addgt	r0, r6, r8
	ble	.L54
.L52:
	strh	r1, [r0]	@ movhi
	add	r0, r0, #480
	cmp	r0, r6
	bne	.L52
.L54:
	add	r7, r7, #1
	cmp	r7, r9
	add	r6, r6, #2
	bne	.L51
.L50:
	ldr	r0, [sp, #12]
	ldr	r6, [sp, #4]
	cmp	fp, #0
	sub	r0, r0, r6
	addle	r0, r0, ip
	strle	r0, [sp, #48]
	ble	.L55
	ldr	r6, .L329
	ldr	r7, [sp, #32]
	add	r0, r0, ip
	str	r0, [sp, #48]
	ldr	r6, [r6]
	rsb	r0, r0, r0, lsl #4
	add	r0, r7, r0, lsl #4
	sub	r9, ip, ip, lsl #4
	add	r8, fp, r7
	add	r6, r6, r0, lsl #1
	lsl	r9, r9, #5
.L56:
	cmp	ip, #0
	addgt	r0, r6, r9
	ble	.L59
.L57:
	strh	r3, [r0]	@ movhi
	add	r0, r0, #480
	cmp	r0, r6
	bne	.L57
.L59:
	add	r7, r7, #1
	cmp	r7, r8
	add	r6, r6, #2
	bne	.L56
.L55:
	ldr	r0, [sp, #4]
	cmp	r0, #0
	ble	.L61
	ldr	r7, [sp, #32]
	mov	r8, r7
	ldr	r6, [sp, #12]
	ldr	r0, .L329
	add	r6, r6, ip
	ldr	fp, [r0]
	rsb	r6, r6, r6, lsl #4
	ldr	r10, [sp, #4]
	mov	r0, r7
	sub	r9, ip, ip, lsl #4
	add	r7, r7, r6, lsl #4
	add	r7, fp, r7, lsl #1
	lsl	r6, r6, #4
	lsl	r9, r9, #5
	add	r10, r8, r10
.L63:
	cmp	ip, #0
	addgt	r0, r7, r9
	ble	.L66
.L62:
	strh	r3, [r0]	@ movhi
	add	r0, r0, #480
	cmp	r0, r7
	bne	.L62
.L66:
	add	r8, r8, #1
	cmp	r8, r10
	add	r7, r7, #2
	bne	.L63
	ldr	r0, [sp, #36]
	add	r6, r0, r6
	add	fp, fp, r6, lsl #1
	mov	r6, r0
	ldr	r7, [sp, #4]
	add	r7, r0, r7
.L64:
	cmp	ip, #0
	addgt	r0, fp, r9
	ble	.L69
.L67:
	strh	r3, [r0]	@ movhi
	add	r0, r0, #480
	cmp	r0, fp
	bne	.L67
.L69:
	add	r6, r6, #1
	cmp	r6, r7
	add	fp, fp, #2
	bne	.L64
.L61:
	ldr	r6, [sp, #16]
	ldr	r7, [sp, #76]
	add	r0, r6, r2
	sub	r7, r7, r0
	str	r0, [sp, #72]
	add	r0, r6, r7
	ldr	r6, [sp, #40]
	str	r0, [sp, #52]
	add	r0, r6, r0
	str	r0, [sp, #60]
	cmp	r2, #0
	sub	r0, r0, r2
	str	r7, [sp, #68]
	str	r0, [sp, #40]
	ble	.L70
	ldr	r0, .L329
	ldr	r9, [r0]
	mov	r0, r7
	ldr	r6, [sp, #12]
	add	r6, r6, ip
	rsb	r6, r6, r6, lsl #4
	add	r7, r7, r6, lsl #4
	str	r9, [sp, #12]
	add	r7, r9, r7, lsl #1
	mov	r9, r0
	sub	r8, ip, ip, lsl #4
	lsl	r6, r6, #4
	lsl	r8, r8, #5
	add	r10, r0, r2
.L71:
	cmp	ip, #0
	addgt	r0, r7, r8
	ble	.L75
.L72:
	strh	r1, [r0]	@ movhi
	add	r0, r0, #480
	cmp	r0, r7
	bne	.L72
.L75:
	add	r9, r9, #1
	cmp	r9, r10
	add	r7, r7, #2
	bne	.L71
	ldr	r0, [sp, #60]
	ldr	r7, [sp, #12]
	add	r6, r0, r6
	add	r6, r7, r6, lsl #1
	mov	r7, r0
	add	r9, r0, r2
.L73:
	cmp	ip, #0
	addgt	r0, r6, r8
	ble	.L79
.L76:
	strh	r1, [r0]	@ movhi
	add	r0, r0, #480
	cmp	r0, r6
	bne	.L76
.L79:
	add	r7, r7, #1
	cmp	r7, r9
	add	r6, r6, #2
	bne	.L73
	ldr	r0, [sp, #48]
	add	r6, ip, r0
	add	r6, r6, r2
	ldr	r0, [sp, #52]
	ldr	r10, [sp, #12]
	rsb	r6, r6, r6, lsl #4
	add	r7, r0, r6, lsl #4
	add	r7, r10, r7, lsl #1
	mov	r10, r0
	ldr	r9, [sp, #8]
	sub	r9, r2, r9
	lsl	r6, r6, #4
	lsl	r9, r9, #5
	add	fp, r0, r2
.L228:
	add	r0, r7, r9
.L80:
	strh	r1, [r0]	@ movhi
	add	r0, r0, #480
	cmp	r0, r7
	bne	.L80
	add	r10, r10, #1
	cmp	r10, fp
	add	r7, r0, #2
	bne	.L228
	ldr	r0, [sp, #40]
	ldr	r7, [sp, #4]
	sub	r7, r0, r7
	ldr	r0, [sp, #12]
	add	r6, r7, r6
	add	r6, r0, r6, lsl #1
	add	r10, r7, r2
.L227:
	add	r0, r6, r9
.L82:
	strh	r1, [r0]	@ movhi
	add	r0, r0, #480
	cmp	r0, r6
	bne	.L82
	add	r7, r7, #1
	cmp	r7, r10
	add	r6, r0, #2
	bne	.L227
	ldr	r0, [sp, #48]
	ldr	r10, [sp, #32]
	add	r6, r0, r2
	rsb	r7, r0, r0, lsl #4
	rsb	r6, r6, r6, lsl #4
	ldr	r0, [sp, #12]
	add	r6, r10, r6, lsl #4
	add	r6, r0, r6, lsl #1
	add	fp, r10, r2
	lsl	r7, r7, #4
.L85:
	add	r0, r6, r9
.L84:
	strh	r1, [r0]	@ movhi
	add	r0, r0, #480
	cmp	r0, r6
	bne	.L84
	add	r10, r10, #1
	cmp	r10, fp
	add	r6, r0, #2
	bne	.L85
	mov	r9, #0
	ldr	r0, [sp, #40]
	add	r7, r0, r7
	ldr	r0, [sp, #12]
	add	r7, r0, r7, lsl #1
.L86:
	mov	r6, r7
	mov	r0, #0
.L87:
	add	r0, r0, #1
	cmp	r2, r0
	strh	r1, [r6]	@ movhi
	add	r6, r6, #480
	bgt	.L87
	add	r9, r9, #1
	cmp	r2, r9
	add	r7, r7, #2
	bgt	.L86
	mov	r9, #0
	ldr	r0, [sp, #48]
	rsb	r6, r0, r0, lsl #4
	ldr	r0, [sp, #68]
	add	r7, r0, r6, lsl #4
	ldr	r0, [sp, #12]
	lsl	r6, r6, #4
	add	r7, r0, r7, lsl #1
.L90:
	cmp	ip, #0
	addgt	r0, r7, r8
	ble	.L93
.L89:
	strh	r1, [r0]	@ movhi
	add	r0, r0, #480
	cmp	r0, r7
	bne	.L89
.L93:
	add	r9, r9, #1
	cmp	r2, r9
	add	r7, r7, #2
	bgt	.L90
	mov	r7, #0
	ldr	r0, [sp, #60]
	add	r6, r6, r0
	ldr	r0, [sp, #12]
	add	r6, r0, r6, lsl #1
.L91:
	cmp	ip, #0
	addgt	r0, r6, r8
	ble	.L96
.L94:
	strh	r1, [r0]	@ movhi
	add	r0, r0, #480
	cmp	r0, r6
	bne	.L94
.L96:
	add	r7, r7, #1
	cmp	r2, r7
	add	r6, r6, #2
	bgt	.L91
.L70:
	add	r6, sp, #40
	ldr	r0, [sp, #4]
	ldm	r6, {r6, r7}
	cmp	r0, #0
	sub	r6, r6, r7
	add	r0, ip, r2
	str	r6, [sp, #56]
	lsl	r6, r0, #1
	str	r6, [sp, #64]
	ldr	r6, [sp, #48]
	sub	r0, r6, r0, lsl #1
	str	r0, [sp, #32]
	ble	.L98
	ldr	r9, [sp, #16]
	ldr	r0, .L329
	ldr	fp, [r0]
	mov	r0, r9
	ldr	r6, [sp, #32]
	ldr	r10, [sp, #56]
	add	r6, r6, r9
	rsb	r6, r6, r6, lsl #4
	add	r7, r10, r6, lsl #4
	add	r7, fp, r7, lsl #1
	str	r7, [sp, #12]
	ldr	r7, [sp, #4]
	mov	r8, r10
	add	r10, r10, r7
	ldr	r7, [sp, #12]
	str	fp, [sp, #12]
	mov	fp, r0
	sub	r9, r9, r9, lsl #4
	lsl	r6, r6, #4
	lsl	r9, r9, #5
.L100:
	cmp	fp, #0
	addgt	r0, r7, r9
	ble	.L103
.L99:
	strh	r1, [r0]	@ movhi
	add	r0, r0, #480
	cmp	r0, r7
	bne	.L99
.L103:
	add	r8, r8, #1
	cmp	r8, r10
	add	r7, r7, #2
	bne	.L100
	ldr	r0, [sp, #40]
	ldr	fp, [sp, #12]
	add	r6, r0, r6
	add	fp, fp, r6, lsl #1
	mov	r6, r0
	ldr	r7, [sp, #4]
	ldr	r8, [sp, #16]
	add	r7, r0, r7
.L101:
	cmp	r8, #0
	addgt	r0, fp, r9
	ble	.L106
.L104:
	strh	r1, [r0]	@ movhi
	add	r0, r0, #480
	cmp	r0, fp
	bne	.L104
.L106:
	add	r6, r6, #1
	cmp	r6, r7
	add	fp, fp, #2
	bne	.L101
.L98:
	ldr	r0, [sp, #32]
	sub	r0, r0, r2
	str	r0, [sp, #88]
	add	r0, ip, r0
	str	r0, [sp, #80]
	ldr	r0, [sp, #56]
	cmp	r2, #0
	sub	r0, r0, r2
	str	r0, [sp, #44]
	ble	.L325
	ldr	r7, [sp, #68]
	mov	r9, r7
	ldr	r6, [sp, #88]
	ldr	r0, .L329
	ldr	r10, [sp, #8]
	add	r6, r6, r2
	rsb	r6, r6, r6, lsl #4
	ldr	r8, [r0]
	add	r7, r7, r6, lsl #4
	sub	r10, r2, r10
	lsl	r6, r6, #4
	add	r7, r8, r7, lsl #1
	lsl	r10, r10, #5
	add	fp, r9, r2
.L110:
	add	r0, r7, r10
.L109:
	strh	r1, [r0]	@ movhi
	add	r0, r0, #480
	cmp	r0, r7
	bne	.L109
	add	r9, r9, #1
	cmp	r9, fp
	add	r7, r0, #2
	bne	.L110
	ldr	r0, [sp, #60]
	mov	r7, r0
	add	r6, r0, r6
	add	r6, r8, r6, lsl #1
	add	r9, r0, r2
.L113:
	add	r0, r6, r10
.L112:
	strh	r1, [r0]	@ movhi
	add	r0, r0, #480
	cmp	r0, r6
	bne	.L112
	add	r7, r7, #1
	cmp	r7, r9
	add	r6, r0, #2
	bne	.L113
	ldr	r0, [sp, #80]
	add	r0, r0, ip
	rsb	r6, r0, r0, lsl #4
	str	r0, [sp, #84]
	ldr	r0, [sp, #44]
	mov	r9, r0
	add	r7, r0, r6, lsl #4
	sub	r10, ip, ip, lsl #4
	add	r7, r8, r7, lsl #1
	lsl	r6, r6, #4
	lsl	r10, r10, #5
	add	fp, r0, r2
.L114:
	cmp	ip, #0
	addgt	r0, r7, r10
	ble	.L118
.L115:
	strh	r1, [r0]	@ movhi
	add	r0, r0, #480
	cmp	r0, r7
	bne	.L115
.L118:
	add	r9, r9, #1
	cmp	r9, fp
	add	r7, r7, #2
	bne	.L114
	ldr	r0, [sp, #8]
	add	r7, r0, r2
	ldr	r0, [sp, #44]
	add	r7, r7, r0
	add	r6, r7, r6
	add	r8, r8, r6, lsl #1
	add	r6, r7, r2
.L226:
	cmp	ip, #0
	addgt	r0, r8, r10
	ble	.L121
.L119:
	strh	r1, [r0]	@ movhi
	add	r0, r0, #480
	cmp	r0, r8
	bne	.L119
.L121:
	add	r7, r7, #1
	cmp	r7, r6
	add	r8, r8, #2
	bne	.L226
.L108:
	cmp	ip, #0
	ble	.L122
	ldr	r7, [sp, #56]
	mov	r10, r7
	ldr	r0, .L329
	ldr	r6, [sp, #84]
	ldr	r9, [r0]
	rsb	r6, r6, r6, lsl #4
	add	r7, r7, r6, lsl #4
	sub	r8, ip, ip, lsl #4
	add	r7, r9, r7, lsl #1
	lsl	r6, r6, #4
	lsl	r8, r8, #5
	add	fp, r10, ip
.L124:
	add	r0, r7, r8
.L123:
	strh	r3, [r0]	@ movhi
	add	r0, r0, #480
	cmp	r0, r7
	bne	.L123
	add	r10, r10, #1
	cmp	r10, fp
	add	r7, r0, #2
	bne	.L124
	ldr	r7, [sp, #60]
	add	r6, r7, r6
	add	r6, r9, r6, lsl #1
	add	r10, r7, ip
.L125:
	add	r0, r6, r8
.L126:
	strh	r3, [r0]	@ movhi
	add	r0, r0, #480
	cmp	r0, r6
	bne	.L126
	add	r7, r7, #1
	cmp	r7, r10
	add	r6, r0, #2
	bne	.L125
	ldr	r0, [sp, #32]
	ldr	r10, [sp, #68]
	add	r6, r0, ip
	rsb	r6, r6, r6, lsl #4
	add	r7, r10, r6, lsl #4
	add	r7, r9, r7, lsl #1
	lsl	r6, r6, #4
	add	fp, r10, ip
.L129:
	add	r0, r7, r8
.L128:
	strh	r3, [r0]	@ movhi
	add	r0, r0, #480
	cmp	r7, r0
	bne	.L128
	add	r10, r10, #1
	cmp	fp, r10
	add	r7, r7, #2
	bne	.L129
	ldr	r7, [sp, #40]
	add	r6, r6, r7
	add	r9, r9, r6, lsl #1
	add	r6, r7, ip
.L130:
	add	r0, r9, r8
.L131:
	strh	r3, [r0]	@ movhi
	add	r0, r0, #480
	cmp	r9, r0
	bne	.L131
	add	r7, r7, #1
	cmp	r6, r7
	add	r9, r9, #2
	bne	.L130
.L122:
	ldr	r0, [sp, #28]
	ldr	r6, [sp, #44]
	cmp	r0, #0
	ldr	r0, [sp, #72]
	add	r0, r0, r6
	str	r0, [sp, #12]
	ble	.L326
	ldr	r0, [sp, #84]
	ldr	r6, .L329
	ldr	r7, [sp, #12]
	add	r0, r0, ip
	str	r0, [sp, #40]
	ldr	r6, [r6]
	rsb	r0, r0, r0, lsl #4
	add	r0, r7, r0, lsl #4
	add	r6, r6, r0, lsl #1
	mov	r0, r7
	ldr	r9, [sp, #28]
	sub	r8, ip, ip, lsl #4
	lsl	r8, r8, #5
	add	fp, r9, r7
.L133:
	cmp	ip, #0
	addgt	r0, r6, r8
	ble	.L136
.L134:
	strh	r5, [r0]	@ movhi
	add	r0, r0, #480
	cmp	r6, r0
	bne	.L134
.L136:
	add	r7, r7, #1
	cmp	fp, r7
	add	r6, r6, #2
	bne	.L133
.L132:
	ldr	r9, [sp, #64]
	cmp	r9, #0
	ble	.L137
	ldr	r7, .L329
	ldr	r0, [sp, #40]
	ldr	r6, [r7]
	add	r0, r0, r2
	ldr	r7, [sp, #52]
	rsb	r0, r0, r0, lsl #4
	add	r0, r7, r0, lsl #4
	add	r6, r6, r0, lsl #1
	mov	r0, r7
	ldr	r8, [sp, #8]
	sub	r8, r2, r8
	lsl	r8, r8, #5
	add	r9, r9, r7
.L138:
	cmp	r2, #0
	addgt	r0, r8, r6
	ble	.L141
.L139:
	strh	r5, [r0]	@ movhi
	add	r0, r0, #480
	cmp	r6, r0
	bne	.L139
.L141:
	add	r7, r7, #1
	cmp	r9, r7
	add	r6, r6, #2
	bne	.L138
.L137:
	ldr	r9, [sp, #16]
	cmp	r9, #0
	ble	.L142
	ldr	r8, .L329
	ldr	r0, [sp, #48]
	ldr	r7, [sp, #76]
	ldr	r6, [r8]
	add	r0, r0, r2
	ldr	r8, [sp, #8]
	rsb	r0, r0, r0, lsl #4
	add	r0, r7, r0, lsl #4
	sub	r8, r2, r8
	add	r6, r6, r0, lsl #1
	add	r9, r9, r7
	lsl	r8, r8, #5
.L143:
	cmp	r2, #0
	addgt	r0, r8, r6
	ble	.L146
.L144:
	strh	r5, [r0]	@ movhi
	add	r0, r0, #480
	cmp	r6, r0
	bne	.L144
.L146:
	add	r7, r7, #1
	cmp	r9, r7
	add	r6, r6, #2
	bne	.L143
.L142:
	cmp	r2, #0
	ble	.L147
	ldr	r0, .L329
	ldr	r8, [r0]
	ldr	r0, [sp, #20]
	mov	r9, r0
	ldr	r5, [sp, #32]
	ldr	r7, [sp, #8]
	add	r5, r5, r2
	rsb	r5, r5, r5, lsl #4
	add	r6, r0, r5, lsl #4
	sub	r7, r2, r7
	lsl	r5, r5, #4
	add	r6, r8, r6, lsl #1
	lsl	r7, r7, #5
	add	r10, r2, r0
.L148:
	add	r0, r7, r6
.L149:
	strh	r1, [r0]	@ movhi
	add	r0, r0, #480
	cmp	r6, r0
	bne	.L149
	add	r9, r9, #1
	cmp	r10, r9
	add	r6, r6, #2
	bne	.L148
	mov	r6, fp
	add	r5, r5, fp
	add	r5, r8, r5, lsl #1
	add	r9, r2, fp
.L150:
	add	r0, r7, r5
.L151:
	strh	r1, [r0]	@ movhi
	add	r0, r0, #480
	cmp	r5, r0
	bne	.L151
	add	r6, r6, #1
	cmp	r9, r6
	add	r5, r5, #2
	bne	.L150
	ldr	r0, [sp, #12]
	mov	r9, r0
	ldr	r5, [sp, #80]
	add	r5, r5, r2
	rsb	r5, r5, r5, lsl #4
	add	r6, r0, r5, lsl #4
	add	r6, r8, r6, lsl #1
	lsl	r5, r5, #4
	add	r10, r2, r0
.L154:
	add	r0, r7, r6
.L153:
	strh	r1, [r0]	@ movhi
	add	r0, r0, #480
	cmp	r0, r6
	bne	.L153
	add	r9, r9, #1
	cmp	r10, r9
	add	r6, r0, #2
	bne	.L154
	ldr	r0, [sp, #36]
	add	r5, r0, r5
	add	r8, r8, r5, lsl #1
	mov	r5, r0
	add	r6, r0, r2
.L155:
	add	r0, r8, r7
.L156:
	strh	r1, [r0]	@ movhi
	add	r0, r0, #480
	cmp	r8, r0
	bne	.L156
	add	r5, r5, #1
	cmp	r6, r5
	add	r8, r8, #2
	bne	.L155
.L147:
	ldr	r9, [sp, #64]
	ldr	r0, [sp, #40]
	ldr	r5, [sp, #4]
	cmp	r9, #0
	sub	r7, r0, r5
	ble	.L157
	ldr	r6, .L329
	add	r0, r7, r2
	ldr	r5, [r6]
	ldr	r6, [sp, #52]
	rsb	r0, r0, r0, lsl #4
	add	r0, r6, r0, lsl #4
	add	r5, r5, r0, lsl #1
	mov	r0, r6
	ldr	r8, [sp, #8]
	sub	r8, r2, r8
	lsl	r8, r8, #5
	add	r9, r9, r6
.L158:
	cmp	r2, #0
	addgt	r0, r8, r5
	ble	.L161
.L159:
	strh	r1, [r0]	@ movhi
	add	r0, r0, #480
	cmp	r5, r0
	bne	.L159
.L161:
	add	r6, r6, #1
	cmp	r9, r6
	add	r5, r5, #2
	bne	.L158
.L157:
	ldr	r9, [sp, #92]
	cmp	r9, #0
	sub	r7, r7, r9
	ble	.L162
	ldr	r6, .L329
	add	r0, r7, ip
	ldr	r5, [r6]
	ldr	r6, [sp, #20]
	rsb	r0, r0, r0, lsl #4
	add	r0, r6, r0, lsl #4
	sub	r8, ip, ip, lsl #4
	add	r9, r9, r6
	add	r5, r5, r0, lsl #1
	lsl	r8, r8, #5
.L163:
	cmp	ip, #0
	addgt	r0, r8, r5
	ble	.L166
.L164:
	strh	r1, [r0]	@ movhi
	add	r0, r0, #480
	cmp	r5, r0
	bne	.L164
.L166:
	add	r6, r6, #1
	cmp	r9, r6
	add	r5, r5, #2
	bne	.L163
.L162:
	ldr	r0, [sp, #28]
	cmp	r0, #0
	sub	r0, r7, r2
	str	r0, [sp, #28]
	ble	.L167
	ldr	r0, .L329
	add	r5, r7, ip
	ldr	r7, [sp, #12]
	ldr	r9, [r0]
	mov	r6, r7
	mov	r0, r7
	rsb	r5, r5, r5, lsl #4
	add	r5, r7, r5, lsl #4
	sub	r8, ip, ip, lsl #4
	add	r5, r9, r5, lsl #1
	lsl	r8, r8, #5
.L168:
	cmp	ip, #0
	addgt	r0, r8, r5
	ble	.L172
.L169:
	strh	r3, [r0]	@ movhi
	add	r0, r0, #480
	cmp	r5, r0
	bne	.L169
.L172:
	add	r7, r7, #1
	cmp	fp, r7
	add	r5, r5, #2
	bne	.L168
	ldr	r0, [sp, #28]
	ldr	r5, [sp, #12]
	add	r0, r0, r2
	rsb	r0, r0, r0, lsl #4
	add	r0, r5, r0, lsl #4
	ldr	r5, [sp, #8]
	sub	r5, r2, r5
	add	r9, r9, r0, lsl #1
	lsl	r5, r5, #5
.L170:
	cmp	r2, #0
	addgt	r0, r5, r9
	ble	.L175
.L173:
	strh	r1, [r0]	@ movhi
	add	r0, r0, #480
	cmp	r9, r0
	bne	.L173
.L175:
	add	r6, r6, #1
	cmp	fp, r6
	add	r9, r9, #2
	bne	.L170
.L167:
	ldr	r6, [sp, #64]
	cmp	r6, #0
	ble	.L176
	ldr	r0, .L329
	ldr	r7, [sp, #8]
	ldr	r10, [r0]
	ldr	r0, [sp, #52]
	sub	r8, r2, r7
	add	r9, r6, r0
	mov	r7, r0
	mov	r6, r0
	ldr	r5, [sp, #28]
	add	r5, r5, r2
	rsb	r5, r5, r5, lsl #4
	add	r5, r0, r5, lsl #4
	add	r5, r10, r5, lsl #1
	lsl	r8, r8, #5
.L177:
	cmp	r2, #0
	addgt	r0, r8, r5
	ble	.L181
.L178:
	strh	r3, [r0]	@ movhi
	add	r0, r0, #480
	cmp	r5, r0
	bne	.L178
.L181:
	add	r7, r7, #1
	cmp	r9, r7
	add	r5, r5, #2
	bne	.L177
	ldr	r0, [sp, #28]
	ldr	r5, [sp, #52]
	rsb	r0, r0, r0, lsl #4
	add	r0, r5, r0, lsl #4
	add	r10, r10, r0, lsl #1
.L225:
	cmp	r2, #0
	addgt	r0, r8, r10
	ble	.L184
.L182:
	strh	r1, [r0]	@ movhi
	add	r0, r0, #480
	cmp	r10, r0
	bne	.L182
.L184:
	add	r6, r6, #1
	cmp	r9, r6
	add	r10, r10, #2
	bne	.L225
.L176:
	ldr	r5, [sp, #28]
	ldr	r0, [sp, #72]
	cmp	ip, #0
	add	r0, r0, r5
	str	r0, [sp, #28]
	ble	.L186
	ldr	r8, [sp, #4]
	ldr	r0, .L329
	ldr	r10, [r0]
	mov	r0, r8
	ldr	r5, [sp, #28]
	ldr	r9, [sp, #20]
	add	r5, r5, r8
	rsb	r5, r5, r5, lsl #4
	add	r6, r9, r5, lsl #4
	str	r10, [sp, #12]
	add	r6, r10, r6, lsl #1
	mov	r10, r0
	sub	r8, r8, r8, lsl #4
	mov	r7, r9
	lsl	r5, r5, #4
	lsl	r8, r8, #5
	add	r9, ip, r9
.L188:
	cmp	r10, #0
	addgt	r0, r8, r6
	ble	.L191
.L187:
	strh	r1, [r0]	@ movhi
	add	r0, r0, #480
	cmp	r6, r0
	bne	.L187
.L191:
	add	r7, r7, #1
	cmp	r9, r7
	add	r6, r6, #2
	bne	.L188
	ldr	r6, [sp, #36]
	ldr	r10, [sp, #12]
	add	r5, r5, r6
	ldr	r7, [sp, #4]
	add	r10, r10, r5, lsl #1
	add	r5, ip, r6
.L189:
	cmp	r7, #0
	addgt	r0, r8, r10
	ble	.L194
.L192:
	strh	r1, [r0]	@ movhi
	add	r0, r0, #480
	cmp	r10, r0
	bne	.L192
.L194:
	add	r6, r6, #1
	cmp	r5, r6
	add	r10, r10, #2
	bne	.L189
.L186:
	ldr	r0, [sp, #28]
	add	ip, ip, r0
	ldr	r0, [sp, #24]
	cmp	r2, #0
	sub	r0, fp, r0
	str	r0, [sp, #24]
	ble	.L327
	ldr	r0, [sp, #20]
	mov	r6, r0
	mov	r7, r0
	ldr	r5, .L329
	add	r8, ip, r2
	ldr	ip, [sp, #8]
	ldr	r9, [r5]
	rsb	r8, r8, r8, lsl #4
	str	r5, [sp, #36]
	sub	r5, r2, ip
	add	ip, r0, r8, lsl #4
	str	r9, [sp, #12]
	add	ip, r9, ip, lsl #1
	lsl	r5, r5, #5
	lsl	r8, r8, #4
	add	r9, r2, r0
.L198:
	add	r0, r5, ip
.L197:
	strh	r4, [r0]	@ movhi
	add	r0, r0, #480
	cmp	ip, r0
	bne	.L197
	add	r7, r7, #1
	cmp	r9, r7
	add	ip, ip, #2
	bne	.L198
	add	ip, r8, fp
	mov	r7, fp
	mov	r8, fp
	ldr	r0, [sp, #12]
	add	r10, r2, fp
	add	ip, r0, ip, lsl #1
.L199:
	add	r0, r5, ip
.L200:
	strh	r4, [r0]	@ movhi
	add	r0, r0, #480
	cmp	ip, r0
	bne	.L200
	add	r8, r8, #1
	cmp	r10, r8
	add	ip, ip, #2
	bne	.L199
	ldr	r0, [sp, #28]
	add	ip, r0, r2
	ldr	r0, [sp, #20]
	rsb	ip, ip, ip, lsl #4
	add	r4, r0, ip, lsl #4
	ldr	r0, [sp, #12]
	lsl	ip, ip, #4
	add	r4, r0, r4, lsl #1
.L203:
	add	r0, r5, r4
	b	.L330
.L331:
	.align	2
.L329:
	.word	.LANCHOR0
.L330:
.L202:
	strh	lr, [r0]	@ movhi
	add	r0, r0, #480
	cmp	r4, r0
	bne	.L202
	add	r6, r6, #1
	cmp	r9, r6
	add	r4, r4, #2
	bne	.L203
	ldr	r0, [sp, #12]
	add	ip, fp, ip
	add	ip, r0, ip, lsl #1
.L204:
	add	r0, r5, ip
.L205:
	strh	lr, [r0]	@ movhi
	add	r0, r0, #480
	cmp	ip, r0
	bne	.L205
	add	r7, r7, #1
	cmp	r10, r7
	add	ip, ip, #2
	bne	.L204
	ldr	r0, [sp, #4]
	cmp	r0, #0
	ble	.L328
.L223:
	ldr	r7, [sp, #16]
	ldr	r0, [sp, #28]
	ldr	lr, [sp, #24]
	add	ip, r0, r7
	rsb	r0, ip, ip, lsl #4
	add	r0, lr, r0, lsl #4
	ldr	lr, [sp, #12]
	add	fp, lr, r0, lsl #1
	mov	lr, #0
	sub	r5, r7, r7, lsl #4
	ldr	r6, [sp, #4]
	lsl	r5, r5, #5
	lsl	r4, r7, #4
.L207:
	cmp	r7, #0
	addgt	r0, r5, fp
	ble	.L211
.L208:
	strh	r1, [r0]	@ movhi
	add	r0, r0, #480
	cmp	fp, r0
	bne	.L208
.L211:
	add	lr, lr, #1
	cmp	r6, lr
	add	fp, fp, #2
	bgt	.L207
	cmp	r2, #0
	ble	.L30
	ldr	r0, [sp, #36]
	ldr	r0, [r0]
	str	r0, [sp, #12]
.L224:
	mov	r5, #0
	ldr	r0, [sp, #88]
	rsb	r6, r0, r0, lsl #4
	ldr	r0, [sp, #56]
	add	r6, r0, r6, lsl #4
	ldr	r0, [sp, #12]
	add	r6, r0, r6, lsl #1
.L215:
	mov	lr, r6
	mov	r0, #0
.L214:
	add	r0, r0, #1
	cmp	r2, r0
	strh	r3, [lr]	@ movhi
	add	lr, lr, #480
	bgt	.L214
	add	r5, r5, #1
	cmp	r2, r5
	add	r6, r6, #2
	bgt	.L215
	mov	lr, #0
	ldr	r0, [sp, #44]
	ldr	r5, [sp, #16]
	rsb	ip, ip, ip, lsl #4
	add	ip, r0, ip, lsl #4
	ldr	r0, [sp, #12]
	sub	r4, r5, r4
	add	ip, r0, ip, lsl #1
	lsl	r4, r4, #5
.L218:
	cmp	r5, #0
	addgt	r0, ip, r4
	ble	.L221
.L217:
	strh	r3, [r0]	@ movhi
	add	r0, r0, #480
	cmp	r0, ip
	bne	.L217
.L221:
	add	lr, lr, #1
	cmp	r2, lr
	add	ip, ip, #2
	bgt	.L218
	mov	ip, #0
	ldr	r3, [sp, #32]
	rsb	r0, r3, r3, lsl #4
	ldr	r3, [sp, #44]
	add	r3, r3, r0, lsl #4
	ldr	r0, [sp, #12]
	add	fp, r0, r3, lsl #1
.L219:
	mov	r0, fp
	mov	r3, #0
.L222:
	add	r3, r3, #1
	cmp	r2, r3
	strh	r1, [r0]	@ movhi
	add	r0, r0, #480
	bgt	.L222
	add	ip, ip, #1
	cmp	r2, ip
	add	fp, fp, #2
	bgt	.L219
.L30:
	add	sp, sp, #100
	@ sp needed
	pop	{r4, r5, r6, r7, r8, r9, r10, fp, lr}
	bx	lr
.L325:
	ldr	r0, [sp, #80]
	add	r0, r0, ip
	str	r0, [sp, #84]
	b	.L108
.L326:
	ldr	r0, [sp, #84]
	add	r0, r0, ip
	str	r0, [sp, #40]
	ldr	r6, [sp, #12]
	ldr	r0, [sp, #28]
	add	fp, r0, r6
	b	.L132
.L327:
	ldr	r0, [sp, #4]
	cmp	r0, #0
	ble	.L30
	ldr	r0, .L329
	str	r0, [sp, #36]
	ldr	r0, [r0]
	str	r0, [sp, #12]
	b	.L223
.L328:
	ldr	r0, [sp, #16]
	ldr	ip, [sp, #28]
	lsl	r4, r0, #4
	add	ip, ip, r0
	b	.L224
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
	ble	.L333
	mov	r8, r5
	ldr	lr, .L373
	add	r1, ip, r9
	ldr	lr, [lr]
	rsb	r1, r1, r1, lsl #4
	add	r1, r5, r1, lsl #4
	sub	r10, r9, r9, lsl #4
	add	lr, lr, r1, lsl #1
	lsl	r10, r10, #5
	add	fp, r7, r5
.L334:
	cmp	r9, #0
	addgt	r1, lr, r10
	ble	.L337
.L335:
	strh	r3, [r1]	@ movhi
	add	r1, r1, #480
	cmp	r1, lr
	bne	.L335
.L337:
	add	r8, r8, #1
	cmp	r8, fp
	add	lr, lr, #2
	bne	.L334
.L333:
	cmp	r9, #0
	add	ip, ip, r2
	sub	r10, r5, r2
	ble	.L338
	mov	r8, r10
	ldr	lr, .L373
	add	r1, ip, r7
	ldr	lr, [lr]
	rsb	r1, r1, r1, lsl #4
	add	r1, r10, r1, lsl #4
	sub	fp, r7, r7, lsl #4
	add	r9, r9, r10
	add	lr, lr, r1, lsl #1
	lsl	fp, fp, #5
.L339:
	cmp	r7, #0
	addgt	r1, lr, fp
	ble	.L342
.L340:
	strh	r3, [r1]	@ movhi
	add	r1, r1, #480
	cmp	r1, lr
	bne	.L340
.L342:
	add	r8, r8, #1
	cmp	r8, r9
	add	lr, lr, #2
	bne	.L339
.L338:
	cmp	r2, #0
	add	r10, r10, r6
	sub	ip, ip, r6
	ble	.L348
	mov	r8, r10
	ldr	lr, .L373
	add	r1, ip, r2
	ldr	lr, [lr]
	rsb	r1, r1, r1, lsl #4
	add	r1, r10, r1, lsl #4
	sub	r9, r2, r2, lsl #4
	add	lr, lr, r1, lsl #1
	lsl	r9, r9, #5
	add	fp, r10, r2
.L347:
	add	r1, lr, r9
.L346:
	strh	r3, [r1]	@ movhi
	add	r1, r1, #480
	cmp	r1, lr
	bne	.L346
	add	r8, r8, #1
	cmp	r8, fp
	add	lr, lr, #2
	bne	.L347
.L348:
	ldr	r3, [sp, #4]
	cmp	r7, #0
	add	ip, r3, ip
	ble	.L345
	ldr	r1, .L373
	add	r3, ip, r6
	ldr	r1, [r1]
	rsb	r3, r3, r3, lsl #4
	add	r3, r5, r3, lsl #4
	sub	lr, r6, r6, lsl #4
	add	r7, r7, r5
	add	r1, r1, r3, lsl #1
	lsl	lr, lr, #5
.L349:
	cmp	r6, #0
	addgt	r3, r1, lr
	ble	.L352
.L350:
	strh	r0, [r3]	@ movhi
	add	r3, r3, #480
	cmp	r3, r1
	bne	.L350
.L352:
	add	r5, r5, #1
	cmp	r5, r7
	add	r1, r1, #2
	bne	.L349
.L345:
	cmp	r2, #0
	sub	r3, ip, r2
	ble	.L332
	mov	lr, r10
	mov	r5, r10
	ldr	r1, .L373
	add	r3, r3, r2
	ldr	r7, [r1]
	rsb	r3, r3, r3, lsl #4
	sub	r8, r2, r2, lsl #4
	add	r1, r10, r3, lsl #4
	add	r1, r7, r1, lsl #1
	lsl	r8, r8, #5
	add	r2, r2, r10
.L356:
	add	r3, r8, r1
.L355:
	strh	r0, [r3]	@ movhi
	add	r3, r3, #480
	cmp	r1, r3
	bne	.L355
	add	r5, r5, #1
	cmp	r2, r5
	add	r1, r1, #2
	bne	.L356
	add	ip, ip, r6
	rsb	ip, ip, ip, lsl #4
	add	r10, r10, ip, lsl #4
	sub	r0, r6, r6, lsl #4
	add	r1, r7, r10, lsl #1
	lsl	r0, r0, #5
.L357:
	cmp	r6, #0
	addgt	r3, r0, r1
	ble	.L360
.L358:
	strh	r4, [r3]	@ movhi
	add	r3, r3, #480
	cmp	r3, r1
	bne	.L358
.L360:
	add	lr, lr, #1
	cmp	r2, lr
	add	r1, r1, #2
	bne	.L357
.L332:
	add	sp, sp, #12
	@ sp needed
	pop	{r4, r5, r6, r7, r8, r9, r10, fp, lr}
	bx	lr
.L374:
	.align	2
.L373:
	.word	.LANCHOR0
	.size	drawDragonFire, .-drawDragonFire
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
	ble	.L379
	ldr	r3, [sp, #12]
	add	ip, ip, r3
	sub	ip, ip, #1
	cmp	ip, r1
	ble	.L379
	ldr	r3, [sp]
	add	r2, r0, r2
	sub	r2, r2, #1
	cmp	r2, r3
	ble	.L379
	ldr	r2, [sp, #8]
	add	r3, r3, r2
	sub	r3, r3, #1
	cmp	r3, r0
	movle	r0, #0
	movgt	r0, #1
	bx	lr
.L379:
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
