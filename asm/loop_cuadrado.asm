; Cristian Medina
section .data
        asterisco db '*'
        new_line db  '',10
section .text
        global _start

_start:
        mov rcx, 10
        mov rbx, 10
fori:
    push rcx
    push rbx

    mov eax, 4
    mov rbx, 1
    mov rcx, new_line
    mov edx, 1
    int 80h

    pop rcx
    mov rbx, rcx
    push rbx

forj:
    push rcx

    mov eax, 4
    mov rbx, 1
    mov rcx, asterisco
    mov edx, 1
    int 80h

    pop rcx
    loop forj

    pop rbx
    pop rcx
    loop fori

    mov eax, 1
    int 80h

