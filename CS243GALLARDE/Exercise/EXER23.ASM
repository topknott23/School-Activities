
; Filename: EXER23.ASM
; Programmer name: Joel Theo C. Gallarde
; Date: September 11, 2025
; Description: This assembly language program will ask for your full name then greets you.
.MODEL small
.STACK 200h

.DATA
    ; Messages
    askFirst db 'Enter your First Name: $'
    askMiddle db 0Dh,0Ah, 'Enter your Middle Name: $'
    askLast db 0Dh,0Ah, 'Enter your Family Name: $'
    greet db 0Dh,0Ah, 'Hello, $'

    ; Buffers for input (max 30 chars each)
    firstName db 30,0,30 dup('$')
    middleName db 30,0,30 dup('$')
    lastName db 30,0,30 dup('$')

    exclam db ' !$'

.CODE
Main:
    mov ax, @data
    mov ds, ax

    ; --- First Name ---
    mov dx, offset askFirst
    mov ah, 09h
    int 21h

    mov dx, offset firstName
    mov ah, 0Ah
    int 21h

    ; --- Middle Name ---
    mov dx, offset askMiddle
    mov ah, 09h
    int 21h

    mov dx, offset middleName
    mov ah, 0Ah
    int 21h

    ; --- Last Name ---
    mov dx, offset askLast
    mov ah, 09h
    int 21h

    mov dx, offset lastName
    mov ah, 0Ah
    int 21h

    ; --- Greeting ---
    mov dx, offset greet
    mov ah, 09h
    int 21h

    ; print first name
    lea si, firstName+2
    call PrintString

    mov dl, ' '
    mov ah, 02h
    int 21h

    ; print middle name
    lea si, middleName+2
    call PrintString

    mov dl, ' '
    mov ah, 02h
    int 21h

    ; print last name
    lea si, lastName+2
    call PrintString

    ; print !
    mov dx, offset exclam
    mov ah, 09h
    int 21h

    ; Exit
    mov ax, 4C00h
    int 21h

; --- Procedure: PrintString ---
; Input: SI points to input string (length at [SI-2], actual chars start here, ends with Enter key)
PrintString proc
    mov cl, [si-1]        ; length of input
    mov ch, 0
nextChar:
    cmp cx, 0
    je done
    lodsb
    cmp al, 0Dh           ; ignore Enter key
    je done
    mov dl, al
    mov ah, 02h
    int 21h
    loop nextChar
done:
    ret
PrintString endp

END Main