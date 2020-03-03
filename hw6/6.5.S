.data
.text
.global InitStack

InitStack:
	stmfd	sp!,{lr}
    @ 400 for stackItems, 1 for top
    sub     sp,sp,#404
    mov     r0,sp
    add     sp,sp,#404
    ldmfd   sp!,{lr}
    bx      lr