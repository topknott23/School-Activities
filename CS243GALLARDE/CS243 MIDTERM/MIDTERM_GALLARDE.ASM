.MODEL SMALL
.STACK 100h
.DATA
    ; --- Header Strings ---
    header1         DB 'CIT-U BANK', '$'
    header2         DB 'Automatic Teller Machine', '$'
    header3         DB 'Copyright 2025', '$'
    header4         DB 'Programmer: JOEL THEO GALLARDE', '$'
    header5         DB 'Welcome!', '$'
 
    ; --- PIN Entry Strings ---
    prompt_card     DB 'Please insert your card.', '$'
    prompt_pin      DB 'Enter your PIN: ', '$'
    msg_wrong_pin   DB 'WRONG PIN'  ; No $ needed for INT 10h/1301h
   
    ; --- Data for PIN Check ---
    correct_pin     DB '12345'
    pin_input       DB 5 DUP(0)
 
    ; --- Main Menu Strings ---
    menu_header     DB 'MAIN MENU', '$'
    menu1           DB '1 Balance Inquiry', '$'
    menu2           DB '2 Deposit', '$'
    menu3           DB '3 Withdraw', '$'
    menu4           DB '4 Pay Bills', '$'
    menu5           DB '5 Exit', '$'
    prompt_choice   DB 'Please enter number of your choice: ', '$'
    msg_wrong_choice DB 'WRONG CHOICE!' ; No $ needed
 
    ; --- Transaction Strings ---
    bal_inq_header  DB 'BALANCE INQUIRY', '$'
    dep_header      DB 'DEPOSIT', '$'
    wit_header      DB 'WITHDRAW', '$'
    pay_header      DB 'PAY BILLS', '$'
    prompt_continue DB 'Continue? Y/N: ', '$'
 
    ; --- Exit Strings ---
    exit_header     DB 'EXIT', '$'
    msg_goodbye     DB 'Please get your card. Thank you.', '$'
 
.CODE
MAIN PROC
    ; --- Initialize DS ---
    MOV AX, @DATA
    MOV DS, AX
 
    ; --- Set Video Mode & Color ---
    ; AH=00h (Set Mode), AL=03h (80x25 text)
    ; This also clears the screen.
    MOV AX, 0003h
    INT 10h
   
    ; AH=0Bh (Set BG Color), BH=0, BL=04h (Red)
    MOV AX, 0B00h
    MOV BX, 0004h
    INT 10h
 
    ; Set default text attribute to Yellow on Red (4Eh)
    ; We'll do this by clearing the screen with this attribute.
    CALL CLEAR_SCREEN
 
; -----------------------------------------------------------------
;  BEHAVIOR 1: OPENING SCREEN & PIN ENTRY
; -----------------------------------------------------------------
START_SCREEN:
    CALL CLEAR_SCREEN
    CALL DISPLAY_HEADER
   
    ; Display "Please insert your card."
    MOV DX, 080Ah ; Row 9, Col 10
    CALL GOTO_XY
    LEA DX, prompt_card
    CALL PRINT_STRING
 
PIN_ENTRY_LOOP:
    ; Display "Enter your PIN:"
    MOV DX, 090Ah ; Row 10, Col 10
    CALL GOTO_XY
    LEA DX, prompt_pin
    CALL PRINT_STRING
   
    ; Read the 4-digit PIN
    CALL READ_PIN
   
    ; Check if PIN is correct
    CALL CHECK_PIN
    CMP CX, 1       ; Check_PIN returns 1 in CX if match
    JE SHOW_MAIN_MENU_NO_CLEAR ; Correct PIN
   
    ; --- Wrong PIN Logic ---
    MOV DX, 0A0Ah ; Row 12, Col 10
    CALL GOTO_XY
   
    ; Print "WRONG PIN" (blinking, red text on yellow bg)
    MOV AX, 1301h   ; Write String
    MOV BH, 0       ; Page 0
    MOV BL, 0E4h    ; Attribute: Blinking(80h)|Yellow BG(60h)|Red Text(04h)
    MOV CX, 9       ; Length of "WRONG PIN"
    LEA BP, msg_wrong_pin
    PUSH DS
    POP ES          ; ES:BP must point to string
    INT 10h
   
    ; --- NEW "Pause for Key" code ---
    MOV DX, 0D0Ah ; Row 13, Col 10
    CALL GOTO_XY
 
    MOV AH, 00h
    INT 16h
 
    JMP START_SCREEN ; Reset to beginning
 
