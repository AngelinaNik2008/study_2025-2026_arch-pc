%include 'in_out.asm'
SECTION .data
msg_func db "Функция: f(x) = 10x - 4", 0
msg_result db "Результат: ", 0
SECTION .text
GLOBAL _start
_start:
    mov eax, msg_func
    call sprintLF

    pop ecx          ; argc (количество аргументов)
    pop edx          ; argv[0] (имя программы) - пропускаем
    sub ecx, 1       ; уменьшаем счётчик на 1 (игнорируем имя программы)
    
    mov esi, 0       ; сумма результатов

next:
    cmp ecx, 0h      ; проверяем, остались ли аргументы
    jz _end          ; если нет, переходим к выводу результата
    
    pop eax          ; следующий аргумент (строку)
    call atoi        ; преобразуем строку в число

    mov ebx, 10
    mul ebx          ; eax = eax * 10
    sub eax, 4       ; eax = eax - 4
    
    add esi, eax     ; добавляем к сумме
    
    loop next

_end:
    mov eax, msg_result
    call sprint
    mov eax, esi
    call iprintLF
    call quit