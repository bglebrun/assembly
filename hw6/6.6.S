.data
.text
.global Push
Push:
    @ r0=stack, r1=value
    stmfd   sp!,{lr}
    ldr     r2,[r0,#404]    @ r2 has top index
    mov     ip,#100
    cmp     r2,ip
    beq     fail

    str     r1,[r0,r2]
    add     r2,r2,#1
    str     r2,[r0,#404]
    mov     r0,#1
    ldmfd   sp!,{lr}
    bx      lr

fail:
    mov     r0,#0
    ldmfd   sp!,{lr}
    bx      lr