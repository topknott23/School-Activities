; Filename: EXER34.asm
; Name: Joel Theo C. Gallarde
; Date: October 6, 2025
; Compares two numbers and displays whichever one is bigger or smaller.

.model small
.stack 100

.data

    nl db 0Ah, '$'

    p1 db "Enter first number: $"
    p2 db "Enter second number: $"

    output1 db "The bigger number is: $"
    output2 db "The smaller number is: $"
    output3 db "They are equal!$"
    

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

    cmp bl, cl
    je ok3
    jg ok1
    jl ok2

ok1:
    mov ah, 09h
    mov dx, offset output1
    int 21h

    mov ah, 02h
    add bl, '0'
    mov dl, bl
    int 21h
    call pnl
    mov ah, 09h
    mov dx, offset output2
    int 21h

    mov ah, 02h
    add cl, '0'
    mov dl, cl
    int 21h

    jmp done

ok2:

    mov ah, 09h
    mov dx, offset output2
    int 21h

    mov ah, 02h
    add bl, '0'
    mov dl, bl
    int 21h

    call pnl

    mov ah, 09h
    mov dx, offset output1
    int 21h

    mov ah, 02h
    add cl, '0'
    mov dl, cl
    int 21h


    jmp done

ok3:
    mov ah, 09h
    mov dx, offset output3
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