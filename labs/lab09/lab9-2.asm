
.section .data
msg1:
    .string "Hello, "
msg1Len = . - msg1

msg2:
    .string "world!\n"
msg2Len = . - msg2

.section .text
.global _start

_start:
    // write syscall
    mov x0, #1          // stdout
    adr x1, msg1        // buffer
    mov x2, #7          // length of "Hello, "
    mov x8, #64         // write syscall number
    svc #0

    mov x0, #1
    adr x1, msg2
    mov x2, #7          // length of "world!\n"
    mov x8, #64
    svc #0

    // exit syscall
    mov x0, #0
    mov x8, #93         // exit syscall number
    svc #0
