.data
    scnf:   .asciz  "%d"
    .align          2
.text
.global     read_and_add
read_and_add:
    @ int a(sp), b(sp+4), sum(sp+8);
    sub     sp,sp,#8   @ allocate

    ldr     r0,=scnf    @ load scan string to r0
    ldr     r1,sp       @ load address of a to r1
    bl      scanf       @ scanf

    ldr     r0,=scnf    @ load scan string to r0 (unecessary)
    ldr     r1,sp       @ load sp address to r1
    add     r1,r1,#4    @ offset by 4 to get b address
    bl      scanf       @ scanf

    ldr     r0,[sp]     @ load a
    ldr     r1,[sp,#4]  @ load b
    add     r0,r0,r1    @ a = a + b
    @ answer already in r0 to return

    add     sp,sp,#8    @ deallocate

    .end
    