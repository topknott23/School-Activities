; Filename: EXER28.asm
; Name: Joel Theo C. Gallarde
; Date: October 5, 2025
; Displaying the sum of two numbers

.model small
.stack 100

.data
    ; newline
    nl db 0Ah, '$'

    ; Prompts
    p1 db "Enter first number (0-9): $"
    p2 db "Enter second number (0-9): $"

    ; Output
    output db "The sum is: $"

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
    add bl, al

    call pnl

    mov ah, 09h
    mov dx, offset output
    int 21h

    mov al, bl
    cmp al, 9
    jg td

pdg:
    mov dl, ah
    add dl, '0'
    mov ah, 02h
    int 21h


td:
    mov ah, 0
    mov dl, '1' 
    mov ah, 02h
    int 21h

    sub bl, 10 
               
    mov al, bl
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