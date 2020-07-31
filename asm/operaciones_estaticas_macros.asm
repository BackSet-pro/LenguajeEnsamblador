;Cristian Eduardo Medina Morocho
;22-Junio-2020

%macro writes 2
	mov eax,4
	mov ebx,1
	mov ecx,%1
	mov edx,%2
	int 80h
%endmacro

%macro reads 2
	mov eax,3
	mov ebx,2
	mov ecx,%1
	mov edx,%2
	int 80h
%endmacro

section .data

	message0 db 'Ingrese el primer numero:'
	sizeNum0 equ $ - message0

	message1 db 10,'Ingrese el segundo numero:'
	sizeNum1 equ $ - message1

	messageAdd db 10,'El resultado de la add es: '
	sizeAdd equ $ - messageAdd

	messageSubtraction db 10,'El resultado de la subtraction es: '
	sizeSubtraction equ $ - messageSubtraction

	messageMultiplication db 10,'El resultado de la multiplication es: '
	sizeMultiplication equ $ - messageMultiplication

	messageDivision db 10,'El resultado de la division es: '
	sizeDivision equ $ - messageDivision

	messageResidue db 10,"El residue es: "
	sizeResidue equ $ - messageResidue

	new_line db 10," "

section .bss 
	num0 resb 1
	num1 resb 1
	adds resb 1
	subtractions resb 1
	multiplications resb 1
	divisions resb 1
	residues resb 1

section .text
	global _start
_start:

	writes message0,sizeNum0
	reads num0,2

	writes message1,sizeNum1
	reads num1,2

	mov al,[num0]
	mov bl,[num1]
	sub al,'0'
	sub bl,'0'
	add al,bl
	add ax,'0'
	mov [adds],ax

	mov al,[num0]
	mov bl,[num1]
	sub al,'0'
	sub bl,'0'
	sub al,bl
	add ax,'0'
	mov [subtractions],ax

	mov ax,[num0]
	mov bl,[num1]
	sub ax,'0'
	sub bl,'0'
	mul bl
	add ax,'0'
	mov [multiplications],ax

	mov al,[num0]
	mov bl,[num1]
	sub ax,'0'
	sub bl,'0'
	div bl

	add al,'0'
	mov [divisions],al

	add ah,'0'
	mov [residues],ah

	writes messageAdd,sizeAdd
	writes adds,1

	writes messageSubtraction,sizeSubtraction
	writes subtractions,1

	writes messageMultiplication,sizeMultiplication
	writes multiplications,1

	writes messageDivision,sizeDivision
	writes divisions,1

	writes messageResidue,sizeResidue
	writes residues,1

	writes new_line,1
	mov eax,1
	int 80h
