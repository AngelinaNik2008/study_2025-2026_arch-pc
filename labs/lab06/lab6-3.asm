%include 'in_out.asm'

SECTION .data
    div: DB 'Результат: ',0
    rem: DB 'Остаток от деления: ',0

SECTION .text
GLOBAL _start

_start:
    ; --- Вычисление выражения (5*2+3)/3 ---
    mov eax, 4      ; EAX = 5
    mov ebx, 6      ; EBX = 2
    mul ebx         ; EAX = EAX * EBX = 5 * 2 = 10
    add eax, 2      ; EAX = EAX + 3 = 10 + 3 = 13
    xor edx, edx    ; обнуляем EDX для корректного деления
    mov ebx, 5      ; EBX = 3
    div ebx         ; EAX = 13 / 3 = 4 (частное), EDX = 1 (остаток)
    mov edi, eax    ; сохраняем частное в edi

    ; --- Вывод результата ---
    mov eax, div    ; адрес строки 'Результат: '
    call sprint     ; печатаем сообщение
    mov eax, edi    ; загружаем частное
    call iprintLF   ; печатаем число и перевод строки

    mov eax, rem    ; адрес строки 'Остаток от деления: '
    call sprint     ; печатаем сообщение
    mov eax, edx    ; загружаем остаток
    call iprintLF   ; печатаем число и перевод строки

    call quit       ; завершение программы