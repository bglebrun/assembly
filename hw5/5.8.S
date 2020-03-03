.text
.global     bytecopy

bytecopy:
    push r4
    @ char dest, char src, int count
    sub     sp,sp,#12
    @ char dest(sp+4)
    str     r0,[sp,#4]
    @ char src(sp+8)
    str     r1,[sp,#8]
    @ int count(sp)
    str     r2,[sp]
    
    @ count--
    sub     r2,r2,#1
    str     r2,[sp]

    @while
    ldr     r0,[sp,#4]  @ dest ptr
    ldr     r1,[sp,#8]  @ src ptr
    ldr     r2,[sp]     @ counter
while:
    ldr     r3,[sp,#4]  @ get destination pointer
    add     r3,r3,r2    @ add counter offset to address
    
    ldr     r4,[sp,#8]  @ get source pointer
    add     r4,r4,r2    @ add counter offset to address
    ldr     r4,[r4]     @ load contents of address
    str     r4,[r3]     @ store contents of r4 to address in r3

    @ count--
    sub     r2,r2,#1
    str     r2,[sp]

    cmp     r2,#-1
    bgt     while

    @@ return 0;
    pop     r4
    add     sp,sp,#12
    mov     r0,#0
    .end