; -----------------------------------------------------------------
;  BEHAVIOR 2 & 3: MAIN MENU & TRANSACTIONS
; -----------------------------------------------------------------
SHOW_MAIN_MENU_WITH_CLEAR:
    CALL CLEAR_SCREEN
    CALL DISPLAY_HEADER
    JMP DISPLAY_MENU_COMMON
 
SHOW_MAIN_MENU_NO_CLEAR:
    ; Clear only the part below the header (from line 8)
    MOV DH, 8
    CALL CLEAR_FROM_LINE
   
DISPLAY_MENU_COMMON:
    ; Display "MAIN MENU"
    MOV DX, 080Ah ; Row 8, Col 10
    CALL GOTO_XY
    LEA DX, menu_header
    CALL PRINT_STRING
 
    ; Display menu options
    MOV DX, 090Ah ; Row 9
    CALL GOTO_XY
    LEA DX, menu1
    CALL PRINT_STRING
 
    MOV DX, 0A0Ah ; Row 10
    CALL GOTO_XY
    LEA DX, menu2
    CALL PRINT_STRING
 
    MOV DX, 0B0Ah ; Row 11
    CALL GOTO_XY
    LEA DX, menu3
    CALL PRINT_STRING
 
    MOV DX, 0C0Ah ; Row 12
    CALL GOTO_XY
    LEA DX, menu4
    CALL PRINT_STRING
 
    MOV DX, 0D0Ah ; Row 13
    CALL GOTO_XY
    LEA DX, menu5
    CALL PRINT_STRING
 
    ; Prompt for choice
    MOV DX, 0E0Ah ; Row 15, Col 10
    CALL GOTO_XY
    LEA DX, prompt_choice
    CALL PRINT_STRING
 
    CALL READ_CHAR ; Choice is in AL
 
    ; --- Process Choice ---
    CMP AL, '1'
    JE DO_BAL_INQUIRY
    CMP AL, '2'
    JE DO_DEPOSIT
    CMP AL, '3'
    JE DO_WITHDRAW
    CMP AL, '4'
    JE DO_PAY_BILLS
    CMP AL, '5'
    JNE HANDLE_WRONG_CHOICE
    JMP DO_EXIT
 
HANDLE_WRONG_CHOICE:
    ; --- Wrong Choice Logic ---
    MOV DX, 0F0Ah ; Row 17, Col 10
    CALL GOTO_XY
   
    ; Print "WRONG CHOICE!" (blinking, red on yellow)
    MOV AX, 1301h   ; Write String
    MOV BH, 0       ; Page 0
    MOV BL, 0E4h    ; Attribute
    MOV CX, 13      ; Length of "WRONG CHOICE!"
    LEA BP, msg_wrong_choice
    PUSH DS
    POP ES
    INT 10h
   
    ; --- NEW "Pause for Key" code ---
    MOV DX, 120Ah ; Row 18, Col 10 (just below WRONG CHOICE)
    CALL GOTO_XY
 
    MOV AH, 00h
    INT 16h
 
    JMP SHOW_MAIN_MENU_WITH_CLEAR ; Clear screen and show menu
 
; --- Transaction Handlers ---
DO_BAL_INQUIRY:
    MOV DX, 100Ah ; Row 10, Col 10
    CALL GOTO_XY
    LEA DX, bal_inq_header
    CALL PRINT_STRING
    JMP CONTINUE_PROMPT
 
