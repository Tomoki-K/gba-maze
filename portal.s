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
	.file	"portal.c"
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
	mov	r3, #1
	strh	r3, [fp, #-36]	@ movhi
	mov	r3, #16
	strh	r3, [fp, #-38]	@ movhi
	mov	r3, #32
	strh	r3, [fp, #-40]	@ movhi
	mov	r3, #64
	strh	r3, [fp, #-42]	@ movhi
	mov	r3, #128
	strh	r3, [fp, #-44]	@ movhi
	mvn	r3, #32768
	strh	r3, [fp, #-46]	@ movhi
	mov	r3, #31
	strh	r3, [fp, #-48]	@ movhi
	mov	r3, #0
	strh	r3, [fp, #-50]	@ movhi
	mov	r3, #31744
	strh	r3, [fp, #-52]	@ movhi
	ldr	r3, .L27
	strh	r3, [fp, #-54]	@ movhi
	mov	r3, #67108864
	str	r3, [fp, #-16]
	ldr	r3, [fp, #-16]
	ldr	r2, .L27+4
	strh	r2, [r3]	@ movhi
.L26:
	bl	draw_title
.L3:
	ldr	r3, .L27+8
	str	r3, [fp, #-20]
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
	beq	.L2
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
	beq	.L2
	b	.L3
.L2:
	ldrh	r3, [fp, #-46]	@ movhi
	mov	r3, r3, asl #16
	mov	r3, r3, lsr #16
	mov	r0, r3
	bl	draw_bg
	ldrh	r3, [fp, #-50]	@ movhi
	mov	r3, r3, asl #16
	mov	r3, r3, lsr #16
	mov	r0, r3
	bl	draw_wall
	mov	r3, #8
	str	r3, [fp, #-8]
	mov	r3, #8
	str	r3, [fp, #-12]
.L24:
	ldr	r3, .L27+8
	str	r3, [fp, #-20]
	ldr	r3, [fp, #-8]
	str	r3, [fp, #-24]
	ldr	r3, [fp, #-12]
	str	r3, [fp, #-28]
	ldr	r3, .L27+12
	str	r3, [fp, #-32]
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
	bne	.L4
	ldr	r0, [fp, #-8]
	ldr	r1, [fp, #-12]
	bl	moveRight
	str	r0, [fp, #-8]
	b	.L5
.L4:
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
	bne	.L6
	ldr	r0, [fp, #-8]
	ldr	r1, [fp, #-12]
	bl	moveLeft
	str	r0, [fp, #-8]
	b	.L5
.L6:
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
	bne	.L7
	ldr	r0, [fp, #-8]
	ldr	r1, [fp, #-12]
	bl	moveUp
	str	r0, [fp, #-12]
	b	.L5
.L7:
	ldr	r3, [fp, #-20]
	ldrh	r3, [r3]	@ movhi
	mov	r3, r3, asl #16
	mov	r2, r3, lsr #16
	ldrh	r3, [fp, #-44]	@ movhi
	mov	r3, r3, asl #16
	mov	r3, r3, lsr #16
	and	r3, r2, r3
	mov	r3, r3, asl #16
	mov	r3, r3, lsr #16
	cmp	r3, #0
	bne	.L5
	ldr	r0, [fp, #-8]
	ldr	r1, [fp, #-12]
	bl	moveDown
	str	r0, [fp, #-12]
.L5:
	ldrh	r3, [fp, #-52]	@ movhi
	mov	r3, r3, asl #16
	mov	r3, r3, lsr #16
	mov	r0, #5
	mov	r1, #1
	mov	r2, r3
	bl	draw_portal
	ldrh	r3, [fp, #-54]	@ movhi
	mov	r3, r3, asl #16
	mov	r3, r3, lsr #16
	mov	r0, #1
	mov	r1, #3
	mov	r2, r3
	bl	draw_portal
	ldrh	r3, [fp, #-52]	@ movhi
	mov	r3, r3, asl #16
	mov	r3, r3, lsr #16
	mov	r0, #9
	mov	r1, #2
	mov	r2, r3
	bl	draw_portal
	ldrh	r3, [fp, #-54]	@ movhi
	mov	r3, r3, asl #16
	mov	r3, r3, lsr #16
	mov	r0, #1
	mov	r1, #18
	mov	r2, r3
	bl	draw_portal
	ldrh	r3, [fp, #-52]	@ movhi
	mov	r3, r3, asl #16
	mov	r3, r3, lsr #16
	mov	r0, #6
	mov	r1, #18
	mov	r2, r3
	bl	draw_portal
	ldrh	r3, [fp, #-54]	@ movhi
	mov	r3, r3, asl #16
	mov	r3, r3, lsr #16
	mov	r0, #28
	mov	r1, #1
	mov	r2, r3
	bl	draw_portal
	ldrh	r3, [fp, #-52]	@ movhi
	mov	r3, r3, asl #16
	mov	r3, r3, lsr #16
	mov	r0, #18
	mov	r1, #14
	mov	r2, r3
	bl	draw_portal
	ldrh	r3, [fp, #-54]	@ movhi
	mov	r3, r3, asl #16
	mov	r3, r3, lsr #16
	mov	r0, #16
	mov	r1, #18
	mov	r2, r3
	bl	draw_portal
	ldrh	r3, [fp, #-52]	@ movhi
	mov	r3, r3, asl #16
	mov	r3, r3, lsr #16
	mov	r0, #7
	mov	r1, #16
	mov	r2, r3
	bl	draw_portal
	ldrh	r3, [fp, #-54]	@ movhi
	mov	r3, r3, asl #16
	mov	r3, r3, lsr #16
	mov	r0, #9
	mov	r1, #10
	mov	r2, r3
	bl	draw_portal
	ldrh	r3, [fp, #-52]	@ movhi
	mov	r3, r3, asl #16
	mov	r3, r3, lsr #16
	mov	r0, #9
	mov	r1, #4
	mov	r2, r3
	bl	draw_portal
	ldrh	r3, [fp, #-54]	@ movhi
	mov	r3, r3, asl #16
	mov	r3, r3, lsr #16
	mov	r0, #18
	mov	r1, #10
	mov	r2, r3
	bl	draw_portal
	ldrh	r3, [fp, #-52]	@ movhi
	mov	r3, r3, asl #16
	mov	r3, r3, lsr #16
	mov	r0, #19
	mov	r1, #7
	mov	r2, r3
	bl	draw_portal
	ldrh	r3, [fp, #-54]	@ movhi
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
	bne	.L8
	mov	r3, #8
	str	r3, [fp, #-8]
	mov	r3, #32
	str	r3, [fp, #-12]
.L8:
	ldr	r3, [fp, #-8]
	mov	r3, r3, asl #16
	mov	r2, r3, lsr #16
	ldr	r3, [fp, #-12]
	mov	r3, r3, asl #16
	mov	r3, r3, lsr #16
	mov	r0, r2
	mov	r1, r3
	mov	r2, #1
	mov	r3, #3
	bl	on_portal
	mov	r3, r0
	cmp	r3, #1
	bne	.L9
	mov	r3, #32
	str	r3, [fp, #-8]
	mov	r3, #8
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
	mov	r3, #136
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
	mov	r2, #1
	mov	r3, #18
	bl	on_portal
	mov	r3, r0
	cmp	r3, #1
	bne	.L11
	mov	r3, #72
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
	mov	r2, #6
	mov	r3, #18
	bl	on_portal
	mov	r3, r0
	cmp	r3, #1
	bne	.L12
	mov	r3, #216
	str	r3, [fp, #-8]
	mov	r3, #8
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
	mov	r2, #28
	mov	r3, #1
	bl	on_portal
	mov	r3, r0
	cmp	r3, #1
	bne	.L13
	mov	r3, #40
	str	r3, [fp, #-8]
	mov	r3, #144
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
	mov	r2, #18
	mov	r3, #14
	bl	on_portal
	mov	r3, r0
	cmp	r3, #1
	bne	.L14
	mov	r3, #120
	str	r3, [fp, #-8]
	mov	r3, #144
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
	mov	r2, #16
	mov	r3, #18
	bl	on_portal
	mov	r3, r0
	cmp	r3, #1
	bne	.L15
	mov	r3, #144
	str	r3, [fp, #-8]
	mov	r3, #120
	str	r3, [fp, #-12]
.L15:
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
	bne	.L16
	mov	r3, #72
	str	r3, [fp, #-8]
	mov	r3, #88
	str	r3, [fp, #-12]
.L16:
	ldr	r3, [fp, #-8]
	mov	r3, r3, asl #16
	mov	r2, r3, lsr #16
	ldr	r3, [fp, #-12]
	mov	r3, r3, asl #16
	mov	r3, r3, lsr #16
	mov	r0, r2
	mov	r1, r3
	mov	r2, #9
	mov	r3, #10
	bl	on_portal
	mov	r3, r0
	cmp	r3, #1
	bne	.L17
	mov	r3, #56
	str	r3, [fp, #-8]
	mov	r3, #128
	str	r3, [fp, #-12]
.L17:
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
	bne	.L18
	mov	r3, #144
	str	r3, [fp, #-8]
	mov	r3, #72
	str	r3, [fp, #-12]
.L18:
	ldr	r3, [fp, #-8]
	mov	r3, r3, asl #16
	mov	r2, r3, lsr #16
	ldr	r3, [fp, #-12]
	mov	r3, r3, asl #16
	mov	r3, r3, lsr #16
	mov	r0, r2
	mov	r1, r3
	mov	r2, #18
	mov	r3, #10
	bl	on_portal
	mov	r3, r0
	cmp	r3, #1
	bne	.L19
	mov	r3, #80
	str	r3, [fp, #-8]
	mov	r3, #32
	str	r3, [fp, #-12]
.L19:
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
	bne	.L20
	mov	r3, #224
	str	r3, [fp, #-8]
	mov	r3, #120
	str	r3, [fp, #-12]
.L20:
	ldr	r3, [fp, #-8]
	mov	r3, r3, asl #16
	mov	r2, r3, lsr #16
	ldr	r3, [fp, #-12]
	mov	r3, r3, asl #16
	mov	r3, r3, lsr #16
	mov	r0, r2
	mov	r1, r3
	mov	r2, #28
	mov	r3, #14
	bl	on_portal
	mov	r3, r0
	cmp	r3, #1
	bne	.L21
	mov	r3, #144
	str	r3, [fp, #-8]
	mov	r3, #56
	str	r3, [fp, #-12]
.L21:
	ldrh	r3, [fp, #-46]	@ movhi
	mov	r3, r3, asl #16
	mov	r3, r3, lsr #16
	ldr	r0, [fp, #-24]
	ldr	r1, [fp, #-28]
	mov	r2, r3
	bl	draw_point
	ldrh	r3, [fp, #-48]	@ movhi
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
	bne	.L22
	ldr	r0, .L27+16
	bl	sleep
	ldrh	r3, [fp, #-46]	@ movhi
	mov	r3, r3, asl #16
	mov	r3, r3, lsr #16
	mov	r0, r3
	bl	draw_bg
	bl	draw_ending
	b	.L23
.L22:
	ldr	r0, [fp, #-32]
	bl	sleep
	b	.L24
.L23:
	ldr	r3, .L27+8
	str	r3, [fp, #-20]
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
	beq	.L25
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
	beq	.L25
	b	.L23
.L25:
	b	.L26
.L28:
	.align	2
.L27:
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
	bhi	.L30
	ldrh	r3, [fp, #-8]	@ movhi
	mov	r3, r3, asl #16
	mov	r2, r3, lsr #16
	ldrh	r3, [fp, #-16]	@ movhi
	mov	r3, r3, asl #16
	mov	r3, r3, lsr #16
	cmp	r2, r3
	bhi	.L30
	ldrh	r3, [fp, #-14]	@ movhi
	mov	r3, r3, asl #16
	mov	r3, r3, lsr #16
	mov	r2, r3
	ldrh	r3, [fp, #-6]	@ movhi
	mov	r3, r3, asl #16
	mov	r3, r3, lsr #16
	add	r3, r3, #5
	cmp	r2, r3
	bge	.L30
	ldrh	r3, [fp, #-16]	@ movhi
	mov	r3, r3, asl #16
	mov	r3, r3, lsr #16
	mov	r2, r3
	ldrh	r3, [fp, #-8]	@ movhi
	mov	r3, r3, asl #16
	mov	r3, r3, lsr #16
	add	r3, r3, #5
	cmp	r2, r3
	bge	.L30
	mov	r3, #1
	b	.L31
.L30:
	mov	r3, #0
.L31:
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
	b	.L33
.L36:
	ldr	r3, [fp, #-8]
	ldrh	r3, [r3]	@ movhi
	mov	r3, r3, asl #16
	mov	r3, r3, lsr #16
	cmp	r3, #0
	bne	.L34
	mov	r3, #1
	strh	r3, [fp, #-14]	@ movhi
	b	.L35
.L34:
	ldr	r3, [fp, #-8]
	add	r3, r3, #480
	str	r3, [fp, #-8]
	ldr	r3, [fp, #-12]
	add	r3, r3, #1
	str	r3, [fp, #-12]
.L33:
	ldr	r3, [fp, #-12]
	cmp	r3, #3
	ble	.L36
.L35:
	ldrh	r3, [fp, #-14]	@ movhi
	mov	r3, r3, asl #16
	mov	r3, r3, lsr #16
	cmp	r3, #0
	bne	.L37
	ldr	r3, [fp, #-24]
	add	r3, r3, #1
	str	r3, [fp, #-24]
	ldr	r3, [fp, #-24]
	b	.L38
.L37:
	ldr	r3, [fp, #-24]
.L38:
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
	b	.L40
.L43:
	ldr	r3, [fp, #-8]
	ldrh	r3, [r3]	@ movhi
	mov	r3, r3, asl #16
	mov	r3, r3, lsr #16
	cmp	r3, #0
	bne	.L41
	mov	r3, #1
	strh	r3, [fp, #-14]	@ movhi
	b	.L42
.L41:
	ldr	r3, [fp, #-8]
	add	r3, r3, #480
	str	r3, [fp, #-8]
	ldr	r3, [fp, #-12]
	add	r3, r3, #1
	str	r3, [fp, #-12]
.L40:
	ldr	r3, [fp, #-12]
	cmp	r3, #3
	ble	.L43
.L42:
	ldrh	r3, [fp, #-14]	@ movhi
	mov	r3, r3, asl #16
	mov	r3, r3, lsr #16
	cmp	r3, #0
	bne	.L44
	ldr	r3, [fp, #-24]
	sub	r3, r3, #1
	str	r3, [fp, #-24]
	ldr	r3, [fp, #-24]
	b	.L45
.L44:
	ldr	r3, [fp, #-24]
.L45:
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
	b	.L47
.L50:
	ldr	r3, [fp, #-8]
	ldrh	r3, [r3]	@ movhi
	mov	r3, r3, asl #16
	mov	r3, r3, lsr #16
	cmp	r3, #0
	bne	.L48
	mov	r3, #1
	strh	r3, [fp, #-14]	@ movhi
	b	.L49
.L48:
	ldr	r3, [fp, #-8]
	add	r3, r3, #2
	str	r3, [fp, #-8]
	ldr	r3, [fp, #-12]
	add	r3, r3, #1
	str	r3, [fp, #-12]
.L47:
	ldr	r3, [fp, #-12]
	cmp	r3, #3
	ble	.L50
.L49:
	ldrh	r3, [fp, #-14]	@ movhi
	mov	r3, r3, asl #16
	mov	r3, r3, lsr #16
	cmp	r3, #0
	bne	.L51
	ldr	r3, [fp, #-28]
	sub	r3, r3, #1
	str	r3, [fp, #-28]
	ldr	r3, [fp, #-28]
	b	.L52
.L51:
	ldr	r3, [fp, #-28]
.L52:
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
	b	.L54
.L57:
	ldr	r3, [fp, #-8]
	ldrh	r3, [r3]	@ movhi
	mov	r3, r3, asl #16
	mov	r3, r3, lsr #16
	cmp	r3, #0
	bne	.L55
	mov	r3, #1
	strh	r3, [fp, #-14]	@ movhi
	b	.L56
.L55:
	ldr	r3, [fp, #-8]
	add	r3, r3, #2
	str	r3, [fp, #-8]
	ldr	r3, [fp, #-12]
	add	r3, r3, #1
	str	r3, [fp, #-12]
.L54:
	ldr	r3, [fp, #-12]
	cmp	r3, #3
	ble	.L57
.L56:
	ldrh	r3, [fp, #-14]	@ movhi
	mov	r3, r3, asl #16
	mov	r3, r3, lsr #16
	cmp	r3, #0
	bne	.L58
	ldr	r3, [fp, #-28]
	add	r3, r3, #1
	str	r3, [fp, #-28]
	ldr	r3, [fp, #-28]
	b	.L59
.L58:
	ldr	r3, [fp, #-28]
.L59:
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
	cmp	r3, #1
	ble	.L64
	ldr	r3, [fp, #-8]
	add	r3, r3, #476
	str	r3, [fp, #-8]
	ldr	r3, [fp, #-16]
	add	r3, r3, #1
	str	r3, [fp, #-16]
.L62:
	ldr	r3, [fp, #-16]
	cmp	r3, #1
	ble	.L65
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
	b	.L67
.L70:
	mov	r3, #0
	str	r3, [fp, #-12]
	b	.L68
.L69:
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
.L68:
	ldr	r3, [fp, #-12]
	cmp	r3, #3
	ble	.L69
	ldr	r3, [fp, #-8]
	add	r3, r3, #472
	str	r3, [fp, #-8]
	ldr	r3, [fp, #-16]
	add	r3, r3, #1
	str	r3, [fp, #-16]
.L67:
	ldr	r3, [fp, #-16]
	cmp	r3, #3
	ble	.L70
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
	b	.L72
.L75:
	mov	r3, #0
	str	r3, [fp, #-12]
	b	.L73
.L74:
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
.L73:
	ldr	r3, [fp, #-12]
	cmp	r3, #7
	ble	.L74
	ldr	r3, [fp, #-8]
	add	r3, r3, #464
	str	r3, [fp, #-8]
	ldr	r3, [fp, #-16]
	add	r3, r3, #1
	str	r3, [fp, #-16]
.L72:
	ldr	r3, [fp, #-16]
	cmp	r3, #7
	ble	.L75
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
	b	.L77
.L82:
	mov	r3, #0
	str	r3, [fp, #-12]
	b	.L78
.L81:
	ldr	r3, [fp, #-12]
	cmp	r3, #0
	beq	.L79
	ldr	r3, [fp, #-12]
	cmp	r3, #1
	beq	.L79
	ldr	r3, [fp, #-12]
	cmp	r3, #6
	beq	.L79
	ldr	r3, [fp, #-12]
	cmp	r3, #7
	beq	.L79
	ldr	r3, [fp, #-16]
	cmp	r3, #0
	beq	.L79
	ldr	r3, [fp, #-16]
	cmp	r3, #1
	beq	.L79
	ldr	r3, [fp, #-16]
	cmp	r3, #6
	beq	.L79
	ldr	r3, [fp, #-16]
	cmp	r3, #7
	bne	.L80
.L79:
	ldrh	r3, [fp, #-26]	@ movhi
	mov	r3, r3, asl #16
	mov	r2, r3, lsr #16
	ldr	r3, [fp, #-8]
	strh	r2, [r3]	@ movhi
.L80:
	ldr	r3, [fp, #-8]
	add	r3, r3, #2
	str	r3, [fp, #-8]
	ldr	r3, [fp, #-12]
	add	r3, r3, #1
	str	r3, [fp, #-12]
.L78:
	ldr	r3, [fp, #-12]
	cmp	r3, #7
	ble	.L81
	ldr	r3, [fp, #-8]
	add	r3, r3, #464
	str	r3, [fp, #-8]
	ldr	r3, [fp, #-16]
	add	r3, r3, #1
	str	r3, [fp, #-16]
.L77:
	ldr	r3, [fp, #-16]
	cmp	r3, #7
	ble	.L82
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
	ldr	r2, .L84
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
	ldr	r2, .L84+4
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
	ldr	r2, .L84+4
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
	ldr	r2, .L84+4
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
	ldr	r2, .L84+4
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
	ldr	r2, .L84+4
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
	ldr	r2, .L84+4
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
	ldr	r2, .L84+4
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
	ldr	r2, .L84+4
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
	ldr	r2, .L84+4
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
	ldr	r2, .L84+4
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
	ldr	r2, .L84+4
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
	ldr	r2, .L84+4
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
	ldr	r2, .L84+4
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
	ldr	r2, .L84+4
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
	ldr	r2, .L84+4
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
	ldr	r2, .L84+4
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
	ldr	r2, .L84+4
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
	ldr	r2, .L84+4
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
	ldr	r2, .L84+4
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
	ldr	r2, .L84+4
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
	ldr	r2, .L84+4
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
	ldr	r2, .L84+4
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
	ldr	r2, .L84+4
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
	ldr	r2, .L84+4
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
	ldr	r2, .L84+4
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
	ldr	r2, .L84+4
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
	ldr	r2, .L84+4
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
	ldr	r2, .L84+4
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
	ldr	r2, .L84+4
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
	ldr	r2, .L84+4
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
	ldr	r2, .L84+4
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
	ldr	r2, .L84+4
	bl	draw_dot
	sub	sp, fp, #4
	@ sp needed
	ldmfd	sp!, {fp, lr}
	bx	lr
.L85:
	.align	2
.L84:
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
	ldr	r3, .L92
	mov	r2, #1
	strh	r2, [r3]	@ movhi
	ldr	r3, .L92
	mov	r2, #1
	strh	r2, [r3, #2]	@ movhi
	ldr	r3, .L92
	mov	r2, #1
	strh	r2, [r3, #4]	@ movhi
	ldr	r3, .L92
	mov	r2, #1
	strh	r2, [r3, #6]	@ movhi
	ldr	r3, .L92
	mov	r2, #1
	strh	r2, [r3, #8]	@ movhi
	ldr	r3, .L92
	mov	r2, #1
	strh	r2, [r3, #10]	@ movhi
	ldr	r3, .L92
	mov	r2, #1
	strh	r2, [r3, #12]	@ movhi
	ldr	r3, .L92
	mov	r2, #1
	strh	r2, [r3, #14]	@ movhi
	ldr	r3, .L92
	mov	r2, #1
	strh	r2, [r3, #16]	@ movhi
	ldr	r3, .L92
	mov	r2, #1
	strh	r2, [r3, #18]	@ movhi
	ldr	r3, .L92
	mov	r2, #1
	strh	r2, [r3, #20]	@ movhi
	ldr	r3, .L92
	mov	r2, #1
	strh	r2, [r3, #22]	@ movhi
	ldr	r3, .L92
	mov	r2, #1
	strh	r2, [r3, #24]	@ movhi
	ldr	r3, .L92
	mov	r2, #1
	strh	r2, [r3, #26]	@ movhi
	ldr	r3, .L92
	mov	r2, #1
	strh	r2, [r3, #28]	@ movhi
	ldr	r3, .L92
	mov	r2, #1
	strh	r2, [r3, #30]	@ movhi
	ldr	r3, .L92
	mov	r2, #1
	strh	r2, [r3, #32]	@ movhi
	ldr	r3, .L92
	mov	r2, #1
	strh	r2, [r3, #34]	@ movhi
	ldr	r3, .L92
	mov	r2, #1
	strh	r2, [r3, #36]	@ movhi
	ldr	r3, .L92
	mov	r2, #1
	strh	r2, [r3, #38]	@ movhi
	ldr	r3, .L92
	mov	r2, #1
	strh	r2, [r3, #40]	@ movhi
	ldr	r3, .L92
	mov	r2, #1
	strh	r2, [r3, #42]	@ movhi
	ldr	r3, .L92
	mov	r2, #1
	strh	r2, [r3, #44]	@ movhi
	ldr	r3, .L92
	mov	r2, #1
	strh	r2, [r3, #46]	@ movhi
	ldr	r3, .L92
	mov	r2, #1
	strh	r2, [r3, #48]	@ movhi
	ldr	r3, .L92
	mov	r2, #1
	strh	r2, [r3, #50]	@ movhi
	ldr	r3, .L92
	mov	r2, #1
	strh	r2, [r3, #52]	@ movhi
	ldr	r3, .L92
	mov	r2, #1
	strh	r2, [r3, #54]	@ movhi
	ldr	r3, .L92
	mov	r2, #1
	strh	r2, [r3, #56]	@ movhi
	ldr	r3, .L92
	mov	r2, #1
	strh	r2, [r3, #58]	@ movhi
	ldr	r3, .L92
	mov	r2, #1
	strh	r2, [r3, #60]	@ movhi
	ldr	r3, .L92
	mov	r2, #0
	strh	r2, [r3, #62]	@ movhi
	ldr	r3, .L92
	mov	r2, #0
	strh	r2, [r3, #64]	@ movhi
	ldr	r3, .L92
	mov	r2, #0
	strh	r2, [r3, #66]	@ movhi
	ldr	r3, .L92
	mov	r2, #0
	strh	r2, [r3, #68]	@ movhi
	ldr	r3, .L92
	mov	r2, #0
	strh	r2, [r3, #70]	@ movhi
	ldr	r3, .L92
	mov	r2, #1
	strh	r2, [r3, #72]	@ movhi
	ldr	r3, .L92
	mov	r2, #0
	strh	r2, [r3, #74]	@ movhi
	ldr	r3, .L92
	mov	r2, #0
	strh	r2, [r3, #76]	@ movhi
	ldr	r3, .L92
	mov	r2, #0
	strh	r2, [r3, #78]	@ movhi
	ldr	r3, .L92
	mov	r2, #1
	strh	r2, [r3, #80]	@ movhi
	ldr	r3, .L92
	mov	r2, #0
	strh	r2, [r3, #82]	@ movhi
	ldr	r3, .L92
	mov	r2, #0
	strh	r2, [r3, #84]	@ movhi
	ldr	r3, .L92
	mov	r2, #0
	strh	r2, [r3, #86]	@ movhi
	ldr	r3, .L92
	mov	r2, #0
	strh	r2, [r3, #88]	@ movhi
	ldr	r3, .L92
	mov	r2, #1
	strh	r2, [r3, #90]	@ movhi
	ldr	r3, .L92
	mov	r2, #0
	strh	r2, [r3, #92]	@ movhi
	ldr	r3, .L92
	mov	r2, #0
	strh	r2, [r3, #94]	@ movhi
	ldr	r3, .L92
	mov	r2, #0
	strh	r2, [r3, #96]	@ movhi
	ldr	r3, .L92
	mov	r2, #0
	strh	r2, [r3, #98]	@ movhi
	ldr	r3, .L92
	mov	r2, #0
	strh	r2, [r3, #100]	@ movhi
	ldr	r3, .L92
	mov	r2, #0
	strh	r2, [r3, #102]	@ movhi
	ldr	r3, .L92
	mov	r2, #0
	strh	r2, [r3, #104]	@ movhi
	ldr	r3, .L92
	mov	r2, #0
	strh	r2, [r3, #106]	@ movhi
	ldr	r3, .L92
	mov	r2, #0
	strh	r2, [r3, #108]	@ movhi
	ldr	r3, .L92
	mov	r2, #1
	strh	r2, [r3, #110]	@ movhi
	ldr	r3, .L92
	mov	r2, #0
	strh	r2, [r3, #112]	@ movhi
	ldr	r3, .L92
	mov	r2, #0
	strh	r2, [r3, #114]	@ movhi
	ldr	r3, .L92
	mov	r2, #0
	strh	r2, [r3, #116]	@ movhi
	ldr	r3, .L92
	mov	r2, #1
	strh	r2, [r3, #118]	@ movhi
	ldr	r3, .L92
	mov	r2, #1
	strh	r2, [r3, #120]	@ movhi
	ldr	r3, .L92
	mov	r2, #1
	strh	r2, [r3, #122]	@ movhi
	ldr	r3, .L92
	mov	r2, #1
	strh	r2, [r3, #124]	@ movhi
	ldr	r3, .L92
	mov	r2, #1
	strh	r2, [r3, #126]	@ movhi
	ldr	r3, .L92
	mov	r2, #1
	strh	r2, [r3, #128]	@ movhi
	ldr	r3, .L92
	mov	r2, #1
	strh	r2, [r3, #130]	@ movhi
	ldr	r3, .L92
	mov	r2, #1
	strh	r2, [r3, #132]	@ movhi
	ldr	r3, .L92
	mov	r2, #0
	strh	r2, [r3, #134]	@ movhi
	ldr	r3, .L92
	mov	r2, #1
	strh	r2, [r3, #136]	@ movhi
	ldr	r3, .L92
	mov	r2, #0
	strh	r2, [r3, #138]	@ movhi
	ldr	r3, .L92
	mov	r2, #1
	strh	r2, [r3, #140]	@ movhi
	ldr	r3, .L92
	mov	r2, #0
	strh	r2, [r3, #142]	@ movhi
	ldr	r3, .L92
	mov	r2, #1
	strh	r2, [r3, #144]	@ movhi
	ldr	r3, .L92
	mov	r2, #1
	strh	r2, [r3, #146]	@ movhi
	ldr	r3, .L92
	mov	r2, #0
	strh	r2, [r3, #148]	@ movhi
	ldr	r3, .L92
	mov	r2, #1
	strh	r2, [r3, #150]	@ movhi
	ldr	r3, .L92
	mov	r2, #1
	strh	r2, [r3, #152]	@ movhi
	ldr	r3, .L92
	mov	r2, #1
	strh	r2, [r3, #154]	@ movhi
	ldr	r3, .L92
	mov	r2, #1
	strh	r2, [r3, #156]	@ movhi
	ldr	r3, .L92
	mov	r2, #1
	strh	r2, [r3, #158]	@ movhi
	ldr	r3, .L92
	mov	r2, #0
	strh	r2, [r3, #160]	@ movhi
	ldr	r3, .L92
	mov	r2, #1
	strh	r2, [r3, #162]	@ movhi
	ldr	r3, .L92
	mov	r2, #1
	strh	r2, [r3, #164]	@ movhi
	ldr	r3, .L92
	mov	r2, #1
	strh	r2, [r3, #166]	@ movhi
	ldr	r3, .L92
	mov	r2, #0
	strh	r2, [r3, #168]	@ movhi
	ldr	r3, .L92
	mov	r2, #1
	strh	r2, [r3, #170]	@ movhi
	ldr	r3, .L92
	mov	r2, #0
	strh	r2, [r3, #172]	@ movhi
	ldr	r3, .L92
	mov	r2, #1
	strh	r2, [r3, #174]	@ movhi
	ldr	r3, .L92
	mov	r2, #1
	strh	r2, [r3, #176]	@ movhi
	ldr	r3, .L92
	mov	r2, #1
	strh	r2, [r3, #178]	@ movhi
	ldr	r3, .L92
	mov	r2, #1
	strh	r2, [r3, #180]	@ movhi
	ldr	r3, .L92
	mov	r2, #0
	strh	r2, [r3, #182]	@ movhi
	ldr	r3, .L92
	mov	r2, #1
	strh	r2, [r3, #184]	@ movhi
	ldr	r3, .L92
	mov	r2, #0
	strh	r2, [r3, #186]	@ movhi
	ldr	r3, .L92
	mov	r2, #1
	strh	r2, [r3, #188]	@ movhi
	ldr	r3, .L92
	mov	r2, #0
	strh	r2, [r3, #190]	@ movhi
	ldr	r3, .L92
	mov	r2, #0
	strh	r2, [r3, #192]	@ movhi
	ldr	r3, .L92
	mov	r2, #0
	strh	r2, [r3, #194]	@ movhi
	ldr	r3, .L92
	mov	r2, #1
	strh	r2, [r3, #196]	@ movhi
	ldr	r3, .L92
	mov	r2, #1
	strh	r2, [r3, #198]	@ movhi
	ldr	r3, .L92
	mov	r2, #1
	strh	r2, [r3, #200]	@ movhi
	ldr	r3, .L92
	mov	r2, #0
	strh	r2, [r3, #202]	@ movhi
	ldr	r3, .L92
	mov	r2, #1
	strh	r2, [r3, #204]	@ movhi
	ldr	r3, .L92
	mov	r2, #0
	strh	r2, [r3, #206]	@ movhi
	ldr	r3, .L92
	mov	r2, #0
	strh	r2, [r3, #208]	@ movhi
	ldr	r3, .L92
	mov	r2, #0
	strh	r2, [r3, #210]	@ movhi
	ldr	r3, .L92
	mov	r2, #0
	strh	r2, [r3, #212]	@ movhi
	ldr	r3, .L92
	mov	r2, #1
	strh	r2, [r3, #214]	@ movhi
	ldr	r3, .L92
	mov	r2, #0
	strh	r2, [r3, #216]	@ movhi
	ldr	r3, .L92
	mov	r2, #0
	strh	r2, [r3, #218]	@ movhi
	ldr	r3, .L92
	mov	r2, #0
	strh	r2, [r3, #220]	@ movhi
	ldr	r3, .L92
	mov	r2, #0
	strh	r2, [r3, #222]	@ movhi
	ldr	r3, .L92
	mov	r2, #1
	strh	r2, [r3, #224]	@ movhi
	ldr	r3, .L92
	mov	r2, #0
	strh	r2, [r3, #226]	@ movhi
	ldr	r3, .L92
	mov	r2, #0
	strh	r2, [r3, #228]	@ movhi
	ldr	r3, .L92
	mov	r2, #1
	strh	r2, [r3, #230]	@ movhi
	ldr	r3, .L92
	mov	r2, #0
	strh	r2, [r3, #232]	@ movhi
	ldr	r3, .L92
	mov	r2, #0
	strh	r2, [r3, #234]	@ movhi
	ldr	r3, .L92
	mov	r2, #0
	strh	r2, [r3, #236]	@ movhi
	ldr	r3, .L92
	mov	r2, #1
	strh	r2, [r3, #238]	@ movhi
	ldr	r3, .L92
	mov	r2, #1
	strh	r2, [r3, #240]	@ movhi
	ldr	r3, .L92
	mov	r2, #0
	strh	r2, [r3, #242]	@ movhi
	ldr	r3, .L92
	mov	r2, #1
	strh	r2, [r3, #244]	@ movhi
	ldr	r3, .L92
	mov	r2, #0
	strh	r2, [r3, #246]	@ movhi
	ldr	r3, .L92
	mov	r2, #1
	strh	r2, [r3, #248]	@ movhi
	ldr	r3, .L92
	mov	r2, #1
	strh	r2, [r3, #250]	@ movhi
	ldr	r3, .L92
	mov	r2, #1
	strh	r2, [r3, #252]	@ movhi
	ldr	r3, .L92
	mov	r2, #0
	strh	r2, [r3, #254]	@ movhi
	ldr	r2, .L92
	mov	r3, #256
	mov	r1, #1
	strh	r1, [r2, r3]	@ movhi
	ldr	r2, .L92
	ldr	r3, .L92+4
	mov	r1, #0
	strh	r1, [r2, r3]	@ movhi
	ldr	r2, .L92
	mov	r3, #260
	mov	r1, #0
	strh	r1, [r2, r3]	@ movhi
	ldr	r2, .L92
	ldr	r3, .L92+8
	mov	r1, #0
	strh	r1, [r2, r3]	@ movhi
	ldr	r2, .L92
	mov	r3, #264
	mov	r1, #1
	strh	r1, [r2, r3]	@ movhi
	ldr	r2, .L92
	ldr	r3, .L92+12
	mov	r1, #0
	strh	r1, [r2, r3]	@ movhi
	ldr	r2, .L92
	mov	r3, #268
	mov	r1, #1
	strh	r1, [r2, r3]	@ movhi
	ldr	r2, .L92
	ldr	r3, .L92+16
	mov	r1, #1
	strh	r1, [r2, r3]	@ movhi
	ldr	r2, .L92
	mov	r3, #272
	mov	r1, #1
	strh	r1, [r2, r3]	@ movhi
	ldr	r2, .L92
	ldr	r3, .L92+20
	mov	r1, #1
	strh	r1, [r2, r3]	@ movhi
	ldr	r2, .L92
	mov	r3, #276
	mov	r1, #0
	strh	r1, [r2, r3]	@ movhi
	ldr	r2, .L92
	ldr	r3, .L92+24
	mov	r1, #1
	strh	r1, [r2, r3]	@ movhi
	ldr	r2, .L92
	mov	r3, #280
	mov	r1, #1
	strh	r1, [r2, r3]	@ movhi
	ldr	r2, .L92
	ldr	r3, .L92+28
	mov	r1, #1
	strh	r1, [r2, r3]	@ movhi
	ldr	r2, .L92
	mov	r3, #284
	mov	r1, #1
	strh	r1, [r2, r3]	@ movhi
	ldr	r2, .L92
	ldr	r3, .L92+32
	mov	r1, #0
	strh	r1, [r2, r3]	@ movhi
	ldr	r2, .L92
	mov	r3, #288
	mov	r1, #1
	strh	r1, [r2, r3]	@ movhi
	ldr	r2, .L92
	ldr	r3, .L92+36
	mov	r1, #1
	strh	r1, [r2, r3]	@ movhi
	ldr	r2, .L92
	mov	r3, #292
	mov	r1, #1
	strh	r1, [r2, r3]	@ movhi
	ldr	r2, .L92
	ldr	r3, .L92+40
	mov	r1, #1
	strh	r1, [r2, r3]	@ movhi
	ldr	r2, .L92
	mov	r3, #296
	mov	r1, #0
	strh	r1, [r2, r3]	@ movhi
	ldr	r2, .L92
	ldr	r3, .L92+44
	mov	r1, #1
	strh	r1, [r2, r3]	@ movhi
	ldr	r2, .L92
	mov	r3, #300
	mov	r1, #1
	strh	r1, [r2, r3]	@ movhi
	ldr	r2, .L92
	ldr	r3, .L92+48
	mov	r1, #0
	strh	r1, [r2, r3]	@ movhi
	ldr	r2, .L92
	mov	r3, #304
	mov	r1, #1
	strh	r1, [r2, r3]	@ movhi
	ldr	r2, .L92
	ldr	r3, .L92+52
	mov	r1, #0
	strh	r1, [r2, r3]	@ movhi
	ldr	r2, .L92
	mov	r3, #308
	mov	r1, #0
	strh	r1, [r2, r3]	@ movhi
	ldr	r2, .L92
	ldr	r3, .L92+56
	mov	r1, #0
	strh	r1, [r2, r3]	@ movhi
	ldr	r2, .L92
	mov	r3, #312
	mov	r1, #1
	strh	r1, [r2, r3]	@ movhi
	ldr	r2, .L92
	ldr	r3, .L92+60
	mov	r1, #0
	strh	r1, [r2, r3]	@ movhi
	ldr	r2, .L92
	mov	r3, #316
	mov	r1, #1
	strh	r1, [r2, r3]	@ movhi
	ldr	r2, .L92
	ldr	r3, .L92+64
	mov	r1, #1
	strh	r1, [r2, r3]	@ movhi
	ldr	r2, .L92
	mov	r3, #320
	mov	r1, #1
	strh	r1, [r2, r3]	@ movhi
	ldr	r2, .L92
	ldr	r3, .L92+68
	mov	r1, #1
	strh	r1, [r2, r3]	@ movhi
	ldr	r2, .L92
	mov	r3, #324
	mov	r1, #1
	strh	r1, [r2, r3]	@ movhi
	ldr	r2, .L92
	ldr	r3, .L92+72
	mov	r1, #0
	strh	r1, [r2, r3]	@ movhi
	ldr	r2, .L92
	mov	r3, #328
	mov	r1, #0
	strh	r1, [r2, r3]	@ movhi
	ldr	r2, .L92
	ldr	r3, .L92+76
	mov	r1, #0
	strh	r1, [r2, r3]	@ movhi
	ldr	r2, .L92
	mov	r3, #332
	mov	r1, #0
	strh	r1, [r2, r3]	@ movhi
	ldr	r2, .L92
	ldr	r3, .L92+80
	mov	r1, #1
	strh	r1, [r2, r3]	@ movhi
	ldr	r2, .L92
	mov	r3, #336
	mov	r1, #0
	strh	r1, [r2, r3]	@ movhi
	ldr	r2, .L92
	ldr	r3, .L92+84
	mov	r1, #0
	strh	r1, [r2, r3]	@ movhi
	ldr	r2, .L92
	mov	r3, #340
	mov	r1, #0
	strh	r1, [r2, r3]	@ movhi
	ldr	r2, .L92
	ldr	r3, .L92+88
	mov	r1, #0
	strh	r1, [r2, r3]	@ movhi
	ldr	r2, .L92
	mov	r3, #344
	mov	r1, #1
	strh	r1, [r2, r3]	@ movhi
	ldr	r2, .L92
	ldr	r3, .L92+92
	mov	r1, #0
	strh	r1, [r2, r3]	@ movhi
	ldr	r2, .L92
	mov	r3, #348
	mov	r1, #0
	strh	r1, [r2, r3]	@ movhi
	ldr	r2, .L92
	ldr	r3, .L92+96
	mov	r1, #0
	strh	r1, [r2, r3]	@ movhi
	ldr	r2, .L92
	mov	r3, #352
	mov	r1, #0
	strh	r1, [r2, r3]	@ movhi
	ldr	r2, .L92
	ldr	r3, .L92+100
	mov	r1, #0
	strh	r1, [r2, r3]	@ movhi
	ldr	r2, .L92
	mov	r3, #356
	mov	r1, #0
	strh	r1, [r2, r3]	@ movhi
	ldr	r2, .L92
	ldr	r3, .L92+104
	mov	r1, #1
	strh	r1, [r2, r3]	@ movhi
	ldr	r2, .L92
	mov	r3, #360
	mov	r1, #1
	strh	r1, [r2, r3]	@ movhi
	ldr	r2, .L92
	ldr	r3, .L92+108
	mov	r1, #0
	strh	r1, [r2, r3]	@ movhi
	ldr	r2, .L92
	mov	r3, #364
	mov	r1, #1
	strh	r1, [r2, r3]	@ movhi
	ldr	r2, .L92
	ldr	r3, .L92+112
	mov	r1, #0
	strh	r1, [r2, r3]	@ movhi
	ldr	r2, .L92
	mov	r3, #368
	mov	r1, #1
	strh	r1, [r2, r3]	@ movhi
	ldr	r2, .L92
	ldr	r3, .L92+116
	mov	r1, #0
	strh	r1, [r2, r3]	@ movhi
	ldr	r2, .L92
	mov	r3, #372
	mov	r1, #1
	strh	r1, [r2, r3]	@ movhi
	ldr	r2, .L92
	ldr	r3, .L92+120
	mov	r1, #0
	strh	r1, [r2, r3]	@ movhi
	ldr	r2, .L92
	mov	r3, #376
	mov	r1, #1
	strh	r1, [r2, r3]	@ movhi
	ldr	r2, .L92
	ldr	r3, .L92+124
	mov	r1, #0
	strh	r1, [r2, r3]	@ movhi
	ldr	r2, .L92
	mov	r3, #380
	mov	r1, #0
	strh	r1, [r2, r3]	@ movhi
	ldr	r2, .L92
	ldr	r3, .L92+128
	mov	r1, #0
	strh	r1, [r2, r3]	@ movhi
	ldr	r2, .L92
	mov	r3, #384
	mov	r1, #0
	strh	r1, [r2, r3]	@ movhi
	ldr	r2, .L92
	ldr	r3, .L92+132
	mov	r1, #0
	strh	r1, [r2, r3]	@ movhi
	ldr	r2, .L92
	mov	r3, #388
	mov	r1, #1
	strh	r1, [r2, r3]	@ movhi
	ldr	r2, .L92
	ldr	r3, .L92+136
	mov	r1, #1
	strh	r1, [r2, r3]	@ movhi
	ldr	r2, .L92
	mov	r3, #392
	mov	r1, #1
	strh	r1, [r2, r3]	@ movhi
	ldr	r2, .L92
	ldr	r3, .L92+140
	mov	r1, #1
	strh	r1, [r2, r3]	@ movhi
	ldr	r2, .L92
	mov	r3, #396
	mov	r1, #1
	strh	r1, [r2, r3]	@ movhi
	ldr	r2, .L92
	ldr	r3, .L92+144
	mov	r1, #1
	strh	r1, [r2, r3]	@ movhi
	ldr	r2, .L92
	mov	r3, #400
	mov	r1, #1
	strh	r1, [r2, r3]	@ movhi
	ldr	r2, .L92
	ldr	r3, .L92+148
	mov	r1, #0
	strh	r1, [r2, r3]	@ movhi
	ldr	r2, .L92
	mov	r3, #404
	mov	r1, #1
	strh	r1, [r2, r3]	@ movhi
	ldr	r2, .L92
	ldr	r3, .L92+152
	mov	r1, #1
	strh	r1, [r2, r3]	@ movhi
	ldr	r2, .L92
	mov	r3, #408
	mov	r1, #1
	strh	r1, [r2, r3]	@ movhi
	ldr	r2, .L92
	ldr	r3, .L92+156
	mov	r1, #1
	strh	r1, [r2, r3]	@ movhi
	ldr	r2, .L92
	mov	r3, #412
	mov	r1, #1
	strh	r1, [r2, r3]	@ movhi
	ldr	r2, .L92
	ldr	r3, .L92+160
	mov	r1, #1
	strh	r1, [r2, r3]	@ movhi
	ldr	r2, .L92
	mov	r3, #416
	mov	r1, #1
	strh	r1, [r2, r3]	@ movhi
	ldr	r2, .L92
	ldr	r3, .L92+164
	mov	r1, #1
	strh	r1, [r2, r3]	@ movhi
	ldr	r2, .L92
	mov	r3, #420
	mov	r1, #1
	strh	r1, [r2, r3]	@ movhi
	ldr	r2, .L92
	ldr	r3, .L92+168
	mov	r1, #0
	strh	r1, [r2, r3]	@ movhi
	ldr	r2, .L92
	mov	r3, #424
	mov	r1, #1
	strh	r1, [r2, r3]	@ movhi
	ldr	r2, .L92
	ldr	r3, .L92+172
	mov	r1, #0
	strh	r1, [r2, r3]	@ movhi
	ldr	r2, .L92
	mov	r3, #428
	mov	r1, #1
	strh	r1, [r2, r3]	@ movhi
	ldr	r2, .L92
	ldr	r3, .L92+176
	mov	r1, #0
	strh	r1, [r2, r3]	@ movhi
	ldr	r2, .L92
	mov	r3, #432
	mov	r1, #1
	strh	r1, [r2, r3]	@ movhi
	ldr	r2, .L92
	ldr	r3, .L92+180
	mov	r1, #0
	strh	r1, [r2, r3]	@ movhi
	ldr	r2, .L92
	mov	r3, #436
	mov	r1, #1
	strh	r1, [r2, r3]	@ movhi
	ldr	r2, .L92
	ldr	r3, .L92+184
	mov	r1, #0
	strh	r1, [r2, r3]	@ movhi
	ldr	r2, .L92
	mov	r3, #440
	mov	r1, #1
	strh	r1, [r2, r3]	@ movhi
	ldr	r2, .L92
	ldr	r3, .L92+188
	mov	r1, #1
	strh	r1, [r2, r3]	@ movhi
	ldr	r2, .L92
	mov	r3, #444
	mov	r1, #1
	strh	r1, [r2, r3]	@ movhi
	ldr	r2, .L92
	ldr	r3, .L92+192
	mov	r1, #1
	strh	r1, [r2, r3]	@ movhi
	ldr	r2, .L92
	mov	r3, #448
	mov	r1, #1
	strh	r1, [r2, r3]	@ movhi
	ldr	r2, .L92
	ldr	r3, .L92+196
	mov	r1, #0
	strh	r1, [r2, r3]	@ movhi
	ldr	r2, .L92
	mov	r3, #452
	mov	r1, #0
	strh	r1, [r2, r3]	@ movhi
	ldr	r2, .L92
	ldr	r3, .L92+200
	mov	r1, #0
	strh	r1, [r2, r3]	@ movhi
	ldr	r2, .L92
	mov	r3, #456
	mov	r1, #0
	strh	r1, [r2, r3]	@ movhi
	ldr	r2, .L92
	ldr	r3, .L92+204
	mov	r1, #0
	strh	r1, [r2, r3]	@ movhi
	ldr	r2, .L92
	mov	r3, #460
	mov	r1, #1
	strh	r1, [r2, r3]	@ movhi
	ldr	r2, .L92
	ldr	r3, .L92+208
	mov	r1, #0
	strh	r1, [r2, r3]	@ movhi
	ldr	r2, .L92
	mov	r3, #464
	mov	r1, #0
	strh	r1, [r2, r3]	@ movhi
	ldr	r2, .L92
	ldr	r3, .L92+212
	mov	r1, #0
	strh	r1, [r2, r3]	@ movhi
	ldr	r2, .L92
	mov	r3, #468
	mov	r1, #0
	strh	r1, [r2, r3]	@ movhi
	ldr	r2, .L92
	ldr	r3, .L92+216
	mov	r1, #0
	strh	r1, [r2, r3]	@ movhi
	ldr	r2, .L92
	mov	r3, #472
	mov	r1, #0
	strh	r1, [r2, r3]	@ movhi
	ldr	r2, .L92
	ldr	r3, .L92+220
	mov	r1, #0
	strh	r1, [r2, r3]	@ movhi
	ldr	r2, .L92
	mov	r3, #476
	mov	r1, #0
	strh	r1, [r2, r3]	@ movhi
	ldr	r2, .L92
	ldr	r3, .L92+224
	mov	r1, #1
	strh	r1, [r2, r3]	@ movhi
	ldr	r2, .L92
	mov	r3, #480
	mov	r1, #1
	strh	r1, [r2, r3]	@ movhi
	ldr	r2, .L92
	ldr	r3, .L92+228
	mov	r1, #0
	strh	r1, [r2, r3]	@ movhi
	ldr	r2, .L92
	mov	r3, #484
	mov	r1, #1
	strh	r1, [r2, r3]	@ movhi
	ldr	r2, .L92
	ldr	r3, .L92+232
	mov	r1, #0
	strh	r1, [r2, r3]	@ movhi
	ldr	r2, .L92
	mov	r3, #488
	mov	r1, #1
	strh	r1, [r2, r3]	@ movhi
	ldr	r2, .L92
	ldr	r3, .L92+236
	mov	r1, #0
	strh	r1, [r2, r3]	@ movhi
	ldr	r2, .L92
	mov	r3, #492
	mov	r1, #1
	strh	r1, [r2, r3]	@ movhi
	ldr	r2, .L92
	ldr	r3, .L92+240
	mov	r1, #0
	strh	r1, [r2, r3]	@ movhi
	ldr	r2, .L92
	mov	r3, #496
	mov	r1, #1
	strh	r1, [r2, r3]	@ movhi
	ldr	r2, .L92
	ldr	r3, .L92+244
	mov	r1, #0
	strh	r1, [r2, r3]	@ movhi
	ldr	r2, .L92
	mov	r3, #500
	mov	r1, #0
	strh	r1, [r2, r3]	@ movhi
	ldr	r2, .L92
	ldr	r3, .L92+248
	mov	r1, #0
	strh	r1, [r2, r3]	@ movhi
	ldr	r2, .L92
	mov	r3, #504
	mov	r1, #1
	strh	r1, [r2, r3]	@ movhi
	ldr	r2, .L92
	ldr	r3, .L92+252
	mov	r1, #0
	strh	r1, [r2, r3]	@ movhi
	ldr	r2, .L92
	mov	r3, #508
	mov	r1, #1
	strh	r1, [r2, r3]	@ movhi
	ldr	r2, .L92
	ldr	r3, .L92+256
	mov	r1, #0
	strh	r1, [r2, r3]	@ movhi
	ldr	r2, .L92
	mov	r3, #512
	mov	r1, #1
	strh	r1, [r2, r3]	@ movhi
	ldr	r2, .L92
	ldr	r3, .L92+260
	mov	r1, #1
	strh	r1, [r2, r3]	@ movhi
	ldr	r2, .L92
	mov	r3, #516
	mov	r1, #1
	strh	r1, [r2, r3]	@ movhi
	ldr	r2, .L92
	ldr	r3, .L92+264
	mov	r1, #1
	strh	r1, [r2, r3]	@ movhi
	ldr	r2, .L92
	mov	r3, #520
	mov	r1, #1
	strh	r1, [r2, r3]	@ movhi
	ldr	r2, .L92
	ldr	r3, .L92+268
	mov	r1, #1
	strh	r1, [r2, r3]	@ movhi
	ldr	r2, .L92
	mov	r3, #524
	mov	r1, #1
	strh	r1, [r2, r3]	@ movhi
	ldr	r2, .L92
	ldr	r3, .L92+272
	mov	r1, #1
	strh	r1, [r2, r3]	@ movhi
	ldr	r2, .L92
	mov	r3, #528
	mov	r1, #1
	strh	r1, [r2, r3]	@ movhi
	ldr	r2, .L92
	ldr	r3, .L92+276
	mov	r1, #1
	strh	r1, [r2, r3]	@ movhi
	ldr	r2, .L92
	mov	r3, #532
	mov	r1, #1
	strh	r1, [r2, r3]	@ movhi
	ldr	r2, .L92
	ldr	r3, .L92+280
	mov	r1, #1
	strh	r1, [r2, r3]	@ movhi
	ldr	r2, .L92
	mov	r3, #536
	mov	r1, #0
	strh	r1, [r2, r3]	@ movhi
	ldr	r2, .L92
	ldr	r3, .L92+284
	mov	r1, #1
	strh	r1, [r2, r3]	@ movhi
	ldr	r2, .L92
	mov	r3, #540
	mov	r1, #1
	strh	r1, [r2, r3]	@ movhi
	ldr	r2, .L92
	ldr	r3, .L92+288
	mov	r1, #0
	strh	r1, [r2, r3]	@ movhi
	ldr	r2, .L92
	mov	r3, #544
	mov	r1, #0
	strh	r1, [r2, r3]	@ movhi
	ldr	r2, .L92
	ldr	r3, .L92+292
	mov	r1, #0
	strh	r1, [r2, r3]	@ movhi
	ldr	r2, .L92
	mov	r3, #548
	mov	r1, #1
	strh	r1, [r2, r3]	@ movhi
	ldr	r2, .L92
	ldr	r3, .L92+296
	mov	r1, #0
	strh	r1, [r2, r3]	@ movhi
	ldr	r2, .L92
	mov	r3, #552
	mov	r1, #1
	strh	r1, [r2, r3]	@ movhi
	ldr	r2, .L92
	ldr	r3, .L92+300
	mov	r1, #0
	strh	r1, [r2, r3]	@ movhi
	ldr	r2, .L92
	mov	r3, #556
	mov	r1, #1
	strh	r1, [r2, r3]	@ movhi
	ldr	r2, .L92
	ldr	r3, .L92+304
	mov	r1, #1
	strh	r1, [r2, r3]	@ movhi
	ldr	r2, .L92
	mov	r3, #560
	mov	r1, #1
	strh	r1, [r2, r3]	@ movhi
	ldr	r2, .L92
	ldr	r3, .L92+308
	mov	r1, #0
	strh	r1, [r2, r3]	@ movhi
	ldr	r2, .L92
	mov	r3, #564
	mov	r1, #1
	strh	r1, [r2, r3]	@ movhi
	ldr	r2, .L92
	ldr	r3, .L92+312
	mov	r1, #0
	strh	r1, [r2, r3]	@ movhi
	ldr	r2, .L92
	mov	r3, #568
	mov	r1, #1
	strh	r1, [r2, r3]	@ movhi
	ldr	r2, .L92
	ldr	r3, .L92+316
	mov	r1, #0
	strh	r1, [r2, r3]	@ movhi
	ldr	r2, .L92
	mov	r3, #572
	mov	r1, #0
	strh	r1, [r2, r3]	@ movhi
	ldr	r2, .L92
	ldr	r3, .L92+320
	mov	r1, #0
	b	.L93
.L94:
	.align	2
.L92:
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
.L93:
	strh	r1, [r2, r3]	@ movhi
	ldr	r2, .L92+876
	mov	r3, #576
	mov	r1, #0
	strh	r1, [r2, r3]	@ movhi
	ldr	r2, .L92+876
	ldr	r3, .L92+324
	mov	r1, #1
	strh	r1, [r2, r3]	@ movhi
	ldr	r2, .L92+876
	mov	r3, #580
	mov	r1, #0
	strh	r1, [r2, r3]	@ movhi
	ldr	r2, .L92+876
	ldr	r3, .L92+328
	mov	r1, #0
	strh	r1, [r2, r3]	@ movhi
	ldr	r2, .L92+876
	mov	r3, #584
	mov	r1, #0
	strh	r1, [r2, r3]	@ movhi
	ldr	r2, .L92+876
	ldr	r3, .L92+332
	mov	r1, #1
	strh	r1, [r2, r3]	@ movhi
	ldr	r2, .L92+876
	mov	r3, #588
	mov	r1, #0
	strh	r1, [r2, r3]	@ movhi
	ldr	r2, .L92+876
	ldr	r3, .L92+336
	mov	r1, #0
	strh	r1, [r2, r3]	@ movhi
	ldr	r2, .L92+876
	mov	r3, #592
	mov	r1, #0
	strh	r1, [r2, r3]	@ movhi
	ldr	r2, .L92+876
	ldr	r3, .L92+340
	mov	r1, #1
	strh	r1, [r2, r3]	@ movhi
	ldr	r2, .L92+876
	mov	r3, #596
	mov	r1, #0
	strh	r1, [r2, r3]	@ movhi
	ldr	r2, .L92+876
	ldr	r3, .L92+344
	mov	r1, #1
	strh	r1, [r2, r3]	@ movhi
	ldr	r2, .L92+876
	mov	r3, #600
	mov	r1, #1
	strh	r1, [r2, r3]	@ movhi
	ldr	r2, .L92+876
	ldr	r3, .L92+348
	mov	r1, #1
	strh	r1, [r2, r3]	@ movhi
	ldr	r2, .L92+876
	mov	r3, #604
	mov	r1, #1
	strh	r1, [r2, r3]	@ movhi
	ldr	r2, .L92+876
	ldr	r3, .L92+352
	mov	r1, #1
	strh	r1, [r2, r3]	@ movhi
	ldr	r2, .L92+876
	mov	r3, #608
	mov	r1, #1
	strh	r1, [r2, r3]	@ movhi
	ldr	r2, .L92+876
	ldr	r3, .L92+356
	mov	r1, #0
	strh	r1, [r2, r3]	@ movhi
	ldr	r2, .L92+876
	mov	r3, #612
	mov	r1, #1
	strh	r1, [r2, r3]	@ movhi
	ldr	r2, .L92+876
	ldr	r3, .L92+360
	mov	r1, #0
	strh	r1, [r2, r3]	@ movhi
	ldr	r2, .L92+876
	mov	r3, #616
	mov	r1, #1
	strh	r1, [r2, r3]	@ movhi
	ldr	r2, .L92+876
	ldr	r3, .L92+364
	mov	r1, #0
	strh	r1, [r2, r3]	@ movhi
	ldr	r2, .L92+876
	mov	r3, #620
	mov	r1, #1
	strh	r1, [r2, r3]	@ movhi
	ldr	r2, .L92+876
	ldr	r3, .L92+368
	mov	r1, #0
	strh	r1, [r2, r3]	@ movhi
	ldr	r2, .L92+876
	mov	r3, #624
	mov	r1, #1
	strh	r1, [r2, r3]	@ movhi
	ldr	r2, .L92+876
	ldr	r3, .L92+372
	mov	r1, #0
	strh	r1, [r2, r3]	@ movhi
	ldr	r2, .L92+876
	mov	r3, #628
	mov	r1, #1
	strh	r1, [r2, r3]	@ movhi
	ldr	r2, .L92+876
	ldr	r3, .L92+376
	mov	r1, #1
	strh	r1, [r2, r3]	@ movhi
	ldr	r2, .L92+876
	mov	r3, #632
	mov	r1, #1
	strh	r1, [r2, r3]	@ movhi
	ldr	r2, .L92+876
	ldr	r3, .L92+380
	mov	r1, #1
	strh	r1, [r2, r3]	@ movhi
	ldr	r2, .L92+876
	mov	r3, #636
	mov	r1, #0
	strh	r1, [r2, r3]	@ movhi
	ldr	r2, .L92+876
	ldr	r3, .L92+384
	mov	r1, #1
	strh	r1, [r2, r3]	@ movhi
	ldr	r2, .L92+876
	mov	r3, #640
	mov	r1, #0
	strh	r1, [r2, r3]	@ movhi
	ldr	r2, .L92+876
	ldr	r3, .L92+388
	mov	r1, #1
	strh	r1, [r2, r3]	@ movhi
	ldr	r2, .L92+876
	mov	r3, #644
	mov	r1, #0
	strh	r1, [r2, r3]	@ movhi
	ldr	r2, .L92+876
	ldr	r3, .L92+392
	mov	r1, #1
	strh	r1, [r2, r3]	@ movhi
	ldr	r2, .L92+876
	mov	r3, #648
	mov	r1, #0
	strh	r1, [r2, r3]	@ movhi
	ldr	r2, .L92+876
	ldr	r3, .L92+396
	mov	r1, #1
	strh	r1, [r2, r3]	@ movhi
	ldr	r2, .L92+876
	mov	r3, #652
	mov	r1, #0
	strh	r1, [r2, r3]	@ movhi
	ldr	r2, .L92+876
	ldr	r3, .L92+400
	mov	r1, #1
	strh	r1, [r2, r3]	@ movhi
	ldr	r2, .L92+876
	mov	r3, #656
	mov	r1, #0
	strh	r1, [r2, r3]	@ movhi
	ldr	r2, .L92+876
	ldr	r3, .L92+404
	mov	r1, #1
	strh	r1, [r2, r3]	@ movhi
	ldr	r2, .L92+876
	mov	r3, #660
	mov	r1, #1
	strh	r1, [r2, r3]	@ movhi
	ldr	r2, .L92+876
	ldr	r3, .L92+408
	mov	r1, #0
	strh	r1, [r2, r3]	@ movhi
	ldr	r2, .L92+876
	mov	r3, #664
	mov	r1, #0
	strh	r1, [r2, r3]	@ movhi
	ldr	r2, .L92+876
	ldr	r3, .L92+412
	mov	r1, #0
	strh	r1, [r2, r3]	@ movhi
	ldr	r2, .L92+876
	mov	r3, #668
	mov	r1, #0
	strh	r1, [r2, r3]	@ movhi
	ldr	r2, .L92+876
	ldr	r3, .L92+416
	mov	r1, #0
	strh	r1, [r2, r3]	@ movhi
	ldr	r2, .L92+876
	mov	r3, #672
	mov	r1, #1
	strh	r1, [r2, r3]	@ movhi
	ldr	r2, .L92+876
	ldr	r3, .L92+420
	mov	r1, #0
	strh	r1, [r2, r3]	@ movhi
	ldr	r2, .L92+876
	mov	r3, #676
	mov	r1, #1
	strh	r1, [r2, r3]	@ movhi
	ldr	r2, .L92+876
	ldr	r3, .L92+424
	mov	r1, #0
	strh	r1, [r2, r3]	@ movhi
	ldr	r2, .L92+876
	mov	r3, #680
	mov	r1, #0
	strh	r1, [r2, r3]	@ movhi
	ldr	r2, .L92+876
	ldr	r3, .L92+428
	mov	r1, #0
	strh	r1, [r2, r3]	@ movhi
	ldr	r2, .L92+876
	mov	r3, #684
	mov	r1, #1
	strh	r1, [r2, r3]	@ movhi
	ldr	r2, .L92+876
	ldr	r3, .L92+432
	mov	r1, #0
	strh	r1, [r2, r3]	@ movhi
	ldr	r2, .L92+876
	mov	r3, #688
	mov	r1, #0
	strh	r1, [r2, r3]	@ movhi
	ldr	r2, .L92+876
	ldr	r3, .L92+436
	mov	r1, #0
	strh	r1, [r2, r3]	@ movhi
	ldr	r2, .L92+876
	mov	r3, #692
	mov	r1, #0
	strh	r1, [r2, r3]	@ movhi
	ldr	r2, .L92+876
	ldr	r3, .L92+440
	mov	r1, #1
	strh	r1, [r2, r3]	@ movhi
	ldr	r2, .L92+876
	mov	r3, #696
	mov	r1, #1
	strh	r1, [r2, r3]	@ movhi
	ldr	r2, .L92+876
	ldr	r3, .L92+444
	mov	r1, #1
	strh	r1, [r2, r3]	@ movhi
	ldr	r2, .L92+876
	mov	r3, #700
	mov	r1, #0
	strh	r1, [r2, r3]	@ movhi
	ldr	r2, .L92+876
	ldr	r3, .L92+448
	mov	r1, #1
	strh	r1, [r2, r3]	@ movhi
	ldr	r2, .L92+876
	mov	r3, #704
	mov	r1, #0
	strh	r1, [r2, r3]	@ movhi
	ldr	r2, .L92+876
	ldr	r3, .L92+452
	mov	r1, #1
	strh	r1, [r2, r3]	@ movhi
	ldr	r2, .L92+876
	mov	r3, #708
	mov	r1, #0
	strh	r1, [r2, r3]	@ movhi
	ldr	r2, .L92+876
	ldr	r3, .L92+456
	mov	r1, #1
	strh	r1, [r2, r3]	@ movhi
	ldr	r2, .L92+876
	mov	r3, #712
	mov	r1, #0
	strh	r1, [r2, r3]	@ movhi
	ldr	r2, .L92+876
	ldr	r3, .L92+460
	mov	r1, #1
	strh	r1, [r2, r3]	@ movhi
	ldr	r2, .L92+876
	mov	r3, #716
	mov	r1, #0
	strh	r1, [r2, r3]	@ movhi
	ldr	r2, .L92+876
	ldr	r3, .L92+464
	mov	r1, #1
	strh	r1, [r2, r3]	@ movhi
	ldr	r2, .L92+876
	mov	r3, #720
	mov	r1, #1
	strh	r1, [r2, r3]	@ movhi
	ldr	r2, .L92+876
	ldr	r3, .L92+468
	mov	r1, #0
	strh	r1, [r2, r3]	@ movhi
	ldr	r2, .L92+876
	mov	r3, #724
	mov	r1, #1
	strh	r1, [r2, r3]	@ movhi
	ldr	r2, .L92+876
	ldr	r3, .L92+472
	mov	r1, #1
	strh	r1, [r2, r3]	@ movhi
	ldr	r2, .L92+876
	mov	r3, #728
	mov	r1, #1
	strh	r1, [r2, r3]	@ movhi
	ldr	r2, .L92+876
	ldr	r3, .L92+476
	mov	r1, #1
	strh	r1, [r2, r3]	@ movhi
	ldr	r2, .L92+876
	mov	r3, #732
	mov	r1, #1
	strh	r1, [r2, r3]	@ movhi
	ldr	r2, .L92+876
	ldr	r3, .L92+480
	mov	r1, #0
	strh	r1, [r2, r3]	@ movhi
	ldr	r2, .L92+876
	mov	r3, #736
	mov	r1, #1
	strh	r1, [r2, r3]	@ movhi
	ldr	r2, .L92+876
	ldr	r3, .L92+484
	mov	r1, #1
	strh	r1, [r2, r3]	@ movhi
	ldr	r2, .L92+876
	mov	r3, #740
	mov	r1, #1
	strh	r1, [r2, r3]	@ movhi
	ldr	r2, .L92+876
	ldr	r3, .L92+488
	mov	r1, #1
	strh	r1, [r2, r3]	@ movhi
	ldr	r2, .L92+876
	mov	r3, #744
	mov	r1, #1
	strh	r1, [r2, r3]	@ movhi
	ldr	r2, .L92+876
	ldr	r3, .L92+492
	mov	r1, #1
	strh	r1, [r2, r3]	@ movhi
	ldr	r2, .L92+876
	mov	r3, #748
	mov	r1, #1
	strh	r1, [r2, r3]	@ movhi
	ldr	r2, .L92+876
	ldr	r3, .L92+496
	mov	r1, #1
	strh	r1, [r2, r3]	@ movhi
	ldr	r2, .L92+876
	mov	r3, #752
	mov	r1, #0
	strh	r1, [r2, r3]	@ movhi
	ldr	r2, .L92+876
	ldr	r3, .L92+500
	mov	r1, #0
	strh	r1, [r2, r3]	@ movhi
	ldr	r2, .L92+876
	mov	r3, #756
	mov	r1, #0
	strh	r1, [r2, r3]	@ movhi
	ldr	r2, .L92+876
	ldr	r3, .L92+504
	mov	r1, #0
	strh	r1, [r2, r3]	@ movhi
	ldr	r2, .L92+876
	mov	r3, #760
	mov	r1, #0
	strh	r1, [r2, r3]	@ movhi
	ldr	r2, .L92+876
	ldr	r3, .L92+508
	mov	r1, #1
	strh	r1, [r2, r3]	@ movhi
	ldr	r2, .L92+876
	mov	r3, #764
	mov	r1, #0
	strh	r1, [r2, r3]	@ movhi
	ldr	r2, .L92+876
	ldr	r3, .L92+512
	mov	r1, #1
	strh	r1, [r2, r3]	@ movhi
	ldr	r2, .L92+876
	mov	r3, #768
	mov	r1, #0
	strh	r1, [r2, r3]	@ movhi
	ldr	r2, .L92+876
	ldr	r3, .L92+516
	mov	r1, #1
	strh	r1, [r2, r3]	@ movhi
	ldr	r2, .L92+876
	mov	r3, #772
	mov	r1, #0
	strh	r1, [r2, r3]	@ movhi
	ldr	r2, .L92+876
	ldr	r3, .L92+520
	mov	r1, #0
	strh	r1, [r2, r3]	@ movhi
	ldr	r2, .L92+876
	mov	r3, #776
	mov	r1, #0
	strh	r1, [r2, r3]	@ movhi
	ldr	r2, .L92+876
	ldr	r3, .L92+524
	mov	r1, #1
	strh	r1, [r2, r3]	@ movhi
	ldr	r2, .L92+876
	mov	r3, #780
	mov	r1, #1
	strh	r1, [r2, r3]	@ movhi
	ldr	r2, .L92+876
	ldr	r3, .L92+528
	mov	r1, #0
	strh	r1, [r2, r3]	@ movhi
	ldr	r2, .L92+876
	mov	r3, #784
	mov	r1, #0
	strh	r1, [r2, r3]	@ movhi
	ldr	r2, .L92+876
	ldr	r3, .L92+532
	mov	r1, #0
	strh	r1, [r2, r3]	@ movhi
	ldr	r2, .L92+876
	mov	r3, #788
	mov	r1, #0
	strh	r1, [r2, r3]	@ movhi
	ldr	r2, .L92+876
	ldr	r3, .L92+536
	mov	r1, #0
	strh	r1, [r2, r3]	@ movhi
	ldr	r2, .L92+876
	mov	r3, #792
	mov	r1, #1
	strh	r1, [r2, r3]	@ movhi
	ldr	r2, .L92+876
	ldr	r3, .L92+540
	mov	r1, #0
	strh	r1, [r2, r3]	@ movhi
	ldr	r2, .L92+876
	mov	r3, #796
	mov	r1, #1
	strh	r1, [r2, r3]	@ movhi
	ldr	r2, .L92+876
	ldr	r3, .L92+544
	mov	r1, #0
	strh	r1, [r2, r3]	@ movhi
	ldr	r2, .L92+876
	mov	r3, #800
	mov	r1, #0
	strh	r1, [r2, r3]	@ movhi
	ldr	r2, .L92+876
	ldr	r3, .L92+548
	mov	r1, #0
	strh	r1, [r2, r3]	@ movhi
	ldr	r2, .L92+876
	mov	r3, #804
	mov	r1, #0
	strh	r1, [r2, r3]	@ movhi
	ldr	r2, .L92+876
	ldr	r3, .L92+552
	mov	r1, #1
	strh	r1, [r2, r3]	@ movhi
	ldr	r2, .L92+876
	mov	r3, #808
	mov	r1, #0
	strh	r1, [r2, r3]	@ movhi
	ldr	r2, .L92+876
	ldr	r3, .L92+556
	mov	r1, #0
	strh	r1, [r2, r3]	@ movhi
	ldr	r2, .L92+876
	mov	r3, #812
	mov	r1, #0
	strh	r1, [r2, r3]	@ movhi
	ldr	r2, .L92+876
	ldr	r3, .L92+560
	mov	r1, #1
	strh	r1, [r2, r3]	@ movhi
	ldr	r2, .L92+876
	mov	r3, #816
	mov	r1, #1
	strh	r1, [r2, r3]	@ movhi
	ldr	r2, .L92+876
	ldr	r3, .L92+564
	mov	r1, #1
	strh	r1, [r2, r3]	@ movhi
	ldr	r2, .L92+876
	mov	r3, #820
	mov	r1, #1
	strh	r1, [r2, r3]	@ movhi
	ldr	r2, .L92+876
	ldr	r3, .L92+568
	mov	r1, #1
	strh	r1, [r2, r3]	@ movhi
	ldr	r2, .L92+876
	mov	r3, #824
	mov	r1, #0
	strh	r1, [r2, r3]	@ movhi
	ldr	r2, .L92+876
	ldr	r3, .L92+572
	mov	r1, #1
	strh	r1, [r2, r3]	@ movhi
	ldr	r2, .L92+876
	mov	r3, #828
	mov	r1, #0
	strh	r1, [r2, r3]	@ movhi
	ldr	r2, .L92+876
	ldr	r3, .L92+576
	mov	r1, #1
	strh	r1, [r2, r3]	@ movhi
	ldr	r2, .L92+876
	mov	r3, #832
	mov	r1, #1
	strh	r1, [r2, r3]	@ movhi
	ldr	r2, .L92+876
	ldr	r3, .L92+580
	mov	r1, #1
	strh	r1, [r2, r3]	@ movhi
	ldr	r2, .L92+876
	mov	r3, #836
	mov	r1, #1
	strh	r1, [r2, r3]	@ movhi
	ldr	r2, .L92+876
	ldr	r3, .L92+584
	mov	r1, #1
	strh	r1, [r2, r3]	@ movhi
	ldr	r2, .L92+876
	mov	r3, #840
	mov	r1, #1
	strh	r1, [r2, r3]	@ movhi
	ldr	r2, .L92+876
	ldr	r3, .L92+588
	mov	r1, #1
	strh	r1, [r2, r3]	@ movhi
	ldr	r2, .L92+876
	mov	r3, #844
	mov	r1, #1
	strh	r1, [r2, r3]	@ movhi
	ldr	r2, .L92+876
	ldr	r3, .L92+592
	mov	r1, #1
	strh	r1, [r2, r3]	@ movhi
	ldr	r2, .L92+876
	mov	r3, #848
	mov	r1, #1
	strh	r1, [r2, r3]	@ movhi
	ldr	r2, .L92+876
	ldr	r3, .L92+596
	mov	r1, #0
	strh	r1, [r2, r3]	@ movhi
	ldr	r2, .L92+876
	mov	r3, #852
	mov	r1, #0
	strh	r1, [r2, r3]	@ movhi
	ldr	r2, .L92+876
	ldr	r3, .L92+600
	mov	r1, #0
	strh	r1, [r2, r3]	@ movhi
	ldr	r2, .L92+876
	mov	r3, #856
	mov	r1, #1
	strh	r1, [r2, r3]	@ movhi
	ldr	r2, .L92+876
	ldr	r3, .L92+604
	mov	r1, #0
	strh	r1, [r2, r3]	@ movhi
	ldr	r2, .L92+876
	mov	r3, #860
	mov	r1, #1
	strh	r1, [r2, r3]	@ movhi
	ldr	r2, .L92+876
	ldr	r3, .L92+608
	mov	r1, #1
	strh	r1, [r2, r3]	@ movhi
	ldr	r2, .L92+876
	mov	r3, #864
	mov	r1, #0
	strh	r1, [r2, r3]	@ movhi
	ldr	r2, .L92+876
	ldr	r3, .L92+612
	mov	r1, #1
	strh	r1, [r2, r3]	@ movhi
	ldr	r2, .L92+876
	mov	r3, #868
	mov	r1, #0
	strh	r1, [r2, r3]	@ movhi
	ldr	r2, .L92+876
	ldr	r3, .L92+616
	mov	r1, #1
	strh	r1, [r2, r3]	@ movhi
	ldr	r2, .L92+876
	mov	r3, #872
	mov	r1, #1
	strh	r1, [r2, r3]	@ movhi
	ldr	r2, .L92+876
	ldr	r3, .L92+620
	mov	r1, #1
	strh	r1, [r2, r3]	@ movhi
	ldr	r2, .L92+876
	mov	r3, #876
	mov	r1, #0
	strh	r1, [r2, r3]	@ movhi
	ldr	r2, .L92+876
	ldr	r3, .L92+624
	mov	r1, #1
	strh	r1, [r2, r3]	@ movhi
	ldr	r2, .L92+876
	mov	r3, #880
	mov	r1, #0
	strh	r1, [r2, r3]	@ movhi
	ldr	r2, .L92+876
	ldr	r3, .L92+628
	mov	r1, #1
	strh	r1, [r2, r3]	@ movhi
	ldr	r2, .L92+876
	mov	r3, #884
	mov	r1, #0
	strh	r1, [r2, r3]	@ movhi
	ldr	r2, .L92+876
	ldr	r3, .L92+632
	mov	r1, #1
	strh	r1, [r2, r3]	@ movhi
	ldr	r2, .L92+876
	mov	r3, #888
	mov	r1, #0
	strh	r1, [r2, r3]	@ movhi
	ldr	r2, .L92+876
	ldr	r3, .L92+636
	mov	r1, #0
	strh	r1, [r2, r3]	@ movhi
	ldr	r2, .L92+876
	mov	r3, #892
	mov	r1, #0
	strh	r1, [r2, r3]	@ movhi
	ldr	r2, .L92+876
	ldr	r3, .L92+640
	mov	r1, #1
	strh	r1, [r2, r3]	@ movhi
	ldr	r2, .L92+876
	mov	r3, #896
	mov	r1, #0
	strh	r1, [r2, r3]	@ movhi
	ldr	r2, .L92+876
	ldr	r3, .L92+644
	mov	r1, #1
	strh	r1, [r2, r3]	@ movhi
	ldr	r2, .L92+876
	mov	r3, #900
	mov	r1, #1
	strh	r1, [r2, r3]	@ movhi
	ldr	r2, .L92+876
	ldr	r3, .L92+648
	mov	r1, #0
	strh	r1, [r2, r3]	@ movhi
	ldr	r2, .L92+876
	mov	r3, #904
	mov	r1, #0
	strh	r1, [r2, r3]	@ movhi
	ldr	r2, .L92+876
	ldr	r3, .L92+652
	mov	r1, #0
	strh	r1, [r2, r3]	@ movhi
	ldr	r2, .L92+876
	mov	r3, #908
	mov	r1, #1
	strh	r1, [r2, r3]	@ movhi
	ldr	r2, .L92+876
	ldr	r3, .L92+656
	mov	r1, #0
	strh	r1, [r2, r3]	@ movhi
	ldr	r2, .L92+876
	mov	r3, #912
	mov	r1, #1
	strh	r1, [r2, r3]	@ movhi
	ldr	r2, .L92+876
	ldr	r3, .L92+660
	mov	r1, #1
	strh	r1, [r2, r3]	@ movhi
	ldr	r2, .L92+876
	mov	r3, #916
	mov	r1, #1
	strh	r1, [r2, r3]	@ movhi
	ldr	r2, .L92+876
	ldr	r3, .L92+664
	mov	r1, #0
	strh	r1, [r2, r3]	@ movhi
	ldr	r2, .L92+876
	mov	r3, #920
	mov	r1, #0
	strh	r1, [r2, r3]	@ movhi
	ldr	r2, .L92+876
	ldr	r3, .L92+668
	mov	r1, #1
	strh	r1, [r2, r3]	@ movhi
	ldr	r2, .L92+876
	mov	r3, #924
	mov	r1, #0
	strh	r1, [r2, r3]	@ movhi
	ldr	r2, .L92+876
	ldr	r3, .L92+672
	mov	r1, #1
	strh	r1, [r2, r3]	@ movhi
	ldr	r2, .L92+876
	mov	r3, #928
	mov	r1, #0
	strh	r1, [r2, r3]	@ movhi
	ldr	r2, .L92+876
	ldr	r3, .L92+676
	mov	r1, #1
	strh	r1, [r2, r3]	@ movhi
	ldr	r2, .L92+876
	mov	r3, #932
	mov	r1, #0
	strh	r1, [r2, r3]	@ movhi
	ldr	r2, .L92+876
	ldr	r3, .L92+680
	mov	r1, #1
	strh	r1, [r2, r3]	@ movhi
	ldr	r2, .L92+876
	mov	r3, #936
	mov	r1, #0
	strh	r1, [r2, r3]	@ movhi
	ldr	r2, .L92+876
	ldr	r3, .L92+684
	mov	r1, #1
	strh	r1, [r2, r3]	@ movhi
	ldr	r2, .L92+876
	mov	r3, #940
	mov	r1, #0
	strh	r1, [r2, r3]	@ movhi
	ldr	r2, .L92+876
	ldr	r3, .L92+688
	mov	r1, #1
	strh	r1, [r2, r3]	@ movhi
	ldr	r2, .L92+876
	mov	r3, #944
	mov	r1, #0
	strh	r1, [r2, r3]	@ movhi
	ldr	r2, .L92+876
	ldr	r3, .L92+692
	mov	r1, #1
	strh	r1, [r2, r3]	@ movhi
	ldr	r2, .L92+876
	mov	r3, #948
	mov	r1, #1
	strh	r1, [r2, r3]	@ movhi
	ldr	r2, .L92+876
	ldr	r3, .L92+696
	mov	r1, #1
	strh	r1, [r2, r3]	@ movhi
	ldr	r2, .L92+876
	mov	r3, #952
	mov	r1, #0
	strh	r1, [r2, r3]	@ movhi
	ldr	r2, .L92+876
	ldr	r3, .L92+700
	mov	r1, #1
	strh	r1, [r2, r3]	@ movhi
	ldr	r2, .L92+876
	mov	r3, #956
	mov	r1, #0
	strh	r1, [r2, r3]	@ movhi
	ldr	r2, .L92+876
	ldr	r3, .L92+704
	mov	r1, #1
	strh	r1, [r2, r3]	@ movhi
	ldr	r2, .L92+876
	mov	r3, #960
	mov	r1, #1
	strh	r1, [r2, r3]	@ movhi
	ldr	r2, .L92+876
	ldr	r3, .L92+708
	mov	r1, #0
	strh	r1, [r2, r3]	@ movhi
	ldr	r2, .L92+876
	mov	r3, #964
	mov	r1, #1
	strh	r1, [r2, r3]	@ movhi
	ldr	r2, .L92+876
	ldr	r3, .L92+712
	mov	r1, #0
	strh	r1, [r2, r3]	@ movhi
	ldr	r2, .L92+876
	mov	r3, #968
	mov	r1, #1
	strh	r1, [r2, r3]	@ movhi
	ldr	r2, .L92+876
	ldr	r3, .L92+716
	mov	r1, #0
	strh	r1, [r2, r3]	@ movhi
	ldr	r2, .L92+876
	mov	r3, #972
	mov	r1, #1
	strh	r1, [r2, r3]	@ movhi
	ldr	r2, .L92+876
	ldr	r3, .L92+720
	mov	r1, #0
	strh	r1, [r2, r3]	@ movhi
	ldr	r2, .L92+876
	mov	r3, #976
	mov	r1, #0
	strh	r1, [r2, r3]	@ movhi
	ldr	r2, .L92+876
	ldr	r3, .L92+724
	mov	r1, #1
	strh	r1, [r2, r3]	@ movhi
	ldr	r2, .L92+876
	mov	r3, #980
	mov	r1, #0
	strh	r1, [r2, r3]	@ movhi
	ldr	r2, .L92+876
	ldr	r3, .L92+728
	mov	r1, #1
	strh	r1, [r2, r3]	@ movhi
	ldr	r2, .L92+876
	mov	r3, #984
	mov	r1, #0
	strh	r1, [r2, r3]	@ movhi
	ldr	r2, .L92+876
	ldr	r3, .L92+732
	mov	r1, #1
	strh	r1, [r2, r3]	@ movhi
	ldr	r2, .L92+876
	mov	r3, #988
	mov	r1, #0
	strh	r1, [r2, r3]	@ movhi
	ldr	r2, .L92+876
	ldr	r3, .L92+736
	mov	r1, #1
	strh	r1, [r2, r3]	@ movhi
	ldr	r2, .L92+876
	mov	r3, #992
	mov	r1, #0
	strh	r1, [r2, r3]	@ movhi
	ldr	r2, .L92+876
	ldr	r3, .L92+740
	mov	r1, #0
	strh	r1, [r2, r3]	@ movhi
	ldr	r2, .L92+876
	mov	r3, #996
	mov	r1, #0
	strh	r1, [r2, r3]	@ movhi
	ldr	r2, .L92+876
	ldr	r3, .L92+744
	mov	r1, #1
	strh	r1, [r2, r3]	@ movhi
	ldr	r2, .L92+876
	mov	r3, #1000
	mov	r1, #0
	strh	r1, [r2, r3]	@ movhi
	ldr	r2, .L92+876
	ldr	r3, .L92+748
	mov	r1, #1
	strh	r1, [r2, r3]	@ movhi
	ldr	r2, .L92+876
	mov	r3, #1004
	mov	r1, #0
	strh	r1, [r2, r3]	@ movhi
	ldr	r2, .L92+876
	ldr	r3, .L92+752
	mov	r1, #0
	strh	r1, [r2, r3]	@ movhi
	ldr	r2, .L92+876
	mov	r3, #1008
	mov	r1, #0
	strh	r1, [r2, r3]	@ movhi
	ldr	r2, .L92+876
	ldr	r3, .L92+756
	mov	r1, #0
	strh	r1, [r2, r3]	@ movhi
	ldr	r2, .L92+876
	mov	r3, #1012
	mov	r1, #0
	strh	r1, [r2, r3]	@ movhi
	ldr	r2, .L92+876
	ldr	r3, .L92+760
	mov	r1, #1
	strh	r1, [r2, r3]	@ movhi
	ldr	r2, .L92+876
	mov	r3, #1016
	mov	r1, #0
	strh	r1, [r2, r3]	@ movhi
	ldr	r2, .L92+876
	ldr	r3, .L92+764
	mov	r1, #1
	strh	r1, [r2, r3]	@ movhi
	ldr	r2, .L92+876
	mov	r3, #1020
	mov	r1, #1
	strh	r1, [r2, r3]	@ movhi
	ldr	r2, .L92+876
	ldr	r3, .L92+768
	mov	r1, #0
	strh	r1, [r2, r3]	@ movhi
	ldr	r2, .L92+876
	mov	r3, #1024
	mov	r1, #1
	strh	r1, [r2, r3]	@ movhi
	ldr	r2, .L92+876
	ldr	r3, .L92+772
	mov	r1, #0
	strh	r1, [r2, r3]	@ movhi
	ldr	r2, .L92+876
	ldr	r3, .L92+776
	mov	r1, #1
	strh	r1, [r2, r3]	@ movhi
	ldr	r2, .L92+876
	ldr	r3, .L92+780
	mov	r1, #1
	strh	r1, [r2, r3]	@ movhi
	ldr	r2, .L92+876
	ldr	r3, .L92+784
	mov	r1, #1
	strh	r1, [r2, r3]	@ movhi
	ldr	r2, .L92+876
	ldr	r3, .L92+788
	mov	r1, #1
	strh	r1, [r2, r3]	@ movhi
	ldr	r2, .L92+876
	ldr	r3, .L92+792
	mov	r1, #0
	strh	r1, [r2, r3]	@ movhi
	ldr	r2, .L92+876
	ldr	r3, .L92+796
	mov	r1, #1
	strh	r1, [r2, r3]	@ movhi
	ldr	r2, .L92+876
	mov	r3, #1040
	mov	r1, #0
	strh	r1, [r2, r3]	@ movhi
	ldr	r2, .L92+876
	ldr	r3, .L92+800
	mov	r1, #1
	strh	r1, [r2, r3]	@ movhi
	ldr	r2, .L92+876
	ldr	r3, .L92+804
	mov	r1, #1
	strh	r1, [r2, r3]	@ movhi
	ldr	r2, .L92+876
	ldr	r3, .L92+808
	mov	r1, #1
	strh	r1, [r2, r3]	@ movhi
	ldr	r2, .L92+876
	ldr	r3, .L92+812
	mov	r1, #1
	strh	r1, [r2, r3]	@ movhi
	ldr	r2, .L92+876
	ldr	r3, .L92+816
	mov	r1, #1
	strh	r1, [r2, r3]	@ movhi
	ldr	r2, .L92+876
	ldr	r3, .L92+820
	mov	r1, #1
	strh	r1, [r2, r3]	@ movhi
	ldr	r2, .L92+876
	ldr	r3, .L92+824
	mov	r1, #1
	strh	r1, [r2, r3]	@ movhi
	ldr	r2, .L92+876
	mov	r3, #1056
	mov	r1, #0
	strh	r1, [r2, r3]	@ movhi
	ldr	r2, .L92+876
	ldr	r3, .L92+828
	mov	r1, #1
	strh	r1, [r2, r3]	@ movhi
	ldr	r2, .L92+876
	ldr	r3, .L92+832
	mov	r1, #0
	strh	r1, [r2, r3]	@ movhi
	ldr	r2, .L92+876
	ldr	r3, .L92+836
	mov	r1, #1
	strh	r1, [r2, r3]	@ movhi
	ldr	r2, .L92+876
	ldr	r3, .L92+840
	mov	r1, #1
	strh	r1, [r2, r3]	@ movhi
	ldr	r2, .L92+876
	ldr	r3, .L92+844
	mov	r1, #1
	strh	r1, [r2, r3]	@ movhi
	ldr	r2, .L92+876
	ldr	r3, .L92+848
	mov	r1, #1
	strh	r1, [r2, r3]	@ movhi
	ldr	r2, .L92+876
	ldr	r3, .L92+852
	mov	r1, #1
	strh	r1, [r2, r3]	@ movhi
	ldr	r2, .L92+876
	mov	r3, #1072
	mov	r1, #0
	strh	r1, [r2, r3]	@ movhi
	ldr	r2, .L92+876
	ldr	r3, .L92+856
	mov	r1, #1
	strh	r1, [r2, r3]	@ movhi
	ldr	r2, .L92+876
	ldr	r3, .L92+860
	mov	r1, #0
	strh	r1, [r2, r3]	@ movhi
	ldr	r2, .L92+876
	ldr	r3, .L92+864
	mov	r1, #1
	strh	r1, [r2, r3]	@ movhi
	ldr	r2, .L92+876
	ldr	r3, .L92+868
	mov	r1, #1
	strh	r1, [r2, r3]	@ movhi
	ldr	r2, .L92+876
	ldr	r3, .L92+872
	mov	r1, #0
	strh	r1, [r2, r3]	@ movhi
	ldr	r2, .L92+876
	ldr	r3, .L92+880
	mov	r1, #1
	strh	r1, [r2, r3]	@ movhi
	ldr	r2, .L95
	ldr	r3, .L95+4
	mov	r1, #0
	strh	r1, [r2, r3]	@ movhi
	ldr	r2, .L95
	mov	r3, #1088
	mov	r1, #0
	strh	r1, [r2, r3]	@ movhi
	ldr	r2, .L95
	ldr	r3, .L95+8
	mov	r1, #0
	strh	r1, [r2, r3]	@ movhi
	ldr	r2, .L95
	ldr	r3, .L95+12
	mov	r1, #0
	strh	r1, [r2, r3]	@ movhi
	ldr	r2, .L95
	ldr	r3, .L95+16
	mov	r1, #1
	strh	r1, [r2, r3]	@ movhi
	ldr	r2, .L95
	ldr	r3, .L95+20
	mov	r1, #0
	strh	r1, [r2, r3]	@ movhi
	ldr	r2, .L95
	ldr	r3, .L95+24
	mov	r1, #0
	strh	r1, [r2, r3]	@ movhi
	ldr	r2, .L95
	ldr	r3, .L95+28
	mov	r1, #0
	strh	r1, [r2, r3]	@ movhi
	ldr	r2, .L95
	ldr	r3, .L95+32
	mov	r1, #0
	strh	r1, [r2, r3]	@ movhi
	ldr	r2, .L95
	mov	r3, #1104
	mov	r1, #0
	strh	r1, [r2, r3]	@ movhi
	ldr	r2, .L95
	ldr	r3, .L95+36
	mov	r1, #0
	strh	r1, [r2, r3]	@ movhi
	ldr	r2, .L95
	ldr	r3, .L95+40
	mov	r1, #0
	strh	r1, [r2, r3]	@ movhi
	ldr	r2, .L95
	ldr	r3, .L95+44
	mov	r1, #0
	strh	r1, [r2, r3]	@ movhi
	ldr	r2, .L95
	ldr	r3, .L95+48
	mov	r1, #0
	strh	r1, [r2, r3]	@ movhi
	ldr	r2, .L95
	ldr	r3, .L95+52
	mov	r1, #1
	strh	r1, [r2, r3]	@ movhi
	ldr	r2, .L95
	ldr	r3, .L95+56
	mov	r1, #0
	strh	r1, [r2, r3]	@ movhi
	ldr	r2, .L95
	ldr	r3, .L95+60
	mov	r1, #0
	strh	r1, [r2, r3]	@ movhi
	ldr	r2, .L95
	mov	r3, #1120
	mov	r1, #0
	strh	r1, [r2, r3]	@ movhi
	ldr	r2, .L95
	ldr	r3, .L95+64
	mov	r1, #0
	strh	r1, [r2, r3]	@ movhi
	ldr	r2, .L95
	ldr	r3, .L95+68
	mov	r1, #0
	strh	r1, [r2, r3]	@ movhi
	ldr	r2, .L95
	ldr	r3, .L95+72
	mov	r1, #0
	strh	r1, [r2, r3]	@ movhi
	ldr	r2, .L95
	ldr	r3, .L95+76
	mov	r1, #0
	strh	r1, [r2, r3]	@ movhi
	ldr	r2, .L95
	ldr	r3, .L95+80
	mov	r1, #0
	strh	r1, [r2, r3]	@ movhi
	ldr	r2, .L95
	ldr	r3, .L95+84
	mov	r1, #0
	strh	r1, [r2, r3]	@ movhi
	ldr	r2, .L95
	ldr	r3, .L95+88
	mov	r1, #1
	strh	r1, [r2, r3]	@ movhi
	ldr	r2, .L95
	mov	r3, #1136
	mov	r1, #0
	strh	r1, [r2, r3]	@ movhi
	ldr	r2, .L95
	ldr	r3, .L95+92
	mov	r1, #1
	strh	r1, [r2, r3]	@ movhi
	ldr	r2, .L95
	ldr	r3, .L95+96
	mov	r1, #1
	strh	r1, [r2, r3]	@ movhi
	ldr	r2, .L95
	ldr	r3, .L95+100
	mov	r1, #1
	strh	r1, [r2, r3]	@ movhi
	ldr	r2, .L95
	ldr	r3, .L95+104
	mov	r1, #1
	strh	r1, [r2, r3]	@ movhi
	ldr	r2, .L95
	ldr	r3, .L95+108
	mov	r1, #1
	strh	r1, [r2, r3]	@ movhi
	ldr	r2, .L95
	ldr	r3, .L95+112
	mov	r1, #1
	strh	r1, [r2, r3]	@ movhi
	ldr	r2, .L95
	ldr	r3, .L95+116
	mov	r1, #1
	strh	r1, [r2, r3]	@ movhi
	ldr	r2, .L95
	mov	r3, #1152
	mov	r1, #1
	strh	r1, [r2, r3]	@ movhi
	ldr	r2, .L95
	ldr	r3, .L95+120
	mov	r1, #1
	strh	r1, [r2, r3]	@ movhi
	ldr	r2, .L95
	ldr	r3, .L95+124
	mov	r1, #1
	strh	r1, [r2, r3]	@ movhi
	ldr	r2, .L95
	ldr	r3, .L95+128
	mov	r1, #1
	strh	r1, [r2, r3]	@ movhi
	ldr	r2, .L95
	ldr	r3, .L95+132
	mov	r1, #1
	strh	r1, [r2, r3]	@ movhi
	ldr	r2, .L95
	ldr	r3, .L95+136
	mov	r1, #1
	strh	r1, [r2, r3]	@ movhi
	ldr	r2, .L95
	ldr	r3, .L95+140
	mov	r1, #1
	strh	r1, [r2, r3]	@ movhi
	ldr	r2, .L95
	ldr	r3, .L95+144
	mov	r1, #1
	strh	r1, [r2, r3]	@ movhi
	ldr	r2, .L95
	mov	r3, #1168
	mov	r1, #1
	strh	r1, [r2, r3]	@ movhi
	ldr	r2, .L95
	ldr	r3, .L95+148
	mov	r1, #1
	strh	r1, [r2, r3]	@ movhi
	ldr	r2, .L95
	ldr	r3, .L95+152
	mov	r1, #1
	strh	r1, [r2, r3]	@ movhi
	ldr	r2, .L95
	ldr	r3, .L95+156
	mov	r1, #1
	strh	r1, [r2, r3]	@ movhi
	ldr	r2, .L95
	ldr	r3, .L95+160
	mov	r1, #1
	strh	r1, [r2, r3]	@ movhi
	ldr	r2, .L95
	ldr	r3, .L95+164
	mov	r1, #1
	strh	r1, [r2, r3]	@ movhi
	ldr	r2, .L95
	ldr	r3, .L95+168
	mov	r1, #1
	strh	r1, [r2, r3]	@ movhi
	ldr	r2, .L95
	ldr	r3, .L95+172
	mov	r1, #1
	strh	r1, [r2, r3]	@ movhi
	ldr	r2, .L95
	mov	r3, #1184
	mov	r1, #1
	strh	r1, [r2, r3]	@ movhi
	ldr	r2, .L95
	ldr	r3, .L95+176
	mov	r1, #1
	strh	r1, [r2, r3]	@ movhi
	ldr	r2, .L95
	ldr	r3, .L95+180
	mov	r1, #1
	strh	r1, [r2, r3]	@ movhi
	ldr	r2, .L95
	ldr	r3, .L95+184
	mov	r1, #1
	strh	r1, [r2, r3]	@ movhi
	ldr	r2, .L95
	ldr	r3, .L95+188
	mov	r1, #1
	strh	r1, [r2, r3]	@ movhi
	ldr	r2, .L95
	ldr	r3, .L95+192
	mov	r1, #1
	strh	r1, [r2, r3]	@ movhi
	ldr	r2, .L95
	ldr	r3, .L95+196
	mov	r1, #1
	strh	r1, [r2, r3]	@ movhi
	ldr	r2, .L95
	ldr	r3, .L95+200
	mov	r1, #1
	strh	r1, [r2, r3]	@ movhi
	mov	r3, #0
	str	r3, [fp, #-12]
	b	.L87
.L91:
	mov	r3, #0
	str	r3, [fp, #-8]
	b	.L88
.L90:
	ldr	r1, .L95
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
	bne	.L89
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
.L89:
	ldr	r3, [fp, #-8]
	add	r3, r3, #1
	str	r3, [fp, #-8]
.L88:
	ldr	r3, [fp, #-8]
	cmp	r3, #29
	ble	.L90
	ldr	r3, [fp, #-12]
	add	r3, r3, #1
	str	r3, [fp, #-12]
.L87:
	ldr	r3, [fp, #-12]
	cmp	r3, #19
	ble	.L91
	sub	sp, fp, #4
	@ sp needed
	ldmfd	sp!, {fp, lr}
	bx	lr
.L96:
	.align	2
.L95:
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
	b	.L98
.L99:
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
.L98:
	ldr	r3, [fp, #-12]
	cmp	r3, #38400
	blt	.L99
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
	ldr	r2, .L101
	bl	draw_point2
	mov	r0, #98
	mov	r1, #16
	ldr	r2, .L101
	bl	draw_point2
	mov	r0, #98
	mov	r1, #17
	ldr	r2, .L101
	bl	draw_point2
	mov	r0, #98
	mov	r1, #18
	ldr	r2, .L101
	bl	draw_point2
	mov	r0, #104
	mov	r1, #18
	ldr	r2, .L101+8
	bl	draw_point2
	mov	r0, #105
	mov	r1, #18
	ldr	r2, .L101+8
	bl	draw_point2
	mov	r0, #98
	mov	r1, #19
	ldr	r2, .L101
	bl	draw_point2
	mov	r0, #102
	mov	r1, #19
	ldr	r2, .L101+8
	bl	draw_point2
	mov	r0, #103
	mov	r1, #19
	ldr	r2, .L101+8
	bl	draw_point2
	mov	r0, #104
	mov	r1, #19
	ldr	r2, .L101+8
	bl	draw_point2
	mov	r0, #105
	mov	r1, #19
	ldr	r2, .L101+8
	bl	draw_point2
	mov	r0, #106
	mov	r1, #19
	ldr	r2, .L101+8
	bl	draw_point2
	mov	r0, #107
	mov	r1, #19
	ldr	r2, .L101+8
	bl	draw_point2
	mov	r0, #98
	mov	r1, #20
	ldr	r2, .L101
	bl	draw_point2
	mov	r0, #102
	mov	r1, #20
	ldr	r2, .L101+8
	bl	draw_point2
	mov	r0, #103
	mov	r1, #20
	ldr	r2, .L101+8
	bl	draw_point2
	mov	r0, #104
	mov	r1, #20
	ldr	r2, .L101+8
	bl	draw_point2
	mov	r0, #105
	mov	r1, #20
	ldr	r2, .L101+8
	bl	draw_point2
	mov	r0, #106
	mov	r1, #20
	ldr	r2, .L101+8
	bl	draw_point2
	mov	r0, #107
	mov	r1, #20
	ldr	r2, .L101+8
	bl	draw_point2
	mov	r0, #98
	mov	r1, #21
	ldr	r2, .L101
	bl	draw_point2
	mov	r0, #101
	mov	r1, #21
	ldr	r2, .L101+8
	bl	draw_point2
	mov	r0, #102
	mov	r1, #21
	ldr	r2, .L101+8
	bl	draw_point2
	mov	r0, #103
	mov	r1, #21
	ldr	r2, .L101+8
	bl	draw_point2
	mov	r0, #104
	mov	r1, #21
	ldr	r2, .L101+8
	bl	draw_point2
	mov	r0, #105
	mov	r1, #21
	ldr	r2, .L101+8
	bl	draw_point2
	mov	r0, #106
	mov	r1, #21
	ldr	r2, .L101+8
	bl	draw_point2
	mov	r0, #107
	mov	r1, #21
	ldr	r2, .L101+8
	bl	draw_point2
	mov	r0, #108
	mov	r1, #21
	ldr	r2, .L101+8
	bl	draw_point2
	mov	r0, #98
	mov	r1, #22
	ldr	r2, .L101
	bl	draw_point2
	mov	r0, #101
	mov	r1, #22
	ldr	r2, .L101+8
	bl	draw_point2
	mov	r0, #102
	mov	r1, #22
	ldr	r2, .L101+8
	bl	draw_point2
	mov	r0, #103
	mov	r1, #22
	ldr	r2, .L101+8
	bl	draw_point2
	mov	r0, #104
	mov	r1, #22
	ldr	r2, .L101+8
	bl	draw_point2
	mov	r0, #105
	mov	r1, #22
	ldr	r2, .L101+8
	bl	draw_point2
	mov	r0, #106
	mov	r1, #22
	ldr	r2, .L101+8
	bl	draw_point2
	mov	r0, #107
	mov	r1, #22
	ldr	r2, .L101+8
	bl	draw_point2
	mov	r0, #108
	mov	r1, #22
	ldr	r2, .L101+8
	bl	draw_point2
	mov	r0, #98
	mov	r1, #23
	ldr	r2, .L101
	bl	draw_point2
	mov	r0, #102
	mov	r1, #23
	ldr	r2, .L101+8
	bl	draw_point2
	mov	r0, #103
	mov	r1, #23
	ldr	r2, .L101+8
	bl	draw_point2
	mov	r0, #104
	mov	r1, #23
	ldr	r2, .L101+8
	bl	draw_point2
	mov	r0, #105
	mov	r1, #23
	ldr	r2, .L101+8
	bl	draw_point2
	mov	r0, #106
	mov	r1, #23
	ldr	r2, .L101+8
	bl	draw_point2
	mov	r0, #107
	mov	r1, #23
	ldr	r2, .L101+8
	bl	draw_point2
	mov	r0, #98
	mov	r1, #24
	ldr	r2, .L101
	bl	draw_point2
	mov	r0, #99
	mov	r1, #24
	ldr	r2, .L101+8
	bl	draw_point2
	mov	r0, #102
	mov	r1, #24
	ldr	r2, .L101+8
	bl	draw_point2
	mov	r0, #103
	mov	r1, #24
	ldr	r2, .L101+8
	bl	draw_point2
	mov	r0, #104
	mov	r1, #24
	ldr	r2, .L101+8
	bl	draw_point2
	mov	r0, #105
	mov	r1, #24
	ldr	r2, .L101+8
	bl	draw_point2
	mov	r0, #106
	mov	r1, #24
	ldr	r2, .L101+8
	bl	draw_point2
	mov	r0, #107
	mov	r1, #24
	ldr	r2, .L101+8
	bl	draw_point2
	mov	r0, #13
	mov	r1, #25
	ldr	r2, .L101+8
	bl	draw_point2
	mov	r0, #14
	mov	r1, #25
	ldr	r2, .L101+8
	bl	draw_point2
	mov	r0, #15
	mov	r1, #25
	ldr	r2, .L101+8
	bl	draw_point2
	mov	r0, #16
	mov	r1, #25
	ldr	r2, .L101+8
	bl	draw_point2
	mov	r0, #17
	mov	r1, #25
	ldr	r2, .L101+8
	bl	draw_point2
	mov	r0, #18
	mov	r1, #25
	ldr	r2, .L101+8
	bl	draw_point2
	mov	r0, #19
	mov	r1, #25
	ldr	r2, .L101+8
	bl	draw_point2
	mov	r0, #20
	mov	r1, #25
	ldr	r2, .L101+8
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
	ldr	r2, .L101+8
	bl	draw_point2
	mov	r0, #43
	mov	r1, #25
	ldr	r2, .L101+8
	bl	draw_point2
	mov	r0, #44
	mov	r1, #25
	ldr	r2, .L101+8
	bl	draw_point2
	mov	r0, #45
	mov	r1, #25
	ldr	r2, .L101+8
	bl	draw_point2
	mov	r0, #46
	mov	r1, #25
	ldr	r2, .L101+8
	bl	draw_point2
	mov	r0, #47
	mov	r1, #25
	ldr	r2, .L101+8
	bl	draw_point2
	mov	r0, #48
	mov	r1, #25
	ldr	r2, .L101+8
	bl	draw_point2
	mov	r0, #49
	mov	r1, #25
	ldr	r2, .L101+8
	bl	draw_point2
	mov	r0, #56
	mov	r1, #25
	ldr	r2, .L101+8
	bl	draw_point2
	mov	r0, #57
	mov	r1, #25
	ldr	r2, .L101+8
	bl	draw_point2
	mov	r0, #58
	mov	r1, #25
	ldr	r2, .L101+8
	bl	draw_point2
	mov	r0, #59
	mov	r1, #25
	ldr	r2, .L101+8
	bl	draw_point2
	mov	r0, #60
	mov	r1, #25
	ldr	r2, .L101+8
	bl	draw_point2
	mov	r0, #61
	mov	r1, #25
	ldr	r2, .L101+8
	bl	draw_point2
	mov	r0, #62
	mov	r1, #25
	ldr	r2, .L101+8
	bl	draw_point2
	mov	r0, #63
	mov	r1, #25
	ldr	r2, .L101+8
	bl	draw_point2
	mov	r0, #64
	mov	r1, #25
	ldr	r2, .L101+8
	bl	draw_point2
	mov	r0, #65
	mov	r1, #25
	ldr	r2, .L101+8
	bl	draw_point2
	mov	r0, #73
	mov	r1, #25
	ldr	r2, .L101+8
	bl	draw_point2
	mov	r0, #82
	mov	r1, #25
	ldr	r2, .L101+8
	bl	draw_point2
	mov	r0, #83
	mov	r1, #25
	ldr	r2, .L101+8
	bl	draw_point2
	mov	r0, #98
	mov	r1, #25
	ldr	r2, .L101
	bl	draw_point2
	mov	r0, #99
	mov	r1, #25
	ldr	r2, .L101+8
	bl	draw_point2
	mov	r0, #100
	mov	r1, #25
	ldr	r2, .L101+8
	bl	draw_point2
	mov	r0, #104
	mov	r1, #25
	ldr	r2, .L101+8
	bl	draw_point2
	mov	r0, #105
	mov	r1, #25
	ldr	r2, .L101+8
	bl	draw_point2
	mov	r0, #13
	mov	r1, #26
	ldr	r2, .L101+8
	bl	draw_point2
	mov	r0, #14
	mov	r1, #26
	ldr	r2, .L101+8
	bl	draw_point2
	mov	r0, #15
	mov	r1, #26
	ldr	r2, .L101+8
	bl	draw_point2
	mov	r0, #16
	mov	r1, #26
	ldr	r2, .L101+8
	bl	draw_point2
	mov	r0, #17
	mov	r1, #26
	ldr	r2, .L101+8
	bl	draw_point2
	mov	r0, #18
	mov	r1, #26
	ldr	r2, .L101+8
	bl	draw_point2
	mov	r0, #19
	mov	r1, #26
	ldr	r2, .L101+8
	bl	draw_point2
	mov	r0, #20
	mov	r1, #26
	ldr	r2, .L101+8
	bl	draw_point2
	mov	r0, #21
	mov	r1, #26
	ldr	r2, .L101+8
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
	ldr	r2, .L101+8
	bl	draw_point2
	mov	r0, #43
	mov	r1, #26
	ldr	r2, .L101+8
	bl	draw_point2
	mov	r0, #44
	mov	r1, #26
	ldr	r2, .L101+8
	bl	draw_point2
	mov	r0, #45
	mov	r1, #26
	ldr	r2, .L101+8
	bl	draw_point2
	mov	r0, #46
	mov	r1, #26
	ldr	r2, .L101+8
	bl	draw_point2
	mov	r0, #47
	mov	r1, #26
	ldr	r2, .L101+8
	bl	draw_point2
	mov	r0, #48
	mov	r1, #26
	ldr	r2, .L101+8
	bl	draw_point2
	mov	r0, #49
	mov	r1, #26
	ldr	r2, .L101+8
	bl	draw_point2
	mov	r0, #50
	mov	r1, #26
	ldr	r2, .L101+8
	bl	draw_point2
	mov	r0, #56
	mov	r1, #26
	ldr	r2, .L101+8
	bl	draw_point2
	mov	r0, #57
	mov	r1, #26
	ldr	r2, .L101+8
	bl	draw_point2
	mov	r0, #58
	mov	r1, #26
	ldr	r2, .L101+8
	bl	draw_point2
	mov	r0, #59
	mov	r1, #26
	ldr	r2, .L101+8
	bl	draw_point2
	mov	r0, #60
	mov	r1, #26
	ldr	r2, .L101+8
	bl	draw_point2
	mov	r0, #61
	mov	r1, #26
	ldr	r2, .L101+8
	bl	draw_point2
	mov	r0, #62
	mov	r1, #26
	ldr	r2, .L101+8
	bl	draw_point2
	mov	r0, #63
	mov	r1, #26
	ldr	r2, .L101+8
	bl	draw_point2
	mov	r0, #64
	mov	r1, #26
	ldr	r2, .L101+8
	bl	draw_point2
	mov	r0, #65
	mov	r1, #26
	ldr	r2, .L101+8
	bl	draw_point2
	mov	r0, #72
	mov	r1, #26
	ldr	r2, .L101+8
	bl	draw_point2
	mov	r0, #73
	mov	r1, #26
	ldr	r2, .L101+8
	bl	draw_point2
	mov	r0, #74
	mov	r1, #26
	ldr	r2, .L101+8
	bl	draw_point2
	mov	r0, #82
	mov	r1, #26
	ldr	r2, .L101+8
	bl	draw_point2
	mov	r0, #83
	mov	r1, #26
	ldr	r2, .L101+8
	bl	draw_point2
	mov	r0, #98
	mov	r1, #26
	ldr	r2, .L101
	bl	draw_point2
	mov	r0, #99
	mov	r1, #26
	ldr	r2, .L101+8
	bl	draw_point2
	mov	r0, #100
	mov	r1, #26
	ldr	r2, .L101+8
	bl	draw_point2
	mov	r0, #101
	mov	r1, #26
	ldr	r2, .L101+8
	bl	draw_point2
	mov	r0, #13
	mov	r1, #27
	ldr	r2, .L101+8
	bl	draw_point2
	mov	r0, #14
	mov	r1, #27
	ldr	r2, .L101+8
	bl	draw_point2
	mov	r0, #20
	mov	r1, #27
	ldr	r2, .L101+8
	bl	draw_point2
	mov	r0, #21
	mov	r1, #27
	ldr	r2, .L101+8
	bl	draw_point2
	mov	r0, #22
	mov	r1, #27
	ldr	r2, .L101+8
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
	ldr	r2, .L101+8
	bl	draw_point2
	mov	r0, #43
	mov	r1, #27
	ldr	r2, .L101+8
	bl	draw_point2
	mov	r0, #49
	mov	r1, #27
	ldr	r2, .L101+8
	bl	draw_point2
	mov	r0, #50
	mov	r1, #27
	ldr	r2, .L101+8
	bl	draw_point2
	mov	r0, #51
	mov	r1, #27
	ldr	r2, .L101+8
	bl	draw_point2
	mov	r0, #60
	mov	r1, #27
	ldr	r2, .L101+8
	bl	draw_point2
	mov	r0, #61
	mov	r1, #27
	ldr	r2, .L101+8
	bl	draw_point2
	mov	r0, #72
	mov	r1, #27
	ldr	r2, .L101+8
	bl	draw_point2
	mov	r0, #73
	mov	r1, #27
	ldr	r2, .L101+8
	bl	draw_point2
	mov	r0, #74
	mov	r1, #27
	ldr	r2, .L101+8
	bl	draw_point2
	mov	r0, #82
	mov	r1, #27
	ldr	r2, .L101+8
	bl	draw_point2
	mov	r0, #83
	mov	r1, #27
	ldr	r2, .L101+8
	bl	draw_point2
	mov	r0, #98
	mov	r1, #27
	ldr	r2, .L101
	bl	draw_point2
	mov	r0, #99
	mov	r1, #27
	ldr	r2, .L101+8
	bl	draw_point2
	mov	r0, #100
	mov	r1, #27
	ldr	r2, .L101+8
	bl	draw_point2
	mov	r0, #101
	mov	r1, #27
	ldr	r2, .L101+8
	bl	draw_point2
	mov	r0, #102
	mov	r1, #27
	ldr	r2, .L101+8
	bl	draw_point2
	mov	r0, #13
	mov	r1, #28
	ldr	r2, .L101+8
	bl	draw_point2
	mov	r0, #14
	mov	r1, #28
	ldr	r2, .L101+8
	bl	draw_point2
	mov	r0, #21
	mov	r1, #28
	ldr	r2, .L101+8
	bl	draw_point2
	mov	r0, #22
	mov	r1, #28
	ldr	r2, .L101+8
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
	ldr	r2, .L101+8
	bl	draw_point2
	mov	r0, #43
	mov	r1, #28
	ldr	r2, .L101+8
	bl	draw_point2
	mov	r0, #50
	mov	r1, #28
	ldr	r2, .L101+8
	bl	draw_point2
	mov	r0, #51
	mov	r1, #28
	ldr	r2, .L101+8
	bl	draw_point2
	mov	r0, #60
	mov	r1, #28
	ldr	r2, .L101+8
	bl	draw_point2
	mov	r0, #61
	mov	r1, #28
	ldr	r2, .L101+8
	bl	draw_point2
	mov	r0, #71
	mov	r1, #28
	ldr	r2, .L101+8
	bl	draw_point2
	mov	r0, #72
	mov	r1, #28
	ldr	r2, .L101+8
	bl	draw_point2
	mov	r0, #74
	mov	r1, #28
	ldr	r2, .L101+8
	bl	draw_point2
	mov	r0, #75
	mov	r1, #28
	ldr	r2, .L101+8
	bl	draw_point2
	mov	r0, #82
	mov	r1, #28
	ldr	r2, .L101+8
	bl	draw_point2
	mov	r0, #83
	mov	r1, #28
	ldr	r2, .L101+8
	bl	draw_point2
	mov	r0, #98
	mov	r1, #28
	ldr	r2, .L101
	bl	draw_point2
	mov	r0, #99
	mov	r1, #28
	ldr	r2, .L101+8
	bl	draw_point2
	mov	r0, #100
	mov	r1, #28
	ldr	r2, .L101+8
	bl	draw_point2
	mov	r0, #101
	mov	r1, #28
	ldr	r2, .L101+8
	bl	draw_point2
	mov	r0, #102
	mov	r1, #28
	ldr	r2, .L101+8
	bl	draw_point2
	mov	r0, #103
	mov	r1, #28
	ldr	r2, .L101+8
	bl	draw_point2
	mov	r0, #13
	mov	r1, #29
	ldr	r2, .L101+8
	bl	draw_point2
	mov	r0, #14
	mov	r1, #29
	ldr	r2, .L101+8
	bl	draw_point2
	mov	r0, #21
	mov	r1, #29
	ldr	r2, .L101+8
	bl	draw_point2
	mov	r0, #22
	mov	r1, #29
	ldr	r2, .L101+8
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
	ldr	r2, .L101+8
	bl	draw_point2
	mov	r0, #43
	mov	r1, #29
	ldr	r2, .L101+8
	bl	draw_point2
	mov	r0, #50
	mov	r1, #29
	ldr	r2, .L101+8
	bl	draw_point2
	mov	r0, #51
	mov	r1, #29
	ldr	r2, .L101+8
	bl	draw_point2
	mov	r0, #60
	mov	r1, #29
	ldr	r2, .L101+8
	bl	draw_point2
	mov	r0, #61
	mov	r1, #29
	ldr	r2, .L101+8
	bl	draw_point2
	mov	r0, #71
	mov	r1, #29
	ldr	r2, .L101+8
	bl	draw_point2
	mov	r0, #72
	mov	r1, #29
	ldr	r2, .L101+8
	bl	draw_point2
	mov	r0, #74
	mov	r1, #29
	ldr	r2, .L101+8
	bl	draw_point2
	mov	r0, #75
	mov	r1, #29
	ldr	r2, .L101+8
	bl	draw_point2
	mov	r0, #82
	mov	r1, #29
	ldr	r2, .L101+8
	bl	draw_point2
	mov	r0, #83
	mov	r1, #29
	ldr	r2, .L101+8
	bl	draw_point2
	mov	r0, #98
	mov	r1, #29
	ldr	r2, .L101
	bl	draw_point2
	mov	r0, #99
	mov	r1, #29
	ldr	r2, .L101+8
	bl	draw_point2
	mov	r0, #100
	mov	r1, #29
	ldr	r2, .L101+8
	bl	draw_point2
	mov	r0, #101
	mov	r1, #29
	ldr	r2, .L101+8
	bl	draw_point2
	mov	r0, #102
	mov	r1, #29
	ldr	r2, .L101+8
	bl	draw_point2
	mov	r0, #103
	mov	r1, #29
	ldr	r2, .L101+8
	bl	draw_point2
	mov	r0, #13
	mov	r1, #30
	ldr	r2, .L101+8
	bl	draw_point2
	mov	r0, #14
	mov	r1, #30
	ldr	r2, .L101+8
	bl	draw_point2
	mov	r0, #21
	mov	r1, #30
	ldr	r2, .L101+8
	bl	draw_point2
	mov	r0, #22
	mov	r1, #30
	ldr	r2, .L101+8
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
	ldr	r2, .L101+8
	bl	draw_point2
	mov	r0, #43
	mov	r1, #30
	ldr	r2, .L101+8
	bl	draw_point2
	mov	r0, #50
	mov	r1, #30
	ldr	r2, .L101+8
	bl	draw_point2
	mov	r0, #51
	mov	r1, #30
	ldr	r2, .L101+8
	bl	draw_point2
	mov	r0, #60
	mov	r1, #30
	ldr	r2, .L101+8
	bl	draw_point2
	mov	r0, #61
	mov	r1, #30
	ldr	r2, .L101+8
	bl	draw_point2
	mov	r0, #71
	mov	r1, #30
	ldr	r2, .L101+8
	bl	draw_point2
	mov	r0, #75
	mov	r1, #30
	ldr	r2, .L101+8
	bl	draw_point2
	mov	r0, #82
	mov	r1, #30
	ldr	r2, .L101+8
	bl	draw_point2
	mov	r0, #83
	mov	r1, #30
	ldr	r2, .L101+8
	bl	draw_point2
	mov	r0, #98
	mov	r1, #30
	ldr	r2, .L101
	bl	draw_point2
	mov	r0, #99
	mov	r1, #30
	ldr	r2, .L101+8
	bl	draw_point2
	mov	r0, #100
	mov	r1, #30
	ldr	r2, .L101+8
	bl	draw_point2
	mov	r0, #101
	mov	r1, #30
	ldr	r2, .L101+8
	bl	draw_point2
	mov	r0, #102
	mov	r1, #30
	ldr	r2, .L101+8
	bl	draw_point2
	mov	r0, #103
	mov	r1, #30
	ldr	r2, .L101+8
	bl	draw_point2
	mov	r0, #13
	mov	r1, #31
	ldr	r2, .L101+8
	bl	draw_point2
	mov	r0, #14
	mov	r1, #31
	ldr	r2, .L101+8
	bl	draw_point2
	mov	r0, #20
	mov	r1, #31
	ldr	r2, .L101+8
	bl	draw_point2
	mov	r0, #21
	mov	r1, #31
	ldr	r2, .L101+8
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
	ldr	r2, .L101+8
	bl	draw_point2
	mov	r0, #43
	mov	r1, #31
	ldr	r2, .L101+8
	bl	draw_point2
	mov	r0, #49
	mov	r1, #31
	ldr	r2, .L101+8
	bl	draw_point2
	mov	r0, #50
	mov	r1, #31
	ldr	r2, .L101+8
	bl	draw_point2
	mov	r0, #60
	mov	r1, #31
	ldr	r2, .L101+8
	bl	draw_point2
	mov	r0, #61
	mov	r1, #31
	ldr	r2, .L101+8
	bl	draw_point2
	mov	r0, #70
	mov	r1, #31
	ldr	r2, .L101+8
	bl	draw_point2
	mov	r0, #71
	mov	r1, #31
	ldr	r2, .L101+8
	bl	draw_point2
	mov	r0, #75
	mov	r1, #31
	ldr	r2, .L101+8
	bl	draw_point2
	mov	r0, #76
	mov	r1, #31
	ldr	r2, .L101+8
	bl	draw_point2
	mov	r0, #82
	b	.L102
.L103:
	.align	2
.L101:
	.word	543
	.word	543
	.word	32767
.L102:
	mov	r1, #31
	ldr	r2, .L101+8
	bl	draw_point2
	mov	r0, #83
	mov	r1, #31
	ldr	r2, .L101+8
	bl	draw_point2
	mov	r0, #98
	mov	r1, #31
	ldr	r2, .L101+4
	bl	draw_point2
	mov	r0, #99
	mov	r1, #31
	ldr	r2, .L101+8
	bl	draw_point2
	mov	r0, #100
	mov	r1, #31
	ldr	r2, .L101+8
	bl	draw_point2
	mov	r0, #101
	mov	r1, #31
	ldr	r2, .L101+8
	bl	draw_point2
	mov	r0, #102
	mov	r1, #31
	ldr	r2, .L101+8
	bl	draw_point2
	mov	r0, #103
	mov	r1, #31
	ldr	r2, .L101+8
	bl	draw_point2
	mov	r0, #13
	mov	r1, #32
	ldr	r2, .L101+8
	bl	draw_point2
	mov	r0, #14
	mov	r1, #32
	ldr	r2, .L101+8
	bl	draw_point2
	mov	r0, #15
	mov	r1, #32
	ldr	r2, .L101+8
	bl	draw_point2
	mov	r0, #16
	mov	r1, #32
	ldr	r2, .L101+8
	bl	draw_point2
	mov	r0, #17
	mov	r1, #32
	ldr	r2, .L101+8
	bl	draw_point2
	mov	r0, #18
	mov	r1, #32
	ldr	r2, .L101+8
	bl	draw_point2
	mov	r0, #19
	mov	r1, #32
	ldr	r2, .L101+8
	bl	draw_point2
	mov	r0, #20
	mov	r1, #32
	ldr	r2, .L101+8
	bl	draw_point2
	mov	r0, #21
	mov	r1, #32
	ldr	r2, .L101+8
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
	ldr	r2, .L101+8
	bl	draw_point2
	mov	r0, #43
	mov	r1, #32
	ldr	r2, .L101+8
	bl	draw_point2
	mov	r0, #44
	mov	r1, #32
	ldr	r2, .L101+8
	bl	draw_point2
	mov	r0, #45
	mov	r1, #32
	ldr	r2, .L101+8
	bl	draw_point2
	mov	r0, #46
	mov	r1, #32
	ldr	r2, .L101+8
	bl	draw_point2
	mov	r0, #47
	mov	r1, #32
	ldr	r2, .L101+8
	bl	draw_point2
	mov	r0, #48
	mov	r1, #32
	ldr	r2, .L101+8
	bl	draw_point2
	mov	r0, #49
	mov	r1, #32
	ldr	r2, .L101+8
	bl	draw_point2
	mov	r0, #50
	mov	r1, #32
	ldr	r2, .L101+8
	bl	draw_point2
	mov	r0, #60
	mov	r1, #32
	ldr	r2, .L101+8
	bl	draw_point2
	mov	r0, #61
	mov	r1, #32
	ldr	r2, .L101+8
	bl	draw_point2
	mov	r0, #70
	mov	r1, #32
	ldr	r2, .L101+8
	bl	draw_point2
	mov	r0, #71
	mov	r1, #32
	ldr	r2, .L101+8
	bl	draw_point2
	mov	r0, #75
	mov	r1, #32
	ldr	r2, .L101+8
	bl	draw_point2
	mov	r0, #76
	mov	r1, #32
	ldr	r2, .L101+8
	bl	draw_point2
	mov	r0, #82
	mov	r1, #32
	ldr	r2, .L101+8
	bl	draw_point2
	mov	r0, #83
	mov	r1, #32
	ldr	r2, .L101+8
	bl	draw_point2
	mov	r0, #98
	mov	r1, #32
	ldr	r2, .L101+4
	bl	draw_point2
	mov	r0, #99
	mov	r1, #32
	ldr	r2, .L101+8
	bl	draw_point2
	mov	r0, #100
	mov	r1, #32
	ldr	r2, .L101+8
	bl	draw_point2
	mov	r0, #102
	mov	r1, #32
	ldr	r2, .L101+8
	bl	draw_point2
	mov	r0, #103
	mov	r1, #32
	ldr	r2, .L101+8
	bl	draw_point2
	mov	r0, #104
	mov	r1, #32
	ldr	r2, .L101+8
	bl	draw_point2
	mov	r0, #13
	mov	r1, #33
	ldr	r2, .L101+8
	bl	draw_point2
	mov	r0, #14
	mov	r1, #33
	ldr	r2, .L101+8
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
	ldr	r2, .L101+8
	bl	draw_point2
	mov	r0, #43
	mov	r1, #33
	ldr	r2, .L101+8
	bl	draw_point2
	mov	r0, #49
	mov	r1, #33
	ldr	r2, .L101+8
	bl	draw_point2
	mov	r0, #60
	mov	r1, #33
	ldr	r2, .L101+8
	bl	draw_point2
	mov	r0, #61
	mov	r1, #33
	ldr	r2, .L101+8
	bl	draw_point2
	mov	r0, #70
	mov	r1, #33
	ldr	r2, .L101+8
	bl	draw_point2
	mov	r0, #71
	mov	r1, #33
	ldr	r2, .L101+8
	bl	draw_point2
	mov	r0, #72
	mov	r1, #33
	ldr	r2, .L101+8
	bl	draw_point2
	mov	r0, #73
	mov	r1, #33
	ldr	r2, .L101+8
	bl	draw_point2
	mov	r0, #74
	mov	r1, #33
	ldr	r2, .L101+8
	bl	draw_point2
	mov	r0, #75
	mov	r1, #33
	ldr	r2, .L101+8
	bl	draw_point2
	mov	r0, #76
	mov	r1, #33
	ldr	r2, .L101+8
	bl	draw_point2
	mov	r0, #82
	mov	r1, #33
	ldr	r2, .L101+8
	bl	draw_point2
	mov	r0, #83
	mov	r1, #33
	ldr	r2, .L101+8
	bl	draw_point2
	mov	r0, #98
	mov	r1, #33
	ldr	r2, .L101+4
	bl	draw_point2
	mov	r0, #99
	mov	r1, #33
	ldr	r2, .L101+8
	bl	draw_point2
	mov	r0, #102
	mov	r1, #33
	ldr	r2, .L101+8
	bl	draw_point2
	mov	r0, #103
	mov	r1, #33
	ldr	r2, .L101+8
	bl	draw_point2
	mov	r0, #104
	mov	r1, #33
	ldr	r2, .L101+8
	bl	draw_point2
	mov	r0, #13
	mov	r1, #34
	ldr	r2, .L101+8
	bl	draw_point2
	mov	r0, #14
	mov	r1, #34
	ldr	r2, .L101+8
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
	ldr	r2, .L101+8
	bl	draw_point2
	mov	r0, #43
	mov	r1, #34
	ldr	r2, .L101+8
	bl	draw_point2
	mov	r0, #49
	mov	r1, #34
	ldr	r2, .L101+8
	bl	draw_point2
	mov	r0, #50
	mov	r1, #34
	ldr	r2, .L101+8
	bl	draw_point2
	mov	r0, #60
	mov	r1, #34
	ldr	r2, .L101+8
	bl	draw_point2
	mov	r0, #61
	mov	r1, #34
	ldr	r2, .L101+8
	bl	draw_point2
	mov	r0, #69
	mov	r1, #34
	ldr	r2, .L101+8
	bl	draw_point2
	mov	r0, #70
	mov	r1, #34
	ldr	r2, .L101+8
	bl	draw_point2
	mov	r0, #71
	mov	r1, #34
	ldr	r2, .L101+8
	bl	draw_point2
	mov	r0, #72
	mov	r1, #34
	ldr	r2, .L101+8
	bl	draw_point2
	mov	r0, #73
	mov	r1, #34
	ldr	r2, .L101+8
	bl	draw_point2
	mov	r0, #74
	mov	r1, #34
	ldr	r2, .L101+8
	bl	draw_point2
	mov	r0, #75
	mov	r1, #34
	ldr	r2, .L101+8
	bl	draw_point2
	mov	r0, #76
	mov	r1, #34
	ldr	r2, .L101+8
	bl	draw_point2
	mov	r0, #77
	mov	r1, #34
	ldr	r2, .L101+8
	bl	draw_point2
	mov	r0, #82
	mov	r1, #34
	ldr	r2, .L101+8
	bl	draw_point2
	mov	r0, #83
	mov	r1, #34
	ldr	r2, .L101+8
	bl	draw_point2
	mov	r0, #98
	mov	r1, #34
	ldr	r2, .L101+4
	bl	draw_point2
	mov	r0, #103
	mov	r1, #34
	ldr	r2, .L101+8
	bl	draw_point2
	mov	r0, #104
	mov	r1, #34
	ldr	r2, .L101+8
	bl	draw_point2
	mov	r0, #105
	mov	r1, #34
	ldr	r2, .L101+8
	bl	draw_point2
	mov	r0, #13
	mov	r1, #35
	ldr	r2, .L101+8
	bl	draw_point2
	mov	r0, #14
	mov	r1, #35
	ldr	r2, .L101+8
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
	ldr	r2, .L101+8
	bl	draw_point2
	mov	r0, #43
	mov	r1, #35
	ldr	r2, .L101+8
	bl	draw_point2
	mov	r0, #50
	mov	r1, #35
	ldr	r2, .L101+8
	bl	draw_point2
	mov	r0, #51
	mov	r1, #35
	ldr	r2, .L101+8
	bl	draw_point2
	mov	r0, #60
	mov	r1, #35
	ldr	r2, .L101+8
	bl	draw_point2
	mov	r0, #61
	mov	r1, #35
	ldr	r2, .L101+8
	bl	draw_point2
	mov	r0, #69
	mov	r1, #35
	ldr	r2, .L101+8
	bl	draw_point2
	mov	r0, #70
	mov	r1, #35
	ldr	r2, .L101+8
	bl	draw_point2
	mov	r0, #76
	mov	r1, #35
	ldr	r2, .L101+8
	bl	draw_point2
	mov	r0, #77
	mov	r1, #35
	ldr	r2, .L101+8
	bl	draw_point2
	mov	r0, #82
	mov	r1, #35
	ldr	r2, .L101+8
	bl	draw_point2
	mov	r0, #83
	mov	r1, #35
	ldr	r2, .L101+8
	bl	draw_point2
	mov	r0, #98
	mov	r1, #35
	ldr	r2, .L101+4
	bl	draw_point2
	mov	r0, #104
	mov	r1, #35
	ldr	r2, .L101+8
	bl	draw_point2
	mov	r0, #105
	mov	r1, #35
	ldr	r2, .L101+8
	bl	draw_point2
	mov	r0, #106
	mov	r1, #35
	ldr	r2, .L101+8
	bl	draw_point2
	mov	r0, #13
	mov	r1, #36
	ldr	r2, .L101+8
	bl	draw_point2
	mov	r0, #14
	mov	r1, #36
	ldr	r2, .L101+8
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
	ldr	r2, .L101+8
	bl	draw_point2
	mov	r0, #43
	mov	r1, #36
	ldr	r2, .L101+8
	bl	draw_point2
	mov	r0, #50
	mov	r1, #36
	ldr	r2, .L101+8
	bl	draw_point2
	mov	r0, #51
	mov	r1, #36
	ldr	r2, .L101+8
	bl	draw_point2
	mov	r0, #60
	mov	r1, #36
	ldr	r2, .L101+8
	bl	draw_point2
	mov	r0, #61
	mov	r1, #36
	ldr	r2, .L101+8
	bl	draw_point2
	mov	r0, #69
	mov	r1, #36
	ldr	r2, .L101+8
	bl	draw_point2
	mov	r0, #77
	mov	r1, #36
	ldr	r2, .L101+8
	bl	draw_point2
	mov	r0, #82
	mov	r1, #36
	ldr	r2, .L101+8
	bl	draw_point2
	mov	r0, #83
	mov	r1, #36
	ldr	r2, .L101+8
	bl	draw_point2
	mov	r0, #98
	mov	r1, #36
	ldr	r2, .L101+4
	bl	draw_point2
	mov	r0, #105
	mov	r1, #36
	ldr	r2, .L101+8
	bl	draw_point2
	mov	r0, #106
	mov	r1, #36
	ldr	r2, .L101+8
	bl	draw_point2
	mov	r0, #107
	mov	r1, #36
	ldr	r2, .L101+8
	bl	draw_point2
	mov	r0, #108
	mov	r1, #36
	ldr	r2, .L101+8
	bl	draw_point2
	mov	r0, #13
	mov	r1, #37
	ldr	r2, .L101+8
	bl	draw_point2
	mov	r0, #14
	mov	r1, #37
	ldr	r2, .L101+8
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
	ldr	r2, .L101+8
	bl	draw_point2
	mov	r0, #43
	mov	r1, #37
	ldr	r2, .L101+8
	bl	draw_point2
	mov	r0, #50
	mov	r1, #37
	ldr	r2, .L101+8
	bl	draw_point2
	mov	r0, #51
	mov	r1, #37
	ldr	r2, .L101+8
	bl	draw_point2
	mov	r0, #60
	mov	r1, #37
	ldr	r2, .L101+8
	bl	draw_point2
	mov	r0, #61
	mov	r1, #37
	ldr	r2, .L101+8
	bl	draw_point2
	mov	r0, #68
	mov	r1, #37
	ldr	r2, .L101+8
	bl	draw_point2
	mov	r0, #69
	mov	r1, #37
	ldr	r2, .L101+8
	bl	draw_point2
	mov	r0, #77
	mov	r1, #37
	ldr	r2, .L101+8
	bl	draw_point2
	mov	r0, #78
	mov	r1, #37
	ldr	r2, .L101+8
	bl	draw_point2
	mov	r0, #82
	mov	r1, #37
	ldr	r2, .L101+8
	bl	draw_point2
	mov	r0, #83
	mov	r1, #37
	ldr	r2, .L101+8
	bl	draw_point2
	mov	r0, #98
	mov	r1, #37
	ldr	r2, .L101+4
	bl	draw_point2
	mov	r0, #106
	mov	r1, #37
	ldr	r2, .L101+8
	bl	draw_point2
	mov	r0, #107
	mov	r1, #37
	ldr	r2, .L101+8
	bl	draw_point2
	mov	r0, #108
	mov	r1, #37
	ldr	r2, .L101+8
	bl	draw_point2
	mov	r0, #13
	mov	r1, #38
	ldr	r2, .L101+8
	bl	draw_point2
	mov	r0, #14
	mov	r1, #38
	ldr	r2, .L101+8
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
	ldr	r2, .L101+8
	bl	draw_point2
	mov	r0, #43
	mov	r1, #38
	ldr	r2, .L101+8
	bl	draw_point2
	mov	r0, #50
	mov	r1, #38
	ldr	r2, .L101+8
	bl	draw_point2
	mov	r0, #51
	mov	r1, #38
	ldr	r2, .L101+8
	bl	draw_point2
	mov	r0, #60
	mov	r1, #38
	ldr	r2, .L101+8
	bl	draw_point2
	mov	r0, #61
	mov	r1, #38
	ldr	r2, .L101+8
	bl	draw_point2
	mov	r0, #68
	mov	r1, #38
	ldr	r2, .L101+8
	bl	draw_point2
	mov	r0, #69
	mov	r1, #38
	ldr	r2, .L101+8
	bl	draw_point2
	mov	r0, #77
	mov	r1, #38
	ldr	r2, .L101+8
	bl	draw_point2
	mov	r0, #78
	mov	r1, #38
	ldr	r2, .L101+8
	bl	draw_point2
	mov	r0, #82
	mov	r1, #38
	ldr	r2, .L101+8
	bl	draw_point2
	mov	r0, #83
	mov	r1, #38
	ldr	r2, .L101+8
	bl	draw_point2
	mov	r0, #84
	mov	r1, #38
	ldr	r2, .L101+8
	bl	draw_point2
	mov	r0, #85
	mov	r1, #38
	ldr	r2, .L101+8
	bl	draw_point2
	mov	r0, #86
	mov	r1, #38
	ldr	r2, .L101+8
	bl	draw_point2
	mov	r0, #87
	mov	r1, #38
	ldr	r2, .L101+8
	bl	draw_point2
	mov	r0, #88
	mov	r1, #38
	ldr	r2, .L101+8
	bl	draw_point2
	mov	r0, #89
	mov	r1, #38
	ldr	r2, .L101+8
	bl	draw_point2
	mov	r0, #90
	mov	r1, #38
	ldr	r2, .L101+8
	bl	draw_point2
	mov	r0, #98
	mov	r1, #38
	ldr	r2, .L101+4
	bl	draw_point2
	mov	r0, #99
	mov	r1, #38
	ldr	r2, .L101+8
	bl	draw_point2
	mov	r0, #98
	mov	r1, #39
	ldr	r2, .L101+4
	bl	draw_point2
	mov	r0, #99
	mov	r1, #39
	ldr	r2, .L101+8
	bl	draw_point2
	mov	r0, #100
	mov	r1, #39
	ldr	r2, .L101+8
	bl	draw_point2
	mov	r0, #98
	mov	r1, #40
	ldr	r2, .L101+4
	bl	draw_point2
	mov	r0, #99
	mov	r1, #40
	ldr	r2, .L101+8
	bl	draw_point2
	mov	r0, #100
	mov	r1, #40
	ldr	r2, .L101+8
	bl	draw_point2
	mov	r0, #101
	mov	r1, #40
	ldr	r2, .L101+8
	bl	draw_point2
	mov	r0, #98
	mov	r1, #41
	ldr	r2, .L101+4
	bl	draw_point2
	mov	r0, #99
	mov	r1, #41
	ldr	r2, .L101+8
	bl	draw_point2
	mov	r0, #100
	mov	r1, #41
	ldr	r2, .L101+8
	bl	draw_point2
	mov	r0, #101
	mov	r1, #41
	ldr	r2, .L101+8
	bl	draw_point2
	mov	r0, #102
	mov	r1, #41
	ldr	r2, .L101+8
	bl	draw_point2
	mov	r0, #98
	mov	r1, #42
	ldr	r2, .L101+4
	bl	draw_point2
	mov	r0, #100
	mov	r1, #42
	ldr	r2, .L101+8
	bl	draw_point2
	mov	r0, #101
	mov	r1, #42
	ldr	r2, .L101+8
	bl	draw_point2
	mov	r0, #102
	mov	r1, #42
	ldr	r2, .L101+8
	bl	draw_point2
	mov	r0, #98
	mov	r1, #43
	ldr	r2, .L101+4
	bl	draw_point2
	mov	r0, #99
	mov	r1, #43
	ldr	r2, .L101+8
	bl	draw_point2
	mov	r0, #100
	mov	r1, #43
	ldr	r2, .L101+8
	bl	draw_point2
	mov	r0, #101
	mov	r1, #43
	ldr	r2, .L101+8
	bl	draw_point2
	mov	r0, #98
	mov	r1, #44
	ldr	r2, .L101+4
	bl	draw_point2
	mov	r0, #99
	mov	r1, #44
	ldr	r2, .L101+8
	bl	draw_point2
	mov	r0, #100
	mov	r1, #44
	ldr	r2, .L101+8
	bl	draw_point2
	mov	r0, #98
	mov	r1, #45
	ldr	r2, .L101+4
	bl	draw_point2
	mov	r0, #99
	mov	r1, #45
	ldr	r2, .L101+8
	bl	draw_point2
	mov	r0, #98
	mov	r1, #46
	ldr	r2, .L101+4
	bl	draw_point2
	mov	r0, #98
	mov	r1, #47
	ldr	r2, .L101+4
	bl	draw_point2
	mov	r0, #98
	mov	r1, #48
	ldr	r2, .L101+4
	bl	draw_point2
	mov	r0, #54
	mov	r1, #58
	ldr	r2, .L101+8
	bl	draw_point2
	mov	r0, #55
	mov	r1, #58
	ldr	r2, .L101+8
	bl	draw_point2
	mov	r0, #53
	mov	r1, #59
	ldr	r2, .L101+8
	bl	draw_point2
	mov	r0, #56
	mov	r1, #59
	ldr	r2, .L101+8
	bl	draw_point2
	mov	r0, #62
	mov	r1, #59
	ldr	r2, .L101+8
	bl	draw_point2
	mov	r0, #73
	mov	r1, #59
	ldr	r2, .L101+8
	bl	draw_point2
	mov	r0, #89
	mov	r1, #59
	ldr	r2, .L101+8
	bl	draw_point2
	mov	r0, #26
	mov	r1, #60
	ldr	r2, .L101+8
	bl	draw_point2
	mov	r0, #27
	mov	r1, #60
	ldr	r2, .L101+8
	bl	draw_point2
	mov	r0, #28
	mov	r1, #60
	ldr	r2, .L101+8
	bl	draw_point2
	mov	r0, #31
	mov	r1, #60
	ldr	r2, .L101+8
	bl	draw_point2
	mov	r0, #33
	mov	r1, #60
	ldr	r2, .L101+8
	bl	draw_point2
	mov	r0, #34
	mov	r1, #60
	ldr	r2, .L101+8
	bl	draw_point2
	mov	r0, #37
	mov	r1, #60
	ldr	r2, .L101+8
	bl	draw_point2
	mov	r0, #38
	mov	r1, #60
	ldr	r2, .L101+8
	bl	draw_point2
	mov	r0, #42
	mov	r1, #60
	ldr	r2, .L101+8
	bl	draw_point2
	mov	r0, #43
	mov	r1, #60
	ldr	r2, .L101+8
	bl	draw_point2
	mov	r0, #44
	mov	r1, #60
	ldr	r2, .L101+8
	bl	draw_point2
	mov	r0, #47
	mov	r1, #60
	ldr	r2, .L101+8
	bl	draw_point2
	mov	r0, #48
	mov	r1, #60
	ldr	r2, .L101+8
	bl	draw_point2
	mov	r0, #49
	mov	r1, #60
	ldr	r2, .L101+8
	bl	draw_point2
	mov	r0, #53
	mov	r1, #60
	ldr	r2, .L101+8
	bl	draw_point2
	mov	r0, #56
	mov	r1, #60
	ldr	r2, .L101+8
	bl	draw_point2
	mov	r0, #61
	mov	r1, #60
	ldr	r2, .L101+8
	bl	draw_point2
	mov	r0, #62
	mov	r1, #60
	ldr	r2, .L101+8
	bl	draw_point2
	mov	r0, #63
	mov	r1, #60
	ldr	r2, .L101+8
	bl	draw_point2
	mov	r0, #66
	mov	r1, #60
	ldr	r2, .L101+8
	bl	draw_point2
	mov	r0, #67
	mov	r1, #60
	ldr	r2, .L101+8
	bl	draw_point2
	mov	r0, #73
	mov	r1, #60
	ldr	r2, .L101+8
	bl	draw_point2
	mov	r0, #74
	mov	r1, #60
	ldr	r2, .L101+8
	bl	draw_point2
	mov	r0, #75
	mov	r1, #60
	ldr	r2, .L101+8
	bl	draw_point2
	mov	r0, #79
	mov	r1, #60
	ldr	r2, .L101+8
	bl	draw_point2
	mov	r0, #80
	mov	r1, #60
	ldr	r2, .L101+8
	bl	draw_point2
	mov	r0, #84
	mov	r1, #60
	ldr	r2, .L101+8
	bl	draw_point2
	mov	r0, #85
	mov	r1, #60
	ldr	r2, .L101+8
	bl	draw_point2
	mov	r0, #91
	mov	r1, #60
	ldr	r2, .L104
	bl	draw_point2
	mov	r0, #92
	mov	r1, #60
	ldr	r2, .L104
	bl	draw_point2
	mov	r0, #93
	mov	r1, #60
	ldr	r2, .L104
	bl	draw_point2
	mov	r0, #26
	mov	r1, #61
	ldr	r2, .L104
	bl	draw_point2
	mov	r0, #29
	mov	r1, #61
	ldr	r2, .L104
	bl	draw_point2
	mov	r0, #31
	mov	r1, #61
	ldr	r2, .L104
	bl	draw_point2
	mov	r0, #32
	mov	r1, #61
	ldr	r2, .L104
	bl	draw_point2
	mov	r0, #36
	mov	r1, #61
	ldr	r2, .L104
	bl	draw_point2
	mov	r0, #39
	mov	r1, #61
	ldr	r2, .L104
	bl	draw_point2
	mov	r0, #41
	mov	r1, #61
	ldr	r2, .L104
	bl	draw_point2
	mov	r0, #46
	mov	r1, #61
	ldr	r2, .L104
	bl	draw_point2
	mov	r0, #53
	mov	r1, #61
	ldr	r2, .L104
	bl	draw_point2
	mov	r0, #56
	mov	r1, #61
	ldr	r2, .L104
	bl	draw_point2
	mov	r0, #62
	mov	r1, #61
	ldr	r2, .L104
	bl	draw_point2
	mov	r0, #65
	mov	r1, #61
	ldr	r2, .L104
	bl	draw_point2
	mov	r0, #68
	mov	r1, #61
	ldr	r2, .L104
	bl	draw_point2
	mov	r0, #73
	mov	r1, #61
	ldr	r2, .L104
	bl	draw_point2
	mov	r0, #76
	mov	r1, #61
	ldr	r2, .L104
	bl	draw_point2
	mov	r0, #78
	mov	r1, #61
	ldr	r2, .L104
	bl	draw_point2
	mov	r0, #81
	mov	r1, #61
	ldr	r2, .L104
	bl	draw_point2
	mov	r0, #83
	mov	r1, #61
	ldr	r2, .L104
	bl	draw_point2
	mov	r0, #86
	mov	r1, #61
	ldr	r2, .L104
	bl	draw_point2
	mov	r0, #89
	mov	r1, #61
	ldr	r2, .L104
	bl	draw_point2
	mov	r0, #91
	mov	r1, #61
	ldr	r2, .L104
	bl	draw_point2
	mov	r0, #94
	mov	r1, #61
	ldr	r2, .L104
	bl	draw_point2
	mov	r0, #18
	mov	r1, #62
	ldr	r2, .L104
	bl	draw_point2
	mov	r0, #19
	mov	r1, #62
	ldr	r2, .L104
	bl	draw_point2
	mov	r0, #20
	mov	r1, #62
	ldr	r2, .L104
	bl	draw_point2
	mov	r0, #21
	mov	r1, #62
	ldr	r2, .L104
	bl	draw_point2
	mov	r0, #22
	mov	r1, #62
	ldr	r2, .L104
	bl	draw_point2
	mov	r0, #26
	mov	r1, #62
	ldr	r2, .L104
	bl	draw_point2
	mov	r0, #29
	mov	r1, #62
	ldr	r2, .L104
	bl	draw_point2
	mov	r0, #31
	mov	r1, #62
	ldr	r2, .L104
	bl	draw_point2
	mov	r0, #36
	mov	r1, #62
	ldr	r2, .L104
	bl	draw_point2
	mov	r0, #37
	mov	r1, #62
	ldr	r2, .L104
	bl	draw_point2
	mov	r0, #38
	mov	r1, #62
	ldr	r2, .L104
	bl	draw_point2
	mov	r0, #39
	mov	r1, #62
	ldr	r2, .L104
	bl	draw_point2
	mov	r0, #42
	mov	r1, #62
	ldr	r2, .L104
	bl	draw_point2
	mov	r0, #43
	mov	r1, #62
	ldr	r2, .L104
	bl	draw_point2
	mov	r0, #46
	mov	r1, #62
	ldr	r2, .L104
	bl	draw_point2
	mov	r0, #47
	mov	r1, #62
	ldr	r2, .L104
	bl	draw_point2
	mov	r0, #48
	mov	r1, #62
	ldr	r2, .L104
	bl	draw_point2
	mov	r0, #53
	mov	r1, #62
	ldr	r2, .L104
	bl	draw_point2
	mov	r0, #54
	mov	r1, #62
	ldr	r2, .L104
	bl	draw_point2
	mov	r0, #55
	mov	r1, #62
	ldr	r2, .L104
	bl	draw_point2
	mov	r0, #56
	mov	r1, #62
	ldr	r2, .L104
	bl	draw_point2
	mov	r0, #62
	mov	r1, #62
	ldr	r2, .L104
	bl	draw_point2
	mov	r0, #65
	mov	r1, #62
	ldr	r2, .L104
	bl	draw_point2
	mov	r0, #68
	mov	r1, #62
	ldr	r2, .L104
	bl	draw_point2
	mov	r0, #73
	mov	r1, #62
	ldr	r2, .L104
	bl	draw_point2
	mov	r0, #76
	mov	r1, #62
	ldr	r2, .L104
	bl	draw_point2
	mov	r0, #78
	mov	r1, #62
	ldr	r2, .L104
	bl	draw_point2
	mov	r0, #79
	mov	r1, #62
	ldr	r2, .L104
	bl	draw_point2
	mov	r0, #80
	mov	r1, #62
	ldr	r2, .L104
	bl	draw_point2
	mov	r0, #81
	mov	r1, #62
	ldr	r2, .L104
	bl	draw_point2
	mov	r0, #83
	mov	r1, #62
	ldr	r2, .L104
	bl	draw_point2
	mov	r0, #86
	mov	r1, #62
	ldr	r2, .L104
	bl	draw_point2
	mov	r0, #89
	mov	r1, #62
	ldr	r2, .L104
	bl	draw_point2
	mov	r0, #91
	mov	r1, #62
	ldr	r2, .L104
	bl	draw_point2
	mov	r0, #94
	mov	r1, #62
	ldr	r2, .L104
	bl	draw_point2
	mov	r0, #98
	mov	r1, #62
	ldr	r2, .L104
	bl	draw_point2
	mov	r0, #99
	mov	r1, #62
	ldr	r2, .L104
	bl	draw_point2
	mov	r0, #100
	mov	r1, #62
	ldr	r2, .L104
	bl	draw_point2
	mov	r0, #101
	mov	r1, #62
	ldr	r2, .L104
	bl	draw_point2
	mov	r0, #102
	mov	r1, #62
	ldr	r2, .L104
	bl	draw_point2
	mov	r0, #26
	mov	r1, #63
	ldr	r2, .L104
	bl	draw_point2
	mov	r0, #29
	mov	r1, #63
	ldr	r2, .L104
	bl	draw_point2
	mov	r0, #31
	mov	r1, #63
	ldr	r2, .L104
	bl	draw_point2
	mov	r0, #36
	mov	r1, #63
	ldr	r2, .L104
	bl	draw_point2
	mov	r0, #44
	mov	r1, #63
	ldr	r2, .L104
	bl	draw_point2
	mov	r0, #49
	mov	r1, #63
	ldr	r2, .L104
	bl	draw_point2
	mov	r0, #53
	mov	r1, #63
	ldr	r2, .L104
	bl	draw_point2
	mov	r0, #56
	mov	r1, #63
	ldr	r2, .L104
	bl	draw_point2
	mov	r0, #62
	mov	r1, #63
	ldr	r2, .L104
	bl	draw_point2
	mov	r0, #65
	mov	r1, #63
	ldr	r2, .L104
	bl	draw_point2
	mov	r0, #68
	mov	r1, #63
	ldr	r2, .L104
	bl	draw_point2
	mov	r0, #73
	mov	r1, #63
	ldr	r2, .L104
	bl	draw_point2
	mov	r0, #76
	mov	r1, #63
	ldr	r2, .L104
	bl	draw_point2
	mov	r0, #78
	mov	r1, #63
	ldr	r2, .L104
	bl	draw_point2
	mov	r0, #83
	mov	r1, #63
	ldr	r2, .L104
	bl	draw_point2
	mov	r0, #86
	mov	r1, #63
	ldr	r2, .L104
	bl	draw_point2
	mov	r0, #89
	mov	r1, #63
	ldr	r2, .L104
	bl	draw_point2
	mov	r0, #91
	mov	r1, #63
	ldr	r2, .L104
	bl	draw_point2
	mov	r0, #94
	mov	r1, #63
	ldr	r2, .L104
	bl	draw_point2
	mov	r0, #26
	mov	r1, #64
	ldr	r2, .L104
	bl	draw_point2
	mov	r0, #27
	mov	r1, #64
	ldr	r2, .L104
	bl	draw_point2
	mov	r0, #28
	mov	r1, #64
	ldr	r2, .L104
	bl	draw_point2
	mov	r0, #31
	mov	r1, #64
	ldr	r2, .L104
	bl	draw_point2
	mov	r0, #37
	mov	r1, #64
	ldr	r2, .L104
	bl	draw_point2
	mov	r0, #38
	mov	r1, #64
	ldr	r2, .L104
	bl	draw_point2
	mov	r0, #41
	mov	r1, #64
	ldr	r2, .L104
	bl	draw_point2
	mov	r0, #42
	mov	r1, #64
	ldr	r2, .L104
	bl	draw_point2
	mov	r0, #43
	mov	r1, #64
	ldr	r2, .L104
	bl	draw_point2
	mov	r0, #46
	mov	r1, #64
	ldr	r2, .L104
	bl	draw_point2
	mov	r0, #47
	mov	r1, #64
	ldr	r2, .L104
	bl	draw_point2
	mov	r0, #48
	mov	r1, #64
	ldr	r2, .L104
	bl	draw_point2
	mov	r0, #53
	mov	r1, #64
	ldr	r2, .L104
	bl	draw_point2
	mov	r0, #56
	mov	r1, #64
	ldr	r2, .L104
	bl	draw_point2
	mov	r0, #62
	mov	r1, #64
	ldr	r2, .L104
	bl	draw_point2
	mov	r0, #63
	mov	r1, #64
	ldr	r2, .L104
	bl	draw_point2
	mov	r0, #66
	mov	r1, #64
	ldr	r2, .L104
	bl	draw_point2
	mov	r0, #67
	mov	r1, #64
	ldr	r2, .L104
	bl	draw_point2
	mov	r0, #73
	mov	r1, #64
	ldr	r2, .L104
	bl	draw_point2
	mov	r0, #74
	mov	r1, #64
	ldr	r2, .L104
	bl	draw_point2
	mov	r0, #75
	mov	r1, #64
	ldr	r2, .L104
	bl	draw_point2
	mov	r0, #79
	mov	r1, #64
	ldr	r2, .L104
	bl	draw_point2
	mov	r0, #80
	mov	r1, #64
	ldr	r2, .L104
	bl	draw_point2
	mov	r0, #84
	mov	r1, #64
	ldr	r2, .L104
	bl	draw_point2
	mov	r0, #85
	mov	r1, #64
	ldr	r2, .L104
	bl	draw_point2
	mov	r0, #86
	mov	r1, #64
	ldr	r2, .L104
	bl	draw_point2
	mov	r0, #89
	mov	r1, #64
	ldr	r2, .L104
	bl	draw_point2
	mov	r0, #91
	mov	r1, #64
	ldr	r2, .L104
	bl	draw_point2
	mov	r0, #94
	mov	r1, #64
	ldr	r2, .L104
	bl	draw_point2
	mov	r0, #26
	mov	r1, #65
	ldr	r2, .L104
	bl	draw_point2
	mov	r0, #86
	mov	r1, #65
	ldr	r2, .L104
	bl	draw_point2
	mov	r0, #26
	mov	r1, #66
	ldr	r2, .L104
	bl	draw_point2
	mov	r0, #84
	mov	r1, #66
	ldr	r2, .L104
	bl	draw_point2
	mov	r0, #85
	mov	r1, #66
	ldr	r2, .L104
	bl	draw_point2
	sub	sp, fp, #4
	@ sp needed
	ldmfd	sp!, {fp, lr}
	bx	lr
.L105:
	.align	2
.L104:
	.word	32767
	.size	draw_title, .-draw_title
	.align	2
	.global	draw_ending
	.type	draw_ending, %function
draw_ending:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 1, uses_anonymous_args = 0
	stmfd	sp!, {fp, lr}
	add	fp, sp, #4
	mov	r0, #0
	bl	draw_bg
	mov	r0, #27
	mov	r1, #37
	ldr	r2, .L107
	bl	draw_point2
	mov	r0, #28
	mov	r1, #37
	ldr	r2, .L107
	bl	draw_point2
	mov	r0, #29
	mov	r1, #37
	ldr	r2, .L107
	bl	draw_point2
	mov	r0, #32
	mov	r1, #37
	ldr	r2, .L107
	bl	draw_point2
	mov	r0, #33
	mov	r1, #37
	ldr	r2, .L107
	bl	draw_point2
	mov	r0, #34
	mov	r1, #37
	ldr	r2, .L107
	bl	draw_point2
	mov	r0, #35
	mov	r1, #37
	ldr	r2, .L107
	bl	draw_point2
	mov	r0, #36
	mov	r1, #37
	ldr	r2, .L107
	bl	draw_point2
	mov	r0, #39
	mov	r1, #37
	ldr	r2, .L107
	bl	draw_point2
	mov	r0, #40
	mov	r1, #37
	ldr	r2, .L107
	bl	draw_point2
	mov	r0, #41
	mov	r1, #37
	ldr	r2, .L107
	bl	draw_point2
	mov	r0, #45
	mov	r1, #37
	ldr	r2, .L107
	bl	draw_point2
	mov	r0, #46
	mov	r1, #37
	ldr	r2, .L107
	bl	draw_point2
	mov	r0, #47
	mov	r1, #37
	ldr	r2, .L107
	bl	draw_point2
	mov	r0, #50
	mov	r1, #37
	ldr	r2, .L107
	bl	draw_point2
	mov	r0, #51
	mov	r1, #37
	ldr	r2, .L107
	bl	draw_point2
	mov	r0, #52
	mov	r1, #37
	ldr	r2, .L107
	bl	draw_point2
	mov	r0, #53
	mov	r1, #37
	ldr	r2, .L107
	bl	draw_point2
	mov	r0, #54
	mov	r1, #37
	ldr	r2, .L107
	bl	draw_point2
	mov	r0, #60
	mov	r1, #37
	ldr	r2, .L107
	bl	draw_point2
	mov	r0, #61
	mov	r1, #37
	ldr	r2, .L107
	bl	draw_point2
	mov	r0, #62
	mov	r1, #37
	ldr	r2, .L107
	bl	draw_point2
	mov	r0, #65
	mov	r1, #37
	ldr	r2, .L107
	bl	draw_point2
	mov	r0, #71
	mov	r1, #37
	ldr	r2, .L107
	bl	draw_point2
	mov	r0, #72
	mov	r1, #37
	ldr	r2, .L107
	bl	draw_point2
	mov	r0, #73
	mov	r1, #37
	ldr	r2, .L107
	bl	draw_point2
	mov	r0, #74
	mov	r1, #37
	ldr	r2, .L107
	bl	draw_point2
	mov	r0, #75
	mov	r1, #37
	ldr	r2, .L107
	bl	draw_point2
	mov	r0, #78
	mov	r1, #37
	ldr	r2, .L107
	bl	draw_point2
	mov	r0, #79
	mov	r1, #37
	ldr	r2, .L107
	bl	draw_point2
	mov	r0, #80
	mov	r1, #37
	ldr	r2, .L107
	bl	draw_point2
	mov	r0, #83
	mov	r1, #37
	ldr	r2, .L107
	bl	draw_point2
	mov	r0, #84
	mov	r1, #37
	ldr	r2, .L107
	bl	draw_point2
	mov	r0, #85
	mov	r1, #37
	ldr	r2, .L107
	bl	draw_point2
	mov	r0, #86
	mov	r1, #37
	ldr	r2, .L107
	bl	draw_point2
	mov	r0, #90
	mov	r1, #37
	ldr	r2, .L107
	bl	draw_point2
	mov	r0, #93
	mov	r1, #37
	ldr	r2, .L107
	bl	draw_point2
	mov	r0, #26
	mov	r1, #38
	ldr	r2, .L107
	bl	draw_point2
	mov	r0, #30
	mov	r1, #38
	ldr	r2, .L107
	bl	draw_point2
	mov	r0, #34
	mov	r1, #38
	ldr	r2, .L107
	bl	draw_point2
	mov	r0, #38
	mov	r1, #38
	ldr	r2, .L107
	bl	draw_point2
	mov	r0, #42
	mov	r1, #38
	ldr	r2, .L107
	bl	draw_point2
	mov	r0, #44
	mov	r1, #38
	ldr	r2, .L107
	bl	draw_point2
	mov	r0, #48
	mov	r1, #38
	ldr	r2, .L107
	bl	draw_point2
	mov	r0, #50
	mov	r1, #38
	ldr	r2, .L107
	bl	draw_point2
	mov	r0, #59
	mov	r1, #38
	ldr	r2, .L107
	bl	draw_point2
	mov	r0, #63
	mov	r1, #38
	ldr	r2, .L107
	bl	draw_point2
	mov	r0, #65
	mov	r1, #38
	ldr	r2, .L107
	bl	draw_point2
	mov	r0, #71
	mov	r1, #38
	ldr	r2, .L107
	bl	draw_point2
	mov	r0, #77
	mov	r1, #38
	ldr	r2, .L107
	bl	draw_point2
	mov	r0, #81
	mov	r1, #38
	ldr	r2, .L107
	bl	draw_point2
	mov	r0, #83
	mov	r1, #38
	ldr	r2, .L107
	bl	draw_point2
	mov	r0, #87
	mov	r1, #38
	ldr	r2, .L107
	bl	draw_point2
	mov	r0, #90
	mov	r1, #38
	ldr	r2, .L107
	bl	draw_point2
	mov	r0, #93
	mov	r1, #38
	ldr	r2, .L107
	bl	draw_point2
	mov	r0, #26
	mov	r1, #39
	ldr	r2, .L107
	bl	draw_point2
	mov	r0, #34
	mov	r1, #39
	ldr	r2, .L107
	bl	draw_point2
	mov	r0, #38
	mov	r1, #39
	ldr	r2, .L107
	bl	draw_point2
	mov	r0, #42
	mov	r1, #39
	ldr	r2, .L107
	bl	draw_point2
	mov	r0, #44
	mov	r1, #39
	ldr	r2, .L107
	bl	draw_point2
	mov	r0, #50
	mov	r1, #39
	ldr	r2, .L107
	bl	draw_point2
	mov	r0, #59
	mov	r1, #39
	ldr	r2, .L107
	bl	draw_point2
	mov	r0, #65
	mov	r1, #39
	ldr	r2, .L107
	bl	draw_point2
	mov	r0, #71
	mov	r1, #39
	ldr	r2, .L107
	bl	draw_point2
	mov	r0, #77
	mov	r1, #39
	ldr	r2, .L107
	bl	draw_point2
	mov	r0, #81
	mov	r1, #39
	ldr	r2, .L107
	bl	draw_point2
	mov	r0, #83
	mov	r1, #39
	ldr	r2, .L107
	bl	draw_point2
	mov	r0, #87
	mov	r1, #39
	ldr	r2, .L107
	bl	draw_point2
	mov	r0, #90
	mov	r1, #39
	ldr	r2, .L107
	bl	draw_point2
	mov	r0, #93
	mov	r1, #39
	ldr	r2, .L107
	bl	draw_point2
	mov	r0, #27
	mov	r1, #40
	ldr	r2, .L107
	bl	draw_point2
	mov	r0, #28
	mov	r1, #40
	ldr	r2, .L107
	bl	draw_point2
	mov	r0, #29
	mov	r1, #40
	ldr	r2, .L107
	bl	draw_point2
	mov	r0, #34
	mov	r1, #40
	ldr	r2, .L107
	bl	draw_point2
	mov	r0, #38
	mov	r1, #40
	ldr	r2, .L107
	bl	draw_point2
	mov	r0, #39
	mov	r1, #40
	ldr	r2, .L107
	bl	draw_point2
	mov	r0, #40
	mov	r1, #40
	ldr	r2, .L107
	bl	draw_point2
	mov	r0, #41
	mov	r1, #40
	ldr	r2, .L107
	bl	draw_point2
	mov	r0, #42
	mov	r1, #40
	ldr	r2, .L107
	bl	draw_point2
	mov	r0, #44
	mov	r1, #40
	ldr	r2, .L107
	bl	draw_point2
	mov	r0, #46
	mov	r1, #40
	ldr	r2, .L107
	bl	draw_point2
	mov	r0, #47
	mov	r1, #40
	ldr	r2, .L107
	bl	draw_point2
	mov	r0, #48
	mov	r1, #40
	ldr	r2, .L107
	bl	draw_point2
	mov	r0, #50
	mov	r1, #40
	ldr	r2, .L107
	bl	draw_point2
	mov	r0, #51
	mov	r1, #40
	ldr	r2, .L107
	bl	draw_point2
	mov	r0, #52
	mov	r1, #40
	ldr	r2, .L107
	bl	draw_point2
	mov	r0, #53
	mov	r1, #40
	ldr	r2, .L107
	bl	draw_point2
	mov	r0, #54
	mov	r1, #40
	ldr	r2, .L107
	bl	draw_point2
	mov	r0, #59
	mov	r1, #40
	ldr	r2, .L107
	bl	draw_point2
	mov	r0, #65
	mov	r1, #40
	ldr	r2, .L107
	bl	draw_point2
	mov	r0, #71
	mov	r1, #40
	ldr	r2, .L107
	bl	draw_point2
	mov	r0, #72
	mov	r1, #40
	ldr	r2, .L107
	bl	draw_point2
	mov	r0, #73
	mov	r1, #40
	ldr	r2, .L107
	bl	draw_point2
	mov	r0, #74
	mov	r1, #40
	ldr	r2, .L107
	bl	draw_point2
	mov	r0, #75
	mov	r1, #40
	ldr	r2, .L107
	bl	draw_point2
	mov	r0, #77
	mov	r1, #40
	ldr	r2, .L107
	bl	draw_point2
	mov	r0, #78
	mov	r1, #40
	ldr	r2, .L107
	bl	draw_point2
	mov	r0, #79
	mov	r1, #40
	ldr	r2, .L107
	bl	draw_point2
	mov	r0, #80
	mov	r1, #40
	ldr	r2, .L107
	bl	draw_point2
	mov	r0, #81
	mov	r1, #40
	ldr	r2, .L107
	bl	draw_point2
	mov	r0, #83
	mov	r1, #40
	ldr	r2, .L107
	bl	draw_point2
	mov	r0, #84
	mov	r1, #40
	ldr	r2, .L107
	bl	draw_point2
	mov	r0, #85
	mov	r1, #40
	ldr	r2, .L107
	bl	draw_point2
	mov	r0, #86
	mov	r1, #40
	ldr	r2, .L107
	bl	draw_point2
	mov	r0, #90
	mov	r1, #40
	ldr	r2, .L107
	bl	draw_point2
	mov	r0, #93
	mov	r1, #40
	ldr	r2, .L107
	bl	draw_point2
	mov	r0, #30
	mov	r1, #41
	ldr	r2, .L107
	bl	draw_point2
	mov	r0, #34
	mov	r1, #41
	ldr	r2, .L107
	bl	draw_point2
	mov	r0, #38
	mov	r1, #41
	ldr	r2, .L107
	bl	draw_point2
	mov	r0, #42
	mov	r1, #41
	ldr	r2, .L107
	bl	draw_point2
	mov	r0, #44
	mov	r1, #41
	ldr	r2, .L107
	bl	draw_point2
	mov	r0, #48
	mov	r1, #41
	ldr	r2, .L107
	bl	draw_point2
	mov	r0, #50
	mov	r1, #41
	ldr	r2, .L107
	bl	draw_point2
	mov	r0, #59
	mov	r1, #41
	ldr	r2, .L107
	bl	draw_point2
	mov	r0, #65
	mov	r1, #41
	ldr	r2, .L107
	bl	draw_point2
	mov	r0, #71
	mov	r1, #41
	ldr	r2, .L107
	bl	draw_point2
	mov	r0, #77
	mov	r1, #41
	ldr	r2, .L107
	bl	draw_point2
	mov	r0, #81
	mov	r1, #41
	ldr	r2, .L107
	bl	draw_point2
	mov	r0, #83
	mov	r1, #41
	ldr	r2, .L107
	bl	draw_point2
	mov	r0, #86
	mov	r1, #41
	ldr	r2, .L107
	bl	draw_point2
	mov	r0, #90
	mov	r1, #41
	ldr	r2, .L107
	bl	draw_point2
	mov	r0, #93
	mov	r1, #41
	ldr	r2, .L107
	bl	draw_point2
	mov	r0, #26
	mov	r1, #42
	ldr	r2, .L107
	bl	draw_point2
	mov	r0, #30
	mov	r1, #42
	ldr	r2, .L107
	bl	draw_point2
	mov	r0, #34
	mov	r1, #42
	ldr	r2, .L107
	bl	draw_point2
	mov	r0, #38
	mov	r1, #42
	ldr	r2, .L107
	bl	draw_point2
	mov	r0, #42
	mov	r1, #42
	ldr	r2, .L107
	bl	draw_point2
	mov	r0, #44
	mov	r1, #42
	ldr	r2, .L107
	bl	draw_point2
	mov	r0, #48
	mov	r1, #42
	ldr	r2, .L107
	bl	draw_point2
	mov	r0, #50
	mov	r1, #42
	ldr	r2, .L107
	bl	draw_point2
	mov	r0, #59
	mov	r1, #42
	ldr	r2, .L107
	bl	draw_point2
	mov	r0, #63
	mov	r1, #42
	ldr	r2, .L107
	bl	draw_point2
	mov	r0, #65
	mov	r1, #42
	ldr	r2, .L107
	bl	draw_point2
	mov	r0, #71
	mov	r1, #42
	ldr	r2, .L107
	bl	draw_point2
	mov	r0, #77
	mov	r1, #42
	ldr	r2, .L107
	bl	draw_point2
	mov	r0, #81
	mov	r1, #42
	ldr	r2, .L107
	bl	draw_point2
	mov	r0, #83
	mov	r1, #42
	ldr	r2, .L107
	bl	draw_point2
	mov	r0, #87
	mov	r1, #42
	ldr	r2, .L107
	bl	draw_point2
	mov	r0, #27
	mov	r1, #43
	ldr	r2, .L107
	bl	draw_point2
	mov	r0, #28
	mov	r1, #43
	ldr	r2, .L107
	bl	draw_point2
	mov	r0, #29
	mov	r1, #43
	ldr	r2, .L107
	bl	draw_point2
	mov	r0, #34
	mov	r1, #43
	ldr	r2, .L107
	bl	draw_point2
	mov	r0, #38
	mov	r1, #43
	ldr	r2, .L107
	bl	draw_point2
	mov	r0, #42
	mov	r1, #43
	ldr	r2, .L107
	bl	draw_point2
	mov	r0, #45
	mov	r1, #43
	ldr	r2, .L107
	bl	draw_point2
	mov	r0, #46
	mov	r1, #43
	ldr	r2, .L107
	bl	draw_point2
	mov	r0, #47
	mov	r1, #43
	ldr	r2, .L107
	bl	draw_point2
	mov	r0, #50
	mov	r1, #43
	ldr	r2, .L107
	bl	draw_point2
	mov	r0, #51
	mov	r1, #43
	ldr	r2, .L107
	bl	draw_point2
	mov	r0, #52
	mov	r1, #43
	ldr	r2, .L107
	bl	draw_point2
	mov	r0, #53
	mov	r1, #43
	ldr	r2, .L107
	bl	draw_point2
	mov	r0, #54
	mov	r1, #43
	ldr	r2, .L107
	bl	draw_point2
	mov	r0, #60
	mov	r1, #43
	ldr	r2, .L107
	bl	draw_point2
	mov	r0, #61
	mov	r1, #43
	ldr	r2, .L107
	bl	draw_point2
	mov	r0, #62
	mov	r1, #43
	ldr	r2, .L107
	bl	draw_point2
	mov	r0, #65
	mov	r1, #43
	ldr	r2, .L107
	bl	draw_point2
	mov	r0, #66
	mov	r1, #43
	ldr	r2, .L107
	bl	draw_point2
	mov	r0, #67
	mov	r1, #43
	ldr	r2, .L107
	bl	draw_point2
	mov	r0, #68
	mov	r1, #43
	ldr	r2, .L107
	bl	draw_point2
	mov	r0, #69
	mov	r1, #43
	ldr	r2, .L107
	bl	draw_point2
	mov	r0, #71
	mov	r1, #43
	ldr	r2, .L107
	bl	draw_point2
	mov	r0, #72
	mov	r1, #43
	ldr	r2, .L107
	bl	draw_point2
	mov	r0, #73
	mov	r1, #43
	ldr	r2, .L107
	bl	draw_point2
	mov	r0, #74
	mov	r1, #43
	ldr	r2, .L107
	bl	draw_point2
	mov	r0, #75
	mov	r1, #43
	ldr	r2, .L107
	bl	draw_point2
	mov	r0, #77
	mov	r1, #43
	ldr	r2, .L107
	bl	draw_point2
	mov	r0, #81
	mov	r1, #43
	ldr	r2, .L107
	bl	draw_point2
	mov	r0, #83
	mov	r1, #43
	ldr	r2, .L107
	bl	draw_point2
	mov	r0, #87
	mov	r1, #43
	ldr	r2, .L107
	bl	draw_point2
	mov	r0, #90
	mov	r1, #43
	ldr	r2, .L107
	bl	draw_point2
	mov	r0, #93
	mov	r1, #43
	ldr	r2, .L107
	bl	draw_point2
	sub	sp, fp, #4
	@ sp needed
	ldmfd	sp!, {fp, lr}
	bx	lr
.L108:
	.align	2
.L107:
	.word	32767
	.size	draw_ending, .-draw_ending
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
	b	.L110
.L111:
	ldr	r3, [fp, #-8]
	add	r3, r3, #1
	str	r3, [fp, #-8]
.L110:
	ldr	r2, [fp, #-8]
	ldr	r3, [fp, #-16]
	cmp	r2, r3
	blt	.L111
	sub	sp, fp, #0
	@ sp needed
	ldr	fp, [sp], #4
	bx	lr
	.size	sleep, .-sleep
	.ident	"GCC: (GNU Tools for ARM Embedded Processors) 4.8.4 20140725 (release) [ARM/embedded-4_8-branch revision 213147]"
