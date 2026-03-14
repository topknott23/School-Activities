; Filename: EXER31.asm
; Name: Joel Theo C. Gallarde
; Date: October 6, 2025
; Displaying the quotient of two numbers

.model small
.stack 100

.data

    nl db 0Ah, '$'

    p1 db "Enter first number (0-9): $"
    p2 db "Enter second number (1-9): $"

    output db "The quotient is: $"

.code
main:
    mov ax, @data
    mov ds, ax

    mov ah, 09h
    mov dx, offset p1
    int 21h

    mov ah, 01h
    int 21h
    sub al, '0'
    mov bl, al

    call pnl

    mov ah, 09h
    mov dx, offset p2
    int 21h

    mov ah, 01h
    int 21h 
    sub al, '0'
    mov cl, al

    call pnl

    mov al, bl
    xor ah, ah
    div cl

    mov bh, al          

    mov ah, 09h
    mov dx, offset output
    int 21h

    mov al, bh          
    add al, '0'        
    mov dl, al
    mov ah, 02h         
    int 21h
    
    int 27h

pnl proc
    mov ah, 09h
    mov dx, offset nl
    int 21h
    ret

pnl endp


end main