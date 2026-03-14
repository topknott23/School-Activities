; Filename: exer18.asm
; Name: Joel Theo C. Gallarde
; Date: September 11, 2025
; Description: This assembly language program will get character input and determine if input is 'y' or 'Y' to display good morning message else display good afternoon message..
.MODEL small
.STACK 200h

.DATA
    inputChar db ?                ; Declare a variable to store the input character.
    inputMsg db 'Enter a character: $'   ; Prompt to get user input.
    goodMorningMsg db 0Ah, 'Good Morning!$'   ; Message for 'y' or 'Y'.
    goodAfternoonMsg db 0Ah, 'Good Afternoon!$' ; Message for anything else.

.CODE
Main:
    mov ax, @data
    mov ds, ax


    mov dx, offset inputMsg
    mov ah, 09h
    int 21h


    mov ah, 01h       
    int 21h

  
    mov inputChar, al

    cmp al, 'y'          
    je good_morning           

   
    cmp al, 'Y'       
    je good_morning          

    ; If input is neither 'y' nor 'Y', show good afternoon message
    mov dx, offset goodAfternoonMsg
    mov ah, 09h
    int 21h
    jmp exit_program           ; Jump to exit the program

good_morning:
    ; If input was 'y' or 'Y', show good morning message
    mov dx, offset goodMorningMsg
    mov ah, 09h
    int 21h
    jmp exit_program           ; Jump to exit the program

exit_program:
    ; Exit the program
    mov ax, 4C00h
    int 21h

END Main