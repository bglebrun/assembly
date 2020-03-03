.text
.global     average
average:
    @ int *array(sp), int number_of_items(sp+4), int i(sp+8)=0, int sum(sp+12)=0
    sub     sp,sp,#16
    str     r0,[sp]
    str     r1,[sp,#4]
    mov     r1,#0
    str     r1,[sp,#8]
    str     r1,[sp,#12]

loop:
    ldr     r0,[sp]     @ load array pointer to r0
    ldr     r0,[r0]     @ load array vaule at r0
    ldr     r1,[sp,#12] @ load average
    add     r1,r1,r0    @ sum
    str     r1,[sp,#12] @ store calculated average

    ldr     r0,[sp,#8]  @ load i(sp+8)
    add     r1,r1,#1    @ i++
    str     r1,[sp,#8]  @ store i(sp+8)

    ldr     r2,[sp,#4]  @ load number_of_items(sp+4)
    cmp     r1,r2       @ compare i to num of items
    blt     loop

    ldr     r0,[sp,#12] @ load sum
    ldr     r1,[sp,#4]  @ load num of items
    bl      divide      @ should just return calculated average to r0, requiring nothing more of us

    add     sp,sp,#16   @ ans should already be in r0 to return

    .end