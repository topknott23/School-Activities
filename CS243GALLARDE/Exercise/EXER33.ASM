; Filename: EXER33.asm
; Name: Joel Theo C. Gallarde
; Date: October 6, 2025
; Display certain messages depending on the inputted number

.model small
.stack 100

.data

    nl db 0Ah, '$'

    p1 db "Enter a number: $"

    output1 db "The number is equal to 5.$"
    output2 db "The number is greater than 5.$"
    output3 db "The number is less than 5.$"

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

    cmp bl, 5
    je ok1 
    jge ok2
    jle ok3

ok1:
    mov ah, 09h
    mov dx, offset output1
    int 21h

    jmp done

ok2:
    mov ah, 09h
    mov dx, offset output2
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