@@ #include <stdio.h>
        .data
scnfmt: .asciz  "%d"
prtfmt: .asciz  "%d\n"

        .text
        .global main

@@ int main() {
main:   stmfd   sp!,{lr}


    @@ int i, t, neg=0;
        sub     sp,sp,#12

        mov     r0,#0
        str     r0,[sp,#8]

    @@ scanf("%d",&i);
        ldr     r0,=scnfmt
        mov     r1,sp
        bl      scanf

    @@ do{
loop:
        @@ scanf("%d",&i);
        ldr     r0,=scnfmt
        add     r1,sp,#4
        bl      scanf

        @@ if(t < 0) neg++;
        ldr     r0,[sp,#4]
        cmp     r0,#0

        bge     non_neg

        ldr     r0,[sp,#8]
        add     r0,r0,#1
        str     r0,[sp,#8]

        @@ i--;     
non_neg:
        ldr     r0,[sp]
        sub     r0,r0,#1

    @@ }
    @@ while(i>0)
        ldr     r0,[sp]
        cmp     r0,#0
        bgt     loop

    @@ printf("%d\n",neg);
        ldr     r0,=prtfmt
        add     r1,[sp,#8]
        bl      printf

    @@ return 0;
        add     sp,sp,#12
        mov     r0,#0
        ldmfd   sp!,{lr}
        mov     pc,lr
@@ }