DO_DEPOSIT:
    MOV DX, 100Ah ; Row 10, Col 10
    CALL GOTO_XY
    LEA DX, dep_header
    CALL PRINT_STRING
    JMP CONTINUE_PROMPT
   
DO_WITHDRAW:
    MOV DX, 100Ah ; Row 10, Col 10
    CALL GOTO_XY
    LEA DX, wit_header
    CALL PRINT_STRING
    JMP CONTINUE_PROMPT
 
DO_PAY_BILLS:
    MOV DX, 100Ah ; Row 10, Col 10
    CALL GOTO_XY
    LEA DX, pay_header
    CALL PRINT_STRING
    JMP CONTINUE_PROMPT
 
; --- "Continue? Y/N" Logic ---
CONTINUE_PROMPT:
    MOV DX, 110Ah ; Row 11, Col 10
    CALL GOTO_XY
    LEA DX, prompt_continue
    CALL PRINT_STRING
   
    CALL READ_CHAR ; Choice in AL
   
    CMP AL, 'Y'
    JE CONTINUE_YES
    CMP AL, 'y'
    JE CONTINUE_YES
   
    CMP AL, 'N'
    JE CONTINUE_NO
    CMP AL, 'n'
    JE CONTINUE_NO
   
    JMP CONTINUE_PROMPT ; Invalid input, re-ask
 
CONTINUE_YES:
    CALL GOTO_XY
 
    MOV AH, 00h
    INT 16h
 
    JMP SHOW_MAIN_MENU_NO_CLEAR
 
CONTINUE_NO:
    MOV DX, 130Ah ; Row 12, Col 10
    CALL GOTO_XY
    LEA DX, msg_goodbye
    CALL PRINT_STRING
    ; --- NEW "Pause for Key" code ---
    MOV DX, 120Ah ; Row 18, Col 10 (just below WRONG CHOICE)
    CALL GOTO_XY
 
    MOV AH, 00h
    INT 16h
   
    JMP START_SCREEN ; Reset to beginning
 
; -----------------------------------------------------------------
;  BEHAVIOR 4: EXIT
; -----------------------------------------------------------------
DO_EXIT:
    ; (No longer clearing screen)
   
    MOV DX, 110Ah ; Row 17
    CALL GOTO_XY
    LEA DX, exit_header
    CALL PRINT_STRING
   
    MOV DX, 120Ah ; Row 18
    CALL GOTO_XY
    LEA DX, msg_goodbye
    CALL PRINT_STRING
   
    ; Wait for a key press
    MOV AH, 00h
    INT 16h
   
    JMP START_SCREEN ; <-- CHANGED (Goes to PIN entry)
 
; -----------------------------------------------------------------
;  END OF PROGRAM
; -----------------------------------------------------------------
END_PROGRAM:
    ; Restore default text mode before exiting
    MOV AX, 0003h
    INT 10h
    ; Terminate
    MOV AH, 4Ch
    INT 21h
MAIN ENDP
 
; =================================================================
;  PROCEDURES
; =================================================================
 
; --- Displays the common screen header ---
DISPLAY_HEADER PROC
    PUSH AX
    PUSH DX
 
    ; 'CIT-U BANK' at Row 1, Col 10
    MOV DX, 010Ah  
    CALL GOTO_XY
    LEA DX, header1
    CALL PRINT_STRING
 
    ; 'Automatic Teller Machine' at Row 2, Col 10
    MOV DX, 020Ah  
    CALL GOTO_XY
    LEA DX, header2
    CALL PRINT_STRING
   
    ; 'Copyright 2025' at Row 3, Col 10
    MOV DX, 030Ah  
    CALL GOTO_XY
    LEA DX, header3
    CALL PRINT_STRING
   
    ; 'Programmer: ...' at Row 4, Col 10
    MOV DX, 040Ah  
    CALL GOTO_XY
    LEA DX, header4
    CALL PRINT_STRING
   
    ; 'Welcome!' at Row 6, Col 10
    MOV DX, 060Ah  
    CALL GOTO_XY
    LEA DX, header5
    CALL PRINT_STRING
   
    POP DX
    POP AX
    RET
