; Cristian Medina
section .data
        asterisco db '*'
        nueva_linea db 10,''
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
    mov rcx, nueva_linea
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
    dec rbx
    loop fori

    mov eax, 1
    int 80h


