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

_start:
    mov    $start, %r15   /* initialize loop counter */

loop_init:
    movq    $len, %rdx    /* message length */
    movq    $msg, %rsi    /* message location */
    movq    $1, %rdi      /* file descriptor stdout */
    movq    $1, %rax      /* syscall sys_write */
    syscall
    inc %r15
    cmp $end, %r15
    jne loop_init

    movq    $0, %rdi       /* exit status */
    movq    $60, %rax      /* syscall sys_exit */
    syscall

.section .rodata

msg:    .ascii      "Loop!\n"
    len = . - msg


