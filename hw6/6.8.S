.data
.text
.global Pop
Pop:
    @ r0=stack
    stmfd   sp!,{lr}
    ldr     r2,[r0,#404]    @ r2 has top index

    mov     ip,#4
    mul     r1,r2,ip
    ldr     r0,[r0,r1]
    ldmfd   sp!,{lr}
    bx      lr