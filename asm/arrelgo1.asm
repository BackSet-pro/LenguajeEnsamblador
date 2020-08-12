segment .data
    arreglo db 3,2,0,7,5
    len_arreglo equ $-arreglo

segment .bss
    aux resb 1

segment .text
    global _start

_start:
    mov esi,arreglo            ; esi: filar el tamaño del arreglo, posicionar el arreglo en memoria
    mov edi,0                  ; edi:contener el indice del arreglo

imprimir:
    mov al,[esi]
    add al,'0'
    mov [aux],al

    add esi,1
    add edi,1                  ; [edi]

    mov eax,4
    mov ebx,1
    mov ecx, aux
    mov edx,1
    int 0x80

    comp edi, len_arreglo      ; comp 3, 4 -> active carry
                               ; comp 4, 3 -> desactiva carry y zero
    jb imprimir                ; comp 4, 3 -> desactiva carry y zero se activa

salir:
    mov eax, 1
    int 0x80