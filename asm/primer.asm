CODE SEGMENT
ASSUME CS:CODE, DS:CODE, SS:CODE, ES:CODE
ORG 100h

principio:  
mov ah, 0Fh
mov ah, 0
int 10h

lea dx, mensaje
mov ah, 9h
int 21h

int 20h

mensaje db "Cristian Medina$",0

CODE ENDS
end principio