/* File: stack.c */

#define STACKSIZE 100

/* The stack is implemented as an array of items and
   the index of the item at the top */
struct IntStackStruct {
    int stackItems[STACKSIZE];
    int top;
};

typedef struct IntStackStruct *IntStack;