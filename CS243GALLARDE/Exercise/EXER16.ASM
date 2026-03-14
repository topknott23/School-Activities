; Filename: exer16.asm
; Name: Joel Theo C. Gallarde
; Date: September 11, 2025
; Description: This assembly language program will get character input and display back character input.

.MODEL small
.STACK 200h

.DATA
    inputChar db ?
    inputMsg db 'Enter a character: $'
    outputMsg db 0Ah, 'You entered: $'

.CODE
Main:
    mov ax, @data
    mov ds, ax

    mov dx, offset inputMsg
    mov ah, 09h ; print string
    int 21h

    mov ah, 01h ; function to read a character
    int 21h

    mov inputChar, al ; store the character in "inputChar"

    mov dx, offset outputMsg
    mov ah, 09h
    int 21h

    mov dl, inputChar
    mov ah, 02h
    int 21h

    mov ax, 4C00h
    int 21h
END Main