section .data
    suma db 10 ,'La suma ',10
    lensuma equ $-suma

    resta db 10 ,'La resta',10
    lenresta equ $-resta

    multiplicar db 10 ,'La multipliacion ',10
    lenmul equ $-multiplicar

    division db 10 ,'La division ',10
    lendiv equ $-division

section .bss
    resuma resb, 1
    reresta restb, 1
    remulti restb, 1
    cociente restb, 1
    residue restb, 1

section .text
    global _start

_start:
    mov eax, 4
	mov ebx, 1
	mov ecx, suma
	mov edx, lensuma
	int 80h

    mov al,4
    mov bl,2
    add al,bl
    add al,'0'

    mov[resuma]

    mov eax, 4
	mov ebx, 1
	mov ecx, resuma
	mov edx, 1
	int 80h
;***********
	mov eax, 4
	mov ebx, 1
	mov ecx, resta
	mov edx, lenresta
	int 80h

    mov al,4
    mov bl,2
    sub al,bl
    add al,'0'

    mov[reresta]

    mov eax, 4
	mov ebx, 1
	mov ecx, reresta
	mov edx, 1
	int 80h
;***********
	mov eax, 4
	mov ebx, 1
	mov ecx, multiplicar
	mov edx, lenmul
	int 80h

    mov al,4
    mov bl,2
    add bl;solo tiene un operando
    add al,'0'

    mov[remulti]

    mov eax, 4
	mov ebx, 1
	mov ecx, remulti
	mov edx, 1
	int 80h
;***********

	mov eax, 4
	mov ebx, 1
	mov ecx, division
	mov edx, lendiv
	int 80h

    mov al,5
    mov bl,2
    div bl
    add al,'0'

    mov[cociente],al
    mov[residue],ah

    mov eax, 4
	mov ebx, 1
	mov ecx, cociente
	mov edx, 1
	int 80h

    