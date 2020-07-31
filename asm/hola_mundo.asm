section .data
    msg_presentacion db "El resultado es", 10
    msg_pr_len equ $-msg_presentacion

section .bss
    num1 resb 1
    num2 resb 1
    resp resb 1


section .text
   global _start
_start:

    mov eax, 8
	mov ebx, 3
	sub eax,ebx
	add eax,'0'
	mov [resp],eax
    ;******************imprime el mensaje***************
    mov eax, 4
    mov ebx, 1
    mov ecx, msg_presentacion
    mov edx, msg_pr_len
    int 80h
    ;******************imprime el mensaje***************
    mov eax, 4
    mov ebx, 1
    mov ecx, resp
    mov edx, 1
    int 80h

    ;******************salir del sistema***************
    mov eax, 1                  ; terminacion del sistema
    int 80h                     ; interrucion de OS Linux
