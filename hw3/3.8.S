i:  .word 4
while:
        ldm r0!,{r2-r5}
        stm r1!,{r2-r5}
        movs r2,#i
        subs r2,r2,#1
        movs i,r2
        cmp r2, #0
        bne while