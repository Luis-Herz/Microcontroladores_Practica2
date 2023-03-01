.section .text

.global main

//; r0 = buffer to write to
//; r1 = number of bytes to read
read_user_input:
    push {lr}
    push {r1}
    push {r0}
    mov r7, #0x3    
    mov r0, #0x0
    pop {r1}
    pop {r2}
    svc 0x0
    pop {pc}

//; r0 = pointer to a string of numbers
my_atoi:
    push {lr}
    mov r2, #0x0        @ our string lenght counter

_string_lenght_loop:
    ldrb r8, [r0]
    cmp r8, #0xa
    beq _count
    add r0, r0, #1      @ pointer to the string
    add r2, r2, #1      @ value that track the lenght of the string
    b _string_lenght_loop

_count:
    sub r0, r0, #1
    ldrb r8, [r0]       @ the first number in the string
    sub r8, r8, #0x30
    mov r0, r8


    pop {pc}

main:

//; estos dos bloques de instrucciones limitan el numero de elementos que se leeran
    @ read user input
    ldr r0, =first
    ldr r1, =#0x6
    bl read_user_input

    ldr r0, =second
    ldr r1, =#0x6
    bl read_user_input

    @ convert that input into a number
    ldr r0, =first
    bl my_atoi
    mov r4, r0
    
    ldr r0, =second
    bl my_atoi
    mov r5, r0

    @ add the two inputs
    add r0, r4, r5
    mov r7, #0x4

    mov r7, #0x1
    svc 0x0


.section .data

first:
    .skip 8

second:
    .skip 8

