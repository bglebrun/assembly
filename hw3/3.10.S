x:  .word @ data goes here
i:  .word @ data goes here
j:  .word @ data goes here

/* Part A */
ldr r0, =x
ldr r1, =i
ldr r2, =j
ldr r3, [r1]        @ i ptr
ldr r4, [r2]        @ j ptr
mul r3, [4*r3]      @ move i * word size places
str r4, [r0,r3]     @ store


/* Part B */
ldr r0, =x
ldr r1, =i
ldr r2, =j
ldr r3, [r1]        @ i ptr
ldr r4, [r2]        @ j ptr
mul r3, 4*r3        @ move i * word size places
mul r4, 4*r4        @ move j * word size places
ldr r5, [r0,r4]     @ load x[j]
str r5, [r0,r3]     @ store x[i] in that spot

/* Part C */
ldr r0, =x
ldr r1, =i
ldr r2, =j
ldr r3, [r1]        @ i ptr
ldr r4, [r2]        @ j ptr
mul r3, 4*r3        @ move i * word size places
mul r4, 8*r4        @ move j * 2 * word size places
ldr r5, [r0, r3]    @ load x[i]
str r5, [r0, r4]    @ store x[j*2] in that spot