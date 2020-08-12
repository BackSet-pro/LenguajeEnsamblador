section .data
    asterisco db '*'
    nueva_linea db 10,''

section .text
    global _start

_start:
    mov rcx, 8
    mov rbx, 1

l1:
    push rcx
    push rbx

    mov eax, 4
    mov rbx, 1
    mov rcx, nueva_linea
    mov edx, 1
    int 80h

    pop rcx
    push rcx

l2:
    push rcx

    mov eax, 4
    mov rbx, 1
    mov rcx, asterisco
    mov edx, 1
    int 80h
    pop rcx
    loop l2

    pop rbx
    pop rcx
    inc rbx
    loop l1

    mov eax, 1
    int 80h