.data
hi: .asciz  "hi!\n"
.align      2
.text
.global     main

main:
    stmfd   sp!,{lr}
    @int i = 0
    sub     sp,sp,#4
    mov     r0,#0
    str     r0,sp

for:
    ldr     r0,=hi
    bl      printf
    @ if i<10, break
    ldr     r1,sp
    ldr     r2,[r1]
    add     r2,r2,#1
    str     r2,[r1]
    cmp     r2,#10
    blt     for

    @@ return 0;
    add     sp,sp,#4
    mov     r0,#0
    ldmfd   sp!,{lr}
    mov     pc,lr
    .end