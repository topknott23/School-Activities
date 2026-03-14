; filename: Gallarde, Joel Theo.asm
; description: Assembly language program to control an air condition unit.
; Progmmer: Joel Theo C. Gallarde
; Date: November 20, 2025
 
.MODEL SMALL
.STACK 100h
.DATA
   ; Feature status variables (0 = Off, 1 = On)
   power_status    DB 0
   swing_status    DB 0
   quiet_status    DB 0
   eco_status      DB 0
   fan_status      DB 0
   cool_status     DB 0
   turbo_status    DB 0
   timer_status    DB 0
   sleep_status    DB 0
   ; String constants
   title1      DB '====================================================', 0Dh, 0Ah, '$'
   title2      DB '            CIT-U AIR CONDITION UNIT', 0Dh, 0Ah, '$'
   programmer  DB '        Programmer: Joel Theo C. Gallarde                  ', 0Dh, 0Ah, 0Dh, 0Ah, '$'
   welcome     DB '                   WELCOME!', 0Dh, 0Ah, 0Dh, 0Ah, '$'
   menu_header DB '-------------- MAIN MENU STATUS --------------------', 0Dh, 0Ah, 0Dh, 0Ah, '$'
   
   line1       DB '  1 Power: $'
   line1b      DB '     4 Eco Mode: $'
   line1c      DB '   7 Turbo: $'
   line1d      DB '      0 Exit', 0Dh, 0Ah, '$'
   line2       DB '  2 Swing: $'
   line2b      DB '     5 Fan: $'
   line2c      DB '        8 Timer: $'
   line2d      DB 0Dh, 0Ah, '$'
   line3       DB '  3 Quiet: $'
   line3b      DB '     6 Cool: $'
   line3c      DB '       9 Sleep: $'
   line3d      DB 0Dh, 0Ah, 0Dh, 0Ah, '$'
   prompt      DB '====================================================', 0Dh, 0Ah
               DB 'Enter choice: $'
   on_msg      DB 'On $'
   off_msg     DB 'Off$'
   error_msg   DB 0Dh, 0Ah, 0Dh, 0Ah, '      >>> INPUT ERROR! <<<', 0Dh, 0Ah
               DB '   Press ENTER to continue...$'
   exit_msg    DB '            Thank you. Be cool always!', 0Dh, 0Ah, 0Dh, 0Ah, '$'
   exit_msg1   DB '================= NOTHING FOLLOWS ==================', 0Dh, 0Ah, 0Dh, 0Ah,'$'
   newLine     DB '$',0Dh,0AH
.CODE
setColor macro num, color
   MOV AH, 09h
   MOV BH, 0
   MOV BL, color
   MOV CX, num
   INT 10h
endm
printStr macro str
   mov ah,09h
   lea dx,str
   int 21h
endm
MAIN PROC
   MOV AX, @DATA
   MOV DS, AX
   ; Set initial video mode
   MOV AH, 00h
   MOV AL, 03h
   INT 10h
MAIN_LOOP:
   CALL CLEAR_SCREEN
   CALL DISPLAY_MENU
   CALL GET_INPUT
   CMP AL, '0'
   JE DO_EXIT
   CMP AL, '1'
   JE TOGGLE_POWER
   CMP AL, '2'
   JE TOGGLE_SWING
   CMP AL, '3'
   JE TOGGLE_QUIET
   CMP AL, '4'
   JE TOGGLE_ECO
   CMP AL, '5'
   JE TOGGLE_FAN
   CMP AL, '6'
   JE TOGGLE_COOL
   CMP AL, '7'
   JE TOGGLE_TURBO
   CMP AL, '8'
   JE TOGGLE_TIMER
   CMP AL, '9'
   JE TOGGLE_SLEEP
   ; Invalid input
   CALL SHOW_ERROR
   JMP MAIN_LOOP
DO_EXIT:
   JMP EXIT_PROGRAM
TOGGLE_POWER:
   XOR power_status, 1
   cmp power_status, 0
   jne POWER_IS_ON
   call POWER_OFF
   POWER_IS_ON:
   JMP MAIN_LOOP
TOGGLE_SWING:
   CMP power_status, 0
   JE SKIP_SWING
   XOR swing_status, 1
SKIP_SWING:
   JMP MAIN_LOOP
TOGGLE_QUIET:
   CMP power_status, 0
   JE SKIP_QUIET
   XOR quiet_status, 1
SKIP_QUIET:
   JMP MAIN_LOOP
TOGGLE_ECO:
   CMP power_status, 0
   JE SKIP_ECO
   XOR eco_status, 1
SKIP_ECO:
   JMP MAIN_LOOP
TOGGLE_FAN:
   CMP power_status, 0
   JE SKIP_FAN
   XOR fan_status, 1
SKIP_FAN:
   JMP MAIN_LOOP
TOGGLE_COOL:
   CMP power_status, 0
   JE SKIP_COOL
   XOR cool_status, 1
