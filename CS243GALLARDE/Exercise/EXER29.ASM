; Filename: EXER29.asm
; Name: Joel Theo C. Gallarde
; Date: October 6, 2025
; Displaying the difference of two numbers

.model small
.stack 100

.data

    nl db 0Ah, '$'

    p1 db "Enter first number: $"
    p2 db "Enter second number: $"

    output db "The difference is: $"

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
    sub bl, al

    call pnl

    mov ah, 09h
    mov dx, offset output
    int 21h

    mov al, bl
    cmp al, 0

    jl negative 
    jge positive 

negative:
    mov ah, 02h
    mov dl, '-'
    int 21h

    mov ah, 02h
    mov al, bl
    neg al 

    add al, '0'
    mov dl, al
    int 21h

    jmp done

positive:
    mov ah, 02h
    mov al, bl
    add al, '0'
    mov dl, al
    int 21h
    
done:
    int 27h

pnl proc
    mov ah, 09h
    mov dx, offset nl
    int 21h
    ret

pnl endp


end main