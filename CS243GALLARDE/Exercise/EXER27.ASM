; Filename: EXER27.asm
; Name: Joel Theo C. Gallarde
; Date: October 5, 2025
; Accepting 3 string inputs and outputting them on separate lines

.model small
.stack 100

.data
    
    ; newline
    nl db 0Ah, '$'

    ; Prompts
    prompt1 db "Enter first string: $"
    prompt2 db "Enter second string: $"
    prompt3 db "Enter third string: $"

    ; Input

    input1 db 100, ?, 100 dup('$')
    input2 db 100, ?, 100 dup('$')
    input3 db 100, ?, 100 dup('$')

    ; Output

    outm1 db "You entered first string: $"
    outm2 db "You entered second string: $"
    outm3 db "You entered third string: $"


.code
main:
    mov ax, @data
    mov ds, ax

    mov ah, 09h
    mov dx, offset prompt1
    int 21h

    mov ah, 0Ah
    mov dx, offset input1
    int 21h

    call pnl

    mov ah, 09h
    mov dx, offset prompt2
    int 21h

    mov ah, 0Ah
    mov dx, offset input2
    int 21h

    call pnl

    mov ah, 09h
    mov dx, offset prompt3
    int 21h

    mov ah, 0Ah
    mov dx, offset input3
    int 21h

    call pnl
    call pnl

    mov ah, 09h
    mov dx, offset outm1
    int 21h

    lea dx, [input1+2]
    int 21h

    call pnl

    mov ah, 09h
    mov dx, offset outm2
    int 21h

    lea dx, [input2+2]
    int 21h

    call pnl

    mov ah, 09h
    mov dx, offset outm3
    int 21h

    lea dx, [input3+2]
    int 21h


    int 27h

pnl proc
    mov ah, 09h
    mov dx, offset nl
    int 21h
    ret
pnl endp



end main