SKIP_COOL:
   JMP MAIN_LOOP
TOGGLE_TURBO:
   CMP power_status, 0
   JE SKIP_TURBO
   XOR turbo_status, 1
SKIP_TURBO:
   JMP MAIN_LOOP
TOGGLE_TIMER:
   CMP power_status, 0
   JE SKIP_TIMER
   XOR timer_status, 1
SKIP_TIMER:
   JMP MAIN_LOOP
TOGGLE_SLEEP:
   CMP power_status, 0
   JE SKIP_SLEEP
   XOR sleep_status, 1
SKIP_SLEEP:
   JMP MAIN_LOOP
EXIT_PROGRAM:
   call CLEAR_SCREEN
   ; Set color to bright cyan
   setColor 52, 0Ch
   printStr exit_msg1
   setColor 38, 0Ah
   printStr exit_msg
   setColor 52, 0Ch
   printStr exit_msg1
   MOV AH, 4Ch
   INT 21h
MAIN ENDP
;----- CLEAR SCREEN PROCEDURE -----
CLEAR_SCREEN PROC
   MOV AH, 00h
   MOV AL, 03h
   INT 10h
   RET
CLEAR_SCREEN ENDP
;----- DISPLAY MENU PROCEDURE -----
DISPLAY_MENU PROC
   ; Set color to bright cyan for title
   setColor 52, 0CH
   printStr title1
   setColor 36, 0DH
   printStr title2
   setColor 52, 0CH
   printStr title1
   ; Set color to yellow for programmer
   setColor 48, 0EH
   printStr programmer
   ; Set color to bright white for welcome
   setColor 27, 0AH
   printStr welcome
   ; Set color to bright green for menu header
   setColor 52, 0AH
   printStr menu_header
   ; Display Line 1
   CALL DISPLAY_LINE1
   ; Display Line 2
   CALL DISPLAY_LINE2
   ; Display Line 3
   CALL DISPLAY_LINE3
   ; Display prompt
   setColor 52, 0AH
   printStr prompt
   RET
DISPLAY_MENU ENDP
;----- DISPLAY LINE 1 PROCEDURE -----
DISPLAY_LINE1 PROC
   ; Set color to white
   setColor 1, 0FH
   printStr line1
   MOV AL, power_status
   CALL PRINT_STATUS
   printStr line1b
   MOV AL, eco_status
   CALL PRINT_STATUS
   printStr line1c
   MOV AL, turbo_status
   CALL PRINT_STATUS
   printStr line1d
   RET
DISPLAY_LINE1 ENDP
;----- DISPLAY LINE 2 PROCEDURE -----
DISPLAY_LINE2 PROC
   printStr line2
   MOV AL, swing_status
   CALL PRINT_STATUS
   printStr line2b
   MOV AL, fan_status
   CALL PRINT_STATUS
   printStr line2c
   MOV AL, timer_status
   CALL PRINT_STATUS
   printStr line2d
   RET
DISPLAY_LINE2 ENDP
;----- DISPLAY LINE 3 PROCEDURE -----
DISPLAY_LINE3 PROC
   printStr line3
   MOV AL, quiet_status
   CALL PRINT_STATUS
   printStr line3b
   MOV AL, cool_status
   CALL PRINT_STATUS
   printStr line3c
   MOV AL, sleep_status
   CALL PRINT_STATUS
   printStr line3d
   RET
DISPLAY_LINE3 ENDP
;----- PRINT STATUS PROCEDURE -----
PRINT_STATUS PROC
   CMP AL, 1
   JE PRINT_ON
   ; Print Off in red
   setColor 3, 0CH
   printStr off_msg
   JMP PRINT_STATUS_END
PRINT_ON:
   ; Print On in bright green
   setColor 2, 0AH
   printStr on_msg
PRINT_STATUS_END:
   ; Reset to black to disregard the excess $
   setColor 1, 00H
   RET
PRINT_STATUS ENDP
;----- GET INPUT PROCEDURE -----
GET_INPUT PROC
    ; get first character (the choice)
    mov ah, 01h
    int 21h
    mov bl, al      ; save choice in BL
 
WAIT_FOR_ENTER:
    mov ah, 01h
    int 21h
    cmp al, 0Dh     ; Enter key?
    jne WAIT_FOR_ENTER
 
    mov al, bl       ; restore choice back to AL
    ret
GET_INPUT ENDP
;----- SHOW ERROR PROCEDURE -----
SHOW_ERROR PROC
   printStr error_msg
   MOV AH, 1
   INT 21h
   RET
SHOW_ERROR ENDP
POWER_OFF PROC
   mov swing_status, 0
   mov quiet_status, 0
   mov eco_status, 0
   mov fan_status, 0
   mov cool_status, 0
   mov turbo_status, 0
   mov timer_status, 0
   mov sleep_status, 0
   jmp MAIN_LOOP
POWER_OFF ENDP
END MAIN
 