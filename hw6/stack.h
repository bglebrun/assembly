/* File: stack.h */

typedef struct IntStackStruct *IntStack;

/* create an empty stack and return a pointer to it */
IntStack InitStack();

/* Push value onto the stack.
   return 1 for success. return 0 if stack is full. */
int Push(IntStack stack, int k);

/* Remove value from top of stack
   Return 1 for success. Return 0 if stack was empty. */
int Pop(IntStack stack);

/* Return the value that is at the top of the stack. */
int Top(IntStack stack);

/* Print the elements of the stack. */
extern PrintStack(IntStack stack);