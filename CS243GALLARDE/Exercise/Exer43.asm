;=====================================================================
; Program Title : greetings.asm
; Description   : Displays a greetings menu with 4 options:
;                   1. Good Morning
;                   2. Good Afternoon
;                   3. Good Evening
;                   4. Exit Program
;                 Each option calls its own procedure.
; Author        : Gallarde, Joel Theo C.
; Assembler     : Turbo Assembler (TASM)
; Target        : DOSBox (8086 real mode)
;=====================================================================
 
.MODEL SMALL                ; Small memory model
.STACK 100h                ; Stack size 256 bytes
 
.DATA                      ; ---- Start of data segment ----
 
;----------------------------------------------------------
; Menu text and messages
;----------------------------------------------------------
menuTitle db 0Dh,0Ah,'Greetings',0Dh,0Ah
          db 'Main Menu',0Dh,0Ah
          db '1. Good Morning',0Dh,0Ah
          db '2. Good Afternoon',0Dh,0Ah
          db '3. Good Evening',0Dh,0Ah
          db '4. Exit Program',0Dh,0Ah
          db 'Enter choice: $'
 
msgMorning   db 0Dh,0Ah,0Dh,0Ah, 'Good Morning!$'
msgAfternoon db 0Dh,0Ah,0Dh,0Ah, 'Good Afternoon!$'
msgEvening   db 0Dh,0Ah,0Dh,0Ah, 'Good Evening!$'
msgInvalid   db 0Dh,0Ah,0Dh,0Ah, 'Invalid choice. Please try again.$'
msgExit      db 0Dh,0Ah,0Dh,0Ah, 'Thank you! Program will now exit.$'
 
.CODE                      ; ---- Start of code segment ----
 
;=====================================================================
; MAIN PROCEDURE
;=====================================================================
MAIN PROC
    mov ax, @data           ; Initialize DS
    mov ds, ax
 
MainMenu:
    ; Display Main Menu
    mov ah, 09h
    lea dx, menuTitle
    int 21h
 
    ; Get user input
    mov ah, 01h
    int 21h
    mov bl, al              ; Store choice
 
    ; Print newline
    mov ah, 02h
    mov dl, 0Dh
    int 21h
    mov dl, 0Ah
    int 21h
 
    ; Evaluate choice
    cmp bl, '1'
    je  CallMorning
    cmp bl, '2'
    je  CallAfternoon
    cmp bl, '3'
    je  CallEvening
    cmp bl, '4'
    je  CallExit
    jmp InvalidChoice
 
CallMorning:
    call GoodMorning
    jmp MainMenu
 
CallAfternoon:
    call GoodAfternoon
    jmp MainMenu
 
CallEvening:
    call GoodEvening
    jmp MainMenu
 
CallExit:
    call ExitProgram
 
InvalidChoice:
    call InvalidMsg
    jmp MainMenu
 
MAIN ENDP
 
;=====================================================================
; PROCEDURE: GoodMorning
;=====================================================================
GoodMorning PROC
    mov ah, 09h
    lea dx, msgMorning
    int 21h
    ret
GoodMorning ENDP
 
;=====================================================================
; PROCEDURE: GoodAfternoon
;=====================================================================
GoodAfternoon PROC
    mov ah, 09h
    lea dx, msgAfternoon
    int 21h
    ret
GoodAfternoon ENDP
 
;=====================================================================
; PROCEDURE: GoodEvening
;=====================================================================
GoodEvening PROC
    mov ah, 09h
    lea dx, msgEvening
    int 21h
    ret
GoodEvening ENDP
 
;=====================================================================
; PROCEDURE: InvalidMsg
;=====================================================================
InvalidMsg PROC
    mov ah, 09h
    lea dx, msgInvalid
    int 21h
    ret
InvalidMsg ENDP
 
;=====================================================================
; PROCEDURE: ExitProgram
;=====================================================================
ExitProgram PROC
    mov ah, 09h
    lea dx, msgExit
    int 21h
 
    mov ah, 4Ch
    mov al, 00h
    int 21h
ExitProgram ENDP
 
END MAIN
 
 