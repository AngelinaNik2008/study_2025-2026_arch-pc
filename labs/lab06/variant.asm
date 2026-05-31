%include 'in_out.asm'

SECTION .data
    msg: DB 'Введите N студенческого билета: ',0
    rem: DB 'Ваш вариант: ',0

SECTION .bss
    x: RESB 80

SECTION .text
GLOBAL _start

_start:
    ; --- Вывод сообщения с запросом ---
    mov eax, msg
    call sprintLF
    
    ; --- Ввод номера студенческого билета ---
    mov ecx, x      ; адрес буфера для ввода
    mov edx, 80     ; размер буфера
    call sread      ; считываем строку
    
    ; --- Преобразование ASCII в число ---
    mov eax, x      ; адрес введённой строки
    call atoi       ; результат в eax (номер билета)
    
    ; --- Вычисление варианта: (Sn mod 20) + 1 ---
    xor edx, edx    ; обнуляем edx (очищаем перед делением)
    mov ebx, 20     ; делитель = 20
    div ebx         ; eax = Sn / 20, edx = Sn mod 20
    inc edx         ; edx = (Sn mod 20) + 1 — это номер варианта
    
    ; --- Вывод результата ---
    mov eax, rem    ; адрес строки 'Ваш вариант: '
    call sprint     ; печатаем сообщение
    mov eax, edx    ; загружаем номер варианта
    call iprintLF   ; печатаем число и перевод строки
    
    call quit       ; завершение программы