%macro escribir 2
    mov eax, 4
    mov ebx, 1
    mov ecx, %1
    mov edx, %2
    int 0x80
%endmacro

segment .data
    msj1 db "Ingrese datos en el archivo", 10
    len_msj1 equ $ - msj1

    archivo db "/mnt/c/Users/crism/OneDrive/Documentos/6to\ Ciclo/Lenguaje\ Ensamblador/3\ Proyectos/Archivos/archivo1.txt"

segment .bss
    texto resb 1
    id_archivo resb 1

segment .text
    global _start

leer:
    mov eax, 3
    mov ebx, 0
    mov ecx, texto
    mov edx, 10
    int 80h
    ret

_start:
    mov eax, 8
    mov ebx, archivo
    mov ecx, 1
    mov edx, 777h
    int 80h

    test eax, eax

    jz salir
    mov dword[id_archivo], eax
    escribir msj1, len_msj1

    call leer

    mov eax, 4
    mov ebx, [id_archivo]
    mov ecx, texto
    mov edx, 20
    int 80h

salir:
    mov eax, 1
    int 80h