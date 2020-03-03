.data
.text
.global Pop
Pop:
    @ r0=stack
    stmfd   sp!,{lr}
    ldr     r2,[r0,#404]    @ r2 has top index
    mov     ip,#0
    cmp     r2,ip
    beq     fail

    subs    r2,r2,#1
    str     r2,[r0,#404]
    mov     r0,#1
    ldmfd   sp!,{lr}
    bx      lr

fail:
    mov     r0,#0
    ldmfd   sp!,{lr}
    bx      lr