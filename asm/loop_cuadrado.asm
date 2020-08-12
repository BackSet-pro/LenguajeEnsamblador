; Cristian Medina
section .data
        asterisco db '*'
        new_line db  '',10
section .text
        global _start

_start:
        mov ecx, 10
        mov ebx, 10
fori:
    push ecx
    push ebx

    mov eax, 4
    mov ebx, 1
    mov ecx, new_line
    mov edx, 1
    int 80h

    pop ecx
    mov ebx, ecx
    push ebx

forj:
    push ecx

    mov eax, 4
    mov ebx, 1
    mov ecx, asterisco
    mov edx, 1
    int 80h

    pop ecx
    loop forj

    pop ebx
    pop ecx
    loop fori

    mov eax, 1
    int 80h

