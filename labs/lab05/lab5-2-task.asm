%include 'in_out.asm'

SECTION .data
msg: DB 'Введите строку: ', 0h

SECTION .bss
buf1: RESB 80

SECTION .text
GLOBAL _start

_start:
    ; Вывод приглашения
    mov eax, msg
    call sprint

    ; Ввод строки
    mov ecx, buf1
    mov edx, 80
    call sread

    ; Вывод введённой строки
    mov eax, buf1
    call sprint

    ; Завершение программы
    call quit
