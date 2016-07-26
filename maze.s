	.cpu arm7tdmi
	.fpu softvfp
	.eabi_attribute 20, 1
	.eabi_attribute 21, 1
	.eabi_attribute 23, 3
	.eabi_attribute 24, 1
	.eabi_attribute 25, 1
	.eabi_attribute 26, 1
	.eabi_attribute 30, 6
	.eabi_attribute 34, 0
	.eabi_attribute 18, 4
	.file	"maze.c"
	.comm	maze,1200,4
	.text
	.align	2
	.global	main
	.type	main, %function
main:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 56
	@ frame_needed = 1, uses_anonymous_args = 0
	stmfd	sp!, {fp, lr}
	add	fp, sp, #4
	sub	sp, sp, #56
	mov	r3, #8
	strh	r3, [fp, #-34]	@ movhi
	mov	r3, #16
	strh	r3, [fp, #-36]	@ movhi
	mov	r3, #32
	strh	r3, [fp, #-38]	@ movhi
	mov	r3, #64
	strh	r3, [fp, #-40]	@ movhi
	mov	r3, #128
	strh	r3, [fp, #-42]	@ movhi
	mov	r3, #256
	strh	r3, [fp, #-44]	@ movhi
	mov	r3, #512
	strh	r3, [fp, #-46]	@ movhi
	mvn	r3, #32768
	strh	r3, [fp, #-48]	@ movhi
	mov	r3, #31
	strh	r3, [fp, #-50]	@ movhi
	mov	r3, #0
	strh	r3, [fp, #-52]	@ movhi
	mov	r3, #31744
	strh	r3, [fp, #-54]	@ movhi
	ldr	r3, .L22
	strh	r3, [fp, #-56]	@ movhi
	mov	r3, #67108864
	str	r3, [fp, #-16]
	ldr	r3, [fp, #-16]
	ldr	r2, .L22+4
	strh	r2, [r3]	@ movhi
.L21:
	bl	draw_title
.L4:
	ldr	r3, .L22+8
	str	r3, [fp, #-20]
	ldr	r3, [fp, #-20]
	ldrh	r3, [r3]	@ movhi
	mov	r3, r3, asl #16
	mov	r2, r3, lsr #16
	ldrh	r3, [fp, #-34]	@ movhi
	mov	r3, r3, asl #16
	mov	r3, r3, lsr #16
	and	r3, r2, r3
	mov	r3, r3, asl #16
	mov	r3, r3, lsr #16
	cmp	r3, #0
	bne	.L2
	mov	r0, r0	@ nop
	ldrh	r3, [fp, #-48]	@ movhi
	mov	r3, r3, asl #16
	mov	r3, r3, lsr #16
	mov	r0, r3
	bl	draw_bg
	ldrh	r3, [fp, #-52]	@ movhi
	mov	r3, r3, asl #16
	mov	r3, r3, lsr #16
	mov	r0, r3
	bl	draw_wall
	mov	r3, #8
	str	r3, [fp, #-8]
	mov	r3, #8
	str	r3, [fp, #-12]
	b	.L18
.L2:
	b	.L4
.L18:
	ldr	r3, .L22+8
	str	r3, [fp, #-20]
	ldr	r3, [fp, #-8]
	str	r3, [fp, #-24]
	ldr	r3, [fp, #-12]
	str	r3, [fp, #-28]
	ldr	r3, .L22+12
	str	r3, [fp, #-32]
	ldr	r3, [fp, #-20]
	ldrh	r3, [r3]	@ movhi
	mov	r3, r3, asl #16
	mov	r2, r3, lsr #16
	ldrh	r3, [fp, #-36]	@ movhi
	mov	r3, r3, asl #16
	mov	r3, r3, lsr #16
	and	r3, r2, r3
	mov	r3, r3, asl #16
	mov	r3, r3, lsr #16
	cmp	r3, #0
	bne	.L5
	ldr	r0, [fp, #-8]
	ldr	r1, [fp, #-12]
	bl	moveRight
	str	r0, [fp, #-8]
	b	.L6
.L5:
	ldr	r3, [fp, #-20]
	ldrh	r3, [r3]	@ movhi
	mov	r3, r3, asl #16
	mov	r2, r3, lsr #16
	ldrh	r3, [fp, #-38]	@ movhi
	mov	r3, r3, asl #16
	mov	r3, r3, lsr #16
	and	r3, r2, r3
	mov	r3, r3, asl #16
	mov	r3, r3, lsr #16
	cmp	r3, #0
	bne	.L7
	ldr	r0, [fp, #-8]
	ldr	r1, [fp, #-12]
	bl	moveLeft
	str	r0, [fp, #-8]
	b	.L6
.L7:
	ldr	r3, [fp, #-20]
	ldrh	r3, [r3]	@ movhi
	mov	r3, r3, asl #16
	mov	r2, r3, lsr #16
	ldrh	r3, [fp, #-40]	@ movhi
	mov	r3, r3, asl #16
	mov	r3, r3, lsr #16
	and	r3, r2, r3
	mov	r3, r3, asl #16
	mov	r3, r3, lsr #16
	cmp	r3, #0
	bne	.L8
	ldr	r0, [fp, #-8]
	ldr	r1, [fp, #-12]
	bl	moveUp
	str	r0, [fp, #-12]
	b	.L6
.L8:
	ldr	r3, [fp, #-20]
	ldrh	r3, [r3]	@ movhi
	mov	r3, r3, asl #16
	mov	r2, r3, lsr #16
	ldrh	r3, [fp, #-42]	@ movhi
	mov	r3, r3, asl #16
	mov	r3, r3, lsr #16
	and	r3, r2, r3
	mov	r3, r3, asl #16
	mov	r3, r3, lsr #16
	cmp	r3, #0
	bne	.L6
	ldr	r0, [fp, #-8]
	ldr	r1, [fp, #-12]
	bl	moveDown
	str	r0, [fp, #-12]
.L6:
	ldrh	r3, [fp, #-54]	@ movhi
	mov	r3, r3, asl #16
	mov	r3, r3, lsr #16
	mov	r0, #5
	mov	r1, #1
	mov	r2, r3
	bl	draw_portal
	ldrh	r3, [fp, #-56]	@ movhi
	mov	r3, r3, asl #16
	mov	r3, r3, lsr #16
	mov	r0, #1
	mov	r1, #3
	mov	r2, r3
	bl	draw_portal
	ldrh	r3, [fp, #-54]	@ movhi
	mov	r3, r3, asl #16
	mov	r3, r3, lsr #16
	mov	r0, #9
	mov	r1, #2
	mov	r2, r3
	bl	draw_portal
	ldrh	r3, [fp, #-56]	@ movhi
	mov	r3, r3, asl #16
	mov	r3, r3, lsr #16
	mov	r0, #1
	mov	r1, #18
	mov	r2, r3
	bl	draw_portal
	ldrh	r3, [fp, #-54]	@ movhi
	mov	r3, r3, asl #16
	mov	r3, r3, lsr #16
	mov	r0, #6
	mov	r1, #18
	mov	r2, r3
	bl	draw_portal
	ldrh	r3, [fp, #-56]	@ movhi
	mov	r3, r3, asl #16
	mov	r3, r3, lsr #16
	mov	r0, #28
	mov	r1, #1
	mov	r2, r3
	bl	draw_portal
	ldrh	r3, [fp, #-54]	@ movhi
	mov	r3, r3, asl #16
	mov	r3, r3, lsr #16
	mov	r0, #18
	mov	r1, #14
	mov	r2, r3
	bl	draw_portal
	ldrh	r3, [fp, #-56]	@ movhi
	mov	r3, r3, asl #16
	mov	r3, r3, lsr #16
	mov	r0, #16
	mov	r1, #18
	mov	r2, r3
	bl	draw_portal
	ldrh	r3, [fp, #-54]	@ movhi
	mov	r3, r3, asl #16
	mov	r3, r3, lsr #16
	mov	r0, #7
	mov	r1, #16
	mov	r2, r3
	bl	draw_portal
	ldrh	r3, [fp, #-56]	@ movhi
	mov	r3, r3, asl #16
	mov	r3, r3, lsr #16
	mov	r0, #9
	mov	r1, #10
	mov	r2, r3
	bl	draw_portal
	ldrh	r3, [fp, #-54]	@ movhi
	mov	r3, r3, asl #16
	mov	r3, r3, lsr #16
	mov	r0, #9
	mov	r1, #4
	mov	r2, r3
	bl	draw_portal
	ldrh	r3, [fp, #-56]	@ movhi
	mov	r3, r3, asl #16
	mov	r3, r3, lsr #16
	mov	r0, #18
	mov	r1, #10
	mov	r2, r3
	bl	draw_portal
	ldrh	r3, [fp, #-54]	@ movhi
	mov	r3, r3, asl #16
	mov	r3, r3, lsr #16
	mov	r0, #19
	mov	r1, #7
	mov	r2, r3
	bl	draw_portal
	ldrh	r3, [fp, #-56]	@ movhi
	mov	r3, r3, asl #16
	mov	r3, r3, lsr #16
	mov	r0, #28
	mov	r1, #14
	mov	r2, r3
	bl	draw_portal
	mov	r0, #28
	mov	r1, #18
	bl	draw_heart
	ldr	r3, [fp, #-8]
	mov	r3, r3, asl #16
	mov	r2, r3, lsr #16
	ldr	r3, [fp, #-12]
	mov	r3, r3, asl #16
	mov	r3, r3, lsr #16
	mov	r0, r2
	mov	r1, r3
	mov	r2, #5
	mov	r3, #1
	bl	on_portal
	mov	r3, r0
	cmp	r3, #1
	bne	.L9
	mov	r3, #8
	str	r3, [fp, #-8]
	mov	r3, #24
	str	r3, [fp, #-12]
.L9:
	ldr	r3, [fp, #-8]
	mov	r3, r3, asl #16
	mov	r2, r3, lsr #16
	ldr	r3, [fp, #-12]
	mov	r3, r3, asl #16
	mov	r3, r3, lsr #16
	mov	r0, r2
	mov	r1, r3
	mov	r2, #9
	mov	r3, #2
	bl	on_portal
	mov	r3, r0
	cmp	r3, #1
	bne	.L10
	mov	r3, #8
	str	r3, [fp, #-8]
	mov	r3, #144
	str	r3, [fp, #-12]
.L10:
	ldr	r3, [fp, #-8]
	mov	r3, r3, asl #16
	mov	r2, r3, lsr #16
	ldr	r3, [fp, #-12]
	mov	r3, r3, asl #16
	mov	r3, r3, lsr #16
	mov	r0, r2
	mov	r1, r3
	mov	r2, #6
	mov	r3, #18
	bl	on_portal
	mov	r3, r0
	cmp	r3, #1
	bne	.L11
	mov	r3, #224
	str	r3, [fp, #-8]
	mov	r3, #8
	str	r3, [fp, #-12]
.L11:
	ldr	r3, [fp, #-8]
	mov	r3, r3, asl #16
	mov	r2, r3, lsr #16
	ldr	r3, [fp, #-12]
	mov	r3, r3, asl #16
	mov	r3, r3, lsr #16
	mov	r0, r2
	mov	r1, r3
	mov	r2, #18
	mov	r3, #14
	bl	on_portal
	mov	r3, r0
	cmp	r3, #1
	bne	.L12
	mov	r3, #128
	str	r3, [fp, #-8]
	mov	r3, #144
	str	r3, [fp, #-12]
.L12:
	ldr	r3, [fp, #-8]
	mov	r3, r3, asl #16
	mov	r2, r3, lsr #16
	ldr	r3, [fp, #-12]
	mov	r3, r3, asl #16
	mov	r3, r3, lsr #16
	mov	r0, r2
	mov	r1, r3
	mov	r2, #7
	mov	r3, #16
	bl	on_portal
	mov	r3, r0
	cmp	r3, #1
	bne	.L13
	mov	r3, #72
	str	r3, [fp, #-8]
	mov	r3, #80
	str	r3, [fp, #-12]
.L13:
	ldr	r3, [fp, #-8]
	mov	r3, r3, asl #16
	mov	r2, r3, lsr #16
	ldr	r3, [fp, #-12]
	mov	r3, r3, asl #16
	mov	r3, r3, lsr #16
	mov	r0, r2
	mov	r1, r3
	mov	r2, #9
	mov	r3, #4
	bl	on_portal
	mov	r3, r0
	cmp	r3, #1
	bne	.L14
	mov	r3, #144
	str	r3, [fp, #-8]
	mov	r3, #80
	str	r3, [fp, #-12]
.L14:
	ldr	r3, [fp, #-8]
	mov	r3, r3, asl #16
	mov	r2, r3, lsr #16
	ldr	r3, [fp, #-12]
	mov	r3, r3, asl #16
	mov	r3, r3, lsr #16
	mov	r0, r2
	mov	r1, r3
	mov	r2, #19
	mov	r3, #7
	bl	on_portal
	mov	r3, r0
	cmp	r3, #1
	bne	.L15
	mov	r3, #224
	str	r3, [fp, #-8]
	mov	r3, #112
	str	r3, [fp, #-12]
.L15:
	ldrh	r3, [fp, #-48]	@ movhi
	mov	r3, r3, asl #16
	mov	r3, r3, lsr #16
	ldr	r0, [fp, #-24]
	ldr	r1, [fp, #-28]
	mov	r2, r3
	bl	draw_point
	ldrh	r3, [fp, #-50]	@ movhi
	mov	r3, r3, asl #16
	mov	r3, r3, lsr #16
	ldr	r0, [fp, #-8]
	ldr	r1, [fp, #-12]
	mov	r2, r3
	bl	draw_point
	ldr	r3, [fp, #-8]
	mov	r3, r3, asl #16
	mov	r2, r3, lsr #16
	ldr	r3, [fp, #-12]
	mov	r3, r3, asl #16
	mov	r3, r3, lsr #16
	mov	r0, r2
	mov	r1, r3
	mov	r2, #28
	mov	r3, #18
	bl	on_portal
	mov	r3, r0
	cmp	r3, #1
	bne	.L16
	ldr	r0, .L22+16
	bl	sleep
	ldrh	r3, [fp, #-48]	@ movhi
	mov	r3, r3, asl #16
	mov	r3, r3, lsr #16
	mov	r0, r3
	bl	draw_bg
	b	.L17
.L16:
	ldr	r0, [fp, #-32]
	bl	sleep
	b	.L18
.L17:
	ldr	r3, .L22+8
	str	r3, [fp, #-20]
	ldr	r3, [fp, #-20]
	ldrh	r3, [r3]	@ movhi
	mov	r3, r3, asl #16
	mov	r2, r3, lsr #16
	ldrh	r3, [fp, #-34]	@ movhi
	mov	r3, r3, asl #16
	mov	r3, r3, lsr #16
	and	r3, r2, r3
	mov	r3, r3, asl #16
	mov	r3, r3, lsr #16
	cmp	r3, #0
	bne	.L19
	mov	r0, r0	@ nop
	b	.L21
.L19:
	b	.L17
.L23:
	.align	2
.L22:
	.word	543
	.word	3843
	.word	67109168
	.word	10000
	.word	100000
	.size	main, .-main
	.align	2
	.global	on_portal
	.type	on_portal, %function
on_portal:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 16
	@ frame_needed = 1, uses_anonymous_args = 0
	@ link register save eliminated.
	str	fp, [sp, #-4]!
	add	fp, sp, #0
	sub	sp, sp, #20
	strh	r0, [fp, #-14]	@ movhi
	strh	r1, [fp, #-16]	@ movhi
	strh	r2, [fp, #-18]	@ movhi
	strh	r3, [fp, #-20]	@ movhi
	ldrh	r3, [fp, #-18]	@ movhi
	mov	r3, r3, asl #16
	mov	r3, r3, lsr #16
	mov	r3, r3, asl #3
	mov	r3, r3, asl #16
	mov	r3, r3, lsr #16
	strh	r3, [fp, #-6]	@ movhi
	ldrh	r3, [fp, #-20]	@ movhi
	mov	r3, r3, asl #16
	mov	r3, r3, lsr #16
	mov	r3, r3, asl #3
	mov	r3, r3, asl #16
	mov	r3, r3, lsr #16
	strh	r3, [fp, #-8]	@ movhi
	ldrh	r3, [fp, #-6]	@ movhi
	mov	r3, r3, asl #16
	mov	r2, r3, lsr #16
	ldrh	r3, [fp, #-14]	@ movhi
	mov	r3, r3, asl #16
	mov	r3, r3, lsr #16
	cmp	r2, r3
	bhi	.L25
	ldrh	r3, [fp, #-8]	@ movhi
	mov	r3, r3, asl #16
	mov	r2, r3, lsr #16
	ldrh	r3, [fp, #-16]	@ movhi
	mov	r3, r3, asl #16
	mov	r3, r3, lsr #16
	cmp	r2, r3
	bhi	.L25
	ldrh	r3, [fp, #-14]	@ movhi
	mov	r3, r3, asl #16
	mov	r3, r3, lsr #16
	mov	r2, r3
	ldrh	r3, [fp, #-6]	@ movhi
	mov	r3, r3, asl #16
	mov	r3, r3, lsr #16
	add	r3, r3, #5
	cmp	r2, r3
	bge	.L25
	ldrh	r3, [fp, #-16]	@ movhi
	mov	r3, r3, asl #16
	mov	r3, r3, lsr #16
	mov	r2, r3
	ldrh	r3, [fp, #-8]	@ movhi
	mov	r3, r3, asl #16
	mov	r3, r3, lsr #16
	add	r3, r3, #5
	cmp	r2, r3
	bge	.L25
	mov	r3, #1
	b	.L26
.L25:
	mov	r3, #0
.L26:
	mov	r0, r3
	sub	sp, fp, #0
	@ sp needed
	ldr	fp, [sp], #4
	bx	lr
	.size	on_portal, .-on_portal
	.align	2
	.global	moveRight
	.type	moveRight, %function
moveRight:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 24
	@ frame_needed = 1, uses_anonymous_args = 0
	@ link register save eliminated.
	str	fp, [sp, #-4]!
	add	fp, sp, #0
	sub	sp, sp, #28
	str	r0, [fp, #-24]
	str	r1, [fp, #-28]
	mov	r3, #0
	strh	r3, [fp, #-14]	@ movhi
	ldr	r2, [fp, #-28]
	mov	r3, r2
	mov	r3, r3, asl #4
	rsb	r3, r2, r3
	mov	r3, r3, asl #4
	mov	r2, r3
	ldr	r3, [fp, #-24]
	add	r3, r2, r3
	add	r3, r3, #4
	mov	r3, r3, asl #1
	add	r3, r3, #100663296
	str	r3, [fp, #-8]
	mov	r3, #0
	str	r3, [fp, #-12]
	b	.L28
.L31:
	ldr	r3, [fp, #-8]
	ldrh	r3, [r3]	@ movhi
	mov	r3, r3, asl #16
	mov	r3, r3, lsr #16
	cmp	r3, #0
	bne	.L29
	mov	r3, #1
	strh	r3, [fp, #-14]	@ movhi
	b	.L30
.L29:
	ldr	r3, [fp, #-8]
	add	r3, r3, #480
	str	r3, [fp, #-8]
	ldr	r3, [fp, #-12]
	add	r3, r3, #1
	str	r3, [fp, #-12]
.L28:
	ldr	r3, [fp, #-12]
	cmp	r3, #3
	ble	.L31
.L30:
	ldrh	r3, [fp, #-14]	@ movhi
	mov	r3, r3, asl #16
	mov	r3, r3, lsr #16
	cmp	r3, #0
	bne	.L32
	ldr	r3, [fp, #-24]
	add	r3, r3, #1
	str	r3, [fp, #-24]
	ldr	r3, [fp, #-24]
	b	.L33
.L32:
	ldr	r3, [fp, #-24]
.L33:
	mov	r0, r3
	sub	sp, fp, #0
	@ sp needed
	ldr	fp, [sp], #4
	bx	lr
	.size	moveRight, .-moveRight
	.align	2
	.global	moveLeft
	.type	moveLeft, %function
moveLeft:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 24
	@ frame_needed = 1, uses_anonymous_args = 0
	@ link register save eliminated.
	str	fp, [sp, #-4]!
	add	fp, sp, #0
	sub	sp, sp, #28
	str	r0, [fp, #-24]
	str	r1, [fp, #-28]
	mov	r3, #0
	strh	r3, [fp, #-14]	@ movhi
	ldr	r2, [fp, #-28]
	mov	r3, r2
	mov	r3, r3, asl #4
	rsb	r3, r2, r3
	mov	r3, r3, asl #4
	mov	r2, r3
	ldr	r3, [fp, #-24]
	add	r3, r2, r3
	sub	r3, r3, #-2147483647
	mov	r3, r3, asl #1
	add	r3, r3, #100663296
	str	r3, [fp, #-8]
	mov	r3, #0
	str	r3, [fp, #-12]
	b	.L35
.L38:
	ldr	r3, [fp, #-8]
	ldrh	r3, [r3]	@ movhi
	mov	r3, r3, asl #16
	mov	r3, r3, lsr #16
	cmp	r3, #0
	bne	.L36
	mov	r3, #1
	strh	r3, [fp, #-14]	@ movhi
	b	.L37
.L36:
	ldr	r3, [fp, #-8]
	add	r3, r3, #480
	str	r3, [fp, #-8]
	ldr	r3, [fp, #-12]
	add	r3, r3, #1
	str	r3, [fp, #-12]
.L35:
	ldr	r3, [fp, #-12]
	cmp	r3, #3
	ble	.L38
.L37:
	ldrh	r3, [fp, #-14]	@ movhi
	mov	r3, r3, asl #16
	mov	r3, r3, lsr #16
	cmp	r3, #0
	bne	.L39
	ldr	r3, [fp, #-24]
	sub	r3, r3, #1
	str	r3, [fp, #-24]
	ldr	r3, [fp, #-24]
	b	.L40
.L39:
	ldr	r3, [fp, #-24]
.L40:
	mov	r0, r3
	sub	sp, fp, #0
	@ sp needed
	ldr	fp, [sp], #4
	bx	lr
	.size	moveLeft, .-moveLeft
	.align	2
	.global	moveUp
	.type	moveUp, %function
moveUp:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 24
	@ frame_needed = 1, uses_anonymous_args = 0
	@ link register save eliminated.
	str	fp, [sp, #-4]!
	add	fp, sp, #0
	sub	sp, sp, #28
	str	r0, [fp, #-24]
	str	r1, [fp, #-28]
	mov	r3, #0
	strh	r3, [fp, #-14]	@ movhi
	ldr	r3, [fp, #-28]
	sub	r2, r3, #1
	mov	r3, r2
	mov	r3, r3, asl #4
	rsb	r3, r2, r3
	mov	r3, r3, asl #4
	mov	r2, r3
	ldr	r3, [fp, #-24]
	add	r3, r2, r3
	mov	r3, r3, asl #1
	add	r3, r3, #100663296
	str	r3, [fp, #-8]
	mov	r3, #0
	str	r3, [fp, #-12]
	b	.L42
.L45:
	ldr	r3, [fp, #-8]
	ldrh	r3, [r3]	@ movhi
	mov	r3, r3, asl #16
	mov	r3, r3, lsr #16
	cmp	r3, #0
	bne	.L43
	mov	r3, #1
	strh	r3, [fp, #-14]	@ movhi
	b	.L44
.L43:
	ldr	r3, [fp, #-8]
	add	r3, r3, #2
	str	r3, [fp, #-8]
	ldr	r3, [fp, #-12]
	add	r3, r3, #1
	str	r3, [fp, #-12]
.L42:
	ldr	r3, [fp, #-12]
	cmp	r3, #3
	ble	.L45
.L44:
	ldrh	r3, [fp, #-14]	@ movhi
	mov	r3, r3, asl #16
	mov	r3, r3, lsr #16
	cmp	r3, #0
	bne	.L46
	ldr	r3, [fp, #-28]
	sub	r3, r3, #1
	str	r3, [fp, #-28]
	ldr	r3, [fp, #-28]
	b	.L47
.L46:
	ldr	r3, [fp, #-28]
.L47:
	mov	r0, r3
	sub	sp, fp, #0
	@ sp needed
	ldr	fp, [sp], #4
	bx	lr
	.size	moveUp, .-moveUp
	.align	2
	.global	moveDown
	.type	moveDown, %function
moveDown:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 24
	@ frame_needed = 1, uses_anonymous_args = 0
	@ link register save eliminated.
	str	fp, [sp, #-4]!
	add	fp, sp, #0
	sub	sp, sp, #28
	str	r0, [fp, #-24]
	str	r1, [fp, #-28]
	mov	r3, #0
	strh	r3, [fp, #-14]	@ movhi
	ldr	r3, [fp, #-28]
	add	r2, r3, #4
	mov	r3, r2
	mov	r3, r3, asl #4
	rsb	r3, r2, r3
	mov	r3, r3, asl #4
	mov	r2, r3
	ldr	r3, [fp, #-24]
	add	r3, r2, r3
	mov	r3, r3, asl #1
	add	r3, r3, #100663296
	str	r3, [fp, #-8]
	mov	r3, #0
	str	r3, [fp, #-12]
	b	.L49
.L52:
	ldr	r3, [fp, #-8]
	ldrh	r3, [r3]	@ movhi
	mov	r3, r3, asl #16
	mov	r3, r3, lsr #16
	cmp	r3, #0
	bne	.L50
	mov	r3, #1
	strh	r3, [fp, #-14]	@ movhi
	b	.L51
.L50:
	ldr	r3, [fp, #-8]
	add	r3, r3, #2
	str	r3, [fp, #-8]
	ldr	r3, [fp, #-12]
	add	r3, r3, #1
	str	r3, [fp, #-12]
.L49:
	ldr	r3, [fp, #-12]
	cmp	r3, #3
	ble	.L52
.L51:
	ldrh	r3, [fp, #-14]	@ movhi
	mov	r3, r3, asl #16
	mov	r3, r3, lsr #16
	cmp	r3, #0
	bne	.L53
	ldr	r3, [fp, #-28]
	add	r3, r3, #1
	str	r3, [fp, #-28]
	ldr	r3, [fp, #-28]
	b	.L54
.L53:
	ldr	r3, [fp, #-28]
.L54:
	mov	r0, r3
	sub	sp, fp, #0
	@ sp needed
	ldr	fp, [sp], #4
	bx	lr
	.size	moveDown, .-moveDown
	.align	2
	.global	draw_dot
	.type	draw_dot, %function
draw_dot:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 24
	@ frame_needed = 1, uses_anonymous_args = 0
	@ link register save eliminated.
	str	fp, [sp, #-4]!
	add	fp, sp, #0
	sub	sp, sp, #28
	str	r0, [fp, #-16]
	str	r1, [fp, #-20]
	mov	r3, r2
	strh	r3, [fp, #-22]	@ movhi
	ldr	r2, [fp, #-20]
	mov	r3, r2
	mov	r3, r3, asl #4
	rsb	r3, r2, r3
	mov	r3, r3, asl #4
	mov	r2, r3
	ldr	r3, [fp, #-16]
	add	r3, r2, r3
	mov	r3, r3, asl #1
	add	r3, r3, #100663296
	str	r3, [fp, #-8]
	ldrh	r3, [fp, #-22]	@ movhi
	mov	r3, r3, asl #16
	mov	r2, r3, lsr #16
	ldr	r3, [fp, #-8]
	strh	r2, [r3]	@ movhi
	sub	sp, fp, #0
	@ sp needed
	ldr	fp, [sp], #4
	bx	lr
	.size	draw_dot, .-draw_dot
	.align	2
	.global	draw_point2
	.type	draw_point2, %function
draw_point2:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 32
	@ frame_needed = 1, uses_anonymous_args = 0
	@ link register save eliminated.
	str	fp, [sp, #-4]!
	add	fp, sp, #0
	sub	sp, sp, #36
	str	r0, [fp, #-24]
	str	r1, [fp, #-28]
	mov	r3, r2
	strh	r3, [fp, #-30]	@ movhi
	ldr	r3, [fp, #-24]
	mov	r3, r3, asl #2
	mov	r1, r3
	ldr	r2, [fp, #-28]
	mov	r3, r2
	mov	r3, r3, asl #4
	rsb	r3, r2, r3
	mov	r3, r3, asl #6
	add	r3, r1, r3
	add	r3, r3, #100663296
	str	r3, [fp, #-8]
	mov	r3, #0
	str	r3, [fp, #-16]
	b	.L57
.L60:
	mov	r3, #0
	str	r3, [fp, #-12]
	b	.L58
.L59:
	ldrh	r3, [fp, #-30]	@ movhi
	mov	r3, r3, asl #16
	mov	r2, r3, lsr #16
	ldr	r3, [fp, #-8]
	strh	r2, [r3]	@ movhi
	ldr	r3, [fp, #-8]
	add	r3, r3, #2
	str	r3, [fp, #-8]
	ldr	r3, [fp, #-12]
	add	r3, r3, #1
	str	r3, [fp, #-12]
.L58:
	ldr	r3, [fp, #-12]
	cmp	r3, #1
	ble	.L59
	ldr	r3, [fp, #-8]
	add	r3, r3, #476
	str	r3, [fp, #-8]
	ldr	r3, [fp, #-16]
	add	r3, r3, #1
	str	r3, [fp, #-16]
.L57:
	ldr	r3, [fp, #-16]
	cmp	r3, #1
	ble	.L60
	sub	sp, fp, #0
	@ sp needed
	ldr	fp, [sp], #4
	bx	lr
	.size	draw_point2, .-draw_point2
	.align	2
	.global	draw_point
	.type	draw_point, %function
draw_point:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 32
	@ frame_needed = 1, uses_anonymous_args = 0
	@ link register save eliminated.
	str	fp, [sp, #-4]!
	add	fp, sp, #0
	sub	sp, sp, #36
	str	r0, [fp, #-24]
	str	r1, [fp, #-28]
	mov	r3, r2
	strh	r3, [fp, #-30]	@ movhi
	ldr	r3, [fp, #-24]
	str	r3, [fp, #-12]
	ldr	r3, [fp, #-28]
	str	r3, [fp, #-16]
	ldr	r2, [fp, #-16]
	mov	r3, r2
	mov	r3, r3, asl #4
	rsb	r3, r2, r3
	mov	r3, r3, asl #4
	mov	r2, r3
	ldr	r3, [fp, #-12]
	add	r3, r2, r3
	mov	r3, r3, asl #1
	add	r3, r3, #100663296
	str	r3, [fp, #-8]
	mov	r3, #0
	str	r3, [fp, #-16]
	b	.L62
.L65:
	mov	r3, #0
	str	r3, [fp, #-12]
	b	.L63
.L64:
	ldrh	r3, [fp, #-30]	@ movhi
	mov	r3, r3, asl #16
	mov	r2, r3, lsr #16
	ldr	r3, [fp, #-8]
	strh	r2, [r3]	@ movhi
	ldr	r3, [fp, #-8]
	add	r3, r3, #2
	str	r3, [fp, #-8]
	ldr	r3, [fp, #-12]
	add	r3, r3, #1
	str	r3, [fp, #-12]
.L63:
	ldr	r3, [fp, #-12]
	cmp	r3, #3
	ble	.L64
	ldr	r3, [fp, #-8]
	add	r3, r3, #472
	str	r3, [fp, #-8]
	ldr	r3, [fp, #-16]
	add	r3, r3, #1
	str	r3, [fp, #-16]
.L62:
	ldr	r3, [fp, #-16]
	cmp	r3, #3
	ble	.L65
	sub	sp, fp, #0
	@ sp needed
	ldr	fp, [sp], #4
	bx	lr
	.size	draw_point, .-draw_point
	.align	2
	.global	draw_block
	.type	draw_block, %function
draw_block:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 24
	@ frame_needed = 1, uses_anonymous_args = 0
	@ link register save eliminated.
	str	fp, [sp, #-4]!
	add	fp, sp, #0
	sub	sp, sp, #28
	mov	r3, r2
	strh	r0, [fp, #-22]	@ movhi
	strh	r1, [fp, #-24]	@ movhi
	strh	r3, [fp, #-26]	@ movhi
	ldrh	r3, [fp, #-22]	@ movhi
	mov	r3, r3, asl #16
	mov	r3, r3, lsr #16
	mov	r3, r3, asl #4
	mov	r1, r3
	ldrh	r3, [fp, #-24]	@ movhi
	mov	r3, r3, asl #16
	mov	r3, r3, lsr #16
	mov	r2, r3
	mov	r3, r2
	mov	r3, r3, asl #4
	rsb	r3, r2, r3
	mov	r3, r3, asl #8
	add	r3, r1, r3
	add	r3, r3, #100663296
	str	r3, [fp, #-8]
	mov	r3, #0
	str	r3, [fp, #-16]
	b	.L67
.L70:
	mov	r3, #0
	str	r3, [fp, #-12]
	b	.L68
.L69:
	ldrh	r3, [fp, #-26]	@ movhi
	mov	r3, r3, asl #16
	mov	r2, r3, lsr #16
	ldr	r3, [fp, #-8]
	strh	r2, [r3]	@ movhi
	ldr	r3, [fp, #-8]
	add	r3, r3, #2
	str	r3, [fp, #-8]
	ldr	r3, [fp, #-12]
	add	r3, r3, #1
	str	r3, [fp, #-12]
.L68:
	ldr	r3, [fp, #-12]
	cmp	r3, #7
	ble	.L69
	ldr	r3, [fp, #-8]
	add	r3, r3, #464
	str	r3, [fp, #-8]
	ldr	r3, [fp, #-16]
	add	r3, r3, #1
	str	r3, [fp, #-16]
.L67:
	ldr	r3, [fp, #-16]
	cmp	r3, #7
	ble	.L70
	sub	sp, fp, #0
	@ sp needed
	ldr	fp, [sp], #4
	bx	lr
	.size	draw_block, .-draw_block
	.align	2
	.global	draw_portal
	.type	draw_portal, %function
draw_portal:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 24
	@ frame_needed = 1, uses_anonymous_args = 0
	@ link register save eliminated.
	str	fp, [sp, #-4]!
	add	fp, sp, #0
	sub	sp, sp, #28
	mov	r3, r2
	strh	r0, [fp, #-22]	@ movhi
	strh	r1, [fp, #-24]	@ movhi
	strh	r3, [fp, #-26]	@ movhi
	ldrh	r3, [fp, #-22]	@ movhi
	mov	r3, r3, asl #16
	mov	r3, r3, lsr #16
	mov	r3, r3, asl #4
	mov	r1, r3
	ldrh	r3, [fp, #-24]	@ movhi
	mov	r3, r3, asl #16
	mov	r3, r3, lsr #16
	mov	r2, r3
	mov	r3, r2
	mov	r3, r3, asl #4
	rsb	r3, r2, r3
	mov	r3, r3, asl #8
	add	r3, r1, r3
	add	r3, r3, #100663296
	str	r3, [fp, #-8]
	mov	r3, #0
	str	r3, [fp, #-16]
	b	.L72
.L77:
	mov	r3, #0
	str	r3, [fp, #-12]
	b	.L73
.L76:
	ldr	r3, [fp, #-12]
	cmp	r3, #0
	beq	.L74
	ldr	r3, [fp, #-12]
	cmp	r3, #1
	beq	.L74
	ldr	r3, [fp, #-12]
	cmp	r3, #6
	beq	.L74
	ldr	r3, [fp, #-12]
	cmp	r3, #7
	beq	.L74
	ldr	r3, [fp, #-16]
	cmp	r3, #0
	beq	.L74
	ldr	r3, [fp, #-16]
	cmp	r3, #1
	beq	.L74
	ldr	r3, [fp, #-16]
	cmp	r3, #6
	beq	.L74
	ldr	r3, [fp, #-16]
	cmp	r3, #7
	bne	.L75
.L74:
	ldrh	r3, [fp, #-26]	@ movhi
	mov	r3, r3, asl #16
	mov	r2, r3, lsr #16
	ldr	r3, [fp, #-8]
	strh	r2, [r3]	@ movhi
.L75:
	ldr	r3, [fp, #-8]
	add	r3, r3, #2
	str	r3, [fp, #-8]
	ldr	r3, [fp, #-12]
	add	r3, r3, #1
	str	r3, [fp, #-12]
.L73:
	ldr	r3, [fp, #-12]
	cmp	r3, #7
	ble	.L76
	ldr	r3, [fp, #-8]
	add	r3, r3, #464
	str	r3, [fp, #-8]
	ldr	r3, [fp, #-16]
	add	r3, r3, #1
	str	r3, [fp, #-16]
.L72:
	ldr	r3, [fp, #-16]
	cmp	r3, #7
	ble	.L77
	sub	sp, fp, #0
	@ sp needed
	ldr	fp, [sp], #4
	bx	lr
	.size	draw_portal, .-draw_portal
	.align	2
	.global	draw_heart
	.type	draw_heart, %function
draw_heart:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 16
	@ frame_needed = 1, uses_anonymous_args = 0
	stmfd	sp!, {fp, lr}
	add	fp, sp, #4
	sub	sp, sp, #16
	str	r0, [fp, #-16]
	str	r1, [fp, #-20]
	ldr	r3, [fp, #-16]
	mov	r3, r3, asl #16
	mov	r3, r3, lsr #16
	mov	r3, r3, asl #3
	mov	r3, r3, asl #16
	mov	r3, r3, lsr #16
	strh	r3, [fp, #-6]	@ movhi
	ldr	r3, [fp, #-20]
	mov	r3, r3, asl #16
	mov	r3, r3, lsr #16
	mov	r3, r3, asl #3
	mov	r3, r3, asl #16
	mov	r3, r3, lsr #16
	strh	r3, [fp, #-8]	@ movhi
	ldr	r3, [fp, #-16]
	mov	r3, r3, asl #16
	mov	r2, r3, lsr #16
	ldr	r3, [fp, #-20]
	mov	r3, r3, asl #16
	mov	r3, r3, lsr #16
	mov	r0, r2
	mov	r1, r3
	ldr	r2, .L79
	bl	draw_block
	ldrh	r3, [fp, #-6]	@ movhi
	mov	r3, r3, asl #16
	mov	r3, r3, lsr #16
	add	r2, r3, #1
	ldrh	r3, [fp, #-8]	@ movhi
	mov	r3, r3, asl #16
	mov	r3, r3, lsr #16
	add	r3, r3, #1
	mov	r0, r2
	mov	r1, r3
	ldr	r2, .L79+4
	bl	draw_dot
	ldrh	r3, [fp, #-6]	@ movhi
	mov	r3, r3, asl #16
	mov	r3, r3, lsr #16
	add	r2, r3, #2
	ldrh	r3, [fp, #-8]	@ movhi
	mov	r3, r3, asl #16
	mov	r3, r3, lsr #16
	add	r3, r3, #1
	mov	r0, r2
	mov	r1, r3
	ldr	r2, .L79+4
	bl	draw_dot
	ldrh	r3, [fp, #-6]	@ movhi
	mov	r3, r3, asl #16
	mov	r3, r3, lsr #16
	add	r2, r3, #5
	ldrh	r3, [fp, #-8]	@ movhi
	mov	r3, r3, asl #16
	mov	r3, r3, lsr #16
	add	r3, r3, #1
	mov	r0, r2
	mov	r1, r3
	ldr	r2, .L79+4
	bl	draw_dot
	ldrh	r3, [fp, #-6]	@ movhi
	mov	r3, r3, asl #16
	mov	r3, r3, lsr #16
	add	r2, r3, #6
	ldrh	r3, [fp, #-8]	@ movhi
	mov	r3, r3, asl #16
	mov	r3, r3, lsr #16
	add	r3, r3, #1
	mov	r0, r2
	mov	r1, r3
	ldr	r2, .L79+4
	bl	draw_dot
	ldrh	r3, [fp, #-6]	@ movhi
	mov	r3, r3, asl #16
	mov	r3, r3, lsr #16
	mov	r2, r3
	ldrh	r3, [fp, #-8]	@ movhi
	mov	r3, r3, asl #16
	mov	r3, r3, lsr #16
	add	r3, r3, #2
	mov	r0, r2
	mov	r1, r3
	ldr	r2, .L79+4
	bl	draw_dot
	ldrh	r3, [fp, #-6]	@ movhi
	mov	r3, r3, asl #16
	mov	r3, r3, lsr #16
	add	r2, r3, #1
	ldrh	r3, [fp, #-8]	@ movhi
	mov	r3, r3, asl #16
	mov	r3, r3, lsr #16
	add	r3, r3, #2
	mov	r0, r2
	mov	r1, r3
	ldr	r2, .L79+4
	bl	draw_dot
	ldrh	r3, [fp, #-6]	@ movhi
	mov	r3, r3, asl #16
	mov	r3, r3, lsr #16
	add	r2, r3, #2
	ldrh	r3, [fp, #-8]	@ movhi
	mov	r3, r3, asl #16
	mov	r3, r3, lsr #16
	add	r3, r3, #2
	mov	r0, r2
	mov	r1, r3
	ldr	r2, .L79+4
	bl	draw_dot
	ldrh	r3, [fp, #-6]	@ movhi
	mov	r3, r3, asl #16
	mov	r3, r3, lsr #16
	add	r2, r3, #3
	ldrh	r3, [fp, #-8]	@ movhi
	mov	r3, r3, asl #16
	mov	r3, r3, lsr #16
	add	r3, r3, #2
	mov	r0, r2
	mov	r1, r3
	ldr	r2, .L79+4
	bl	draw_dot
	ldrh	r3, [fp, #-6]	@ movhi
	mov	r3, r3, asl #16
	mov	r3, r3, lsr #16
	add	r2, r3, #4
	ldrh	r3, [fp, #-8]	@ movhi
	mov	r3, r3, asl #16
	mov	r3, r3, lsr #16
	add	r3, r3, #2
	mov	r0, r2
	mov	r1, r3
	ldr	r2, .L79+4
	bl	draw_dot
	ldrh	r3, [fp, #-6]	@ movhi
	mov	r3, r3, asl #16
	mov	r3, r3, lsr #16
	add	r2, r3, #5
	ldrh	r3, [fp, #-8]	@ movhi
	mov	r3, r3, asl #16
	mov	r3, r3, lsr #16
	add	r3, r3, #2
	mov	r0, r2
	mov	r1, r3
	ldr	r2, .L79+4
	bl	draw_dot
	ldrh	r3, [fp, #-6]	@ movhi
	mov	r3, r3, asl #16
	mov	r3, r3, lsr #16
	add	r2, r3, #6
	ldrh	r3, [fp, #-8]	@ movhi
	mov	r3, r3, asl #16
	mov	r3, r3, lsr #16
	add	r3, r3, #2
	mov	r0, r2
	mov	r1, r3
	ldr	r2, .L79+4
	bl	draw_dot
	ldrh	r3, [fp, #-6]	@ movhi
	mov	r3, r3, asl #16
	mov	r3, r3, lsr #16
	add	r2, r3, #7
	ldrh	r3, [fp, #-8]	@ movhi
	mov	r3, r3, asl #16
	mov	r3, r3, lsr #16
	add	r3, r3, #2
	mov	r0, r2
	mov	r1, r3
	ldr	r2, .L79+4
	bl	draw_dot
	ldrh	r3, [fp, #-6]	@ movhi
	mov	r3, r3, asl #16
	mov	r3, r3, lsr #16
	mov	r2, r3
	ldrh	r3, [fp, #-8]	@ movhi
	mov	r3, r3, asl #16
	mov	r3, r3, lsr #16
	add	r3, r3, #3
	mov	r0, r2
	mov	r1, r3
	ldr	r2, .L79+4
	bl	draw_dot
	ldrh	r3, [fp, #-6]	@ movhi
	mov	r3, r3, asl #16
	mov	r3, r3, lsr #16
	add	r2, r3, #1
	ldrh	r3, [fp, #-8]	@ movhi
	mov	r3, r3, asl #16
	mov	r3, r3, lsr #16
	add	r3, r3, #3
	mov	r0, r2
	mov	r1, r3
	ldr	r2, .L79+4
	bl	draw_dot
	ldrh	r3, [fp, #-6]	@ movhi
	mov	r3, r3, asl #16
	mov	r3, r3, lsr #16
	add	r2, r3, #2
	ldrh	r3, [fp, #-8]	@ movhi
	mov	r3, r3, asl #16
	mov	r3, r3, lsr #16
	add	r3, r3, #3
	mov	r0, r2
	mov	r1, r3
	ldr	r2, .L79+4
	bl	draw_dot
	ldrh	r3, [fp, #-6]	@ movhi
	mov	r3, r3, asl #16
	mov	r3, r3, lsr #16
	add	r2, r3, #3
	ldrh	r3, [fp, #-8]	@ movhi
	mov	r3, r3, asl #16
	mov	r3, r3, lsr #16
	add	r3, r3, #3
	mov	r0, r2
	mov	r1, r3
	ldr	r2, .L79+4
	bl	draw_dot
	ldrh	r3, [fp, #-6]	@ movhi
	mov	r3, r3, asl #16
	mov	r3, r3, lsr #16
	add	r2, r3, #4
	ldrh	r3, [fp, #-8]	@ movhi
	mov	r3, r3, asl #16
	mov	r3, r3, lsr #16
	add	r3, r3, #3
	mov	r0, r2
	mov	r1, r3
	ldr	r2, .L79+4
	bl	draw_dot
	ldrh	r3, [fp, #-6]	@ movhi
	mov	r3, r3, asl #16
	mov	r3, r3, lsr #16
	add	r2, r3, #5
	ldrh	r3, [fp, #-8]	@ movhi
	mov	r3, r3, asl #16
	mov	r3, r3, lsr #16
	add	r3, r3, #3
	mov	r0, r2
	mov	r1, r3
	ldr	r2, .L79+4
	bl	draw_dot
	ldrh	r3, [fp, #-6]	@ movhi
	mov	r3, r3, asl #16
	mov	r3, r3, lsr #16
	add	r2, r3, #6
	ldrh	r3, [fp, #-8]	@ movhi
	mov	r3, r3, asl #16
	mov	r3, r3, lsr #16
	add	r3, r3, #3
	mov	r0, r2
	mov	r1, r3
	ldr	r2, .L79+4
	bl	draw_dot
	ldrh	r3, [fp, #-6]	@ movhi
	mov	r3, r3, asl #16
	mov	r3, r3, lsr #16
	add	r2, r3, #7
	ldrh	r3, [fp, #-8]	@ movhi
	mov	r3, r3, asl #16
	mov	r3, r3, lsr #16
	add	r3, r3, #3
	mov	r0, r2
	mov	r1, r3
	ldr	r2, .L79+4
	bl	draw_dot
	ldrh	r3, [fp, #-6]	@ movhi
	mov	r3, r3, asl #16
	mov	r3, r3, lsr #16
	add	r2, r3, #1
	ldrh	r3, [fp, #-8]	@ movhi
	mov	r3, r3, asl #16
	mov	r3, r3, lsr #16
	add	r3, r3, #4
	mov	r0, r2
	mov	r1, r3
	ldr	r2, .L79+4
	bl	draw_dot
	ldrh	r3, [fp, #-6]	@ movhi
	mov	r3, r3, asl #16
	mov	r3, r3, lsr #16
	add	r2, r3, #2
	ldrh	r3, [fp, #-8]	@ movhi
	mov	r3, r3, asl #16
	mov	r3, r3, lsr #16
	add	r3, r3, #4
	mov	r0, r2
	mov	r1, r3
	ldr	r2, .L79+4
	bl	draw_dot
	ldrh	r3, [fp, #-6]	@ movhi
	mov	r3, r3, asl #16
	mov	r3, r3, lsr #16
	add	r2, r3, #3
	ldrh	r3, [fp, #-8]	@ movhi
	mov	r3, r3, asl #16
	mov	r3, r3, lsr #16
	add	r3, r3, #4
	mov	r0, r2
	mov	r1, r3
	ldr	r2, .L79+4
	bl	draw_dot
	ldrh	r3, [fp, #-6]	@ movhi
	mov	r3, r3, asl #16
	mov	r3, r3, lsr #16
	add	r2, r3, #4
	ldrh	r3, [fp, #-8]	@ movhi
	mov	r3, r3, asl #16
	mov	r3, r3, lsr #16
	add	r3, r3, #4
	mov	r0, r2
	mov	r1, r3
	ldr	r2, .L79+4
	bl	draw_dot
	ldrh	r3, [fp, #-6]	@ movhi
	mov	r3, r3, asl #16
	mov	r3, r3, lsr #16
	add	r2, r3, #5
	ldrh	r3, [fp, #-8]	@ movhi
	mov	r3, r3, asl #16
	mov	r3, r3, lsr #16
	add	r3, r3, #4
	mov	r0, r2
	mov	r1, r3
	ldr	r2, .L79+4
	bl	draw_dot
	ldrh	r3, [fp, #-6]	@ movhi
	mov	r3, r3, asl #16
	mov	r3, r3, lsr #16
	add	r2, r3, #6
	ldrh	r3, [fp, #-8]	@ movhi
	mov	r3, r3, asl #16
	mov	r3, r3, lsr #16
	add	r3, r3, #4
	mov	r0, r2
	mov	r1, r3
	ldr	r2, .L79+4
	bl	draw_dot
	ldrh	r3, [fp, #-6]	@ movhi
	mov	r3, r3, asl #16
	mov	r3, r3, lsr #16
	add	r2, r3, #2
	ldrh	r3, [fp, #-8]	@ movhi
	mov	r3, r3, asl #16
	mov	r3, r3, lsr #16
	add	r3, r3, #5
	mov	r0, r2
	mov	r1, r3
	ldr	r2, .L79+4
	bl	draw_dot
	ldrh	r3, [fp, #-6]	@ movhi
	mov	r3, r3, asl #16
	mov	r3, r3, lsr #16
	add	r2, r3, #3
	ldrh	r3, [fp, #-8]	@ movhi
	mov	r3, r3, asl #16
	mov	r3, r3, lsr #16
	add	r3, r3, #5
	mov	r0, r2
	mov	r1, r3
	ldr	r2, .L79+4
	bl	draw_dot
	ldrh	r3, [fp, #-6]	@ movhi
	mov	r3, r3, asl #16
	mov	r3, r3, lsr #16
	add	r2, r3, #4
	ldrh	r3, [fp, #-8]	@ movhi
	mov	r3, r3, asl #16
	mov	r3, r3, lsr #16
	add	r3, r3, #5
	mov	r0, r2
	mov	r1, r3
	ldr	r2, .L79+4
	bl	draw_dot
	ldrh	r3, [fp, #-6]	@ movhi
	mov	r3, r3, asl #16
	mov	r3, r3, lsr #16
	add	r2, r3, #5
	ldrh	r3, [fp, #-8]	@ movhi
	mov	r3, r3, asl #16
	mov	r3, r3, lsr #16
	add	r3, r3, #5
	mov	r0, r2
	mov	r1, r3
	ldr	r2, .L79+4
	bl	draw_dot
	ldrh	r3, [fp, #-6]	@ movhi
	mov	r3, r3, asl #16
	mov	r3, r3, lsr #16
	add	r2, r3, #3
	ldrh	r3, [fp, #-8]	@ movhi
	mov	r3, r3, asl #16
	mov	r3, r3, lsr #16
	add	r3, r3, #6
	mov	r0, r2
	mov	r1, r3
	ldr	r2, .L79+4
	bl	draw_dot
	ldrh	r3, [fp, #-6]	@ movhi
	mov	r3, r3, asl #16
	mov	r3, r3, lsr #16
	add	r2, r3, #4
	ldrh	r3, [fp, #-8]	@ movhi
	mov	r3, r3, asl #16
	mov	r3, r3, lsr #16
	add	r3, r3, #6
	mov	r0, r2
	mov	r1, r3
	ldr	r2, .L79+4
	bl	draw_dot
	sub	sp, fp, #4
	@ sp needed
	ldmfd	sp!, {fp, lr}
	bx	lr
.L80:
	.align	2
.L79:
	.word	50712
	.word	63519
	.size	draw_heart, .-draw_heart
	.align	2
	.global	draw_wall
	.type	draw_wall, %function
draw_wall:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 16
	@ frame_needed = 1, uses_anonymous_args = 0
	stmfd	sp!, {fp, lr}
	add	fp, sp, #4
	sub	sp, sp, #16
	mov	r3, r0
	strh	r3, [fp, #-14]	@ movhi
	ldr	r3, .L87
	mov	r2, #1
	strh	r2, [r3]	@ movhi
	ldr	r3, .L87
	mov	r2, #1
	strh	r2, [r3, #2]	@ movhi
	ldr	r3, .L87
	mov	r2, #1
	strh	r2, [r3, #4]	@ movhi
	ldr	r3, .L87
	mov	r2, #1
	strh	r2, [r3, #6]	@ movhi
	ldr	r3, .L87
	mov	r2, #1
	strh	r2, [r3, #8]	@ movhi
	ldr	r3, .L87
	mov	r2, #1
	strh	r2, [r3, #10]	@ movhi
	ldr	r3, .L87
	mov	r2, #1
	strh	r2, [r3, #12]	@ movhi
	ldr	r3, .L87
	mov	r2, #1
	strh	r2, [r3, #14]	@ movhi
	ldr	r3, .L87
	mov	r2, #1
	strh	r2, [r3, #16]	@ movhi
	ldr	r3, .L87
	mov	r2, #1
	strh	r2, [r3, #18]	@ movhi
	ldr	r3, .L87
	mov	r2, #1
	strh	r2, [r3, #20]	@ movhi
	ldr	r3, .L87
	mov	r2, #1
	strh	r2, [r3, #22]	@ movhi
	ldr	r3, .L87
	mov	r2, #1
	strh	r2, [r3, #24]	@ movhi
	ldr	r3, .L87
	mov	r2, #1
	strh	r2, [r3, #26]	@ movhi
	ldr	r3, .L87
	mov	r2, #1
	strh	r2, [r3, #28]	@ movhi
	ldr	r3, .L87
	mov	r2, #1
	strh	r2, [r3, #30]	@ movhi
	ldr	r3, .L87
	mov	r2, #1
	strh	r2, [r3, #32]	@ movhi
	ldr	r3, .L87
	mov	r2, #1
	strh	r2, [r3, #34]	@ movhi
	ldr	r3, .L87
	mov	r2, #1
	strh	r2, [r3, #36]	@ movhi
	ldr	r3, .L87
	mov	r2, #1
	strh	r2, [r3, #38]	@ movhi
	ldr	r3, .L87
	mov	r2, #1
	strh	r2, [r3, #40]	@ movhi
	ldr	r3, .L87
	mov	r2, #1
	strh	r2, [r3, #42]	@ movhi
	ldr	r3, .L87
	mov	r2, #1
	strh	r2, [r3, #44]	@ movhi
	ldr	r3, .L87
	mov	r2, #1
	strh	r2, [r3, #46]	@ movhi
	ldr	r3, .L87
	mov	r2, #1
	strh	r2, [r3, #48]	@ movhi
	ldr	r3, .L87
	mov	r2, #1
	strh	r2, [r3, #50]	@ movhi
	ldr	r3, .L87
	mov	r2, #1
	strh	r2, [r3, #52]	@ movhi
	ldr	r3, .L87
	mov	r2, #1
	strh	r2, [r3, #54]	@ movhi
	ldr	r3, .L87
	mov	r2, #1
	strh	r2, [r3, #56]	@ movhi
	ldr	r3, .L87
	mov	r2, #1
	strh	r2, [r3, #58]	@ movhi
	ldr	r3, .L87
	mov	r2, #1
	strh	r2, [r3, #60]	@ movhi
	ldr	r3, .L87
	mov	r2, #0
	strh	r2, [r3, #62]	@ movhi
	ldr	r3, .L87
	mov	r2, #0
	strh	r2, [r3, #64]	@ movhi
	ldr	r3, .L87
	mov	r2, #0
	strh	r2, [r3, #66]	@ movhi
	ldr	r3, .L87
	mov	r2, #0
	strh	r2, [r3, #68]	@ movhi
	ldr	r3, .L87
	mov	r2, #0
	strh	r2, [r3, #70]	@ movhi
	ldr	r3, .L87
	mov	r2, #1
	strh	r2, [r3, #72]	@ movhi
	ldr	r3, .L87
	mov	r2, #0
	strh	r2, [r3, #74]	@ movhi
	ldr	r3, .L87
	mov	r2, #0
	strh	r2, [r3, #76]	@ movhi
	ldr	r3, .L87
	mov	r2, #0
	strh	r2, [r3, #78]	@ movhi
	ldr	r3, .L87
	mov	r2, #1
	strh	r2, [r3, #80]	@ movhi
	ldr	r3, .L87
	mov	r2, #0
	strh	r2, [r3, #82]	@ movhi
	ldr	r3, .L87
	mov	r2, #0
	strh	r2, [r3, #84]	@ movhi
	ldr	r3, .L87
	mov	r2, #0
	strh	r2, [r3, #86]	@ movhi
	ldr	r3, .L87
	mov	r2, #0
	strh	r2, [r3, #88]	@ movhi
	ldr	r3, .L87
	mov	r2, #1
	strh	r2, [r3, #90]	@ movhi
	ldr	r3, .L87
	mov	r2, #0
	strh	r2, [r3, #92]	@ movhi
	ldr	r3, .L87
	mov	r2, #0
	strh	r2, [r3, #94]	@ movhi
	ldr	r3, .L87
	mov	r2, #0
	strh	r2, [r3, #96]	@ movhi
	ldr	r3, .L87
	mov	r2, #0
	strh	r2, [r3, #98]	@ movhi
	ldr	r3, .L87
	mov	r2, #0
	strh	r2, [r3, #100]	@ movhi
	ldr	r3, .L87
	mov	r2, #0
	strh	r2, [r3, #102]	@ movhi
	ldr	r3, .L87
	mov	r2, #0
	strh	r2, [r3, #104]	@ movhi
	ldr	r3, .L87
	mov	r2, #0
	strh	r2, [r3, #106]	@ movhi
	ldr	r3, .L87
	mov	r2, #0
	strh	r2, [r3, #108]	@ movhi
	ldr	r3, .L87
	mov	r2, #1
	strh	r2, [r3, #110]	@ movhi
	ldr	r3, .L87
	mov	r2, #0
	strh	r2, [r3, #112]	@ movhi
	ldr	r3, .L87
	mov	r2, #0
	strh	r2, [r3, #114]	@ movhi
	ldr	r3, .L87
	mov	r2, #0
	strh	r2, [r3, #116]	@ movhi
	ldr	r3, .L87
	mov	r2, #1
	strh	r2, [r3, #118]	@ movhi
	ldr	r3, .L87
	mov	r2, #1
	strh	r2, [r3, #120]	@ movhi
	ldr	r3, .L87
	mov	r2, #1
	strh	r2, [r3, #122]	@ movhi
	ldr	r3, .L87
	mov	r2, #1
	strh	r2, [r3, #124]	@ movhi
	ldr	r3, .L87
	mov	r2, #1
	strh	r2, [r3, #126]	@ movhi
	ldr	r3, .L87
	mov	r2, #1
	strh	r2, [r3, #128]	@ movhi
	ldr	r3, .L87
	mov	r2, #1
	strh	r2, [r3, #130]	@ movhi
	ldr	r3, .L87
	mov	r2, #1
	strh	r2, [r3, #132]	@ movhi
	ldr	r3, .L87
	mov	r2, #0
	strh	r2, [r3, #134]	@ movhi
	ldr	r3, .L87
	mov	r2, #1
	strh	r2, [r3, #136]	@ movhi
	ldr	r3, .L87
	mov	r2, #0
	strh	r2, [r3, #138]	@ movhi
	ldr	r3, .L87
	mov	r2, #1
	strh	r2, [r3, #140]	@ movhi
	ldr	r3, .L87
	mov	r2, #0
	strh	r2, [r3, #142]	@ movhi
	ldr	r3, .L87
	mov	r2, #1
	strh	r2, [r3, #144]	@ movhi
	ldr	r3, .L87
	mov	r2, #1
	strh	r2, [r3, #146]	@ movhi
	ldr	r3, .L87
	mov	r2, #0
	strh	r2, [r3, #148]	@ movhi
	ldr	r3, .L87
	mov	r2, #1
	strh	r2, [r3, #150]	@ movhi
	ldr	r3, .L87
	mov	r2, #1
	strh	r2, [r3, #152]	@ movhi
	ldr	r3, .L87
	mov	r2, #1
	strh	r2, [r3, #154]	@ movhi
	ldr	r3, .L87
	mov	r2, #1
	strh	r2, [r3, #156]	@ movhi
	ldr	r3, .L87
	mov	r2, #1
	strh	r2, [r3, #158]	@ movhi
	ldr	r3, .L87
	mov	r2, #0
	strh	r2, [r3, #160]	@ movhi
	ldr	r3, .L87
	mov	r2, #1
	strh	r2, [r3, #162]	@ movhi
	ldr	r3, .L87
	mov	r2, #1
	strh	r2, [r3, #164]	@ movhi
	ldr	r3, .L87
	mov	r2, #1
	strh	r2, [r3, #166]	@ movhi
	ldr	r3, .L87
	mov	r2, #0
	strh	r2, [r3, #168]	@ movhi
	ldr	r3, .L87
	mov	r2, #1
	strh	r2, [r3, #170]	@ movhi
	ldr	r3, .L87
	mov	r2, #0
	strh	r2, [r3, #172]	@ movhi
	ldr	r3, .L87
	mov	r2, #1
	strh	r2, [r3, #174]	@ movhi
	ldr	r3, .L87
	mov	r2, #1
	strh	r2, [r3, #176]	@ movhi
	ldr	r3, .L87
	mov	r2, #1
	strh	r2, [r3, #178]	@ movhi
	ldr	r3, .L87
	mov	r2, #1
	strh	r2, [r3, #180]	@ movhi
	ldr	r3, .L87
	mov	r2, #0
	strh	r2, [r3, #182]	@ movhi
	ldr	r3, .L87
	mov	r2, #1
	strh	r2, [r3, #184]	@ movhi
	ldr	r3, .L87
	mov	r2, #0
	strh	r2, [r3, #186]	@ movhi
	ldr	r3, .L87
	mov	r2, #1
	strh	r2, [r3, #188]	@ movhi
	ldr	r3, .L87
	mov	r2, #0
	strh	r2, [r3, #190]	@ movhi
	ldr	r3, .L87
	mov	r2, #0
	strh	r2, [r3, #192]	@ movhi
	ldr	r3, .L87
	mov	r2, #0
	strh	r2, [r3, #194]	@ movhi
	ldr	r3, .L87
	mov	r2, #1
	strh	r2, [r3, #196]	@ movhi
	ldr	r3, .L87
	mov	r2, #1
	strh	r2, [r3, #198]	@ movhi
	ldr	r3, .L87
	mov	r2, #1
	strh	r2, [r3, #200]	@ movhi
	ldr	r3, .L87
	mov	r2, #0
	strh	r2, [r3, #202]	@ movhi
	ldr	r3, .L87
	mov	r2, #1
	strh	r2, [r3, #204]	@ movhi
	ldr	r3, .L87
	mov	r2, #0
	strh	r2, [r3, #206]	@ movhi
	ldr	r3, .L87
	mov	r2, #0
	strh	r2, [r3, #208]	@ movhi
	ldr	r3, .L87
	mov	r2, #0
	strh	r2, [r3, #210]	@ movhi
	ldr	r3, .L87
	mov	r2, #0
	strh	r2, [r3, #212]	@ movhi
	ldr	r3, .L87
	mov	r2, #1
	strh	r2, [r3, #214]	@ movhi
	ldr	r3, .L87
	mov	r2, #0
	strh	r2, [r3, #216]	@ movhi
	ldr	r3, .L87
	mov	r2, #0
	strh	r2, [r3, #218]	@ movhi
	ldr	r3, .L87
	mov	r2, #0
	strh	r2, [r3, #220]	@ movhi
	ldr	r3, .L87
	mov	r2, #0
	strh	r2, [r3, #222]	@ movhi
	ldr	r3, .L87
	mov	r2, #1
	strh	r2, [r3, #224]	@ movhi
	ldr	r3, .L87
	mov	r2, #0
	strh	r2, [r3, #226]	@ movhi
	ldr	r3, .L87
	mov	r2, #0
	strh	r2, [r3, #228]	@ movhi
	ldr	r3, .L87
	mov	r2, #1
	strh	r2, [r3, #230]	@ movhi
	ldr	r3, .L87
	mov	r2, #0
	strh	r2, [r3, #232]	@ movhi
	ldr	r3, .L87
	mov	r2, #0
	strh	r2, [r3, #234]	@ movhi
	ldr	r3, .L87
	mov	r2, #0
	strh	r2, [r3, #236]	@ movhi
	ldr	r3, .L87
	mov	r2, #1
	strh	r2, [r3, #238]	@ movhi
	ldr	r3, .L87
	mov	r2, #1
	strh	r2, [r3, #240]	@ movhi
	ldr	r3, .L87
	mov	r2, #0
	strh	r2, [r3, #242]	@ movhi
	ldr	r3, .L87
	mov	r2, #1
	strh	r2, [r3, #244]	@ movhi
	ldr	r3, .L87
	mov	r2, #0
	strh	r2, [r3, #246]	@ movhi
	ldr	r3, .L87
	mov	r2, #1
	strh	r2, [r3, #248]	@ movhi
	ldr	r3, .L87
	mov	r2, #1
	strh	r2, [r3, #250]	@ movhi
	ldr	r3, .L87
	mov	r2, #1
	strh	r2, [r3, #252]	@ movhi
	ldr	r3, .L87
	mov	r2, #0
	strh	r2, [r3, #254]	@ movhi
	ldr	r2, .L87
	mov	r3, #256
	mov	r1, #1
	strh	r1, [r2, r3]	@ movhi
	ldr	r2, .L87
	ldr	r3, .L87+4
	mov	r1, #0
	strh	r1, [r2, r3]	@ movhi
	ldr	r2, .L87
	mov	r3, #260
	mov	r1, #0
	strh	r1, [r2, r3]	@ movhi
	ldr	r2, .L87
	ldr	r3, .L87+8
	mov	r1, #0
	strh	r1, [r2, r3]	@ movhi
	ldr	r2, .L87
	mov	r3, #264
	mov	r1, #1
	strh	r1, [r2, r3]	@ movhi
	ldr	r2, .L87
	ldr	r3, .L87+12
	mov	r1, #0
	strh	r1, [r2, r3]	@ movhi
	ldr	r2, .L87
	mov	r3, #268
	mov	r1, #1
	strh	r1, [r2, r3]	@ movhi
	ldr	r2, .L87
	ldr	r3, .L87+16
	mov	r1, #1
	strh	r1, [r2, r3]	@ movhi
	ldr	r2, .L87
	mov	r3, #272
	mov	r1, #1
	strh	r1, [r2, r3]	@ movhi
	ldr	r2, .L87
	ldr	r3, .L87+20
	mov	r1, #1
	strh	r1, [r2, r3]	@ movhi
	ldr	r2, .L87
	mov	r3, #276
	mov	r1, #0
	strh	r1, [r2, r3]	@ movhi
	ldr	r2, .L87
	ldr	r3, .L87+24
	mov	r1, #1
	strh	r1, [r2, r3]	@ movhi
	ldr	r2, .L87
	mov	r3, #280
	mov	r1, #1
	strh	r1, [r2, r3]	@ movhi
	ldr	r2, .L87
	ldr	r3, .L87+28
	mov	r1, #1
	strh	r1, [r2, r3]	@ movhi
	ldr	r2, .L87
	mov	r3, #284
	mov	r1, #1
	strh	r1, [r2, r3]	@ movhi
	ldr	r2, .L87
	ldr	r3, .L87+32
	mov	r1, #0
	strh	r1, [r2, r3]	@ movhi
	ldr	r2, .L87
	mov	r3, #288
	mov	r1, #1
	strh	r1, [r2, r3]	@ movhi
	ldr	r2, .L87
	ldr	r3, .L87+36
	mov	r1, #1
	strh	r1, [r2, r3]	@ movhi
	ldr	r2, .L87
	mov	r3, #292
	mov	r1, #1
	strh	r1, [r2, r3]	@ movhi
	ldr	r2, .L87
	ldr	r3, .L87+40
	mov	r1, #1
	strh	r1, [r2, r3]	@ movhi
	ldr	r2, .L87
	mov	r3, #296
	mov	r1, #0
	strh	r1, [r2, r3]	@ movhi
	ldr	r2, .L87
	ldr	r3, .L87+44
	mov	r1, #1
	strh	r1, [r2, r3]	@ movhi
	ldr	r2, .L87
	mov	r3, #300
	mov	r1, #1
	strh	r1, [r2, r3]	@ movhi
	ldr	r2, .L87
	ldr	r3, .L87+48
	mov	r1, #0
	strh	r1, [r2, r3]	@ movhi
	ldr	r2, .L87
	mov	r3, #304
	mov	r1, #1
	strh	r1, [r2, r3]	@ movhi
	ldr	r2, .L87
	ldr	r3, .L87+52
	mov	r1, #0
	strh	r1, [r2, r3]	@ movhi
	ldr	r2, .L87
	mov	r3, #308
	mov	r1, #0
	strh	r1, [r2, r3]	@ movhi
	ldr	r2, .L87
	ldr	r3, .L87+56
	mov	r1, #0
	strh	r1, [r2, r3]	@ movhi
	ldr	r2, .L87
	mov	r3, #312
	mov	r1, #1
	strh	r1, [r2, r3]	@ movhi
	ldr	r2, .L87
	ldr	r3, .L87+60
	mov	r1, #0
	strh	r1, [r2, r3]	@ movhi
	ldr	r2, .L87
	mov	r3, #316
	mov	r1, #1
	strh	r1, [r2, r3]	@ movhi
	ldr	r2, .L87
	ldr	r3, .L87+64
	mov	r1, #1
	strh	r1, [r2, r3]	@ movhi
	ldr	r2, .L87
	mov	r3, #320
	mov	r1, #1
	strh	r1, [r2, r3]	@ movhi
	ldr	r2, .L87
	ldr	r3, .L87+68
	mov	r1, #1
	strh	r1, [r2, r3]	@ movhi
	ldr	r2, .L87
	mov	r3, #324
	mov	r1, #1
	strh	r1, [r2, r3]	@ movhi
	ldr	r2, .L87
	ldr	r3, .L87+72
	mov	r1, #0
	strh	r1, [r2, r3]	@ movhi
	ldr	r2, .L87
	mov	r3, #328
	mov	r1, #0
	strh	r1, [r2, r3]	@ movhi
	ldr	r2, .L87
	ldr	r3, .L87+76
	mov	r1, #0
	strh	r1, [r2, r3]	@ movhi
	ldr	r2, .L87
	mov	r3, #332
	mov	r1, #0
	strh	r1, [r2, r3]	@ movhi
	ldr	r2, .L87
	ldr	r3, .L87+80
	mov	r1, #1
	strh	r1, [r2, r3]	@ movhi
	ldr	r2, .L87
	mov	r3, #336
	mov	r1, #0
	strh	r1, [r2, r3]	@ movhi
	ldr	r2, .L87
	ldr	r3, .L87+84
	mov	r1, #0
	strh	r1, [r2, r3]	@ movhi
	ldr	r2, .L87
	mov	r3, #340
	mov	r1, #0
	strh	r1, [r2, r3]	@ movhi
	ldr	r2, .L87
	ldr	r3, .L87+88
	mov	r1, #0
	strh	r1, [r2, r3]	@ movhi
	ldr	r2, .L87
	mov	r3, #344
	mov	r1, #1
	strh	r1, [r2, r3]	@ movhi
	ldr	r2, .L87
	ldr	r3, .L87+92
	mov	r1, #0
	strh	r1, [r2, r3]	@ movhi
	ldr	r2, .L87
	mov	r3, #348
	mov	r1, #0
	strh	r1, [r2, r3]	@ movhi
	ldr	r2, .L87
	ldr	r3, .L87+96
	mov	r1, #0
	strh	r1, [r2, r3]	@ movhi
	ldr	r2, .L87
	mov	r3, #352
	mov	r1, #0
	strh	r1, [r2, r3]	@ movhi
	ldr	r2, .L87
	ldr	r3, .L87+100
	mov	r1, #0
	strh	r1, [r2, r3]	@ movhi
	ldr	r2, .L87
	mov	r3, #356
	mov	r1, #0
	strh	r1, [r2, r3]	@ movhi
	ldr	r2, .L87
	ldr	r3, .L87+104
	mov	r1, #1
	strh	r1, [r2, r3]	@ movhi
	ldr	r2, .L87
	mov	r3, #360
	mov	r1, #1
	strh	r1, [r2, r3]	@ movhi
	ldr	r2, .L87
	ldr	r3, .L87+108
	mov	r1, #0
	strh	r1, [r2, r3]	@ movhi
	ldr	r2, .L87
	mov	r3, #364
	mov	r1, #1
	strh	r1, [r2, r3]	@ movhi
	ldr	r2, .L87
	ldr	r3, .L87+112
	mov	r1, #0
	strh	r1, [r2, r3]	@ movhi
	ldr	r2, .L87
	mov	r3, #368
	mov	r1, #1
	strh	r1, [r2, r3]	@ movhi
	ldr	r2, .L87
	ldr	r3, .L87+116
	mov	r1, #0
	strh	r1, [r2, r3]	@ movhi
	ldr	r2, .L87
	mov	r3, #372
	mov	r1, #1
	strh	r1, [r2, r3]	@ movhi
	ldr	r2, .L87
	ldr	r3, .L87+120
	mov	r1, #0
	strh	r1, [r2, r3]	@ movhi
	ldr	r2, .L87
	mov	r3, #376
	mov	r1, #1
	strh	r1, [r2, r3]	@ movhi
	ldr	r2, .L87
	ldr	r3, .L87+124
	mov	r1, #0
	strh	r1, [r2, r3]	@ movhi
	ldr	r2, .L87
	mov	r3, #380
	mov	r1, #0
	strh	r1, [r2, r3]	@ movhi
	ldr	r2, .L87
	ldr	r3, .L87+128
	mov	r1, #0
	strh	r1, [r2, r3]	@ movhi
	ldr	r2, .L87
	mov	r3, #384
	mov	r1, #0
	strh	r1, [r2, r3]	@ movhi
	ldr	r2, .L87
	ldr	r3, .L87+132
	mov	r1, #0
	strh	r1, [r2, r3]	@ movhi
	ldr	r2, .L87
	mov	r3, #388
	mov	r1, #1
	strh	r1, [r2, r3]	@ movhi
	ldr	r2, .L87
	ldr	r3, .L87+136
	mov	r1, #1
	strh	r1, [r2, r3]	@ movhi
	ldr	r2, .L87
	mov	r3, #392
	mov	r1, #1
	strh	r1, [r2, r3]	@ movhi
	ldr	r2, .L87
	ldr	r3, .L87+140
	mov	r1, #1
	strh	r1, [r2, r3]	@ movhi
	ldr	r2, .L87
	mov	r3, #396
	mov	r1, #1
	strh	r1, [r2, r3]	@ movhi
	ldr	r2, .L87
	ldr	r3, .L87+144
	mov	r1, #1
	strh	r1, [r2, r3]	@ movhi
	ldr	r2, .L87
	mov	r3, #400
	mov	r1, #1
	strh	r1, [r2, r3]	@ movhi
	ldr	r2, .L87
	ldr	r3, .L87+148
	mov	r1, #0
	strh	r1, [r2, r3]	@ movhi
	ldr	r2, .L87
	mov	r3, #404
	mov	r1, #1
	strh	r1, [r2, r3]	@ movhi
	ldr	r2, .L87
	ldr	r3, .L87+152
	mov	r1, #1
	strh	r1, [r2, r3]	@ movhi
	ldr	r2, .L87
	mov	r3, #408
	mov	r1, #1
	strh	r1, [r2, r3]	@ movhi
	ldr	r2, .L87
	ldr	r3, .L87+156
	mov	r1, #1
	strh	r1, [r2, r3]	@ movhi
	ldr	r2, .L87
	mov	r3, #412
	mov	r1, #1
	strh	r1, [r2, r3]	@ movhi
	ldr	r2, .L87
	ldr	r3, .L87+160
	mov	r1, #1
	strh	r1, [r2, r3]	@ movhi
	ldr	r2, .L87
	mov	r3, #416
	mov	r1, #1
	strh	r1, [r2, r3]	@ movhi
	ldr	r2, .L87
	ldr	r3, .L87+164
	mov	r1, #1
	strh	r1, [r2, r3]	@ movhi
	ldr	r2, .L87
	mov	r3, #420
	mov	r1, #1
	strh	r1, [r2, r3]	@ movhi
	ldr	r2, .L87
	ldr	r3, .L87+168
	mov	r1, #0
	strh	r1, [r2, r3]	@ movhi
	ldr	r2, .L87
	mov	r3, #424
	mov	r1, #1
	strh	r1, [r2, r3]	@ movhi
	ldr	r2, .L87
	ldr	r3, .L87+172
	mov	r1, #0
	strh	r1, [r2, r3]	@ movhi
	ldr	r2, .L87
	mov	r3, #428
	mov	r1, #1
	strh	r1, [r2, r3]	@ movhi
	ldr	r2, .L87
	ldr	r3, .L87+176
	mov	r1, #0
	strh	r1, [r2, r3]	@ movhi
	ldr	r2, .L87
	mov	r3, #432
	mov	r1, #1
	strh	r1, [r2, r3]	@ movhi
	ldr	r2, .L87
	ldr	r3, .L87+180
	mov	r1, #0
	strh	r1, [r2, r3]	@ movhi
	ldr	r2, .L87
	mov	r3, #436
	mov	r1, #1
	strh	r1, [r2, r3]	@ movhi
	ldr	r2, .L87
	ldr	r3, .L87+184
	mov	r1, #0
	strh	r1, [r2, r3]	@ movhi
	ldr	r2, .L87
	mov	r3, #440
	mov	r1, #1
	strh	r1, [r2, r3]	@ movhi
	ldr	r2, .L87
	ldr	r3, .L87+188
	mov	r1, #1
	strh	r1, [r2, r3]	@ movhi
	ldr	r2, .L87
	mov	r3, #444
	mov	r1, #1
	strh	r1, [r2, r3]	@ movhi
	ldr	r2, .L87
	ldr	r3, .L87+192
	mov	r1, #1
	strh	r1, [r2, r3]	@ movhi
	ldr	r2, .L87
	mov	r3, #448
	mov	r1, #1
	strh	r1, [r2, r3]	@ movhi
	ldr	r2, .L87
	ldr	r3, .L87+196
	mov	r1, #0
	strh	r1, [r2, r3]	@ movhi
	ldr	r2, .L87
	mov	r3, #452
	mov	r1, #0
	strh	r1, [r2, r3]	@ movhi
	ldr	r2, .L87
	ldr	r3, .L87+200
	mov	r1, #0
	strh	r1, [r2, r3]	@ movhi
	ldr	r2, .L87
	mov	r3, #456
	mov	r1, #0
	strh	r1, [r2, r3]	@ movhi
	ldr	r2, .L87
	ldr	r3, .L87+204
	mov	r1, #0
	strh	r1, [r2, r3]	@ movhi
	ldr	r2, .L87
	mov	r3, #460
	mov	r1, #1
	strh	r1, [r2, r3]	@ movhi
	ldr	r2, .L87
	ldr	r3, .L87+208
	mov	r1, #0
	strh	r1, [r2, r3]	@ movhi
	ldr	r2, .L87
	mov	r3, #464
	mov	r1, #0
	strh	r1, [r2, r3]	@ movhi
	ldr	r2, .L87
	ldr	r3, .L87+212
	mov	r1, #0
	strh	r1, [r2, r3]	@ movhi
	ldr	r2, .L87
	mov	r3, #468
	mov	r1, #0
	strh	r1, [r2, r3]	@ movhi
	ldr	r2, .L87
	ldr	r3, .L87+216
	mov	r1, #0
	strh	r1, [r2, r3]	@ movhi
	ldr	r2, .L87
	mov	r3, #472
	mov	r1, #0
	strh	r1, [r2, r3]	@ movhi
	ldr	r2, .L87
	ldr	r3, .L87+220
	mov	r1, #0
	strh	r1, [r2, r3]	@ movhi
	ldr	r2, .L87
	mov	r3, #476
	mov	r1, #0
	strh	r1, [r2, r3]	@ movhi
	ldr	r2, .L87
	ldr	r3, .L87+224
	mov	r1, #1
	strh	r1, [r2, r3]	@ movhi
	ldr	r2, .L87
	mov	r3, #480
	mov	r1, #1
	strh	r1, [r2, r3]	@ movhi
	ldr	r2, .L87
	ldr	r3, .L87+228
	mov	r1, #0
	strh	r1, [r2, r3]	@ movhi
	ldr	r2, .L87
	mov	r3, #484
	mov	r1, #1
	strh	r1, [r2, r3]	@ movhi
	ldr	r2, .L87
	ldr	r3, .L87+232
	mov	r1, #0
	strh	r1, [r2, r3]	@ movhi
	ldr	r2, .L87
	mov	r3, #488
	mov	r1, #1
	strh	r1, [r2, r3]	@ movhi
	ldr	r2, .L87
	ldr	r3, .L87+236
	mov	r1, #0
	strh	r1, [r2, r3]	@ movhi
	ldr	r2, .L87
	mov	r3, #492
	mov	r1, #1
	strh	r1, [r2, r3]	@ movhi
	ldr	r2, .L87
	ldr	r3, .L87+240
	mov	r1, #0
	strh	r1, [r2, r3]	@ movhi
	ldr	r2, .L87
	mov	r3, #496
	mov	r1, #1
	strh	r1, [r2, r3]	@ movhi
	ldr	r2, .L87
	ldr	r3, .L87+244
	mov	r1, #0
	strh	r1, [r2, r3]	@ movhi
	ldr	r2, .L87
	mov	r3, #500
	mov	r1, #0
	strh	r1, [r2, r3]	@ movhi
	ldr	r2, .L87
	ldr	r3, .L87+248
	mov	r1, #0
	strh	r1, [r2, r3]	@ movhi
	ldr	r2, .L87
	mov	r3, #504
	mov	r1, #1
	strh	r1, [r2, r3]	@ movhi
	ldr	r2, .L87
	ldr	r3, .L87+252
	mov	r1, #0
	strh	r1, [r2, r3]	@ movhi
	ldr	r2, .L87
	mov	r3, #508
	mov	r1, #1
	strh	r1, [r2, r3]	@ movhi
	ldr	r2, .L87
	ldr	r3, .L87+256
	mov	r1, #0
	strh	r1, [r2, r3]	@ movhi
	ldr	r2, .L87
	mov	r3, #512
	mov	r1, #1
	strh	r1, [r2, r3]	@ movhi
	ldr	r2, .L87
	ldr	r3, .L87+260
	mov	r1, #1
	strh	r1, [r2, r3]	@ movhi
	ldr	r2, .L87
	mov	r3, #516
	mov	r1, #1
	strh	r1, [r2, r3]	@ movhi
	ldr	r2, .L87
	ldr	r3, .L87+264
	mov	r1, #1
	strh	r1, [r2, r3]	@ movhi
	ldr	r2, .L87
	mov	r3, #520
	mov	r1, #1
	strh	r1, [r2, r3]	@ movhi
	ldr	r2, .L87
	ldr	r3, .L87+268
	mov	r1, #1
	strh	r1, [r2, r3]	@ movhi
	ldr	r2, .L87
	mov	r3, #524
	mov	r1, #1
	strh	r1, [r2, r3]	@ movhi
	ldr	r2, .L87
	ldr	r3, .L87+272
	mov	r1, #1
	strh	r1, [r2, r3]	@ movhi
	ldr	r2, .L87
	mov	r3, #528
	mov	r1, #1
	strh	r1, [r2, r3]	@ movhi
	ldr	r2, .L87
	ldr	r3, .L87+276
	mov	r1, #1
	strh	r1, [r2, r3]	@ movhi
	ldr	r2, .L87
	mov	r3, #532
	mov	r1, #1
	strh	r1, [r2, r3]	@ movhi
	ldr	r2, .L87
	ldr	r3, .L87+280
	mov	r1, #1
	strh	r1, [r2, r3]	@ movhi
	ldr	r2, .L87
	mov	r3, #536
	mov	r1, #0
	strh	r1, [r2, r3]	@ movhi
	ldr	r2, .L87
	ldr	r3, .L87+284
	mov	r1, #1
	strh	r1, [r2, r3]	@ movhi
	ldr	r2, .L87
	mov	r3, #540
	mov	r1, #1
	strh	r1, [r2, r3]	@ movhi
	ldr	r2, .L87
	ldr	r3, .L87+288
	mov	r1, #0
	strh	r1, [r2, r3]	@ movhi
	ldr	r2, .L87
	mov	r3, #544
	mov	r1, #0
	strh	r1, [r2, r3]	@ movhi
	ldr	r2, .L87
	ldr	r3, .L87+292
	mov	r1, #0
	strh	r1, [r2, r3]	@ movhi
	ldr	r2, .L87
	mov	r3, #548
	mov	r1, #1
	strh	r1, [r2, r3]	@ movhi
	ldr	r2, .L87
	ldr	r3, .L87+296
	mov	r1, #0
	strh	r1, [r2, r3]	@ movhi
	ldr	r2, .L87
	mov	r3, #552
	mov	r1, #1
	strh	r1, [r2, r3]	@ movhi
	ldr	r2, .L87
	ldr	r3, .L87+300
	mov	r1, #0
	strh	r1, [r2, r3]	@ movhi
	ldr	r2, .L87
	mov	r3, #556
	mov	r1, #1
	strh	r1, [r2, r3]	@ movhi
	ldr	r2, .L87
	ldr	r3, .L87+304
	mov	r1, #1
	strh	r1, [r2, r3]	@ movhi
	ldr	r2, .L87
	mov	r3, #560
	mov	r1, #1
	strh	r1, [r2, r3]	@ movhi
	ldr	r2, .L87
	ldr	r3, .L87+308
	mov	r1, #0
	strh	r1, [r2, r3]	@ movhi
	ldr	r2, .L87
	mov	r3, #564
	mov	r1, #1
	strh	r1, [r2, r3]	@ movhi
	ldr	r2, .L87
	ldr	r3, .L87+312
	mov	r1, #0
	strh	r1, [r2, r3]	@ movhi
	ldr	r2, .L87
	mov	r3, #568
	mov	r1, #0
	strh	r1, [r2, r3]	@ movhi
	ldr	r2, .L87
	ldr	r3, .L87+316
	mov	r1, #0
	strh	r1, [r2, r3]	@ movhi
	ldr	r2, .L87
	mov	r3, #572
	mov	r1, #0
	strh	r1, [r2, r3]	@ movhi
	ldr	r2, .L87
	ldr	r3, .L87+320
	mov	r1, #0
	b	.L88
.L89:
	.align	2
.L87:
	.word	maze
	.word	258
	.word	262
	.word	266
	.word	270
	.word	274
	.word	278
	.word	282
	.word	286
	.word	290
	.word	294
	.word	298
	.word	302
	.word	306
	.word	310
	.word	314
	.word	318
	.word	322
	.word	326
	.word	330
	.word	334
	.word	338
	.word	342
	.word	346
	.word	350
	.word	354
	.word	358
	.word	362
	.word	366
	.word	370
	.word	374
	.word	378
	.word	382
	.word	386
	.word	390
	.word	394
	.word	398
	.word	402
	.word	406
	.word	410
	.word	414
	.word	418
	.word	422
	.word	426
	.word	430
	.word	434
	.word	438
	.word	442
	.word	446
	.word	450
	.word	454
	.word	458
	.word	462
	.word	466
	.word	470
	.word	474
	.word	478
	.word	482
	.word	486
	.word	490
	.word	494
	.word	498
	.word	502
	.word	506
	.word	510
	.word	514
	.word	518
	.word	522
	.word	526
	.word	530
	.word	534
	.word	538
	.word	542
	.word	546
	.word	550
	.word	554
	.word	558
	.word	562
	.word	566
	.word	570
	.word	574
	.word	578
	.word	582
	.word	586
	.word	590
	.word	594
	.word	598
	.word	602
	.word	606
	.word	610
	.word	614
	.word	618
	.word	622
	.word	626
	.word	630
	.word	634
	.word	638
	.word	642
	.word	646
	.word	650
	.word	654
	.word	658
	.word	662
	.word	666
	.word	670
	.word	674
	.word	678
	.word	682
	.word	686
	.word	690
	.word	694
	.word	698
	.word	702
	.word	706
	.word	710
	.word	714
	.word	718
	.word	722
	.word	726
	.word	730
	.word	734
	.word	738
	.word	742
	.word	746
	.word	750
	.word	754
	.word	758
	.word	762
	.word	766
	.word	770
	.word	774
	.word	778
	.word	782
	.word	786
	.word	790
	.word	794
	.word	798
	.word	802
	.word	806
	.word	810
	.word	814
	.word	818
	.word	822
	.word	826
	.word	830
	.word	834
	.word	838
	.word	842
	.word	846
	.word	850
	.word	854
	.word	858
	.word	862
	.word	866
	.word	870
	.word	874
	.word	878
	.word	882
	.word	886
	.word	890
	.word	894
	.word	898
	.word	902
	.word	906
	.word	910
	.word	914
	.word	918
	.word	922
	.word	926
	.word	930
	.word	934
	.word	938
	.word	942
	.word	946
	.word	950
	.word	954
	.word	958
	.word	962
	.word	966
	.word	970
	.word	974
	.word	978
	.word	982
	.word	986
	.word	990
	.word	994
	.word	998
	.word	1002
	.word	1006
	.word	1010
	.word	1014
	.word	1018
	.word	1022
	.word	1026
	.word	1028
	.word	1030
	.word	1032
	.word	1034
	.word	1036
	.word	1038
	.word	1042
	.word	1044
	.word	1046
	.word	1048
	.word	1050
	.word	1052
	.word	1054
	.word	1058
	.word	1060
	.word	1062
	.word	1064
	.word	1066
	.word	1068
	.word	1070
	.word	1074
	.word	1076
	.word	1078
	.word	1080
	.word	1082
	.word	maze
	.word	1084
.L88:
	strh	r1, [r2, r3]	@ movhi
	ldr	r2, .L87+876
	mov	r3, #576
	mov	r1, #0
	strh	r1, [r2, r3]	@ movhi
	ldr	r2, .L87+876
	ldr	r3, .L87+324
	mov	r1, #1
	strh	r1, [r2, r3]	@ movhi
	ldr	r2, .L87+876
	mov	r3, #580
	mov	r1, #0
	strh	r1, [r2, r3]	@ movhi
	ldr	r2, .L87+876
	ldr	r3, .L87+328
	mov	r1, #0
	strh	r1, [r2, r3]	@ movhi
	ldr	r2, .L87+876
	mov	r3, #584
	mov	r1, #0
	strh	r1, [r2, r3]	@ movhi
	ldr	r2, .L87+876
	ldr	r3, .L87+332
	mov	r1, #1
	strh	r1, [r2, r3]	@ movhi
	ldr	r2, .L87+876
	mov	r3, #588
	mov	r1, #0
	strh	r1, [r2, r3]	@ movhi
	ldr	r2, .L87+876
	ldr	r3, .L87+336
	mov	r1, #0
	strh	r1, [r2, r3]	@ movhi
	ldr	r2, .L87+876
	mov	r3, #592
	mov	r1, #0
	strh	r1, [r2, r3]	@ movhi
	ldr	r2, .L87+876
	ldr	r3, .L87+340
	mov	r1, #1
	strh	r1, [r2, r3]	@ movhi
	ldr	r2, .L87+876
	mov	r3, #596
	mov	r1, #0
	strh	r1, [r2, r3]	@ movhi
	ldr	r2, .L87+876
	ldr	r3, .L87+344
	mov	r1, #1
	strh	r1, [r2, r3]	@ movhi
	ldr	r2, .L87+876
	mov	r3, #600
	mov	r1, #1
	strh	r1, [r2, r3]	@ movhi
	ldr	r2, .L87+876
	ldr	r3, .L87+348
	mov	r1, #1
	strh	r1, [r2, r3]	@ movhi
	ldr	r2, .L87+876
	mov	r3, #604
	mov	r1, #1
	strh	r1, [r2, r3]	@ movhi
	ldr	r2, .L87+876
	ldr	r3, .L87+352
	mov	r1, #1
	strh	r1, [r2, r3]	@ movhi
	ldr	r2, .L87+876
	mov	r3, #608
	mov	r1, #1
	strh	r1, [r2, r3]	@ movhi
	ldr	r2, .L87+876
	ldr	r3, .L87+356
	mov	r1, #0
	strh	r1, [r2, r3]	@ movhi
	ldr	r2, .L87+876
	mov	r3, #612
	mov	r1, #1
	strh	r1, [r2, r3]	@ movhi
	ldr	r2, .L87+876
	ldr	r3, .L87+360
	mov	r1, #0
	strh	r1, [r2, r3]	@ movhi
	ldr	r2, .L87+876
	mov	r3, #616
	mov	r1, #1
	strh	r1, [r2, r3]	@ movhi
	ldr	r2, .L87+876
	ldr	r3, .L87+364
	mov	r1, #0
	strh	r1, [r2, r3]	@ movhi
	ldr	r2, .L87+876
	mov	r3, #620
	mov	r1, #1
	strh	r1, [r2, r3]	@ movhi
	ldr	r2, .L87+876
	ldr	r3, .L87+368
	mov	r1, #0
	strh	r1, [r2, r3]	@ movhi
	ldr	r2, .L87+876
	mov	r3, #624
	mov	r1, #1
	strh	r1, [r2, r3]	@ movhi
	ldr	r2, .L87+876
	ldr	r3, .L87+372
	mov	r1, #0
	strh	r1, [r2, r3]	@ movhi
	ldr	r2, .L87+876
	mov	r3, #628
	mov	r1, #1
	strh	r1, [r2, r3]	@ movhi
	ldr	r2, .L87+876
	ldr	r3, .L87+376
	mov	r1, #1
	strh	r1, [r2, r3]	@ movhi
	ldr	r2, .L87+876
	mov	r3, #632
	mov	r1, #1
	strh	r1, [r2, r3]	@ movhi
	ldr	r2, .L87+876
	ldr	r3, .L87+380
	mov	r1, #1
	strh	r1, [r2, r3]	@ movhi
	ldr	r2, .L87+876
	mov	r3, #636
	mov	r1, #0
	strh	r1, [r2, r3]	@ movhi
	ldr	r2, .L87+876
	ldr	r3, .L87+384
	mov	r1, #1
	strh	r1, [r2, r3]	@ movhi
	ldr	r2, .L87+876
	mov	r3, #640
	mov	r1, #0
	strh	r1, [r2, r3]	@ movhi
	ldr	r2, .L87+876
	ldr	r3, .L87+388
	mov	r1, #1
	strh	r1, [r2, r3]	@ movhi
	ldr	r2, .L87+876
	mov	r3, #644
	mov	r1, #0
	strh	r1, [r2, r3]	@ movhi
	ldr	r2, .L87+876
	ldr	r3, .L87+392
	mov	r1, #1
	strh	r1, [r2, r3]	@ movhi
	ldr	r2, .L87+876
	mov	r3, #648
	mov	r1, #0
	strh	r1, [r2, r3]	@ movhi
	ldr	r2, .L87+876
	ldr	r3, .L87+396
	mov	r1, #1
	strh	r1, [r2, r3]	@ movhi
	ldr	r2, .L87+876
	mov	r3, #652
	mov	r1, #0
	strh	r1, [r2, r3]	@ movhi
	ldr	r2, .L87+876
	ldr	r3, .L87+400
	mov	r1, #1
	strh	r1, [r2, r3]	@ movhi
	ldr	r2, .L87+876
	mov	r3, #656
	mov	r1, #0
	strh	r1, [r2, r3]	@ movhi
	ldr	r2, .L87+876
	ldr	r3, .L87+404
	mov	r1, #1
	strh	r1, [r2, r3]	@ movhi
	ldr	r2, .L87+876
	mov	r3, #660
	mov	r1, #1
	strh	r1, [r2, r3]	@ movhi
	ldr	r2, .L87+876
	ldr	r3, .L87+408
	mov	r1, #0
	strh	r1, [r2, r3]	@ movhi
	ldr	r2, .L87+876
	mov	r3, #664
	mov	r1, #0
	strh	r1, [r2, r3]	@ movhi
	ldr	r2, .L87+876
	ldr	r3, .L87+412
	mov	r1, #0
	strh	r1, [r2, r3]	@ movhi
	ldr	r2, .L87+876
	mov	r3, #668
	mov	r1, #0
	strh	r1, [r2, r3]	@ movhi
	ldr	r2, .L87+876
	ldr	r3, .L87+416
	mov	r1, #0
	strh	r1, [r2, r3]	@ movhi
	ldr	r2, .L87+876
	mov	r3, #672
	mov	r1, #1
	strh	r1, [r2, r3]	@ movhi
	ldr	r2, .L87+876
	ldr	r3, .L87+420
	mov	r1, #0
	strh	r1, [r2, r3]	@ movhi
	ldr	r2, .L87+876
	mov	r3, #676
	mov	r1, #1
	strh	r1, [r2, r3]	@ movhi
	ldr	r2, .L87+876
	ldr	r3, .L87+424
	mov	r1, #0
	strh	r1, [r2, r3]	@ movhi
	ldr	r2, .L87+876
	mov	r3, #680
	mov	r1, #0
	strh	r1, [r2, r3]	@ movhi
	ldr	r2, .L87+876
	ldr	r3, .L87+428
	mov	r1, #0
	strh	r1, [r2, r3]	@ movhi
	ldr	r2, .L87+876
	mov	r3, #684
	mov	r1, #1
	strh	r1, [r2, r3]	@ movhi
	ldr	r2, .L87+876
	ldr	r3, .L87+432
	mov	r1, #0
	strh	r1, [r2, r3]	@ movhi
	ldr	r2, .L87+876
	mov	r3, #688
	mov	r1, #0
	strh	r1, [r2, r3]	@ movhi
	ldr	r2, .L87+876
	ldr	r3, .L87+436
	mov	r1, #0
	strh	r1, [r2, r3]	@ movhi
	ldr	r2, .L87+876
	mov	r3, #692
	mov	r1, #0
	strh	r1, [r2, r3]	@ movhi
	ldr	r2, .L87+876
	ldr	r3, .L87+440
	mov	r1, #1
	strh	r1, [r2, r3]	@ movhi
	ldr	r2, .L87+876
	mov	r3, #696
	mov	r1, #1
	strh	r1, [r2, r3]	@ movhi
	ldr	r2, .L87+876
	ldr	r3, .L87+444
	mov	r1, #1
	strh	r1, [r2, r3]	@ movhi
	ldr	r2, .L87+876
	mov	r3, #700
	mov	r1, #0
	strh	r1, [r2, r3]	@ movhi
	ldr	r2, .L87+876
	ldr	r3, .L87+448
	mov	r1, #1
	strh	r1, [r2, r3]	@ movhi
	ldr	r2, .L87+876
	mov	r3, #704
	mov	r1, #0
	strh	r1, [r2, r3]	@ movhi
	ldr	r2, .L87+876
	ldr	r3, .L87+452
	mov	r1, #1
	strh	r1, [r2, r3]	@ movhi
	ldr	r2, .L87+876
	mov	r3, #708
	mov	r1, #0
	strh	r1, [r2, r3]	@ movhi
	ldr	r2, .L87+876
	ldr	r3, .L87+456
	mov	r1, #1
	strh	r1, [r2, r3]	@ movhi
	ldr	r2, .L87+876
	mov	r3, #712
	mov	r1, #0
	strh	r1, [r2, r3]	@ movhi
	ldr	r2, .L87+876
	ldr	r3, .L87+460
	mov	r1, #1
	strh	r1, [r2, r3]	@ movhi
	ldr	r2, .L87+876
	mov	r3, #716
	mov	r1, #0
	strh	r1, [r2, r3]	@ movhi
	ldr	r2, .L87+876
	ldr	r3, .L87+464
	mov	r1, #1
	strh	r1, [r2, r3]	@ movhi
	ldr	r2, .L87+876
	mov	r3, #720
	mov	r1, #1
	strh	r1, [r2, r3]	@ movhi
	ldr	r2, .L87+876
	ldr	r3, .L87+468
	mov	r1, #0
	strh	r1, [r2, r3]	@ movhi
	ldr	r2, .L87+876
	mov	r3, #724
	mov	r1, #1
	strh	r1, [r2, r3]	@ movhi
	ldr	r2, .L87+876
	ldr	r3, .L87+472
	mov	r1, #1
	strh	r1, [r2, r3]	@ movhi
	ldr	r2, .L87+876
	mov	r3, #728
	mov	r1, #1
	strh	r1, [r2, r3]	@ movhi
	ldr	r2, .L87+876
	ldr	r3, .L87+476
	mov	r1, #1
	strh	r1, [r2, r3]	@ movhi
	ldr	r2, .L87+876
	mov	r3, #732
	mov	r1, #1
	strh	r1, [r2, r3]	@ movhi
	ldr	r2, .L87+876
	ldr	r3, .L87+480
	mov	r1, #0
	strh	r1, [r2, r3]	@ movhi
	ldr	r2, .L87+876
	mov	r3, #736
	mov	r1, #1
	strh	r1, [r2, r3]	@ movhi
	ldr	r2, .L87+876
	ldr	r3, .L87+484
	mov	r1, #1
	strh	r1, [r2, r3]	@ movhi
	ldr	r2, .L87+876
	mov	r3, #740
	mov	r1, #1
	strh	r1, [r2, r3]	@ movhi
	ldr	r2, .L87+876
	ldr	r3, .L87+488
	mov	r1, #1
	strh	r1, [r2, r3]	@ movhi
	ldr	r2, .L87+876
	mov	r3, #744
	mov	r1, #1
	strh	r1, [r2, r3]	@ movhi
	ldr	r2, .L87+876
	ldr	r3, .L87+492
	mov	r1, #1
	strh	r1, [r2, r3]	@ movhi
	ldr	r2, .L87+876
	mov	r3, #748
	mov	r1, #1
	strh	r1, [r2, r3]	@ movhi
	ldr	r2, .L87+876
	ldr	r3, .L87+496
	mov	r1, #1
	strh	r1, [r2, r3]	@ movhi
	ldr	r2, .L87+876
	mov	r3, #752
	mov	r1, #0
	strh	r1, [r2, r3]	@ movhi
	ldr	r2, .L87+876
	ldr	r3, .L87+500
	mov	r1, #0
	strh	r1, [r2, r3]	@ movhi
	ldr	r2, .L87+876
	mov	r3, #756
	mov	r1, #0
	strh	r1, [r2, r3]	@ movhi
	ldr	r2, .L87+876
	ldr	r3, .L87+504
	mov	r1, #0
	strh	r1, [r2, r3]	@ movhi
	ldr	r2, .L87+876
	mov	r3, #760
	mov	r1, #0
	strh	r1, [r2, r3]	@ movhi
	ldr	r2, .L87+876
	ldr	r3, .L87+508
	mov	r1, #1
	strh	r1, [r2, r3]	@ movhi
	ldr	r2, .L87+876
	mov	r3, #764
	mov	r1, #0
	strh	r1, [r2, r3]	@ movhi
	ldr	r2, .L87+876
	ldr	r3, .L87+512
	mov	r1, #1
	strh	r1, [r2, r3]	@ movhi
	ldr	r2, .L87+876
	mov	r3, #768
	mov	r1, #0
	strh	r1, [r2, r3]	@ movhi
	ldr	r2, .L87+876
	ldr	r3, .L87+516
	mov	r1, #1
	strh	r1, [r2, r3]	@ movhi
	ldr	r2, .L87+876
	mov	r3, #772
	mov	r1, #0
	strh	r1, [r2, r3]	@ movhi
	ldr	r2, .L87+876
	ldr	r3, .L87+520
	mov	r1, #0
	strh	r1, [r2, r3]	@ movhi
	ldr	r2, .L87+876
	mov	r3, #776
	mov	r1, #0
	strh	r1, [r2, r3]	@ movhi
	ldr	r2, .L87+876
	ldr	r3, .L87+524
	mov	r1, #1
	strh	r1, [r2, r3]	@ movhi
	ldr	r2, .L87+876
	mov	r3, #780
	mov	r1, #1
	strh	r1, [r2, r3]	@ movhi
	ldr	r2, .L87+876
	ldr	r3, .L87+528
	mov	r1, #0
	strh	r1, [r2, r3]	@ movhi
	ldr	r2, .L87+876
	mov	r3, #784
	mov	r1, #0
	strh	r1, [r2, r3]	@ movhi
	ldr	r2, .L87+876
	ldr	r3, .L87+532
	mov	r1, #0
	strh	r1, [r2, r3]	@ movhi
	ldr	r2, .L87+876
	mov	r3, #788
	mov	r1, #0
	strh	r1, [r2, r3]	@ movhi
	ldr	r2, .L87+876
	ldr	r3, .L87+536
	mov	r1, #0
	strh	r1, [r2, r3]	@ movhi
	ldr	r2, .L87+876
	mov	r3, #792
	mov	r1, #1
	strh	r1, [r2, r3]	@ movhi
	ldr	r2, .L87+876
	ldr	r3, .L87+540
	mov	r1, #0
	strh	r1, [r2, r3]	@ movhi
	ldr	r2, .L87+876
	mov	r3, #796
	mov	r1, #1
	strh	r1, [r2, r3]	@ movhi
	ldr	r2, .L87+876
	ldr	r3, .L87+544
	mov	r1, #0
	strh	r1, [r2, r3]	@ movhi
	ldr	r2, .L87+876
	mov	r3, #800
	mov	r1, #0
	strh	r1, [r2, r3]	@ movhi
	ldr	r2, .L87+876
	ldr	r3, .L87+548
	mov	r1, #0
	strh	r1, [r2, r3]	@ movhi
	ldr	r2, .L87+876
	mov	r3, #804
	mov	r1, #0
	strh	r1, [r2, r3]	@ movhi
	ldr	r2, .L87+876
	ldr	r3, .L87+552
	mov	r1, #1
	strh	r1, [r2, r3]	@ movhi
	ldr	r2, .L87+876
	mov	r3, #808
	mov	r1, #0
	strh	r1, [r2, r3]	@ movhi
	ldr	r2, .L87+876
	ldr	r3, .L87+556
	mov	r1, #0
	strh	r1, [r2, r3]	@ movhi
	ldr	r2, .L87+876
	mov	r3, #812
	mov	r1, #0
	strh	r1, [r2, r3]	@ movhi
	ldr	r2, .L87+876
	ldr	r3, .L87+560
	mov	r1, #1
	strh	r1, [r2, r3]	@ movhi
	ldr	r2, .L87+876
	mov	r3, #816
	mov	r1, #1
	strh	r1, [r2, r3]	@ movhi
	ldr	r2, .L87+876
	ldr	r3, .L87+564
	mov	r1, #1
	strh	r1, [r2, r3]	@ movhi
	ldr	r2, .L87+876
	mov	r3, #820
	mov	r1, #1
	strh	r1, [r2, r3]	@ movhi
	ldr	r2, .L87+876
	ldr	r3, .L87+568
	mov	r1, #1
	strh	r1, [r2, r3]	@ movhi
	ldr	r2, .L87+876
	mov	r3, #824
	mov	r1, #0
	strh	r1, [r2, r3]	@ movhi
	ldr	r2, .L87+876
	ldr	r3, .L87+572
	mov	r1, #1
	strh	r1, [r2, r3]	@ movhi
	ldr	r2, .L87+876
	mov	r3, #828
	mov	r1, #0
	strh	r1, [r2, r3]	@ movhi
	ldr	r2, .L87+876
	ldr	r3, .L87+576
	mov	r1, #1
	strh	r1, [r2, r3]	@ movhi
	ldr	r2, .L87+876
	mov	r3, #832
	mov	r1, #1
	strh	r1, [r2, r3]	@ movhi
	ldr	r2, .L87+876
	ldr	r3, .L87+580
	mov	r1, #1
	strh	r1, [r2, r3]	@ movhi
	ldr	r2, .L87+876
	mov	r3, #836
	mov	r1, #1
	strh	r1, [r2, r3]	@ movhi
	ldr	r2, .L87+876
	ldr	r3, .L87+584
	mov	r1, #1
	strh	r1, [r2, r3]	@ movhi
	ldr	r2, .L87+876
	mov	r3, #840
	mov	r1, #1
	strh	r1, [r2, r3]	@ movhi
	ldr	r2, .L87+876
	ldr	r3, .L87+588
	mov	r1, #1
	strh	r1, [r2, r3]	@ movhi
	ldr	r2, .L87+876
	mov	r3, #844
	mov	r1, #1
	strh	r1, [r2, r3]	@ movhi
	ldr	r2, .L87+876
	ldr	r3, .L87+592
	mov	r1, #1
	strh	r1, [r2, r3]	@ movhi
	ldr	r2, .L87+876
	mov	r3, #848
	mov	r1, #1
	strh	r1, [r2, r3]	@ movhi
	ldr	r2, .L87+876
	ldr	r3, .L87+596
	mov	r1, #0
	strh	r1, [r2, r3]	@ movhi
	ldr	r2, .L87+876
	mov	r3, #852
	mov	r1, #0
	strh	r1, [r2, r3]	@ movhi
	ldr	r2, .L87+876
	ldr	r3, .L87+600
	mov	r1, #0
	strh	r1, [r2, r3]	@ movhi
	ldr	r2, .L87+876
	mov	r3, #856
	mov	r1, #1
	strh	r1, [r2, r3]	@ movhi
	ldr	r2, .L87+876
	ldr	r3, .L87+604
	mov	r1, #0
	strh	r1, [r2, r3]	@ movhi
	ldr	r2, .L87+876
	mov	r3, #860
	mov	r1, #1
	strh	r1, [r2, r3]	@ movhi
	ldr	r2, .L87+876
	ldr	r3, .L87+608
	mov	r1, #1
	strh	r1, [r2, r3]	@ movhi
	ldr	r2, .L87+876
	mov	r3, #864
	mov	r1, #0
	strh	r1, [r2, r3]	@ movhi
	ldr	r2, .L87+876
	ldr	r3, .L87+612
	mov	r1, #1
	strh	r1, [r2, r3]	@ movhi
	ldr	r2, .L87+876
	mov	r3, #868
	mov	r1, #0
	strh	r1, [r2, r3]	@ movhi
	ldr	r2, .L87+876
	ldr	r3, .L87+616
	mov	r1, #1
	strh	r1, [r2, r3]	@ movhi
	ldr	r2, .L87+876
	mov	r3, #872
	mov	r1, #1
	strh	r1, [r2, r3]	@ movhi
	ldr	r2, .L87+876
	ldr	r3, .L87+620
	mov	r1, #1
	strh	r1, [r2, r3]	@ movhi
	ldr	r2, .L87+876
	mov	r3, #876
	mov	r1, #0
	strh	r1, [r2, r3]	@ movhi
	ldr	r2, .L87+876
	ldr	r3, .L87+624
	mov	r1, #1
	strh	r1, [r2, r3]	@ movhi
	ldr	r2, .L87+876
	mov	r3, #880
	mov	r1, #0
	strh	r1, [r2, r3]	@ movhi
	ldr	r2, .L87+876
	ldr	r3, .L87+628
	mov	r1, #1
	strh	r1, [r2, r3]	@ movhi
	ldr	r2, .L87+876
	mov	r3, #884
	mov	r1, #0
	strh	r1, [r2, r3]	@ movhi
	ldr	r2, .L87+876
	ldr	r3, .L87+632
	mov	r1, #1
	strh	r1, [r2, r3]	@ movhi
	ldr	r2, .L87+876
	mov	r3, #888
	mov	r1, #0
	strh	r1, [r2, r3]	@ movhi
	ldr	r2, .L87+876
	ldr	r3, .L87+636
	mov	r1, #0
	strh	r1, [r2, r3]	@ movhi
	ldr	r2, .L87+876
	mov	r3, #892
	mov	r1, #0
	strh	r1, [r2, r3]	@ movhi
	ldr	r2, .L87+876
	ldr	r3, .L87+640
	mov	r1, #1
	strh	r1, [r2, r3]	@ movhi
	ldr	r2, .L87+876
	mov	r3, #896
	mov	r1, #0
	strh	r1, [r2, r3]	@ movhi
	ldr	r2, .L87+876
	ldr	r3, .L87+644
	mov	r1, #1
	strh	r1, [r2, r3]	@ movhi
	ldr	r2, .L87+876
	mov	r3, #900
	mov	r1, #1
	strh	r1, [r2, r3]	@ movhi
	ldr	r2, .L87+876
	ldr	r3, .L87+648
	mov	r1, #0
	strh	r1, [r2, r3]	@ movhi
	ldr	r2, .L87+876
	mov	r3, #904
	mov	r1, #0
	strh	r1, [r2, r3]	@ movhi
	ldr	r2, .L87+876
	ldr	r3, .L87+652
	mov	r1, #0
	strh	r1, [r2, r3]	@ movhi
	ldr	r2, .L87+876
	mov	r3, #908
	mov	r1, #1
	strh	r1, [r2, r3]	@ movhi
	ldr	r2, .L87+876
	ldr	r3, .L87+656
	mov	r1, #0
	strh	r1, [r2, r3]	@ movhi
	ldr	r2, .L87+876
	mov	r3, #912
	mov	r1, #1
	strh	r1, [r2, r3]	@ movhi
	ldr	r2, .L87+876
	ldr	r3, .L87+660
	mov	r1, #1
	strh	r1, [r2, r3]	@ movhi
	ldr	r2, .L87+876
	mov	r3, #916
	mov	r1, #1
	strh	r1, [r2, r3]	@ movhi
	ldr	r2, .L87+876
	ldr	r3, .L87+664
	mov	r1, #0
	strh	r1, [r2, r3]	@ movhi
	ldr	r2, .L87+876
	mov	r3, #920
	mov	r1, #0
	strh	r1, [r2, r3]	@ movhi
	ldr	r2, .L87+876
	ldr	r3, .L87+668
	mov	r1, #1
	strh	r1, [r2, r3]	@ movhi
	ldr	r2, .L87+876
	mov	r3, #924
	mov	r1, #0
	strh	r1, [r2, r3]	@ movhi
	ldr	r2, .L87+876
	ldr	r3, .L87+672
	mov	r1, #1
	strh	r1, [r2, r3]	@ movhi
	ldr	r2, .L87+876
	mov	r3, #928
	mov	r1, #0
	strh	r1, [r2, r3]	@ movhi
	ldr	r2, .L87+876
	ldr	r3, .L87+676
	mov	r1, #1
	strh	r1, [r2, r3]	@ movhi
	ldr	r2, .L87+876
	mov	r3, #932
	mov	r1, #0
	strh	r1, [r2, r3]	@ movhi
	ldr	r2, .L87+876
	ldr	r3, .L87+680
	mov	r1, #1
	strh	r1, [r2, r3]	@ movhi
	ldr	r2, .L87+876
	mov	r3, #936
	mov	r1, #0
	strh	r1, [r2, r3]	@ movhi
	ldr	r2, .L87+876
	ldr	r3, .L87+684
	mov	r1, #1
	strh	r1, [r2, r3]	@ movhi
	ldr	r2, .L87+876
	mov	r3, #940
	mov	r1, #0
	strh	r1, [r2, r3]	@ movhi
	ldr	r2, .L87+876
	ldr	r3, .L87+688
	mov	r1, #1
	strh	r1, [r2, r3]	@ movhi
	ldr	r2, .L87+876
	mov	r3, #944
	mov	r1, #0
	strh	r1, [r2, r3]	@ movhi
	ldr	r2, .L87+876
	ldr	r3, .L87+692
	mov	r1, #1
	strh	r1, [r2, r3]	@ movhi
	ldr	r2, .L87+876
	mov	r3, #948
	mov	r1, #1
	strh	r1, [r2, r3]	@ movhi
	ldr	r2, .L87+876
	ldr	r3, .L87+696
	mov	r1, #1
	strh	r1, [r2, r3]	@ movhi
	ldr	r2, .L87+876
	mov	r3, #952
	mov	r1, #0
	strh	r1, [r2, r3]	@ movhi
	ldr	r2, .L87+876
	ldr	r3, .L87+700
	mov	r1, #1
	strh	r1, [r2, r3]	@ movhi
	ldr	r2, .L87+876
	mov	r3, #956
	mov	r1, #0
	strh	r1, [r2, r3]	@ movhi
	ldr	r2, .L87+876
	ldr	r3, .L87+704
	mov	r1, #1
	strh	r1, [r2, r3]	@ movhi
	ldr	r2, .L87+876
	mov	r3, #960
	mov	r1, #1
	strh	r1, [r2, r3]	@ movhi
	ldr	r2, .L87+876
	ldr	r3, .L87+708
	mov	r1, #0
	strh	r1, [r2, r3]	@ movhi
	ldr	r2, .L87+876
	mov	r3, #964
	mov	r1, #1
	strh	r1, [r2, r3]	@ movhi
	ldr	r2, .L87+876
	ldr	r3, .L87+712
	mov	r1, #0
	strh	r1, [r2, r3]	@ movhi
	ldr	r2, .L87+876
	mov	r3, #968
	mov	r1, #1
	strh	r1, [r2, r3]	@ movhi
	ldr	r2, .L87+876
	ldr	r3, .L87+716
	mov	r1, #0
	strh	r1, [r2, r3]	@ movhi
	ldr	r2, .L87+876
	mov	r3, #972
	mov	r1, #1
	strh	r1, [r2, r3]	@ movhi
	ldr	r2, .L87+876
	ldr	r3, .L87+720
	mov	r1, #0
	strh	r1, [r2, r3]	@ movhi
	ldr	r2, .L87+876
	mov	r3, #976
	mov	r1, #0
	strh	r1, [r2, r3]	@ movhi
	ldr	r2, .L87+876
	ldr	r3, .L87+724
	mov	r1, #1
	strh	r1, [r2, r3]	@ movhi
	ldr	r2, .L87+876
	mov	r3, #980
	mov	r1, #0
	strh	r1, [r2, r3]	@ movhi
	ldr	r2, .L87+876
	ldr	r3, .L87+728
	mov	r1, #1
	strh	r1, [r2, r3]	@ movhi
	ldr	r2, .L87+876
	mov	r3, #984
	mov	r1, #0
	strh	r1, [r2, r3]	@ movhi
	ldr	r2, .L87+876
	ldr	r3, .L87+732
	mov	r1, #1
	strh	r1, [r2, r3]	@ movhi
	ldr	r2, .L87+876
	mov	r3, #988
	mov	r1, #0
	strh	r1, [r2, r3]	@ movhi
	ldr	r2, .L87+876
	ldr	r3, .L87+736
	mov	r1, #1
	strh	r1, [r2, r3]	@ movhi
	ldr	r2, .L87+876
	mov	r3, #992
	mov	r1, #0
	strh	r1, [r2, r3]	@ movhi
	ldr	r2, .L87+876
	ldr	r3, .L87+740
	mov	r1, #0
	strh	r1, [r2, r3]	@ movhi
	ldr	r2, .L87+876
	mov	r3, #996
	mov	r1, #0
	strh	r1, [r2, r3]	@ movhi
	ldr	r2, .L87+876
	ldr	r3, .L87+744
	mov	r1, #1
	strh	r1, [r2, r3]	@ movhi
	ldr	r2, .L87+876
	mov	r3, #1000
	mov	r1, #0
	strh	r1, [r2, r3]	@ movhi
	ldr	r2, .L87+876
	ldr	r3, .L87+748
	mov	r1, #1
	strh	r1, [r2, r3]	@ movhi
	ldr	r2, .L87+876
	mov	r3, #1004
	mov	r1, #0
	strh	r1, [r2, r3]	@ movhi
	ldr	r2, .L87+876
	ldr	r3, .L87+752
	mov	r1, #0
	strh	r1, [r2, r3]	@ movhi
	ldr	r2, .L87+876
	mov	r3, #1008
	mov	r1, #0
	strh	r1, [r2, r3]	@ movhi
	ldr	r2, .L87+876
	ldr	r3, .L87+756
	mov	r1, #0
	strh	r1, [r2, r3]	@ movhi
	ldr	r2, .L87+876
	mov	r3, #1012
	mov	r1, #0
	strh	r1, [r2, r3]	@ movhi
	ldr	r2, .L87+876
	ldr	r3, .L87+760
	mov	r1, #1
	strh	r1, [r2, r3]	@ movhi
	ldr	r2, .L87+876
	mov	r3, #1016
	mov	r1, #0
	strh	r1, [r2, r3]	@ movhi
	ldr	r2, .L87+876
	ldr	r3, .L87+764
	mov	r1, #1
	strh	r1, [r2, r3]	@ movhi
	ldr	r2, .L87+876
	mov	r3, #1020
	mov	r1, #1
	strh	r1, [r2, r3]	@ movhi
	ldr	r2, .L87+876
	ldr	r3, .L87+768
	mov	r1, #0
	strh	r1, [r2, r3]	@ movhi
	ldr	r2, .L87+876
	mov	r3, #1024
	mov	r1, #1
	strh	r1, [r2, r3]	@ movhi
	ldr	r2, .L87+876
	ldr	r3, .L87+772
	mov	r1, #0
	strh	r1, [r2, r3]	@ movhi
	ldr	r2, .L87+876
	ldr	r3, .L87+776
	mov	r1, #1
	strh	r1, [r2, r3]	@ movhi
	ldr	r2, .L87+876
	ldr	r3, .L87+780
	mov	r1, #1
	strh	r1, [r2, r3]	@ movhi
	ldr	r2, .L87+876
	ldr	r3, .L87+784
	mov	r1, #1
	strh	r1, [r2, r3]	@ movhi
	ldr	r2, .L87+876
	ldr	r3, .L87+788
	mov	r1, #1
	strh	r1, [r2, r3]	@ movhi
	ldr	r2, .L87+876
	ldr	r3, .L87+792
	mov	r1, #0
	strh	r1, [r2, r3]	@ movhi
	ldr	r2, .L87+876
	ldr	r3, .L87+796
	mov	r1, #1
	strh	r1, [r2, r3]	@ movhi
	ldr	r2, .L87+876
	mov	r3, #1040
	mov	r1, #0
	strh	r1, [r2, r3]	@ movhi
	ldr	r2, .L87+876
	ldr	r3, .L87+800
	mov	r1, #1
	strh	r1, [r2, r3]	@ movhi
	ldr	r2, .L87+876
	ldr	r3, .L87+804
	mov	r1, #1
	strh	r1, [r2, r3]	@ movhi
	ldr	r2, .L87+876
	ldr	r3, .L87+808
	mov	r1, #1
	strh	r1, [r2, r3]	@ movhi
	ldr	r2, .L87+876
	ldr	r3, .L87+812
	mov	r1, #1
	strh	r1, [r2, r3]	@ movhi
	ldr	r2, .L87+876
	ldr	r3, .L87+816
	mov	r1, #1
	strh	r1, [r2, r3]	@ movhi
	ldr	r2, .L87+876
	ldr	r3, .L87+820
	mov	r1, #1
	strh	r1, [r2, r3]	@ movhi
	ldr	r2, .L87+876
	ldr	r3, .L87+824
	mov	r1, #1
	strh	r1, [r2, r3]	@ movhi
	ldr	r2, .L87+876
	mov	r3, #1056
	mov	r1, #0
	strh	r1, [r2, r3]	@ movhi
	ldr	r2, .L87+876
	ldr	r3, .L87+828
	mov	r1, #1
	strh	r1, [r2, r3]	@ movhi
	ldr	r2, .L87+876
	ldr	r3, .L87+832
	mov	r1, #0
	strh	r1, [r2, r3]	@ movhi
	ldr	r2, .L87+876
	ldr	r3, .L87+836
	mov	r1, #1
	strh	r1, [r2, r3]	@ movhi
	ldr	r2, .L87+876
	ldr	r3, .L87+840
	mov	r1, #1
	strh	r1, [r2, r3]	@ movhi
	ldr	r2, .L87+876
	ldr	r3, .L87+844
	mov	r1, #1
	strh	r1, [r2, r3]	@ movhi
	ldr	r2, .L87+876
	ldr	r3, .L87+848
	mov	r1, #1
	strh	r1, [r2, r3]	@ movhi
	ldr	r2, .L87+876
	ldr	r3, .L87+852
	mov	r1, #1
	strh	r1, [r2, r3]	@ movhi
	ldr	r2, .L87+876
	mov	r3, #1072
	mov	r1, #0
	strh	r1, [r2, r3]	@ movhi
	ldr	r2, .L87+876
	ldr	r3, .L87+856
	mov	r1, #1
	strh	r1, [r2, r3]	@ movhi
	ldr	r2, .L87+876
	ldr	r3, .L87+860
	mov	r1, #0
	strh	r1, [r2, r3]	@ movhi
	ldr	r2, .L87+876
	ldr	r3, .L87+864
	mov	r1, #1
	strh	r1, [r2, r3]	@ movhi
	ldr	r2, .L87+876
	ldr	r3, .L87+868
	mov	r1, #1
	strh	r1, [r2, r3]	@ movhi
	ldr	r2, .L87+876
	ldr	r3, .L87+872
	mov	r1, #0
	strh	r1, [r2, r3]	@ movhi
	ldr	r2, .L87+876
	ldr	r3, .L87+880
	mov	r1, #1
	strh	r1, [r2, r3]	@ movhi
	ldr	r2, .L90
	ldr	r3, .L90+4
	mov	r1, #0
	strh	r1, [r2, r3]	@ movhi
	ldr	r2, .L90
	mov	r3, #1088
	mov	r1, #0
	strh	r1, [r2, r3]	@ movhi
	ldr	r2, .L90
	ldr	r3, .L90+8
	mov	r1, #0
	strh	r1, [r2, r3]	@ movhi
	ldr	r2, .L90
	ldr	r3, .L90+12
	mov	r1, #0
	strh	r1, [r2, r3]	@ movhi
	ldr	r2, .L90
	ldr	r3, .L90+16
	mov	r1, #1
	strh	r1, [r2, r3]	@ movhi
	ldr	r2, .L90
	ldr	r3, .L90+20
	mov	r1, #0
	strh	r1, [r2, r3]	@ movhi
	ldr	r2, .L90
	ldr	r3, .L90+24
	mov	r1, #0
	strh	r1, [r2, r3]	@ movhi
	ldr	r2, .L90
	ldr	r3, .L90+28
	mov	r1, #0
	strh	r1, [r2, r3]	@ movhi
	ldr	r2, .L90
	ldr	r3, .L90+32
	mov	r1, #0
	strh	r1, [r2, r3]	@ movhi
	ldr	r2, .L90
	mov	r3, #1104
	mov	r1, #0
	strh	r1, [r2, r3]	@ movhi
	ldr	r2, .L90
	ldr	r3, .L90+36
	mov	r1, #0
	strh	r1, [r2, r3]	@ movhi
	ldr	r2, .L90
	ldr	r3, .L90+40
	mov	r1, #0
	strh	r1, [r2, r3]	@ movhi
	ldr	r2, .L90
	ldr	r3, .L90+44
	mov	r1, #0
	strh	r1, [r2, r3]	@ movhi
	ldr	r2, .L90
	ldr	r3, .L90+48
	mov	r1, #0
	strh	r1, [r2, r3]	@ movhi
	ldr	r2, .L90
	ldr	r3, .L90+52
	mov	r1, #1
	strh	r1, [r2, r3]	@ movhi
	ldr	r2, .L90
	ldr	r3, .L90+56
	mov	r1, #0
	strh	r1, [r2, r3]	@ movhi
	ldr	r2, .L90
	ldr	r3, .L90+60
	mov	r1, #0
	strh	r1, [r2, r3]	@ movhi
	ldr	r2, .L90
	mov	r3, #1120
	mov	r1, #0
	strh	r1, [r2, r3]	@ movhi
	ldr	r2, .L90
	ldr	r3, .L90+64
	mov	r1, #0
	strh	r1, [r2, r3]	@ movhi
	ldr	r2, .L90
	ldr	r3, .L90+68
	mov	r1, #0
	strh	r1, [r2, r3]	@ movhi
	ldr	r2, .L90
	ldr	r3, .L90+72
	mov	r1, #0
	strh	r1, [r2, r3]	@ movhi
	ldr	r2, .L90
	ldr	r3, .L90+76
	mov	r1, #0
	strh	r1, [r2, r3]	@ movhi
	ldr	r2, .L90
	ldr	r3, .L90+80
	mov	r1, #0
	strh	r1, [r2, r3]	@ movhi
	ldr	r2, .L90
	ldr	r3, .L90+84
	mov	r1, #0
	strh	r1, [r2, r3]	@ movhi
	ldr	r2, .L90
	ldr	r3, .L90+88
	mov	r1, #1
	strh	r1, [r2, r3]	@ movhi
	ldr	r2, .L90
	mov	r3, #1136
	mov	r1, #0
	strh	r1, [r2, r3]	@ movhi
	ldr	r2, .L90
	ldr	r3, .L90+92
	mov	r1, #1
	strh	r1, [r2, r3]	@ movhi
	ldr	r2, .L90
	ldr	r3, .L90+96
	mov	r1, #1
	strh	r1, [r2, r3]	@ movhi
	ldr	r2, .L90
	ldr	r3, .L90+100
	mov	r1, #1
	strh	r1, [r2, r3]	@ movhi
	ldr	r2, .L90
	ldr	r3, .L90+104
	mov	r1, #1
	strh	r1, [r2, r3]	@ movhi
	ldr	r2, .L90
	ldr	r3, .L90+108
	mov	r1, #1
	strh	r1, [r2, r3]	@ movhi
	ldr	r2, .L90
	ldr	r3, .L90+112
	mov	r1, #1
	strh	r1, [r2, r3]	@ movhi
	ldr	r2, .L90
	ldr	r3, .L90+116
	mov	r1, #1
	strh	r1, [r2, r3]	@ movhi
	ldr	r2, .L90
	mov	r3, #1152
	mov	r1, #1
	strh	r1, [r2, r3]	@ movhi
	ldr	r2, .L90
	ldr	r3, .L90+120
	mov	r1, #1
	strh	r1, [r2, r3]	@ movhi
	ldr	r2, .L90
	ldr	r3, .L90+124
	mov	r1, #1
	strh	r1, [r2, r3]	@ movhi
	ldr	r2, .L90
	ldr	r3, .L90+128
	mov	r1, #1
	strh	r1, [r2, r3]	@ movhi
	ldr	r2, .L90
	ldr	r3, .L90+132
	mov	r1, #1
	strh	r1, [r2, r3]	@ movhi
	ldr	r2, .L90
	ldr	r3, .L90+136
	mov	r1, #1
	strh	r1, [r2, r3]	@ movhi
	ldr	r2, .L90
	ldr	r3, .L90+140
	mov	r1, #1
	strh	r1, [r2, r3]	@ movhi
	ldr	r2, .L90
	ldr	r3, .L90+144
	mov	r1, #1
	strh	r1, [r2, r3]	@ movhi
	ldr	r2, .L90
	mov	r3, #1168
	mov	r1, #1
	strh	r1, [r2, r3]	@ movhi
	ldr	r2, .L90
	ldr	r3, .L90+148
	mov	r1, #1
	strh	r1, [r2, r3]	@ movhi
	ldr	r2, .L90
	ldr	r3, .L90+152
	mov	r1, #1
	strh	r1, [r2, r3]	@ movhi
	ldr	r2, .L90
	ldr	r3, .L90+156
	mov	r1, #1
	strh	r1, [r2, r3]	@ movhi
	ldr	r2, .L90
	ldr	r3, .L90+160
	mov	r1, #1
	strh	r1, [r2, r3]	@ movhi
	ldr	r2, .L90
	ldr	r3, .L90+164
	mov	r1, #1
	strh	r1, [r2, r3]	@ movhi
	ldr	r2, .L90
	ldr	r3, .L90+168
	mov	r1, #1
	strh	r1, [r2, r3]	@ movhi
	ldr	r2, .L90
	ldr	r3, .L90+172
	mov	r1, #1
	strh	r1, [r2, r3]	@ movhi
	ldr	r2, .L90
	mov	r3, #1184
	mov	r1, #1
	strh	r1, [r2, r3]	@ movhi
	ldr	r2, .L90
	ldr	r3, .L90+176
	mov	r1, #1
	strh	r1, [r2, r3]	@ movhi
	ldr	r2, .L90
	ldr	r3, .L90+180
	mov	r1, #1
	strh	r1, [r2, r3]	@ movhi
	ldr	r2, .L90
	ldr	r3, .L90+184
	mov	r1, #1
	strh	r1, [r2, r3]	@ movhi
	ldr	r2, .L90
	ldr	r3, .L90+188
	mov	r1, #1
	strh	r1, [r2, r3]	@ movhi
	ldr	r2, .L90
	ldr	r3, .L90+192
	mov	r1, #1
	strh	r1, [r2, r3]	@ movhi
	ldr	r2, .L90
	ldr	r3, .L90+196
	mov	r1, #1
	strh	r1, [r2, r3]	@ movhi
	ldr	r2, .L90
	ldr	r3, .L90+200
	mov	r1, #1
	strh	r1, [r2, r3]	@ movhi
	mov	r3, #0
	str	r3, [fp, #-12]
	b	.L82
.L86:
	mov	r3, #0
	str	r3, [fp, #-8]
	b	.L83
.L85:
	ldr	r1, .L90
	ldr	r2, [fp, #-12]
	mov	r3, r2
	mov	r3, r3, asl #4
	rsb	r3, r2, r3
	mov	r3, r3, asl #1
	ldr	r2, [fp, #-8]
	add	r3, r3, r2
	mov	r3, r3, asl #1
	add	r3, r1, r3
	ldrh	r3, [r3]	@ movhi
	mov	r3, r3, asl #16
	mov	r3, r3, lsr #16
	cmp	r3, #1
	bne	.L84
	ldr	r3, [fp, #-8]
	mov	r3, r3, asl #16
	mov	r1, r3, lsr #16
	ldr	r3, [fp, #-12]
	mov	r3, r3, asl #16
	mov	r2, r3, lsr #16
	ldrh	r3, [fp, #-14]	@ movhi
	mov	r3, r3, asl #16
	mov	r3, r3, lsr #16
	mov	r0, r1
	mov	r1, r2
	mov	r2, r3
	bl	draw_block
.L84:
	ldr	r3, [fp, #-8]
	add	r3, r3, #1
	str	r3, [fp, #-8]
.L83:
	ldr	r3, [fp, #-8]
	cmp	r3, #29
	ble	.L85
	ldr	r3, [fp, #-12]
	add	r3, r3, #1
	str	r3, [fp, #-12]
.L82:
	ldr	r3, [fp, #-12]
	cmp	r3, #19
	ble	.L86
	sub	sp, fp, #4
	@ sp needed
	ldmfd	sp!, {fp, lr}
	bx	lr
.L91:
	.align	2
.L90:
	.word	maze
	.word	1086
	.word	1090
	.word	1092
	.word	1094
	.word	1096
	.word	1098
	.word	1100
	.word	1102
	.word	1106
	.word	1108
	.word	1110
	.word	1112
	.word	1114
	.word	1116
	.word	1118
	.word	1122
	.word	1124
	.word	1126
	.word	1128
	.word	1130
	.word	1132
	.word	1134
	.word	1138
	.word	1140
	.word	1142
	.word	1144
	.word	1146
	.word	1148
	.word	1150
	.word	1154
	.word	1156
	.word	1158
	.word	1160
	.word	1162
	.word	1164
	.word	1166
	.word	1170
	.word	1172
	.word	1174
	.word	1176
	.word	1178
	.word	1180
	.word	1182
	.word	1186
	.word	1188
	.word	1190
	.word	1192
	.word	1194
	.word	1196
	.word	1198
	.size	draw_wall, .-draw_wall
	.align	2
	.global	draw_bg
	.type	draw_bg, %function
draw_bg:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 16
	@ frame_needed = 1, uses_anonymous_args = 0
	@ link register save eliminated.
	str	fp, [sp, #-4]!
	add	fp, sp, #0
	sub	sp, sp, #20
	mov	r3, r0
	strh	r3, [fp, #-14]	@ movhi
	mov	r3, #100663296
	str	r3, [fp, #-8]
	mov	r3, #0
	str	r3, [fp, #-12]
	b	.L93
.L94:
	ldrh	r3, [fp, #-14]	@ movhi
	mov	r3, r3, asl #16
	mov	r2, r3, lsr #16
	ldr	r3, [fp, #-8]
	strh	r2, [r3]	@ movhi
	ldr	r3, [fp, #-8]
	add	r3, r3, #2
	str	r3, [fp, #-8]
	ldr	r3, [fp, #-12]
	add	r3, r3, #1
	str	r3, [fp, #-12]
.L93:
	ldr	r3, [fp, #-12]
	cmp	r3, #38400
	blt	.L94
	sub	sp, fp, #0
	@ sp needed
	ldr	fp, [sp], #4
	bx	lr
	.size	draw_bg, .-draw_bg
	.align	2
	.global	draw_title
	.type	draw_title, %function
draw_title:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 1, uses_anonymous_args = 0
	stmfd	sp!, {fp, lr}
	add	fp, sp, #4
	mov	r0, #0
	bl	draw_bg
	mov	r0, #98
	mov	r1, #15
	ldr	r2, .L96
	bl	draw_point2
	mov	r0, #98
	mov	r1, #16
	ldr	r2, .L96
	bl	draw_point2
	mov	r0, #98
	mov	r1, #17
	ldr	r2, .L96
	bl	draw_point2
	mov	r0, #98
	mov	r1, #18
	ldr	r2, .L96
	bl	draw_point2
	mov	r0, #104
	mov	r1, #18
	ldr	r2, .L96+8
	bl	draw_point2
	mov	r0, #105
	mov	r1, #18
	ldr	r2, .L96+8
	bl	draw_point2
	mov	r0, #98
	mov	r1, #19
	ldr	r2, .L96
	bl	draw_point2
	mov	r0, #102
	mov	r1, #19
	ldr	r2, .L96+8
	bl	draw_point2
	mov	r0, #103
	mov	r1, #19
	ldr	r2, .L96+8
	bl	draw_point2
	mov	r0, #104
	mov	r1, #19
	ldr	r2, .L96+8
	bl	draw_point2
	mov	r0, #105
	mov	r1, #19
	ldr	r2, .L96+8
	bl	draw_point2
	mov	r0, #106
	mov	r1, #19
	ldr	r2, .L96+8
	bl	draw_point2
	mov	r0, #107
	mov	r1, #19
	ldr	r2, .L96+8
	bl	draw_point2
	mov	r0, #98
	mov	r1, #20
	ldr	r2, .L96
	bl	draw_point2
	mov	r0, #102
	mov	r1, #20
	ldr	r2, .L96+8
	bl	draw_point2
	mov	r0, #103
	mov	r1, #20
	ldr	r2, .L96+8
	bl	draw_point2
	mov	r0, #104
	mov	r1, #20
	ldr	r2, .L96+8
	bl	draw_point2
	mov	r0, #105
	mov	r1, #20
	ldr	r2, .L96+8
	bl	draw_point2
	mov	r0, #106
	mov	r1, #20
	ldr	r2, .L96+8
	bl	draw_point2
	mov	r0, #107
	mov	r1, #20
	ldr	r2, .L96+8
	bl	draw_point2
	mov	r0, #98
	mov	r1, #21
	ldr	r2, .L96
	bl	draw_point2
	mov	r0, #101
	mov	r1, #21
	ldr	r2, .L96+8
	bl	draw_point2
	mov	r0, #102
	mov	r1, #21
	ldr	r2, .L96+8
	bl	draw_point2
	mov	r0, #103
	mov	r1, #21
	ldr	r2, .L96+8
	bl	draw_point2
	mov	r0, #104
	mov	r1, #21
	ldr	r2, .L96+8
	bl	draw_point2
	mov	r0, #105
	mov	r1, #21
	ldr	r2, .L96+8
	bl	draw_point2
	mov	r0, #106
	mov	r1, #21
	ldr	r2, .L96+8
	bl	draw_point2
	mov	r0, #107
	mov	r1, #21
	ldr	r2, .L96+8
	bl	draw_point2
	mov	r0, #108
	mov	r1, #21
	ldr	r2, .L96+8
	bl	draw_point2
	mov	r0, #98
	mov	r1, #22
	ldr	r2, .L96
	bl	draw_point2
	mov	r0, #101
	mov	r1, #22
	ldr	r2, .L96+8
	bl	draw_point2
	mov	r0, #102
	mov	r1, #22
	ldr	r2, .L96+8
	bl	draw_point2
	mov	r0, #103
	mov	r1, #22
	ldr	r2, .L96+8
	bl	draw_point2
	mov	r0, #104
	mov	r1, #22
	ldr	r2, .L96+8
	bl	draw_point2
	mov	r0, #105
	mov	r1, #22
	ldr	r2, .L96+8
	bl	draw_point2
	mov	r0, #106
	mov	r1, #22
	ldr	r2, .L96+8
	bl	draw_point2
	mov	r0, #107
	mov	r1, #22
	ldr	r2, .L96+8
	bl	draw_point2
	mov	r0, #108
	mov	r1, #22
	ldr	r2, .L96+8
	bl	draw_point2
	mov	r0, #98
	mov	r1, #23
	ldr	r2, .L96
	bl	draw_point2
	mov	r0, #102
	mov	r1, #23
	ldr	r2, .L96+8
	bl	draw_point2
	mov	r0, #103
	mov	r1, #23
	ldr	r2, .L96+8
	bl	draw_point2
	mov	r0, #104
	mov	r1, #23
	ldr	r2, .L96+8
	bl	draw_point2
	mov	r0, #105
	mov	r1, #23
	ldr	r2, .L96+8
	bl	draw_point2
	mov	r0, #106
	mov	r1, #23
	ldr	r2, .L96+8
	bl	draw_point2
	mov	r0, #107
	mov	r1, #23
	ldr	r2, .L96+8
	bl	draw_point2
	mov	r0, #98
	mov	r1, #24
	ldr	r2, .L96
	bl	draw_point2
	mov	r0, #99
	mov	r1, #24
	ldr	r2, .L96+8
	bl	draw_point2
	mov	r0, #102
	mov	r1, #24
	ldr	r2, .L96+8
	bl	draw_point2
	mov	r0, #103
	mov	r1, #24
	ldr	r2, .L96+8
	bl	draw_point2
	mov	r0, #104
	mov	r1, #24
	ldr	r2, .L96+8
	bl	draw_point2
	mov	r0, #105
	mov	r1, #24
	ldr	r2, .L96+8
	bl	draw_point2
	mov	r0, #106
	mov	r1, #24
	ldr	r2, .L96+8
	bl	draw_point2
	mov	r0, #107
	mov	r1, #24
	ldr	r2, .L96+8
	bl	draw_point2
	mov	r0, #13
	mov	r1, #25
	ldr	r2, .L96+8
	bl	draw_point2
	mov	r0, #14
	mov	r1, #25
	ldr	r2, .L96+8
	bl	draw_point2
	mov	r0, #15
	mov	r1, #25
	ldr	r2, .L96+8
	bl	draw_point2
	mov	r0, #16
	mov	r1, #25
	ldr	r2, .L96+8
	bl	draw_point2
	mov	r0, #17
	mov	r1, #25
	ldr	r2, .L96+8
	bl	draw_point2
	mov	r0, #18
	mov	r1, #25
	ldr	r2, .L96+8
	bl	draw_point2
	mov	r0, #19
	mov	r1, #25
	ldr	r2, .L96+8
	bl	draw_point2
	mov	r0, #20
	mov	r1, #25
	ldr	r2, .L96+8
	bl	draw_point2
	mov	r0, #30
	mov	r1, #25
	mov	r2, #31744
	bl	draw_point2
	mov	r0, #31
	mov	r1, #25
	mov	r2, #31744
	bl	draw_point2
	mov	r0, #32
	mov	r1, #25
	mov	r2, #31744
	bl	draw_point2
	mov	r0, #33
	mov	r1, #25
	mov	r2, #31744
	bl	draw_point2
	mov	r0, #42
	mov	r1, #25
	ldr	r2, .L96+8
	bl	draw_point2
	mov	r0, #43
	mov	r1, #25
	ldr	r2, .L96+8
	bl	draw_point2
	mov	r0, #44
	mov	r1, #25
	ldr	r2, .L96+8
	bl	draw_point2
	mov	r0, #45
	mov	r1, #25
	ldr	r2, .L96+8
	bl	draw_point2
	mov	r0, #46
	mov	r1, #25
	ldr	r2, .L96+8
	bl	draw_point2
	mov	r0, #47
	mov	r1, #25
	ldr	r2, .L96+8
	bl	draw_point2
	mov	r0, #48
	mov	r1, #25
	ldr	r2, .L96+8
	bl	draw_point2
	mov	r0, #49
	mov	r1, #25
	ldr	r2, .L96+8
	bl	draw_point2
	mov	r0, #56
	mov	r1, #25
	ldr	r2, .L96+8
	bl	draw_point2
	mov	r0, #57
	mov	r1, #25
	ldr	r2, .L96+8
	bl	draw_point2
	mov	r0, #58
	mov	r1, #25
	ldr	r2, .L96+8
	bl	draw_point2
	mov	r0, #59
	mov	r1, #25
	ldr	r2, .L96+8
	bl	draw_point2
	mov	r0, #60
	mov	r1, #25
	ldr	r2, .L96+8
	bl	draw_point2
	mov	r0, #61
	mov	r1, #25
	ldr	r2, .L96+8
	bl	draw_point2
	mov	r0, #62
	mov	r1, #25
	ldr	r2, .L96+8
	bl	draw_point2
	mov	r0, #63
	mov	r1, #25
	ldr	r2, .L96+8
	bl	draw_point2
	mov	r0, #64
	mov	r1, #25
	ldr	r2, .L96+8
	bl	draw_point2
	mov	r0, #65
	mov	r1, #25
	ldr	r2, .L96+8
	bl	draw_point2
	mov	r0, #73
	mov	r1, #25
	ldr	r2, .L96+8
	bl	draw_point2
	mov	r0, #82
	mov	r1, #25
	ldr	r2, .L96+8
	bl	draw_point2
	mov	r0, #83
	mov	r1, #25
	ldr	r2, .L96+8
	bl	draw_point2
	mov	r0, #98
	mov	r1, #25
	ldr	r2, .L96
	bl	draw_point2
	mov	r0, #99
	mov	r1, #25
	ldr	r2, .L96+8
	bl	draw_point2
	mov	r0, #100
	mov	r1, #25
	ldr	r2, .L96+8
	bl	draw_point2
	mov	r0, #104
	mov	r1, #25
	ldr	r2, .L96+8
	bl	draw_point2
	mov	r0, #105
	mov	r1, #25
	ldr	r2, .L96+8
	bl	draw_point2
	mov	r0, #13
	mov	r1, #26
	ldr	r2, .L96+8
	bl	draw_point2
	mov	r0, #14
	mov	r1, #26
	ldr	r2, .L96+8
	bl	draw_point2
	mov	r0, #15
	mov	r1, #26
	ldr	r2, .L96+8
	bl	draw_point2
	mov	r0, #16
	mov	r1, #26
	ldr	r2, .L96+8
	bl	draw_point2
	mov	r0, #17
	mov	r1, #26
	ldr	r2, .L96+8
	bl	draw_point2
	mov	r0, #18
	mov	r1, #26
	ldr	r2, .L96+8
	bl	draw_point2
	mov	r0, #19
	mov	r1, #26
	ldr	r2, .L96+8
	bl	draw_point2
	mov	r0, #20
	mov	r1, #26
	ldr	r2, .L96+8
	bl	draw_point2
	mov	r0, #21
	mov	r1, #26
	ldr	r2, .L96+8
	bl	draw_point2
	mov	r0, #28
	mov	r1, #26
	mov	r2, #31744
	bl	draw_point2
	mov	r0, #29
	mov	r1, #26
	mov	r2, #31744
	bl	draw_point2
	mov	r0, #30
	mov	r1, #26
	mov	r2, #31744
	bl	draw_point2
	mov	r0, #31
	mov	r1, #26
	mov	r2, #31744
	bl	draw_point2
	mov	r0, #32
	mov	r1, #26
	mov	r2, #31744
	bl	draw_point2
	mov	r0, #33
	mov	r1, #26
	mov	r2, #31744
	bl	draw_point2
	mov	r0, #34
	mov	r1, #26
	mov	r2, #31744
	bl	draw_point2
	mov	r0, #35
	mov	r1, #26
	mov	r2, #31744
	bl	draw_point2
	mov	r0, #42
	mov	r1, #26
	ldr	r2, .L96+8
	bl	draw_point2
	mov	r0, #43
	mov	r1, #26
	ldr	r2, .L96+8
	bl	draw_point2
	mov	r0, #44
	mov	r1, #26
	ldr	r2, .L96+8
	bl	draw_point2
	mov	r0, #45
	mov	r1, #26
	ldr	r2, .L96+8
	bl	draw_point2
	mov	r0, #46
	mov	r1, #26
	ldr	r2, .L96+8
	bl	draw_point2
	mov	r0, #47
	mov	r1, #26
	ldr	r2, .L96+8
	bl	draw_point2
	mov	r0, #48
	mov	r1, #26
	ldr	r2, .L96+8
	bl	draw_point2
	mov	r0, #49
	mov	r1, #26
	ldr	r2, .L96+8
	bl	draw_point2
	mov	r0, #50
	mov	r1, #26
	ldr	r2, .L96+8
	bl	draw_point2
	mov	r0, #56
	mov	r1, #26
	ldr	r2, .L96+8
	bl	draw_point2
	mov	r0, #57
	mov	r1, #26
	ldr	r2, .L96+8
	bl	draw_point2
	mov	r0, #58
	mov	r1, #26
	ldr	r2, .L96+8
	bl	draw_point2
	mov	r0, #59
	mov	r1, #26
	ldr	r2, .L96+8
	bl	draw_point2
	mov	r0, #60
	mov	r1, #26
	ldr	r2, .L96+8
	bl	draw_point2
	mov	r0, #61
	mov	r1, #26
	ldr	r2, .L96+8
	bl	draw_point2
	mov	r0, #62
	mov	r1, #26
	ldr	r2, .L96+8
	bl	draw_point2
	mov	r0, #63
	mov	r1, #26
	ldr	r2, .L96+8
	bl	draw_point2
	mov	r0, #64
	mov	r1, #26
	ldr	r2, .L96+8
	bl	draw_point2
	mov	r0, #65
	mov	r1, #26
	ldr	r2, .L96+8
	bl	draw_point2
	mov	r0, #72
	mov	r1, #26
	ldr	r2, .L96+8
	bl	draw_point2
	mov	r0, #73
	mov	r1, #26
	ldr	r2, .L96+8
	bl	draw_point2
	mov	r0, #74
	mov	r1, #26
	ldr	r2, .L96+8
	bl	draw_point2
	mov	r0, #82
	mov	r1, #26
	ldr	r2, .L96+8
	bl	draw_point2
	mov	r0, #83
	mov	r1, #26
	ldr	r2, .L96+8
	bl	draw_point2
	mov	r0, #98
	mov	r1, #26
	ldr	r2, .L96
	bl	draw_point2
	mov	r0, #99
	mov	r1, #26
	ldr	r2, .L96+8
	bl	draw_point2
	mov	r0, #100
	mov	r1, #26
	ldr	r2, .L96+8
	bl	draw_point2
	mov	r0, #101
	mov	r1, #26
	ldr	r2, .L96+8
	bl	draw_point2
	mov	r0, #13
	mov	r1, #27
	ldr	r2, .L96+8
	bl	draw_point2
	mov	r0, #14
	mov	r1, #27
	ldr	r2, .L96+8
	bl	draw_point2
	mov	r0, #20
	mov	r1, #27
	ldr	r2, .L96+8
	bl	draw_point2
	mov	r0, #21
	mov	r1, #27
	ldr	r2, .L96+8
	bl	draw_point2
	mov	r0, #22
	mov	r1, #27
	ldr	r2, .L96+8
	bl	draw_point2
	mov	r0, #27
	mov	r1, #27
	mov	r2, #31744
	bl	draw_point2
	mov	r0, #28
	mov	r1, #27
	mov	r2, #31744
	bl	draw_point2
	mov	r0, #35
	mov	r1, #27
	mov	r2, #31744
	bl	draw_point2
	mov	r0, #36
	mov	r1, #27
	mov	r2, #31744
	bl	draw_point2
	mov	r0, #42
	mov	r1, #27
	ldr	r2, .L96+8
	bl	draw_point2
	mov	r0, #43
	mov	r1, #27
	ldr	r2, .L96+8
	bl	draw_point2
	mov	r0, #49
	mov	r1, #27
	ldr	r2, .L96+8
	bl	draw_point2
	mov	r0, #50
	mov	r1, #27
	ldr	r2, .L96+8
	bl	draw_point2
	mov	r0, #51
	mov	r1, #27
	ldr	r2, .L96+8
	bl	draw_point2
	mov	r0, #60
	mov	r1, #27
	ldr	r2, .L96+8
	bl	draw_point2
	mov	r0, #61
	mov	r1, #27
	ldr	r2, .L96+8
	bl	draw_point2
	mov	r0, #72
	mov	r1, #27
	ldr	r2, .L96+8
	bl	draw_point2
	mov	r0, #73
	mov	r1, #27
	ldr	r2, .L96+8
	bl	draw_point2
	mov	r0, #74
	mov	r1, #27
	ldr	r2, .L96+8
	bl	draw_point2
	mov	r0, #82
	mov	r1, #27
	ldr	r2, .L96+8
	bl	draw_point2
	mov	r0, #83
	mov	r1, #27
	ldr	r2, .L96+8
	bl	draw_point2
	mov	r0, #98
	mov	r1, #27
	ldr	r2, .L96
	bl	draw_point2
	mov	r0, #99
	mov	r1, #27
	ldr	r2, .L96+8
	bl	draw_point2
	mov	r0, #100
	mov	r1, #27
	ldr	r2, .L96+8
	bl	draw_point2
	mov	r0, #101
	mov	r1, #27
	ldr	r2, .L96+8
	bl	draw_point2
	mov	r0, #102
	mov	r1, #27
	ldr	r2, .L96+8
	bl	draw_point2
	mov	r0, #13
	mov	r1, #28
	ldr	r2, .L96+8
	bl	draw_point2
	mov	r0, #14
	mov	r1, #28
	ldr	r2, .L96+8
	bl	draw_point2
	mov	r0, #21
	mov	r1, #28
	ldr	r2, .L96+8
	bl	draw_point2
	mov	r0, #22
	mov	r1, #28
	ldr	r2, .L96+8
	bl	draw_point2
	mov	r0, #26
	mov	r1, #28
	mov	r2, #31744
	bl	draw_point2
	mov	r0, #27
	mov	r1, #28
	mov	r2, #31744
	bl	draw_point2
	mov	r0, #36
	mov	r1, #28
	mov	r2, #31744
	bl	draw_point2
	mov	r0, #37
	mov	r1, #28
	mov	r2, #31744
	bl	draw_point2
	mov	r0, #42
	mov	r1, #28
	ldr	r2, .L96+8
	bl	draw_point2
	mov	r0, #43
	mov	r1, #28
	ldr	r2, .L96+8
	bl	draw_point2
	mov	r0, #50
	mov	r1, #28
	ldr	r2, .L96+8
	bl	draw_point2
	mov	r0, #51
	mov	r1, #28
	ldr	r2, .L96+8
	bl	draw_point2
	mov	r0, #60
	mov	r1, #28
	ldr	r2, .L96+8
	bl	draw_point2
	mov	r0, #61
	mov	r1, #28
	ldr	r2, .L96+8
	bl	draw_point2
	mov	r0, #71
	mov	r1, #28
	ldr	r2, .L96+8
	bl	draw_point2
	mov	r0, #72
	mov	r1, #28
	ldr	r2, .L96+8
	bl	draw_point2
	mov	r0, #74
	mov	r1, #28
	ldr	r2, .L96+8
	bl	draw_point2
	mov	r0, #75
	mov	r1, #28
	ldr	r2, .L96+8
	bl	draw_point2
	mov	r0, #82
	mov	r1, #28
	ldr	r2, .L96+8
	bl	draw_point2
	mov	r0, #83
	mov	r1, #28
	ldr	r2, .L96+8
	bl	draw_point2
	mov	r0, #98
	mov	r1, #28
	ldr	r2, .L96
	bl	draw_point2
	mov	r0, #99
	mov	r1, #28
	ldr	r2, .L96+8
	bl	draw_point2
	mov	r0, #100
	mov	r1, #28
	ldr	r2, .L96+8
	bl	draw_point2
	mov	r0, #101
	mov	r1, #28
	ldr	r2, .L96+8
	bl	draw_point2
	mov	r0, #102
	mov	r1, #28
	ldr	r2, .L96+8
	bl	draw_point2
	mov	r0, #103
	mov	r1, #28
	ldr	r2, .L96+8
	bl	draw_point2
	mov	r0, #13
	mov	r1, #29
	ldr	r2, .L96+8
	bl	draw_point2
	mov	r0, #14
	mov	r1, #29
	ldr	r2, .L96+8
	bl	draw_point2
	mov	r0, #21
	mov	r1, #29
	ldr	r2, .L96+8
	bl	draw_point2
	mov	r0, #22
	mov	r1, #29
	ldr	r2, .L96+8
	bl	draw_point2
	mov	r0, #26
	mov	r1, #29
	mov	r2, #31744
	bl	draw_point2
	mov	r0, #27
	mov	r1, #29
	mov	r2, #31744
	bl	draw_point2
	mov	r0, #36
	mov	r1, #29
	mov	r2, #31744
	bl	draw_point2
	mov	r0, #37
	mov	r1, #29
	mov	r2, #31744
	bl	draw_point2
	mov	r0, #42
	mov	r1, #29
	ldr	r2, .L96+8
	bl	draw_point2
	mov	r0, #43
	mov	r1, #29
	ldr	r2, .L96+8
	bl	draw_point2
	mov	r0, #50
	mov	r1, #29
	ldr	r2, .L96+8
	bl	draw_point2
	mov	r0, #51
	mov	r1, #29
	ldr	r2, .L96+8
	bl	draw_point2
	mov	r0, #60
	mov	r1, #29
	ldr	r2, .L96+8
	bl	draw_point2
	mov	r0, #61
	mov	r1, #29
	ldr	r2, .L96+8
	bl	draw_point2
	mov	r0, #71
	mov	r1, #29
	ldr	r2, .L96+8
	bl	draw_point2
	mov	r0, #72
	mov	r1, #29
	ldr	r2, .L96+8
	bl	draw_point2
	mov	r0, #74
	mov	r1, #29
	ldr	r2, .L96+8
	bl	draw_point2
	mov	r0, #75
	mov	r1, #29
	ldr	r2, .L96+8
	bl	draw_point2
	mov	r0, #82
	mov	r1, #29
	ldr	r2, .L96+8
	bl	draw_point2
	mov	r0, #83
	mov	r1, #29
	ldr	r2, .L96+8
	bl	draw_point2
	mov	r0, #98
	mov	r1, #29
	ldr	r2, .L96
	bl	draw_point2
	mov	r0, #99
	mov	r1, #29
	ldr	r2, .L96+8
	bl	draw_point2
	mov	r0, #100
	mov	r1, #29
	ldr	r2, .L96+8
	bl	draw_point2
	mov	r0, #101
	mov	r1, #29
	ldr	r2, .L96+8
	bl	draw_point2
	mov	r0, #102
	mov	r1, #29
	ldr	r2, .L96+8
	bl	draw_point2
	mov	r0, #103
	mov	r1, #29
	ldr	r2, .L96+8
	bl	draw_point2
	mov	r0, #13
	mov	r1, #30
	ldr	r2, .L96+8
	bl	draw_point2
	mov	r0, #14
	mov	r1, #30
	ldr	r2, .L96+8
	bl	draw_point2
	mov	r0, #21
	mov	r1, #30
	ldr	r2, .L96+8
	bl	draw_point2
	mov	r0, #22
	mov	r1, #30
	ldr	r2, .L96+8
	bl	draw_point2
	mov	r0, #26
	mov	r1, #30
	mov	r2, #31744
	bl	draw_point2
	mov	r0, #27
	mov	r1, #30
	mov	r2, #31744
	bl	draw_point2
	mov	r0, #36
	mov	r1, #30
	mov	r2, #31744
	bl	draw_point2
	mov	r0, #37
	mov	r1, #30
	mov	r2, #31744
	bl	draw_point2
	mov	r0, #42
	mov	r1, #30
	ldr	r2, .L96+8
	bl	draw_point2
	mov	r0, #43
	mov	r1, #30
	ldr	r2, .L96+8
	bl	draw_point2
	mov	r0, #50
	mov	r1, #30
	ldr	r2, .L96+8
	bl	draw_point2
	mov	r0, #51
	mov	r1, #30
	ldr	r2, .L96+8
	bl	draw_point2
	mov	r0, #60
	mov	r1, #30
	ldr	r2, .L96+8
	bl	draw_point2
	mov	r0, #61
	mov	r1, #30
	ldr	r2, .L96+8
	bl	draw_point2
	mov	r0, #71
	mov	r1, #30
	ldr	r2, .L96+8
	bl	draw_point2
	mov	r0, #75
	mov	r1, #30
	ldr	r2, .L96+8
	bl	draw_point2
	mov	r0, #82
	mov	r1, #30
	ldr	r2, .L96+8
	bl	draw_point2
	mov	r0, #83
	mov	r1, #30
	ldr	r2, .L96+8
	bl	draw_point2
	mov	r0, #98
	mov	r1, #30
	ldr	r2, .L96
	bl	draw_point2
	mov	r0, #99
	mov	r1, #30
	ldr	r2, .L96+8
	bl	draw_point2
	mov	r0, #100
	mov	r1, #30
	ldr	r2, .L96+8
	bl	draw_point2
	mov	r0, #101
	mov	r1, #30
	ldr	r2, .L96+8
	bl	draw_point2
	mov	r0, #102
	mov	r1, #30
	ldr	r2, .L96+8
	bl	draw_point2
	mov	r0, #103
	mov	r1, #30
	ldr	r2, .L96+8
	bl	draw_point2
	mov	r0, #13
	mov	r1, #31
	ldr	r2, .L96+8
	bl	draw_point2
	mov	r0, #14
	mov	r1, #31
	ldr	r2, .L96+8
	bl	draw_point2
	mov	r0, #20
	mov	r1, #31
	ldr	r2, .L96+8
	bl	draw_point2
	mov	r0, #21
	mov	r1, #31
	ldr	r2, .L96+8
	bl	draw_point2
	mov	r0, #26
	mov	r1, #31
	mov	r2, #31744
	bl	draw_point2
	mov	r0, #27
	mov	r1, #31
	mov	r2, #31744
	bl	draw_point2
	mov	r0, #36
	mov	r1, #31
	mov	r2, #31744
	bl	draw_point2
	mov	r0, #37
	mov	r1, #31
	mov	r2, #31744
	bl	draw_point2
	mov	r0, #42
	mov	r1, #31
	ldr	r2, .L96+8
	bl	draw_point2
	mov	r0, #43
	mov	r1, #31
	ldr	r2, .L96+8
	bl	draw_point2
	mov	r0, #49
	mov	r1, #31
	ldr	r2, .L96+8
	bl	draw_point2
	mov	r0, #50
	mov	r1, #31
	ldr	r2, .L96+8
	bl	draw_point2
	mov	r0, #60
	mov	r1, #31
	ldr	r2, .L96+8
	bl	draw_point2
	mov	r0, #61
	mov	r1, #31
	ldr	r2, .L96+8
	bl	draw_point2
	mov	r0, #70
	mov	r1, #31
	ldr	r2, .L96+8
	bl	draw_point2
	mov	r0, #71
	mov	r1, #31
	ldr	r2, .L96+8
	bl	draw_point2
	mov	r0, #75
	mov	r1, #31
	ldr	r2, .L96+8
	bl	draw_point2
	mov	r0, #76
	mov	r1, #31
	ldr	r2, .L96+8
	bl	draw_point2
	mov	r0, #82
	b	.L97
.L98:
	.align	2
.L96:
	.word	543
	.word	543
	.word	32767
.L97:
	mov	r1, #31
	ldr	r2, .L96+8
	bl	draw_point2
	mov	r0, #83
	mov	r1, #31
	ldr	r2, .L96+8
	bl	draw_point2
	mov	r0, #98
	mov	r1, #31
	ldr	r2, .L96+4
	bl	draw_point2
	mov	r0, #99
	mov	r1, #31
	ldr	r2, .L96+8
	bl	draw_point2
	mov	r0, #100
	mov	r1, #31
	ldr	r2, .L96+8
	bl	draw_point2
	mov	r0, #101
	mov	r1, #31
	ldr	r2, .L96+8
	bl	draw_point2
	mov	r0, #102
	mov	r1, #31
	ldr	r2, .L96+8
	bl	draw_point2
	mov	r0, #103
	mov	r1, #31
	ldr	r2, .L96+8
	bl	draw_point2
	mov	r0, #13
	mov	r1, #32
	ldr	r2, .L96+8
	bl	draw_point2
	mov	r0, #14
	mov	r1, #32
	ldr	r2, .L96+8
	bl	draw_point2
	mov	r0, #15
	mov	r1, #32
	ldr	r2, .L96+8
	bl	draw_point2
	mov	r0, #16
	mov	r1, #32
	ldr	r2, .L96+8
	bl	draw_point2
	mov	r0, #17
	mov	r1, #32
	ldr	r2, .L96+8
	bl	draw_point2
	mov	r0, #18
	mov	r1, #32
	ldr	r2, .L96+8
	bl	draw_point2
	mov	r0, #19
	mov	r1, #32
	ldr	r2, .L96+8
	bl	draw_point2
	mov	r0, #20
	mov	r1, #32
	ldr	r2, .L96+8
	bl	draw_point2
	mov	r0, #21
	mov	r1, #32
	ldr	r2, .L96+8
	bl	draw_point2
	mov	r0, #26
	mov	r1, #32
	mov	r2, #31744
	bl	draw_point2
	mov	r0, #27
	mov	r1, #32
	mov	r2, #31744
	bl	draw_point2
	mov	r0, #36
	mov	r1, #32
	mov	r2, #31744
	bl	draw_point2
	mov	r0, #37
	mov	r1, #32
	mov	r2, #31744
	bl	draw_point2
	mov	r0, #42
	mov	r1, #32
	ldr	r2, .L96+8
	bl	draw_point2
	mov	r0, #43
	mov	r1, #32
	ldr	r2, .L96+8
	bl	draw_point2
	mov	r0, #44
	mov	r1, #32
	ldr	r2, .L96+8
	bl	draw_point2
	mov	r0, #45
	mov	r1, #32
	ldr	r2, .L96+8
	bl	draw_point2
	mov	r0, #46
	mov	r1, #32
	ldr	r2, .L96+8
	bl	draw_point2
	mov	r0, #47
	mov	r1, #32
	ldr	r2, .L96+8
	bl	draw_point2
	mov	r0, #48
	mov	r1, #32
	ldr	r2, .L96+8
	bl	draw_point2
	mov	r0, #49
	mov	r1, #32
	ldr	r2, .L96+8
	bl	draw_point2
	mov	r0, #50
	mov	r1, #32
	ldr	r2, .L96+8
	bl	draw_point2
	mov	r0, #60
	mov	r1, #32
	ldr	r2, .L96+8
	bl	draw_point2
	mov	r0, #61
	mov	r1, #32
	ldr	r2, .L96+8
	bl	draw_point2
	mov	r0, #70
	mov	r1, #32
	ldr	r2, .L96+8
	bl	draw_point2
	mov	r0, #71
	mov	r1, #32
	ldr	r2, .L96+8
	bl	draw_point2
	mov	r0, #75
	mov	r1, #32
	ldr	r2, .L96+8
	bl	draw_point2
	mov	r0, #76
	mov	r1, #32
	ldr	r2, .L96+8
	bl	draw_point2
	mov	r0, #82
	mov	r1, #32
	ldr	r2, .L96+8
	bl	draw_point2
	mov	r0, #83
	mov	r1, #32
	ldr	r2, .L96+8
	bl	draw_point2
	mov	r0, #98
	mov	r1, #32
	ldr	r2, .L96+4
	bl	draw_point2
	mov	r0, #99
	mov	r1, #32
	ldr	r2, .L96+8
	bl	draw_point2
	mov	r0, #100
	mov	r1, #32
	ldr	r2, .L96+8
	bl	draw_point2
	mov	r0, #102
	mov	r1, #32
	ldr	r2, .L96+8
	bl	draw_point2
	mov	r0, #103
	mov	r1, #32
	ldr	r2, .L96+8
	bl	draw_point2
	mov	r0, #104
	mov	r1, #32
	ldr	r2, .L96+8
	bl	draw_point2
	mov	r0, #13
	mov	r1, #33
	ldr	r2, .L96+8
	bl	draw_point2
	mov	r0, #14
	mov	r1, #33
	ldr	r2, .L96+8
	bl	draw_point2
	mov	r0, #26
	mov	r1, #33
	mov	r2, #31744
	bl	draw_point2
	mov	r0, #27
	mov	r1, #33
	mov	r2, #31744
	bl	draw_point2
	mov	r0, #36
	mov	r1, #33
	mov	r2, #31744
	bl	draw_point2
	mov	r0, #37
	mov	r1, #33
	mov	r2, #31744
	bl	draw_point2
	mov	r0, #42
	mov	r1, #33
	ldr	r2, .L96+8
	bl	draw_point2
	mov	r0, #43
	mov	r1, #33
	ldr	r2, .L96+8
	bl	draw_point2
	mov	r0, #49
	mov	r1, #33
	ldr	r2, .L96+8
	bl	draw_point2
	mov	r0, #60
	mov	r1, #33
	ldr	r2, .L96+8
	bl	draw_point2
	mov	r0, #61
	mov	r1, #33
	ldr	r2, .L96+8
	bl	draw_point2
	mov	r0, #70
	mov	r1, #33
	ldr	r2, .L96+8
	bl	draw_point2
	mov	r0, #71
	mov	r1, #33
	ldr	r2, .L96+8
	bl	draw_point2
	mov	r0, #72
	mov	r1, #33
	ldr	r2, .L96+8
	bl	draw_point2
	mov	r0, #73
	mov	r1, #33
	ldr	r2, .L96+8
	bl	draw_point2
	mov	r0, #74
	mov	r1, #33
	ldr	r2, .L96+8
	bl	draw_point2
	mov	r0, #75
	mov	r1, #33
	ldr	r2, .L96+8
	bl	draw_point2
	mov	r0, #76
	mov	r1, #33
	ldr	r2, .L96+8
	bl	draw_point2
	mov	r0, #82
	mov	r1, #33
	ldr	r2, .L96+8
	bl	draw_point2
	mov	r0, #83
	mov	r1, #33
	ldr	r2, .L96+8
	bl	draw_point2
	mov	r0, #98
	mov	r1, #33
	ldr	r2, .L96+4
	bl	draw_point2
	mov	r0, #99
	mov	r1, #33
	ldr	r2, .L96+8
	bl	draw_point2
	mov	r0, #102
	mov	r1, #33
	ldr	r2, .L96+8
	bl	draw_point2
	mov	r0, #103
	mov	r1, #33
	ldr	r2, .L96+8
	bl	draw_point2
	mov	r0, #104
	mov	r1, #33
	ldr	r2, .L96+8
	bl	draw_point2
	mov	r0, #13
	mov	r1, #34
	ldr	r2, .L96+8
	bl	draw_point2
	mov	r0, #14
	mov	r1, #34
	ldr	r2, .L96+8
	bl	draw_point2
	mov	r0, #26
	mov	r1, #34
	mov	r2, #31744
	bl	draw_point2
	mov	r0, #27
	mov	r1, #34
	mov	r2, #31744
	bl	draw_point2
	mov	r0, #36
	mov	r1, #34
	mov	r2, #31744
	bl	draw_point2
	mov	r0, #37
	mov	r1, #34
	mov	r2, #31744
	bl	draw_point2
	mov	r0, #42
	mov	r1, #34
	ldr	r2, .L96+8
	bl	draw_point2
	mov	r0, #43
	mov	r1, #34
	ldr	r2, .L96+8
	bl	draw_point2
	mov	r0, #49
	mov	r1, #34
	ldr	r2, .L96+8
	bl	draw_point2
	mov	r0, #50
	mov	r1, #34
	ldr	r2, .L96+8
	bl	draw_point2
	mov	r0, #60
	mov	r1, #34
	ldr	r2, .L96+8
	bl	draw_point2
	mov	r0, #61
	mov	r1, #34
	ldr	r2, .L96+8
	bl	draw_point2
	mov	r0, #69
	mov	r1, #34
	ldr	r2, .L96+8
	bl	draw_point2
	mov	r0, #70
	mov	r1, #34
	ldr	r2, .L96+8
	bl	draw_point2
	mov	r0, #71
	mov	r1, #34
	ldr	r2, .L96+8
	bl	draw_point2
	mov	r0, #72
	mov	r1, #34
	ldr	r2, .L96+8
	bl	draw_point2
	mov	r0, #73
	mov	r1, #34
	ldr	r2, .L96+8
	bl	draw_point2
	mov	r0, #74
	mov	r1, #34
	ldr	r2, .L96+8
	bl	draw_point2
	mov	r0, #75
	mov	r1, #34
	ldr	r2, .L96+8
	bl	draw_point2
	mov	r0, #76
	mov	r1, #34
	ldr	r2, .L96+8
	bl	draw_point2
	mov	r0, #77
	mov	r1, #34
	ldr	r2, .L96+8
	bl	draw_point2
	mov	r0, #82
	mov	r1, #34
	ldr	r2, .L96+8
	bl	draw_point2
	mov	r0, #83
	mov	r1, #34
	ldr	r2, .L96+8
	bl	draw_point2
	mov	r0, #98
	mov	r1, #34
	ldr	r2, .L96+4
	bl	draw_point2
	mov	r0, #103
	mov	r1, #34
	ldr	r2, .L96+8
	bl	draw_point2
	mov	r0, #104
	mov	r1, #34
	ldr	r2, .L96+8
	bl	draw_point2
	mov	r0, #105
	mov	r1, #34
	ldr	r2, .L96+8
	bl	draw_point2
	mov	r0, #13
	mov	r1, #35
	ldr	r2, .L96+8
	bl	draw_point2
	mov	r0, #14
	mov	r1, #35
	ldr	r2, .L96+8
	bl	draw_point2
	mov	r0, #26
	mov	r1, #35
	mov	r2, #31744
	bl	draw_point2
	mov	r0, #27
	mov	r1, #35
	mov	r2, #31744
	bl	draw_point2
	mov	r0, #36
	mov	r1, #35
	mov	r2, #31744
	bl	draw_point2
	mov	r0, #37
	mov	r1, #35
	mov	r2, #31744
	bl	draw_point2
	mov	r0, #42
	mov	r1, #35
	ldr	r2, .L96+8
	bl	draw_point2
	mov	r0, #43
	mov	r1, #35
	ldr	r2, .L96+8
	bl	draw_point2
	mov	r0, #50
	mov	r1, #35
	ldr	r2, .L96+8
	bl	draw_point2
	mov	r0, #51
	mov	r1, #35
	ldr	r2, .L96+8
	bl	draw_point2
	mov	r0, #60
	mov	r1, #35
	ldr	r2, .L96+8
	bl	draw_point2
	mov	r0, #61
	mov	r1, #35
	ldr	r2, .L96+8
	bl	draw_point2
	mov	r0, #69
	mov	r1, #35
	ldr	r2, .L96+8
	bl	draw_point2
	mov	r0, #70
	mov	r1, #35
	ldr	r2, .L96+8
	bl	draw_point2
	mov	r0, #76
	mov	r1, #35
	ldr	r2, .L96+8
	bl	draw_point2
	mov	r0, #77
	mov	r1, #35
	ldr	r2, .L96+8
	bl	draw_point2
	mov	r0, #82
	mov	r1, #35
	ldr	r2, .L96+8
	bl	draw_point2
	mov	r0, #83
	mov	r1, #35
	ldr	r2, .L96+8
	bl	draw_point2
	mov	r0, #98
	mov	r1, #35
	ldr	r2, .L96+4
	bl	draw_point2
	mov	r0, #104
	mov	r1, #35
	ldr	r2, .L96+8
	bl	draw_point2
	mov	r0, #105
	mov	r1, #35
	ldr	r2, .L96+8
	bl	draw_point2
	mov	r0, #106
	mov	r1, #35
	ldr	r2, .L96+8
	bl	draw_point2
	mov	r0, #13
	mov	r1, #36
	ldr	r2, .L96+8
	bl	draw_point2
	mov	r0, #14
	mov	r1, #36
	ldr	r2, .L96+8
	bl	draw_point2
	mov	r0, #27
	mov	r1, #36
	mov	r2, #31744
	bl	draw_point2
	mov	r0, #28
	mov	r1, #36
	mov	r2, #31744
	bl	draw_point2
	mov	r0, #35
	mov	r1, #36
	mov	r2, #31744
	bl	draw_point2
	mov	r0, #36
	mov	r1, #36
	mov	r2, #31744
	bl	draw_point2
	mov	r0, #42
	mov	r1, #36
	ldr	r2, .L96+8
	bl	draw_point2
	mov	r0, #43
	mov	r1, #36
	ldr	r2, .L96+8
	bl	draw_point2
	mov	r0, #50
	mov	r1, #36
	ldr	r2, .L96+8
	bl	draw_point2
	mov	r0, #51
	mov	r1, #36
	ldr	r2, .L96+8
	bl	draw_point2
	mov	r0, #60
	mov	r1, #36
	ldr	r2, .L96+8
	bl	draw_point2
	mov	r0, #61
	mov	r1, #36
	ldr	r2, .L96+8
	bl	draw_point2
	mov	r0, #69
	mov	r1, #36
	ldr	r2, .L96+8
	bl	draw_point2
	mov	r0, #77
	mov	r1, #36
	ldr	r2, .L96+8
	bl	draw_point2
	mov	r0, #82
	mov	r1, #36
	ldr	r2, .L96+8
	bl	draw_point2
	mov	r0, #83
	mov	r1, #36
	ldr	r2, .L96+8
	bl	draw_point2
	mov	r0, #98
	mov	r1, #36
	ldr	r2, .L96+4
	bl	draw_point2
	mov	r0, #105
	mov	r1, #36
	ldr	r2, .L96+8
	bl	draw_point2
	mov	r0, #106
	mov	r1, #36
	ldr	r2, .L96+8
	bl	draw_point2
	mov	r0, #107
	mov	r1, #36
	ldr	r2, .L96+8
	bl	draw_point2
	mov	r0, #108
	mov	r1, #36
	ldr	r2, .L96+8
	bl	draw_point2
	mov	r0, #13
	mov	r1, #37
	ldr	r2, .L96+8
	bl	draw_point2
	mov	r0, #14
	mov	r1, #37
	ldr	r2, .L96+8
	bl	draw_point2
	mov	r0, #28
	mov	r1, #37
	mov	r2, #31744
	bl	draw_point2
	mov	r0, #29
	mov	r1, #37
	mov	r2, #31744
	bl	draw_point2
	mov	r0, #30
	mov	r1, #37
	mov	r2, #31744
	bl	draw_point2
	mov	r0, #31
	mov	r1, #37
	mov	r2, #31744
	bl	draw_point2
	mov	r0, #32
	mov	r1, #37
	mov	r2, #31744
	bl	draw_point2
	mov	r0, #33
	mov	r1, #37
	mov	r2, #31744
	bl	draw_point2
	mov	r0, #34
	mov	r1, #37
	mov	r2, #31744
	bl	draw_point2
	mov	r0, #35
	mov	r1, #37
	mov	r2, #31744
	bl	draw_point2
	mov	r0, #42
	mov	r1, #37
	ldr	r2, .L96+8
	bl	draw_point2
	mov	r0, #43
	mov	r1, #37
	ldr	r2, .L96+8
	bl	draw_point2
	mov	r0, #50
	mov	r1, #37
	ldr	r2, .L96+8
	bl	draw_point2
	mov	r0, #51
	mov	r1, #37
	ldr	r2, .L96+8
	bl	draw_point2
	mov	r0, #60
	mov	r1, #37
	ldr	r2, .L96+8
	bl	draw_point2
	mov	r0, #61
	mov	r1, #37
	ldr	r2, .L96+8
	bl	draw_point2
	mov	r0, #68
	mov	r1, #37
	ldr	r2, .L96+8
	bl	draw_point2
	mov	r0, #69
	mov	r1, #37
	ldr	r2, .L96+8
	bl	draw_point2
	mov	r0, #77
	mov	r1, #37
	ldr	r2, .L96+8
	bl	draw_point2
	mov	r0, #78
	mov	r1, #37
	ldr	r2, .L96+8
	bl	draw_point2
	mov	r0, #82
	mov	r1, #37
	ldr	r2, .L96+8
	bl	draw_point2
	mov	r0, #83
	mov	r1, #37
	ldr	r2, .L96+8
	bl	draw_point2
	mov	r0, #98
	mov	r1, #37
	ldr	r2, .L96+4
	bl	draw_point2
	mov	r0, #106
	mov	r1, #37
	ldr	r2, .L96+8
	bl	draw_point2
	mov	r0, #107
	mov	r1, #37
	ldr	r2, .L96+8
	bl	draw_point2
	mov	r0, #108
	mov	r1, #37
	ldr	r2, .L96+8
	bl	draw_point2
	mov	r0, #13
	mov	r1, #38
	ldr	r2, .L96+8
	bl	draw_point2
	mov	r0, #14
	mov	r1, #38
	ldr	r2, .L96+8
	bl	draw_point2
	mov	r0, #30
	mov	r1, #38
	mov	r2, #31744
	bl	draw_point2
	mov	r0, #31
	mov	r1, #38
	mov	r2, #31744
	bl	draw_point2
	mov	r0, #32
	mov	r1, #38
	mov	r2, #31744
	bl	draw_point2
	mov	r0, #33
	mov	r1, #38
	mov	r2, #31744
	bl	draw_point2
	mov	r0, #42
	mov	r1, #38
	ldr	r2, .L96+8
	bl	draw_point2
	mov	r0, #43
	mov	r1, #38
	ldr	r2, .L96+8
	bl	draw_point2
	mov	r0, #50
	mov	r1, #38
	ldr	r2, .L96+8
	bl	draw_point2
	mov	r0, #51
	mov	r1, #38
	ldr	r2, .L96+8
	bl	draw_point2
	mov	r0, #60
	mov	r1, #38
	ldr	r2, .L96+8
	bl	draw_point2
	mov	r0, #61
	mov	r1, #38
	ldr	r2, .L96+8
	bl	draw_point2
	mov	r0, #68
	mov	r1, #38
	ldr	r2, .L96+8
	bl	draw_point2
	mov	r0, #69
	mov	r1, #38
	ldr	r2, .L96+8
	bl	draw_point2
	mov	r0, #77
	mov	r1, #38
	ldr	r2, .L96+8
	bl	draw_point2
	mov	r0, #78
	mov	r1, #38
	ldr	r2, .L96+8
	bl	draw_point2
	mov	r0, #82
	mov	r1, #38
	ldr	r2, .L96+8
	bl	draw_point2
	mov	r0, #83
	mov	r1, #38
	ldr	r2, .L96+8
	bl	draw_point2
	mov	r0, #84
	mov	r1, #38
	ldr	r2, .L96+8
	bl	draw_point2
	mov	r0, #85
	mov	r1, #38
	ldr	r2, .L96+8
	bl	draw_point2
	mov	r0, #86
	mov	r1, #38
	ldr	r2, .L96+8
	bl	draw_point2
	mov	r0, #87
	mov	r1, #38
	ldr	r2, .L96+8
	bl	draw_point2
	mov	r0, #88
	mov	r1, #38
	ldr	r2, .L96+8
	bl	draw_point2
	mov	r0, #89
	mov	r1, #38
	ldr	r2, .L96+8
	bl	draw_point2
	mov	r0, #90
	mov	r1, #38
	ldr	r2, .L96+8
	bl	draw_point2
	mov	r0, #98
	mov	r1, #38
	ldr	r2, .L96+4
	bl	draw_point2
	mov	r0, #99
	mov	r1, #38
	ldr	r2, .L96+8
	bl	draw_point2
	mov	r0, #98
	mov	r1, #39
	ldr	r2, .L96+4
	bl	draw_point2
	mov	r0, #99
	mov	r1, #39
	ldr	r2, .L96+8
	bl	draw_point2
	mov	r0, #100
	mov	r1, #39
	ldr	r2, .L96+8
	bl	draw_point2
	mov	r0, #98
	mov	r1, #40
	ldr	r2, .L96+4
	bl	draw_point2
	mov	r0, #99
	mov	r1, #40
	ldr	r2, .L96+8
	bl	draw_point2
	mov	r0, #100
	mov	r1, #40
	ldr	r2, .L96+8
	bl	draw_point2
	mov	r0, #101
	mov	r1, #40
	ldr	r2, .L96+8
	bl	draw_point2
	mov	r0, #98
	mov	r1, #41
	ldr	r2, .L96+4
	bl	draw_point2
	mov	r0, #99
	mov	r1, #41
	ldr	r2, .L96+8
	bl	draw_point2
	mov	r0, #100
	mov	r1, #41
	ldr	r2, .L96+8
	bl	draw_point2
	mov	r0, #101
	mov	r1, #41
	ldr	r2, .L96+8
	bl	draw_point2
	mov	r0, #102
	mov	r1, #41
	ldr	r2, .L96+8
	bl	draw_point2
	mov	r0, #98
	mov	r1, #42
	ldr	r2, .L96+4
	bl	draw_point2
	mov	r0, #100
	mov	r1, #42
	ldr	r2, .L96+8
	bl	draw_point2
	mov	r0, #101
	mov	r1, #42
	ldr	r2, .L96+8
	bl	draw_point2
	mov	r0, #102
	mov	r1, #42
	ldr	r2, .L96+8
	bl	draw_point2
	mov	r0, #98
	mov	r1, #43
	ldr	r2, .L96+4
	bl	draw_point2
	mov	r0, #99
	mov	r1, #43
	ldr	r2, .L96+8
	bl	draw_point2
	mov	r0, #100
	mov	r1, #43
	ldr	r2, .L96+8
	bl	draw_point2
	mov	r0, #101
	mov	r1, #43
	ldr	r2, .L96+8
	bl	draw_point2
	mov	r0, #98
	mov	r1, #44
	ldr	r2, .L96+4
	bl	draw_point2
	mov	r0, #99
	mov	r1, #44
	ldr	r2, .L96+8
	bl	draw_point2
	mov	r0, #100
	mov	r1, #44
	ldr	r2, .L96+8
	bl	draw_point2
	mov	r0, #98
	mov	r1, #45
	ldr	r2, .L96+4
	bl	draw_point2
	mov	r0, #99
	mov	r1, #45
	ldr	r2, .L96+8
	bl	draw_point2
	mov	r0, #98
	mov	r1, #46
	ldr	r2, .L96+4
	bl	draw_point2
	mov	r0, #98
	mov	r1, #47
	ldr	r2, .L96+4
	bl	draw_point2
	mov	r0, #98
	mov	r1, #48
	ldr	r2, .L96+4
	bl	draw_point2
	mov	r0, #54
	mov	r1, #58
	ldr	r2, .L96+8
	bl	draw_point2
	mov	r0, #55
	mov	r1, #58
	ldr	r2, .L96+8
	bl	draw_point2
	mov	r0, #53
	mov	r1, #59
	ldr	r2, .L96+8
	bl	draw_point2
	mov	r0, #56
	mov	r1, #59
	ldr	r2, .L96+8
	bl	draw_point2
	mov	r0, #62
	mov	r1, #59
	ldr	r2, .L96+8
	bl	draw_point2
	mov	r0, #73
	mov	r1, #59
	ldr	r2, .L96+8
	bl	draw_point2
	mov	r0, #89
	mov	r1, #59
	ldr	r2, .L96+8
	bl	draw_point2
	mov	r0, #26
	mov	r1, #60
	ldr	r2, .L96+8
	bl	draw_point2
	mov	r0, #27
	mov	r1, #60
	ldr	r2, .L96+8
	bl	draw_point2
	mov	r0, #28
	mov	r1, #60
	ldr	r2, .L96+8
	bl	draw_point2
	mov	r0, #31
	mov	r1, #60
	ldr	r2, .L96+8
	bl	draw_point2
	mov	r0, #33
	mov	r1, #60
	ldr	r2, .L96+8
	bl	draw_point2
	mov	r0, #34
	mov	r1, #60
	ldr	r2, .L96+8
	bl	draw_point2
	mov	r0, #37
	mov	r1, #60
	ldr	r2, .L96+8
	bl	draw_point2
	mov	r0, #38
	mov	r1, #60
	ldr	r2, .L96+8
	bl	draw_point2
	mov	r0, #42
	mov	r1, #60
	ldr	r2, .L96+8
	bl	draw_point2
	mov	r0, #43
	mov	r1, #60
	ldr	r2, .L96+8
	bl	draw_point2
	mov	r0, #44
	mov	r1, #60
	ldr	r2, .L96+8
	bl	draw_point2
	mov	r0, #47
	mov	r1, #60
	ldr	r2, .L96+8
	bl	draw_point2
	mov	r0, #48
	mov	r1, #60
	ldr	r2, .L96+8
	bl	draw_point2
	mov	r0, #49
	mov	r1, #60
	ldr	r2, .L96+8
	bl	draw_point2
	mov	r0, #53
	mov	r1, #60
	ldr	r2, .L96+8
	bl	draw_point2
	mov	r0, #56
	mov	r1, #60
	ldr	r2, .L96+8
	bl	draw_point2
	mov	r0, #61
	mov	r1, #60
	ldr	r2, .L96+8
	bl	draw_point2
	mov	r0, #62
	mov	r1, #60
	ldr	r2, .L96+8
	bl	draw_point2
	mov	r0, #63
	mov	r1, #60
	ldr	r2, .L96+8
	bl	draw_point2
	mov	r0, #66
	mov	r1, #60
	ldr	r2, .L96+8
	bl	draw_point2
	mov	r0, #67
	mov	r1, #60
	ldr	r2, .L96+8
	bl	draw_point2
	mov	r0, #73
	mov	r1, #60
	ldr	r2, .L96+8
	bl	draw_point2
	mov	r0, #74
	mov	r1, #60
	ldr	r2, .L96+8
	bl	draw_point2
	mov	r0, #75
	mov	r1, #60
	ldr	r2, .L96+8
	bl	draw_point2
	mov	r0, #79
	mov	r1, #60
	ldr	r2, .L96+8
	bl	draw_point2
	mov	r0, #80
	mov	r1, #60
	ldr	r2, .L96+8
	bl	draw_point2
	mov	r0, #84
	mov	r1, #60
	ldr	r2, .L96+8
	bl	draw_point2
	mov	r0, #85
	mov	r1, #60
	ldr	r2, .L96+8
	bl	draw_point2
	mov	r0, #91
	mov	r1, #60
	ldr	r2, .L99
	bl	draw_point2
	mov	r0, #92
	mov	r1, #60
	ldr	r2, .L99
	bl	draw_point2
	mov	r0, #93
	mov	r1, #60
	ldr	r2, .L99
	bl	draw_point2
	mov	r0, #26
	mov	r1, #61
	ldr	r2, .L99
	bl	draw_point2
	mov	r0, #29
	mov	r1, #61
	ldr	r2, .L99
	bl	draw_point2
	mov	r0, #31
	mov	r1, #61
	ldr	r2, .L99
	bl	draw_point2
	mov	r0, #32
	mov	r1, #61
	ldr	r2, .L99
	bl	draw_point2
	mov	r0, #36
	mov	r1, #61
	ldr	r2, .L99
	bl	draw_point2
	mov	r0, #39
	mov	r1, #61
	ldr	r2, .L99
	bl	draw_point2
	mov	r0, #41
	mov	r1, #61
	ldr	r2, .L99
	bl	draw_point2
	mov	r0, #46
	mov	r1, #61
	ldr	r2, .L99
	bl	draw_point2
	mov	r0, #53
	mov	r1, #61
	ldr	r2, .L99
	bl	draw_point2
	mov	r0, #56
	mov	r1, #61
	ldr	r2, .L99
	bl	draw_point2
	mov	r0, #62
	mov	r1, #61
	ldr	r2, .L99
	bl	draw_point2
	mov	r0, #65
	mov	r1, #61
	ldr	r2, .L99
	bl	draw_point2
	mov	r0, #68
	mov	r1, #61
	ldr	r2, .L99
	bl	draw_point2
	mov	r0, #73
	mov	r1, #61
	ldr	r2, .L99
	bl	draw_point2
	mov	r0, #76
	mov	r1, #61
	ldr	r2, .L99
	bl	draw_point2
	mov	r0, #78
	mov	r1, #61
	ldr	r2, .L99
	bl	draw_point2
	mov	r0, #81
	mov	r1, #61
	ldr	r2, .L99
	bl	draw_point2
	mov	r0, #83
	mov	r1, #61
	ldr	r2, .L99
	bl	draw_point2
	mov	r0, #86
	mov	r1, #61
	ldr	r2, .L99
	bl	draw_point2
	mov	r0, #89
	mov	r1, #61
	ldr	r2, .L99
	bl	draw_point2
	mov	r0, #91
	mov	r1, #61
	ldr	r2, .L99
	bl	draw_point2
	mov	r0, #94
	mov	r1, #61
	ldr	r2, .L99
	bl	draw_point2
	mov	r0, #18
	mov	r1, #62
	ldr	r2, .L99
	bl	draw_point2
	mov	r0, #19
	mov	r1, #62
	ldr	r2, .L99
	bl	draw_point2
	mov	r0, #20
	mov	r1, #62
	ldr	r2, .L99
	bl	draw_point2
	mov	r0, #21
	mov	r1, #62
	ldr	r2, .L99
	bl	draw_point2
	mov	r0, #22
	mov	r1, #62
	ldr	r2, .L99
	bl	draw_point2
	mov	r0, #26
	mov	r1, #62
	ldr	r2, .L99
	bl	draw_point2
	mov	r0, #29
	mov	r1, #62
	ldr	r2, .L99
	bl	draw_point2
	mov	r0, #31
	mov	r1, #62
	ldr	r2, .L99
	bl	draw_point2
	mov	r0, #36
	mov	r1, #62
	ldr	r2, .L99
	bl	draw_point2
	mov	r0, #37
	mov	r1, #62
	ldr	r2, .L99
	bl	draw_point2
	mov	r0, #38
	mov	r1, #62
	ldr	r2, .L99
	bl	draw_point2
	mov	r0, #39
	mov	r1, #62
	ldr	r2, .L99
	bl	draw_point2
	mov	r0, #42
	mov	r1, #62
	ldr	r2, .L99
	bl	draw_point2
	mov	r0, #43
	mov	r1, #62
	ldr	r2, .L99
	bl	draw_point2
	mov	r0, #46
	mov	r1, #62
	ldr	r2, .L99
	bl	draw_point2
	mov	r0, #47
	mov	r1, #62
	ldr	r2, .L99
	bl	draw_point2
	mov	r0, #48
	mov	r1, #62
	ldr	r2, .L99
	bl	draw_point2
	mov	r0, #53
	mov	r1, #62
	ldr	r2, .L99
	bl	draw_point2
	mov	r0, #54
	mov	r1, #62
	ldr	r2, .L99
	bl	draw_point2
	mov	r0, #55
	mov	r1, #62
	ldr	r2, .L99
	bl	draw_point2
	mov	r0, #56
	mov	r1, #62
	ldr	r2, .L99
	bl	draw_point2
	mov	r0, #62
	mov	r1, #62
	ldr	r2, .L99
	bl	draw_point2
	mov	r0, #65
	mov	r1, #62
	ldr	r2, .L99
	bl	draw_point2
	mov	r0, #68
	mov	r1, #62
	ldr	r2, .L99
	bl	draw_point2
	mov	r0, #73
	mov	r1, #62
	ldr	r2, .L99
	bl	draw_point2
	mov	r0, #76
	mov	r1, #62
	ldr	r2, .L99
	bl	draw_point2
	mov	r0, #78
	mov	r1, #62
	ldr	r2, .L99
	bl	draw_point2
	mov	r0, #79
	mov	r1, #62
	ldr	r2, .L99
	bl	draw_point2
	mov	r0, #80
	mov	r1, #62
	ldr	r2, .L99
	bl	draw_point2
	mov	r0, #81
	mov	r1, #62
	ldr	r2, .L99
	bl	draw_point2
	mov	r0, #83
	mov	r1, #62
	ldr	r2, .L99
	bl	draw_point2
	mov	r0, #86
	mov	r1, #62
	ldr	r2, .L99
	bl	draw_point2
	mov	r0, #89
	mov	r1, #62
	ldr	r2, .L99
	bl	draw_point2
	mov	r0, #91
	mov	r1, #62
	ldr	r2, .L99
	bl	draw_point2
	mov	r0, #94
	mov	r1, #62
	ldr	r2, .L99
	bl	draw_point2
	mov	r0, #98
	mov	r1, #62
	ldr	r2, .L99
	bl	draw_point2
	mov	r0, #99
	mov	r1, #62
	ldr	r2, .L99
	bl	draw_point2
	mov	r0, #100
	mov	r1, #62
	ldr	r2, .L99
	bl	draw_point2
	mov	r0, #101
	mov	r1, #62
	ldr	r2, .L99
	bl	draw_point2
	mov	r0, #102
	mov	r1, #62
	ldr	r2, .L99
	bl	draw_point2
	mov	r0, #26
	mov	r1, #63
	ldr	r2, .L99
	bl	draw_point2
	mov	r0, #29
	mov	r1, #63
	ldr	r2, .L99
	bl	draw_point2
	mov	r0, #31
	mov	r1, #63
	ldr	r2, .L99
	bl	draw_point2
	mov	r0, #36
	mov	r1, #63
	ldr	r2, .L99
	bl	draw_point2
	mov	r0, #44
	mov	r1, #63
	ldr	r2, .L99
	bl	draw_point2
	mov	r0, #49
	mov	r1, #63
	ldr	r2, .L99
	bl	draw_point2
	mov	r0, #53
	mov	r1, #63
	ldr	r2, .L99
	bl	draw_point2
	mov	r0, #56
	mov	r1, #63
	ldr	r2, .L99
	bl	draw_point2
	mov	r0, #62
	mov	r1, #63
	ldr	r2, .L99
	bl	draw_point2
	mov	r0, #65
	mov	r1, #63
	ldr	r2, .L99
	bl	draw_point2
	mov	r0, #68
	mov	r1, #63
	ldr	r2, .L99
	bl	draw_point2
	mov	r0, #73
	mov	r1, #63
	ldr	r2, .L99
	bl	draw_point2
	mov	r0, #76
	mov	r1, #63
	ldr	r2, .L99
	bl	draw_point2
	mov	r0, #78
	mov	r1, #63
	ldr	r2, .L99
	bl	draw_point2
	mov	r0, #83
	mov	r1, #63
	ldr	r2, .L99
	bl	draw_point2
	mov	r0, #86
	mov	r1, #63
	ldr	r2, .L99
	bl	draw_point2
	mov	r0, #89
	mov	r1, #63
	ldr	r2, .L99
	bl	draw_point2
	mov	r0, #91
	mov	r1, #63
	ldr	r2, .L99
	bl	draw_point2
	mov	r0, #94
	mov	r1, #63
	ldr	r2, .L99
	bl	draw_point2
	mov	r0, #26
	mov	r1, #64
	ldr	r2, .L99
	bl	draw_point2
	mov	r0, #27
	mov	r1, #64
	ldr	r2, .L99
	bl	draw_point2
	mov	r0, #28
	mov	r1, #64
	ldr	r2, .L99
	bl	draw_point2
	mov	r0, #31
	mov	r1, #64
	ldr	r2, .L99
	bl	draw_point2
	mov	r0, #37
	mov	r1, #64
	ldr	r2, .L99
	bl	draw_point2
	mov	r0, #38
	mov	r1, #64
	ldr	r2, .L99
	bl	draw_point2
	mov	r0, #41
	mov	r1, #64
	ldr	r2, .L99
	bl	draw_point2
	mov	r0, #42
	mov	r1, #64
	ldr	r2, .L99
	bl	draw_point2
	mov	r0, #43
	mov	r1, #64
	ldr	r2, .L99
	bl	draw_point2
	mov	r0, #46
	mov	r1, #64
	ldr	r2, .L99
	bl	draw_point2
	mov	r0, #47
	mov	r1, #64
	ldr	r2, .L99
	bl	draw_point2
	mov	r0, #48
	mov	r1, #64
	ldr	r2, .L99
	bl	draw_point2
	mov	r0, #53
	mov	r1, #64
	ldr	r2, .L99
	bl	draw_point2
	mov	r0, #56
	mov	r1, #64
	ldr	r2, .L99
	bl	draw_point2
	mov	r0, #62
	mov	r1, #64
	ldr	r2, .L99
	bl	draw_point2
	mov	r0, #63
	mov	r1, #64
	ldr	r2, .L99
	bl	draw_point2
	mov	r0, #66
	mov	r1, #64
	ldr	r2, .L99
	bl	draw_point2
	mov	r0, #67
	mov	r1, #64
	ldr	r2, .L99
	bl	draw_point2
	mov	r0, #73
	mov	r1, #64
	ldr	r2, .L99
	bl	draw_point2
	mov	r0, #74
	mov	r1, #64
	ldr	r2, .L99
	bl	draw_point2
	mov	r0, #75
	mov	r1, #64
	ldr	r2, .L99
	bl	draw_point2
	mov	r0, #79
	mov	r1, #64
	ldr	r2, .L99
	bl	draw_point2
	mov	r0, #80
	mov	r1, #64
	ldr	r2, .L99
	bl	draw_point2
	mov	r0, #84
	mov	r1, #64
	ldr	r2, .L99
	bl	draw_point2
	mov	r0, #85
	mov	r1, #64
	ldr	r2, .L99
	bl	draw_point2
	mov	r0, #86
	mov	r1, #64
	ldr	r2, .L99
	bl	draw_point2
	mov	r0, #89
	mov	r1, #64
	ldr	r2, .L99
	bl	draw_point2
	mov	r0, #91
	mov	r1, #64
	ldr	r2, .L99
	bl	draw_point2
	mov	r0, #94
	mov	r1, #64
	ldr	r2, .L99
	bl	draw_point2
	mov	r0, #26
	mov	r1, #65
	ldr	r2, .L99
	bl	draw_point2
	mov	r0, #86
	mov	r1, #65
	ldr	r2, .L99
	bl	draw_point2
	mov	r0, #26
	mov	r1, #66
	ldr	r2, .L99
	bl	draw_point2
	mov	r0, #84
	mov	r1, #66
	ldr	r2, .L99
	bl	draw_point2
	mov	r0, #85
	mov	r1, #66
	ldr	r2, .L99
	bl	draw_point2
	sub	sp, fp, #4
	@ sp needed
	ldmfd	sp!, {fp, lr}
	bx	lr
.L100:
	.align	2
.L99:
	.word	32767
	.size	draw_title, .-draw_title
	.align	2
	.global	sleep
	.type	sleep, %function
sleep:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 16
	@ frame_needed = 1, uses_anonymous_args = 0
	@ link register save eliminated.
	str	fp, [sp, #-4]!
	add	fp, sp, #0
	sub	sp, sp, #20
	str	r0, [fp, #-16]
	mov	r3, #0
	str	r3, [fp, #-8]
	b	.L102
.L103:
	ldr	r3, [fp, #-8]
	add	r3, r3, #1
	str	r3, [fp, #-8]
.L102:
	ldr	r2, [fp, #-8]
	ldr	r3, [fp, #-16]
	cmp	r2, r3
	blt	.L103
	sub	sp, fp, #0
	@ sp needed
	ldr	fp, [sp], #4
	bx	lr
	.size	sleep, .-sleep
	.ident	"GCC: (GNU Tools for ARM Embedded Processors) 4.8.4 20140725 (release) [ARM/embedded-4_8-branch revision 213147]"
