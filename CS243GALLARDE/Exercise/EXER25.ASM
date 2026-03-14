; Filename: EXER25.ASM
; Programmer name: Joel Theo C. Gallarde
; Date: September 11, 2025
; This program:
;  1. Displays a menu of ATM transactions
;  2. Asks the user to enter a number (1–7)
;  3. Displays back the number and the chosen transaction
;  4. Exits gracefully


.MODEL small
.STACK 200h

.DATA
    titleMsg db 0Ah, 'Cebu Institute of Technology - University$'
    atmMsg   db 0Ah, 'Automated Teller Machine$'
    menuMsg  db 0Ah, 0Ah, 'Main Menu$'
    opt1 db 0Ah, '1 Balance Inquiry$'
    opt2 db 0Ah, '2 Withdrawal$'
    opt3 db 0Ah, '3 Deposit$'
    opt4 db 0Ah, '4 Transfer$'
    opt5 db 0Ah, '5 Bills Payment$'
    opt6 db 0Ah, '6 Change Pin$'
    opt7 db 0Ah, '7 Exit$'
    askChoice db 0Ah, 0Ah, 'Enter number of your choice: $'

    chosenMsg db 0Ah, 'You have chosen $'

    msg1 db 'Balance Inquiry.$'
    msg2 db 'Withdrawal.$'
    msg3 db 'Deposit.$'
    msg4 db 'Transfer.$'
    msg5 db 'Bills Payment.$'
    msg6 db 'Change Pin.$'
    msg7 db 'Exit.$'

    thankMsg db 0Ah, 0Ah, 'Thank you for banking with us!$'
    copyMsg  db 0Ah, 'Copyright 2024$'
    progMsg  db 0Ah, 'Programmer: JOEL THEO C. GALLARDE$'

    userChoice db ?    ; storage for user input (character)

.CODE
Main PROC
    mov ax, @data
    mov ds, ax

    ;=== Display ATM Header ===
    mov dx, offset titleMsg
    mov ah, 09h
    int 21h

    mov dx, offset atmMsg
    mov ah, 09h
    int 21h

    mov dx, offset menuMsg
    mov ah, 09h
    int 21h

    ;=== Display Menu Options ===
    mov dx, offset opt1
    mov ah, 09h
    int 21h

    mov dx, offset opt2
    mov ah, 09h
    int 21h

    mov dx, offset opt3
    mov ah, 09h
    int 21h

    mov dx, offset opt4
    mov ah, 09h
    int 21h

    mov dx, offset opt5
    mov ah, 09h
    int 21h

    mov dx, offset opt6
    mov ah, 09h
    int 21h

    mov dx, offset opt7
    mov ah, 09h
    int 21h

    ;=== Ask for user choice ===
    mov dx, offset askChoice
    mov ah, 09h
    int 21h

    mov ah, 01h        ; read character
    int 21h
    mov userChoice, al

    ;=== Print "You have chosen " ===
    mov dx, offset chosenMsg
    mov ah, 09h
    int 21h

    ;=== Print the number the user entered ===
    mov dl, userChoice
    mov ah, 02h
    int 21h

    mov dl, ' '        ; add space after number
    mov ah, 02h
    int 21h

    ;=== Check what choice user entered ===
    mov al, userChoice
    cmp al, '1'
    je choice1
    cmp al, '2'
    je choice2
    cmp al, '3'
    je choice3
    cmp al, '4'
    je choice4
    cmp al, '5'
    je choice5
    cmp al, '6'
    je choice6
    cmp al, '7'
    je choice7
    jmp done   ; invalid entry, just exit

choice1:
    mov dx, offset msg1
    mov ah, 09h
    int 21h
    jmp summary

choice2:
    mov dx, offset msg2
    mov ah, 09h
    int 21h
    jmp summary

choice3:
    mov dx, offset msg3
    mov ah, 09h
    int 21h
    jmp summary

choice4:
    mov dx, offset msg4
    mov ah, 09h
    int 21h
    jmp summary

choice5:
    mov dx, offset msg5
    mov ah, 09h
    int 21h
    jmp summary

choice6:
    mov dx, offset msg6
    mov ah, 09h
    int 21h
    jmp summary

choice7:
    mov dx, offset msg7
    mov ah, 09h
    int 21h
    jmp summary

;=== Print Thank You & Exit ===
summary:
    mov dx, offset thankMsg
    mov ah, 09h
    int 21h

    mov dx, offset copyMsg
    mov ah, 09h
    int 21h

    mov dx, offset progMsg
    mov ah, 09h
    int 21h

done:
    mov ax, 4C00h
    int 21h

Main ENDP
END Main