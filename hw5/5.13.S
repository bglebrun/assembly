.data
    table:  .space  50
.text
.global     factorial
factorial:
    @ int x;
    sub     sp,sp,#4   @ allocate
    ldr     r0,[sp]

    cmp     r0,#2
    blt     return_1

    ldr     r1,=table   @ get table ptr
    add     r1,r1,r0    @ move to table[x]
    ldr     r1,[r1]     @ dereference
    cmp     r0,#50
    cmplt   r1,#0
    beq    add_to_table

    ldr     r1,[sp]     @ load x into r1
    cmp     r1,#50      @ see if x is less than 50
    blt     get_table   @ if so, grab from our table

    @ otherwise too large to be in our table
    push    r5          @ about to use non-volatile reg
    ldr     r5,[sp]     @ load x
    sub     r0,r5,#1    @ r0 = r1-1
    bl      factorial   @ recall factorial
    mul     r0,r0,r5    @ multiply results of factorial with x
    pop     r5          @ restore non-volatile reg
    b       end         @ result should already be in r0

add_to_table:
    ldr     r1,[sp]     @ load x
    sub     r0,r1,#1
    bl      factorial

    ldr     r1,=table   @ get table ptr
    add     r1,r1,r0    @ move to table[x]
    ldr     r2,[sp]     @ load x

    mul     r0,r2,r0    @ result from factorial shoudl still be in r0
    str     r0,[r1]     @ store result in table[x] to r0
    b       end

return_1:
    mov     r0,#1       @ 1 is the answer in r0
    b       end

get_table:
    ldr     r0,[sp]     @ load x
    ldr     r1,=table   @ load table address
    add     r0,r0,r1    @ move table address to x
    ldr     r0,[r0]     @ dereference for answer
    b       end

end:
    .end