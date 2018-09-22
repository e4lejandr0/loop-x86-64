/* 
   This is a 'hello world' program in x86_64 assembler using the 
   GNU assembler (gas) syntax. Note that this program runs in 64-bit
   mode.

   CTyler, Seneca College, 2014-01-20
   Licensed under GNU GPL v2+
*/

.text
.globl    _start

start = 0
end = 30
space = 20 /* ascii space */
asc_zero = 48 /* ascii zero */

_start:
    mov    $start, %r15   /* initialize loop counter */

loop:
    xor    %rdx, %rdx  /* clear rdx */
    mov    %r15, %rax  /* we'll divide the counter */
    mov    $10, %r14   /* by 10 to split the digits */
    div    %r14
    add    $asc_zero, %rdx   /* add '0' to result and remainder */
    mov    %dl, num_offset + 1

    cmp    $0, %al
    je     print_msg          /* skip the second digit */
    add    $asc_zero, %rax
    mov    %al, num_offset    /* put both digits inside the message */

print_msg:
    movq    $len, %rdx    /* message length */
    movq    $msg, %rsi    /* message location */
    movq    $1, %rdi      /* file descriptor stdout */
    movq    $1, %rax      /* syscall sys_write */

    
    syscall

    inc %r15
    cmp $end, %r15
    jne loop

    movq    $0, %rdi       /* exit status */
    movq    $60, %rax      /* syscall sys_exit */
    syscall

.section .data

msg:    .ascii      "Loop:   \n"
    len = . - msg
    num_offset = msg + 6


