.data
.text
.global Pop
Pop:
    @ r0=stack
    stmfd   sp!,{lr}
    ldr     r2,[r0,#404]    @ r2 has top index

    mov     r1,r0           @ r1 now has stack
    mov     ip,#0

while:
    ldr     r0,[r1,ip]
    bl      printf
    cmp     ip,r2
    beq     done
    add     ip,ip,#1
    b       while

done:
    ldmfd   sp!,{lr}
    bx      lr