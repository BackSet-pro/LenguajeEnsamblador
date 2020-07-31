section .data
    resultado db "El resultado es: ",10
    len equ $-resultado
    new_line db "",10
    len_new_line equ $-new_line

section .bss
    global resb 1

section .text
    global _start

_start:
    mov eax, 6
    mov ebx,2
    sub, eax, ebx ; eax =eax-ebx
    add eax