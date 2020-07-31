; Programam que imprime -*******
;Cristian Eduardo Medina Morocho
%macro enter 2
    mov eax, 4
	mov ebx, 1
	mov ecx, msg2
	mov edx, lmsg2
	int 80h
%endmacro

section .data
    newline db 10,""
    len_newline equ $ - newline

    asterisco db '*'

section .text
    global _start

_start:
    ;mov rbx, 4
    mov ax, 4
    mov bx,4
    ; mov ecx, 9
    

row:
    dec ax
    push ax
    jump column
    enter newline, len_newline
    pop ax
    cmp ax, 0
    jnz row

column:
    dec bx
    push bx
    mov eax, 4
    mov ebx, 1
    mov ecx, asterisco
    mov edx, 1
    int 80h
    pop bx
    cmp bx, 0
    jnz column

salir:
	; Finalizamos el programa
	mov eax, 1
	mov ebx, 0
	int 80h

