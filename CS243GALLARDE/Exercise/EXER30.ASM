; Filename: EXER30.asm
; Name: Joel Theo C. Gallarde
; Date: October 6, 2025
; Displaying Product of Two Numbers

.model small
.stack 100h

.data
    nl db 0Ah, '$'
    
    p1 db "Enter first number: $"
    p2 db "Enter second number: $"

    output db "The product is: $"

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
    
    mov cl, bl          
    mul cl              

    mov bx, ax          

    call pnl

    mov ah, 09h
    mov dx, offset output
    int 21h

    mov ax, bx          

    cmp ax, 10
    jl od

td:
    mov cl, 10
    div cl

    mov dl, al          
    add dl, '0'         
    mov dh, ah         
    
    mov ah, 02h         
    int 21h

    mov dl, dh         
    add dl, '0'         
    mov ah, 02h        
    int 21h

    jmp done

od:
    add al, '0'
    mov dl, al
    mov ah, 02h
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