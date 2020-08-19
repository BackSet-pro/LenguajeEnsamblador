section .data
    msg1 db "Ingrese 5 números", 10
    len1 equ $ - msg1

    msg2 db "Número mayor es:", 10
    len2 equ $ - msg2

    arreglo db 0,0,0,0,0
    len_arreglo equ $ - arreglo

section .bss
    numero resb 2

section .data
    global _start

_start:
    mov rsi, arreglo
    mov rdi, 0

    mov rax, 4
    mov rbx, 1
    mov rcx, msg1
    mov rdx, len1
    int 80h

leer:
    ; Lectura de datos en el arreglo
    mov rax, 3
    mov rbx, 0
    mov rcx, numero
    mov rdx, 2
    int 80h

    mov al, [numero]
    sub al, '0'

    mov [rsi], al ; indice 2(1) es numero 0

    inc rdi
    inc rsi

    comp rdi, len_arreglo
    jb leer

    mov rcx, 0
    mov bl, 0

comparacion:
    mov al, [arreglo+rcx]
    comp al, bl
    jb contador
    mov bl, al

contador:
    inc rcx
    comp rcx, len_arreglo
    jb comparacion

imprimir:
    add bl, '0'
    mov [numero], bl

    mov rax, 4
    mov rbx, 1
    mov rcx, msg2
    mov rdx, len2
    int 80h

    mov rax, 4
    mov rbx, 1
    mov rcx, numero
    mov rdx, 1
    int 80h

salir:
    mov rax, 1
    int 80h