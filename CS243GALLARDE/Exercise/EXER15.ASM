; Filename: exer15.asm
; Name: Joel Theo C. Gallarde
; Date: September 11, 2025
; Description: This assembly language program will display multiple string variables on separate lines.

.MODEL small
.STACK 200h

.DATA
    String1 DB 'Line1', 0dh, 0ah, '$'
    String2 DB 'Line2', 0dh, 0ah, '$'
    String3 DB 'Line3', 0dh, 0ah, '$'

.CODE
ProgramStart:
    mov ax, @data
    mov ds, ax
    mov ah, 9
    mov dx, OFFSET String1
    int 21h

    mov dx, OFFSET String2
    int 21h

    mov dx, OFFSET String3
    int 21h

    mov ah, 4ch
    int 21h
END ProgramStart