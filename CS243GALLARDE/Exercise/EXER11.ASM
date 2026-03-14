
; Filename: Exer11.asm
; Displaying multi-colored cartoon character
; Name: Joel Theo C. Gallarde
; Date: August 22, 2025

.model small
.stack 100h

.data 
    px db "  $", 0Ah
    nl db 0Ah, '$'

.code
start:
    mov ax, @data
    mov ds, ax

    mov ah, 09h

    ; ROW 1
    mov bl, 22h
    mov cx, 2
    int 10h

    mov dx, offset px
    int 21h
    mov bl, 22h
    mov cx, 2
    int 10h

    mov dx, offset px
    int 21h
    mov bl, 22h
    mov cx, 2
    int 10h

    mov dx, offset px
    int 21h
    mov bl, 22h
    mov cx, 2
    int 10h

    mov dx, offset px
    int 21h
    mov bl, 22h
    mov cx, 2
    int 10h

    mov dx, offset px
    int 21h
    mov bl, 22h
    mov cx, 2
    int 10h

    mov dx, offset px
    int 21h
    mov bl, 22h
    mov cx, 2
    int 10h

    mov dx, offset px
    int 21h
    mov bl, 22h
    mov cx, 2
    int 10h

    mov dx, offset px
    int 21h

    mov dx, offset nl
    int 21h

    ; ROW 2

    mov bl, 22h
    mov cx, 2
    int 10h

    mov dx, offset px
    int 21h

    mov bl, 22h
    mov cx, 2
    int 10h

    mov dx, offset px
    int 21h
    mov bl, 22h
    mov cx, 2
    int 10h

    mov dx, offset px
    int 21h
    mov bl, 22h
    mov cx, 2
    int 10h

    mov dx, offset px
    int 21h
    mov bl, 22h
    mov cx, 2
    int 10h

    mov dx, offset px
    int 21h
    mov bl, 22h
    mov cx, 2
    int 10h

    mov dx, offset px
    int 21h
    mov bl, 22h
    mov cx, 2
    int 10h

    mov dx, offset px
    int 21h
    mov bl, 22h
    mov cx, 2
    int 10h

    mov dx, offset px
    int 21h


    mov bl, 00h
    mov cx, 100
    int 10h

    mov dx, offset px
    int 21h

    mov dx, offset nl
    int 21h

    ; ROW 3

    mov bl, 22h
    mov cx, 100
    int 10h

    mov dx, offset px
    int 21h
 
    mov bl, 00h
    mov cx, 100
    int 10h

    mov dx, offset px
    int 21h   

    mov bl, 00h
    mov cx, 100
    int 10h

    mov dx, offset px
    int 21h


    mov bl, 22h
    mov cx, 100
    int 10h

    mov dx, offset px
    int 21h

    mov bl, 22h
    mov cx, 100
    int 10h

    mov dx, offset px
    int 21h

    mov bl, 00h
    mov cx, 100
    int 10h

    mov dx, offset px
    int 21h
    mov bl, 00h
    mov cx, 100
    int 10h

    mov dx, offset px
    int 21h


    mov bl, 22h
    mov cx, 100
    int 10h

    mov dx, offset px
    int 21h

    mov bl, 00h
    mov cx, 100
    int 10h


    mov dx, offset nl
    int 21h

    ; ROW 4
    mov bl, 22h
    mov cx, 2
    int 10h

    mov dx, offset px
    int 21h

    mov bl, 00h
    mov cx, 2
    int 10h

    mov dx, offset px
    int 21h
    mov bl, 00h
    mov cx, 2
    int 10h

    mov dx, offset px
    int 21h
    mov bl, 22h
    mov cx, 2
    int 10h

    mov dx, offset px
    int 21h
    mov bl, 22h
    mov cx, 2
    int 10h

    mov dx, offset px
    int 21h

    mov bl, 00h
    mov cx, 2
    int 10h

    mov dx, offset px
    int 21h

    mov bl, 00h
    mov cx, 2
    int 10h

    mov dx, offset px
    int 21h

    mov bl, 22h
    mov cx, 2
    int 10h

    mov dx, offset px
    int 21h

    mov bl, 00h
    mov cx, 100
    int 10h

    mov dx, offset px
    int 21h

    mov dx, offset nl
    int 21h

    ; ROW 5
    mov bl, 22h
    mov cx, 100
    int 10h

    mov dx, offset px
    int 21h

    mov bl, 22h
    mov cx, 100
    int 10h

    mov dx, offset px
    int 21h


    mov bl, 22h
    mov cx, 100
    int 10h

    mov dx, offset px
    int 21h

    mov bl, 00h
    mov cx, 100
    int 10h

    mov dx, offset px
    int 21h

    mov bl, 00h
    mov cx, 100
    int 10h

    mov dx, offset px
    int 21h
    mov bl, 22h
    mov cx, 100
    int 10h

    mov dx, offset px
    int 21h

    mov bl, 22h
    mov cx, 100
    int 10h

    mov dx, offset px
    int 21h


    mov bl, 22h
    mov cx, 100
    int 10h

    mov dx, offset px
    int 21h

    mov bl, 00h
    mov cx, 100
    int 10h

    mov dx, offset px
    int 21h

    mov dx, offset nl
    int 21h

    ; ROW 6
    mov bl, 22h
    mov cx, 100
    int 10h

    mov dx, offset px
    int 21h


    mov bl, 22h
    mov cx, 100
    int 10h

    mov dx, offset px
    int 21h

    mov bl, 00h
    mov cx, 100
    int 10h

    mov dx, offset px
    int 21h

    mov bl, 00h
    mov cx, 100
    int 10h

    mov dx, offset px
    int 21h

    mov bl, 00h
    mov cx, 100
    int 10h

    mov dx, offset px
    int 21h

    mov bl, 00h
    mov cx, 100
    int 10h

    mov dx, offset px
    int 21h

    mov bl, 22h
    mov cx, 100
    int 10h

    mov dx, offset px
    int 21h


    mov bl, 22h
    mov cx, 100
    int 10h

    mov dx, offset px
    int 21h

    mov bl, 00h
    mov cx, 100
    int 10h

    mov dx, offset px
    int 21h

    mov dx, offset nl
    int 21h

    ; ROW 7
    mov bl, 22h
    mov cx, 100
    int 10h

    mov dx, offset px
    int 21h


    mov bl, 22h
    mov cx, 100
    int 10h

    mov dx, offset px
    int 21h

    mov bl, 00h
    mov cx, 100
    int 10h

    mov dx, offset px
    int 21h

    mov bl, 00h
    mov cx, 100
    int 10h

    mov dx, offset px
    int 21h

    mov bl, 00h
    mov cx, 100
    int 10h

    mov dx, offset px
    int 21h

    mov bl, 00h
    mov cx, 100
    int 10h

    mov dx, offset px
    int 21h

    mov bl, 22h
    mov cx, 100
    int 10h

    mov dx, offset px
    int 21h


    mov bl, 22h
    mov cx, 100
    int 10h

    mov dx, offset px
    int 21h

    mov bl, 00h
    mov cx, 100
    int 10h

    mov dx, offset px
    int 21h

    mov dx, offset nl
    int 21h
    
    ; ROW 8
    mov bl, 22h
    mov cx, 100
    int 10h

    mov dx, offset px
    int 21h

    mov bl, 22h
    mov cx, 100
    int 10h

    mov dx, offset px
    int 21h

    mov bl, 00h
    mov cx, 100
    int 10h

    mov dx, offset px
    int 21h

    mov bl, 22h
    mov cx, 100
    int 10h

    mov dx, offset px
    int 21h

    mov bl, 22h
    mov cx, 100
    int 10h

    mov dx, offset px
    int 21h
    mov bl, 00h
    mov cx, 100
    int 10h

    mov dx, offset px
    int 21h
    mov bl, 22h
    mov cx, 100
    int 10h

    mov dx, offset px
    int 21h
    mov bl, 22h
    mov cx, 100
    int 10h

    mov dx, offset px
    int 21h
    mov bl, 00h
    mov cx, 100
    int 10h

    mov dx, offset px
    int 21h
    
    int 27h
end start
