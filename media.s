	.arch armv7-m
	.eabi_attribute 20, 1
	.eabi_attribute 21, 1
	.eabi_attribute 23, 3
	.eabi_attribute 24, 1
	.eabi_attribute 25, 1
	.eabi_attribute 26, 2
	.eabi_attribute 30, 6
	.eabi_attribute 34, 1
	.eabi_attribute 18, 4
	.file	"media.c"
	.text
	.align	1
	.global	main
	.syntax unified
	.thumb
	.thumb_func
	.fpu softvfp
	.type	main, %function
main:
	@ args = 0, pretend = 0, frame = 24
	@ frame_needed = 1, uses_anonymous_args = 0
    #prologue stars here
	push	{r7, lr}
	sub	sp, sp, #24
	add	r7, sp, #0
	ldr	r3, .L6
	ldr	r3, [r3]
	str	r3, [r7, #20]
	mov	r3, #0
	movs	r3, #0
	str	r3, [r7]
	b	.L2
.L3:
	ldr	r3, [r7]
	adds	r3, r3, #1
	str	r3, [r7]
.L2:
	ldr	r3, [r7]
	cmp	r3, #7
	ble	.L3
	movs	r3, #8
	str	r3, [r7, #4]
	add	r3, r7, #16
	ldr	r1, [r7, #4]
	mov	r0, r3
	bl	promedioDeArreglo
	strd	r0, [r7, #8]
	movs	r3, #0
	ldr	r2, .L6
	ldr	r1, [r2]
	ldr	r2, [r7, #20]
	eors	r1, r2, r1
	mov	r2, #0
	beq	.L5
	bl	__stack_chk_fail
.L5:
	mov	r0, r3
	adds	r7, r7, #24
	mov	sp, r7
	@ sp needed
	pop	{r7, pc}
.L7:
	.align	2
.L6:
	.word	__stack_chk_guard
	.size	main, .-main
	.global	__aeabi_i2d
	.global	__aeabi_dadd
	.global	__aeabi_ddiv
	.align	1
	.global	promedioDeArreglo
	.syntax unified
	.thumb
	.thumb_func
	.fpu softvfp
	.type	promedioDeArreglo, %function
promedioDeArreglo:
#Funtion body
	@ args = 0, pretend = 0, frame = 24
	@ frame_needed = 1, uses_anonymous_args = 0
	push	{r7, lr}
	sub	sp, sp, #24
	add	r7, sp, #0
	str	r0, [r7, #4]
	str	r1, [r7]
	mov	r2, #0
	mov	r3, #0
	strd	r2, [r7, #16]
	movs	r3, #0
	str	r3, [r7, #12]
	b	.L9
.L10:
	ldr	r3, [r7, #12]
	lsls	r3, r3, #2
	ldr	r2, [r7, #4]
	add	r3, r3, r2
	ldr	r3, [r3]
	mov	r0, r3
	bl	__aeabi_i2d
	mov	r2, r0
	mov	r3, r1
	ldrd	r0, [r7, #16]
	bl	__aeabi_dadd
	mov	r2, r0
	mov	r3, r1
	strd	r2, [r7, #16]
	ldr	r3, [r7, #12]
	adds	r3, r3, #1
	str	r3, [r7, #12]
.L9:
	ldr	r2, [r7, #12]
	ldr	r3, [r7]
	cmp	r2, r3
	blt	.L10
	ldr	r0, [r7]
	bl	__aeabi_i2d
	mov	r2, r0
	mov	r3, r1
	ldrd	r0, [r7, #16]
	bl	__aeabi_ddiv
	#Epilogue
	mov	r2, r0
	mov	r3, r1
	mov	r0, r2
	mov	r1, r3
	adds	r7, r7, #24
	mov	sp, r7
	@ sp needed
	pop	{r7, pc}
	.size	promedioDeArreglo, .-promedioDeArreglo
	.ident	"GCC: (Ubuntu 10.3.0-1ubuntu1~20.04) 10.3.0"
	.section	.note.GNU-stack,"",%progbits
