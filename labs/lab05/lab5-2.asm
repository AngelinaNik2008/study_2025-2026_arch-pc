SECTION .data
msg: DB 'Введите строку:',10
msgLen: EQU $-msg

SECTION .bss
buf1: RESB 80

SECTION .text
GLOBAL _start

_start:
    mov eax,  msg
    call sprintLF

    mov eax, buf1
    mov ebx, 80

    call sread

    call quit
