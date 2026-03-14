; Filename: EXER22.ASM
; Programmer name: Joel Theo C. Gallarde
; Date: September 11, 2025
; Description: This assembly language program will check if it's 'a' or 'A'.
.MODEL small
.STACK 200h

.DATA
    inputMsg db 'Enter a character: $'            ; Prompt for input.
    yesMsg db 0Ah, 'Yes, you have entered letter A.$'  ; Message for 'A'
    noMsg db 0Ah, 'No, you have not entered letter A. You entered character: $'  ; Message for not 'A'
    inputChar db 0    ; Space to store the character entered by the user

.CODE
Main:
    mov ax, @data
    mov ds, ax

    ; Ask user for input
    mov dx, offset inputMsg
    mov ah, 09h
    int 21h

    ; Read a character from input
    mov ah, 01h                ; DOS function 01h (read a character from input)
    int 21h                    ; Call interrupt to get input
    mov [inputChar], al        ; Store the input character in inputChar

    ; Check if the input character is 'A' or 'a'
    mov al, [inputChar]        ; Load the entered character into AL
    cmp al, 'A'                ; Compare with 'A'
    je is_A                    ; If equal, jump to is_A

    cmp al, 'a'                ; Compare with 'a'
    je is_A                    ; If equal, jump to is_A

    ; If the character is not 'A' or 'a', display the "No" message
    mov dx, offset noMsg
    mov ah, 09h
    int 21h

    ; Display the entered character
    mov dl, [inputChar]        ; Load the entered character into DL
    mov ah, 02h                ; DOS function 02h (output character in DL)
    int 21h                    ; Call interrupt to display the character

    ; Exit the program
    mov ax, 4C00h
    int 21h

is_A:
    ; If the character is 'A' or 'a', display the "Yes" message
    mov dx, offset yesMsg
    mov ah, 09h
    int 21h

    ; Exit the program
    mov ax, 4C00h
    int 21h

END Main