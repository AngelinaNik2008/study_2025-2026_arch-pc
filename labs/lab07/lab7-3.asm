%include 'in_out.asm'
SECTION .data
msg_x: DB 'Введите значение переменной x: ', 0
msg_a: DB 'Введите значение переменной a: ', 0
res: DB 'Результат: ', 0

SECTION .bss
x: RESB 80
a: RESB 80

SECTION .text
GLOBAL _start
_start:
    ; Input x
    mov eax, msg_x
    call sprint
    mov ecx, x
    mov edx, 80
    call sread
    mov eax, x
    call atoi
    mov edi, eax          ; edi = x
    
    ; Input a
    mov eax, msg_a
    call sprint
    mov ecx, a
    mov edx, 80
    call sread
    mov eax, a
    call atoi
    mov esi, eax          ; esi = a
    
    ; Compare x and a
    cmp edi, esi
    jle add_values        ; if x <= a, go to add_values
    mov ebx, esi          ; else result = a
    jmp print_result
    
add_values:
    mov ebx, edi          ; result = x
    add ebx, esi          ; result = x + a
    
print_result:
    ; Output result
    mov eax, res
    call sprint
    mov eax, ebx          ; ebx contains the result
    call iprintLF
    call quit