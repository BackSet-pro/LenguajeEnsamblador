%macro escribir 2
	mov eax, 4
	mov rbx, 1
	mov rcx, %1
	mov rdx, %2
	int 0x80
%endmacro

segment .data
	msj1 db "Ingresa datos en el archivo", 10
	len_msj1 equ $-msj1

	archivo db "/mnt/c/Users/crism/OneDrive/Documentos/6to Ciclo/Lenguaje Ensamblador/3 Proyectos/Archivos/archivo1.txt"

segment .bss
	texto resb 30
	idarchivo resd 1

segment .text
	global _start

leer:
	mov eax, 3
	mov rbx, 0
	mov rcx, texto
	mov rdx, 10
	int 80h
	ret
	
_start:
	mov eax, 8 		;servicio para crear archivos, trabajar con archivos
	mov rbx, archivo	; dirección del archivo
	mov rcx, 1		; MODO DE ACCESO
					; O-RDONLY 0: El archivo se abre sólo para leer
					; O-WRONLY 1: El archivo se abre para escritura
					; O-RDWR 2: El archivo se abre para escritura y lectura
					; O-CREATE 256: Crea el archivo en caso que no exist
					; O-APPEND 2000h: El archivo se abro solo par escritura al final
	mov rdx, 777h
	int 80h
	
	test eax, eax		; instrucción de comparación realiza la operación lógica “Y” de dos operandos, 
				; pero NO afecta a ninguno de ellos, SÓLO afecta al registro de estado. Admite 
				; todos los tipos de direccionamiento excepto los dos operandos en memoria
					; TEST reg, reg
					; TEST reg, mem
					; TEST mem, reg
					; TEST reg, inmediato
					; TEST mem, inmediato 
	
	jz salir		; se ejecuta cuando existen errores en el archivo
	
	mov dword [idarchivo], eax
	escribir msj1, len_msj1
	
	
	
	call leer
	
	; ************************ escritura en el archivo *****************************
	mov eax, 4
	mov rbx, [idarchivo]
	mov rcx, texto
	mov rdx, 20
	int 0x80

salir:
	mov eax, 1
	int 80h
