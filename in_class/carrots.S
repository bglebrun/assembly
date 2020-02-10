@@ #include <stdio.h>

        .data
        .global cont
        .global hpps
    @@ int cont, hpps;
cont:   .word   0
hpps:   .word   0
scfmt:  .asciz  "%d%d"
ptfmt:  .asciz  "%d\n"


        .text
        .global main
@@ int main
@@ {

main:
    
        stmfd   sp!, {lr}

    @@  scanf("%d%d", &cont, &hpps);

        ldr     r0,=scfmt
        ldr     r1,=cont
        ldr     r2,=hpps

        bl      scanf

    @@ printf("%d\n",hpps);
        ldr     r0,=ptfmt
        ldr     r1,=hpps
        ldr     r1,[r1]

        bl      printf

        @@ return 0;

        mov     r0, #0
        ldmfd   sp!, {lr}
        mov     pc, lr

@@ }