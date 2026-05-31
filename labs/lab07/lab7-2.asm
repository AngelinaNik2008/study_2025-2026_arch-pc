%include 'in_out.asm'
SECTION .data
msg1 db 'Введите В: ', 0h
msg2 db 'Наименьшее число: ', 0h
A dd 24        
C dd 15        
SECTION .bss
min resb 10
B resb 10

SECTION .text
GLOBAL _start
_start:
    ; Input B
    mov eax, msg1
    call sprint
    mov ecx, B
    mov edx, 10
    call sread
    
    ; Convert B to integer
    mov eax, B
    call atoi
    mov [B], eax
    
    ; Start with A as minimum
    mov ecx, [A]
    mov [min], ecx
    
    ; Compare with C
    cmp ecx, [C]
    jle check_B    
    mov ecx, [C]
    mov [min], ecx
    
check_B:
    ; Compare current min with B
    mov ecx, [min]
    cmp ecx, [B]
    jle fin       
    mov ecx, [B]  
    mov [min], ecx
    
fin:
    ; Output result
    mov eax, msg2
    call sprint
    mov eax, [min]
    call iprintLF
    call quit