; Filename: exer17.asm
; Name: Joel Theo C. Gallarde
; Date: September 11, 2025
; Description: This assembly language program will continuously get character input and display back input until Enter key is pressed.

.MODEL small
.STACK 200h

.DATA
    inputChar db ?                ; Declare a variable to store input character.
    inputMsg db 0Ah,'Enter a character: $'   ; Message to prompt the user to enter a character.
    outputMsg db 0Ah, 'You entered: $'   ; Message to display before showing the input character.

.CODE
Main:
    mov ax, @data
    mov ds, ax

loop_start:

    mov dx, offset inputMsg
    mov ah, 09h
    int 21h

    mov ah, 01h             
    int 21h

  
    mov inputChar, al


    cmp al, 13               
    je exit_program             

    ; Display the "You entered: " message
    mov dx, offset outputMsg
    mov ah, 09h
    int 21h

    ; Display the entered character
    mov dl, inputChar
    mov ah, 02h                ; DOS function 02h (output a character in DL)
    int 21h

    ; Repeat the loop
    jmp loop_start

exit_program:
    ; Exit the program
    mov ax, 4C00h
    int 21h

END Main