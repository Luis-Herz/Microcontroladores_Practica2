	.arch armv7-m
	.fpu softvfp
	.eabi_attribute 20, 1
	.eabi_attribute 21, 1
	.eabi_attribute 23, 3
	.eabi_attribute 24, 1
	.eabi_attribute 25, 1
	.eabi_attribute 26, 2
	.eabi_attribute 30, 6
	.eabi_attribute 34, 1
	.eabi_attribute 18, 4
	.file	"invertir.c"
	.text
	.align	1
	.global	invierte
	.syntax unified
	.thumb
	.thumb_func
	.type	invierte, %function

# This function reads an ascii string from STDIN
# Arguments:
#		- r0 stores the base address of the writing buffer
#		- r1 stores the number of bytes to read
read_input: 
	push {r7}
	sub sp, sp, #12
	add r7, sp, #0
	str r0, [r7]
	str r1, [r7, #4]

	ldr r2, [r7, #4]
	ldr r1, [r7]
	mov r0, #0
	mov r7, #3
	svc 0x0
	mov r3, r0
	add r7, sp, #0

	mov r0, r3
	adds r7, r7, #12
	mov sp, r7
	pop {r7}
	bx lr

invierte:
	@ args = 0, pretend = 0, frame = 40
	@ frame_needed = 1, uses_anonymous_args = 0
	push	{r7, lr}
	sub	sp, sp, #40
	add	r7, sp, #0
	str	r0, [r7, #4]
	str	r1, [r7]
	ldr	r3, .L8
	ldr	r3, [r3]
	str	r3, [r7, #36]
	mov	r3, #0
	add	r3, r7, #16
	movs	r2, #0
	str	r2, [r3]
	str	r2, [r3, #4]
	str	r2, [r3, #8]
	str	r2, [r3, #12]
	str	r2, [r3, #16]
	movs	r3, #0				@ m = 0
	str	r3, [r7, #8]
	ldr	r3, [r7]
	subs	r3, r3, #1			@ i = tam - 1
	str	r3, [r7, #12]
	b	.L2
.L3:
	ldr	r3, [r7, #12]
	lsls	r3, r3, #2
	ldr	r2, [r7, #4]
	add	r3, r3, r2
	ldr	r2, [r3]
	ldr	r3, [r7, #8]
	lsls	r3, r3, #2
	adds	r3, r3, #40
	add	r3, r3, r7
	str	r2, [r3, #-24]
	ldr	r3, [r7, #8]
	adds	r3, r3, #1
	str	r3, [r7, #8]
	ldr	r3, [r7, #12]
	subs	r3, r3, #1
	str	r3, [r7, #12]
.L2:
	ldr	r3, [r7, #12]
	cmp	r3, #0
	bge	.L3
	movs	r3, #0
	str	r3, [r7, #12]
	b	.L4
.L5:
	ldr	r3, [r7, #12]
	adds	r3, r3, #1
	str	r3, [r7, #12]
.L4:
	ldr	r2, [r7, #12]
	ldr	r3, [r7]
	cmp	r2, r3
	blt	.L5
	nop
	ldr	r3, .L8
	ldr	r2, [r3]
	ldr	r3, [r7, #36]
	eors	r2, r3, r2
	mov	r3, #0
	beq	.L7
	bl	__stack_chk_fail
.L7:
	adds	r7, r7, #40
	mov	sp, r7
	@ sp needed
	pop	{r7, pc}
.L9:
	.align	2
.L8:
	.word	__stack_chk_guard
	.size	invierte, .-invierte
	.align	1
	.global	main
	.syntax unified
	.thumb
	.thumb_func
	.type	main, %function
main:
	@ args = 0, pretend = 0, frame = 32
	@ frame_needed = 1, uses_anonymous_args = 0
	push	{r7, lr}
	sub	sp, sp, #32
	add	r7, sp, #0
	ldr	r3, .L15
	ldr	r3, [r3]
	str	r3, [r7, #28]
	mov	r3, #0
	add	r3, r7, #8
	movs	r2, #0
	str	r2, [r3]
	str	r2, [r3, #4]
	str	r2, [r3, #8]
	str	r2, [r3, #12]
	str	r2, [r3, #16]
	movs	r3, #0
	str	r3, [r7, #4]
	b	.L11
.L12:
	ldr	r3, [r7, #4]
	adds	r3, r3, #1
	str	r3, [r7, #4]
.L11:
	ldr	r3, [r7, #4]
	cmp	r3, #4
	ble	.L12

	@ aqui va el llamado a funcion para leer del teclado

	add	r3, r7, #8
	movs	r1, #5
	mov	r0, r3
	bl	invierte
	movs	r3, #0
	ldr	r2, .L15
	ldr	r1, [r2]
	ldr	r2, [r7, #28]
	eors	r1, r2, r1
	mov	r2, #0
	beq	.L14
	bl	__stack_chk_fail
.L14:
	mov	r0, r3
	adds	r7, r7, #32
	mov	sp, r7
	@ sp needed
	pop	{r7, pc}
.L16:
	.align	2
.L15:
	.word	__stack_chk_guard
	.size	main, .-main
	.ident	"GCC: (Ubuntu 11.3.0-6ubuntu1) 11.3.0"
	.section	.note.GNU-stack,"",%progbits
