        .data
str:    .asciz  "Benjamin LeBrun\n" @ name in null terminated string

        .text
        .globl  main
        /* beginning of the main function, prints name then returns */

main:   stmfd   sp!, {lr}   @ return address on stack
        ldr     r0, =str    @ load pointer to format string
        bl      printf      @ printf our string
        mov     r0, #0      @ return code to reg 0
        ldmfd   sp!, {lr}   @ pop return address
        mov     pc, lr      @ return from main