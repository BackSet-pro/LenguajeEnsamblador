
%macro imprimir 2
    mov eax, 4
    mov ebx, 1
    mov ecx, %1
    mov edx, %2
    int 80h
%endmacro

section .data
    msj1 db " x "
    len1 equ $-msj1

    msj2 db " = "
    len2 equ $-msj2

    nueva_linea db 10,''
    len3 equ $-nueva_linea

section .bss
    a resb 2
    b resb 2
    resultado resb 1

section .text
    global _start

_start:
        mov al,3
        add al,'0'
        mov [a], al
        mov cx, 1

ciclo :
        push cx
        mov ax,[a]
        sub ax,'0'
        mul cx
        add ax, '0'
        mov [resultado], ax
        add cx, '0'
        mov [b],cx
        imprimir a, 1
        imprimir msj1, len1
        imprimir b, 1
        imprimir msj2, len2
        imprimir resultado, 1
        imprimir nueva_linea,len3
        pop cx
        inc cx
        cmp cx, 10
        jnz ciclo

        mov eax, 1