DISPLAY_HEADER ENDP
 
; --- Clears the entire screen with Yellow on Red attribute ---
CLEAR_SCREEN PROC
    MOV AX, 0600h   ; Scroll window up (06h), clear entire (AL=00h)
    MOV BH, 4Eh     ; Attribute: Yellow(E) on Red(4)
    MOV CX, 0000    ; Top-left corner (0,0)
    MOV DX, 184Fh   ; Bottom-right corner (24,79)
    INT 10h
   
    ; Reset cursor to top-left
    MOV DX, 0000
    CALL GOTO_XY
    RET
CLEAR_SCREEN ENDP
 
; --- Clears screen from a specific row to the bottom ---
CLEAR_FROM_LINE PROC
    ; Input: DH = Start Row
    PUSH AX
    PUSH BX
    PUSH CX
    PUSH DX
   
    MOV AX, 0600h   ; Scroll window up
    MOV BH, 4Eh     ; Attribute: Yellow on Red
    MOV CH, DH      ; Start Row (from input DH)
    MOV CL, 0       ; Start Col
    MOV DH, 18h     ; End Row (24)
    MOV DL, 4Fh     ; End Col (79)
    INT 10h
   
    POP DX
    POP CX
    POP BX
    POP AX
    RET
CLEAR_FROM_LINE ENDP
 
; --- Moves cursor to position (DH=Row, DL=Col) ---
GOTO_XY PROC
    PUSH AX
    PUSH BX
    MOV AH, 02h     ; Set cursor position
    MOV BH, 0       ; Page 0
    INT 10h
    POP BX
    POP AX
    RET
GOTO_XY ENDP
 
; --- Prints a $-terminated string ---
; Input: DX = offset of string
PRINT_STRING PROC
    PUSH AX
    MOV AH, 09h
    INT 21h
    POP AX
    RET
PRINT_STRING ENDP
 
; --- Reads a single character with echo ---
; Output: AL = character
READ_CHAR PROC
    PUSH DX
    MOV AH, 01h
    INT 21h
    POP DX
    RET
READ_CHAR ENDP
 
; --- Reads 4 characters for the PIN ---
READ_PIN PROC
    PUSH CX
    PUSH DI
   
    LEA DI, pin_input
    MOV CX, 5       ; Read 5 digits
   
    READ_PIN_LOOP:
        CALL READ_CHAR
        MOV [DI], AL
        INC DI
        DEC CX
        JNZ READ_PIN_LOOP
   
    POP DI
    POP CX
    RET
READ_PIN ENDP
 
; --- Checks pin_input against correct_pin ---
; Output: CX = 1 if match, 0 if no match
CHECK_PIN PROC
    PUSH SI
    PUSH DI
    PUSH AX
    PUSH BX
   
    MOV CX, 1       ; Assume match
    LEA SI, correct_pin
    LEA DI, pin_input
    MOV BX, 5       ; Length of PIN
   
    PIN_CHECK_LOOP:
        MOV AL, [SI]
        CMP AL, [DI]
        JNE PIN_MISMATCH
       
        INC SI
        INC DI
        DEC BX
        JNZ PIN_CHECK_LOOP
        JMP PIN_END ; Match found
       
    PIN_MISMATCH:
        MOV CX, 0   ; Set to 0 (no match)
   
    PIN_END:
    POP BX
    POP AX
    POP DI
    POP SI
    RET
CHECK_PIN ENDP
 
; --- A simple delay loop ---
PAUSE_TEMP PROC
    PUSH CX
    PUSH DX
   
    MOV CX, 05h  ; Outer loop
    DELAY_OUTER:
        MOV DX, 0FFFFh ; Inner loop
        DELAY_INNER:
            DEC DX
            JNZ DELAY_INNER
        DEC CX
        JNZ DELAY_OUTER
       
    POP DX
    POP CX
    RET
PAUSE_TEMP ENDP
 
END MAIN