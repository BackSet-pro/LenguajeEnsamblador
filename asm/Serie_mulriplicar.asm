;Cristian Eduardo Medina Morocho

section .data
    msj1 db " x "
    len1 equ $-msj1

    msj2 db " = "
    len2 equ $-msj2

    nueva_linea db 10,''
    len3 equ $-nueva_linea

	
section .bss
	resultado rest 2
	a rest 2
	b rest 2
	aux rest 2

section .text
	global _start
	
_start:
	mov al, 1
	mov [aux], al
	mov rcx, 0
	
c1:
	cmp rcx,9
	jz bucle
	inc rcx
	push rcx
	mov [resultado], rcx
	jmp c2
	
c2:
	mov al, [resultado]
	mov [a], al
	mov cl, [aux]
	mul cl
	
	mov [resultado], al
	mov ah, [a]
	add ax, '00'
	add cx, '00'
	mov [a], ah
	mov [b], cl
	call imprimira
	call imprimirx
	call imprimirb
	call imprimirigual
	mov eax, 48
	add [resultado], eax 
	call imprimirresultado
	call imprimir_enter
	pop rcx
	jmp c1

bucle: 
	call imprimir_enter
	mov ebx, [aux]
	inc ebx
	mov [aux], ebx
	mov rcx, 0
	cmp ebx, 6
	jb c1
	
salir:
	mov eax, 1
	mov ebx, 0
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