; Filename: EXER32.asm
; Name: Joel Theo C. Gallarde
; Date: October 6, 2025
; Checks if inputted character is letter A.

.model small
.stack 100

.data

    nl db 0Ah, '$'

    p1 db "Enter a character: $"

    output1 db "You entered A.$"
    output2 db "You entered not A.$"

.code
main:
    mov ax, @data
    mov ds, ax

    mov ah, 09h
    mov dx, offset p1
    int 21h

    mov ah, 01h
    int 21h
    mov bl, al
    call pnl

    cmp bl, 'A'
    je isa 

not_isa:
    mov ah, 09h
    mov dx, offset output2
    int 21h

    jmp done

isa:
    mov ah, 09h
    mov dx, offset output1
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