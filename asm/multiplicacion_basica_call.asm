
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
        mov [resultado], DWORD PTR -12[ax]
        add cx, '0'
        mov [b],cx
        call imprimira
        call imprimirx
        call imprimirb
        call imprimirigual
        call imprimirresultado
        call imprimir_enter
        pop cx
        inc cx
        cmp cx, 10
        jnz ciclo

        mov eax, 1
        int 80h

imprimirx:
    mov eax, 4
    mov ebx, 1
    mov ecx, msj1
    mov edx, len1
    int 80h
    ret

imprimirigual:
    mov eax, 4
    mov ebx, 1
    mov ecx, msj2
    mov edx, len2
    int 80h
    ret

imprimir_enter:
	mov eax, 4
	mov ebx, 1
	mov ecx, nueva_linea
	mov edx, len3
	int 80h
	ret

imprimira:
    mov eax, 4
    mov ebx, 1
    mov ecx, a
    mov edx, 1
    int 80h
    ret

imprimirb:
    mov eax, 4
    mov ebx, 1
    mov ecx, b
    mov edx, 1
    int 80h
    ret

imprimirresultado:
    mov eax, 4
    mov ebx, 1
    mov ecx, resultado
    mov edx, 1
    int 80h
    ret