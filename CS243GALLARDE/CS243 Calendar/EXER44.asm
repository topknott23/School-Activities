.MODEL SMALL
.STACK 100h
.DATA
    ; Title and programmer info
    title1 DB '2025 Calendar$'
    programmer DB 'Programmer: GALLARDE, JOEL THEO C.$'
    dateFinished DB 'Date Finished: OCTOBER 26, 2025$'
    
    ; Menu strings
    menuTitle DB 'Main Menu$'
    menu1 DB 0BAh,' 1 January     5 May         9 September ',0BAh,'$'
    menu2 DB 0BAh,' 2 February    6 June       10 October   ',0BAh,'$'
    menu3 DB 0BAh,' 3 March       7 July       11 November  ',0BAh,'$'
    menu4 DB 0BAh,' 4 April       8 August     12 December  ',0BAh,'$'
    enterChoice DB 'Enter choice: $'
    
    ; Prompt strings
    againPrompt DB 'Again? Y/N: $'
    invalidMsg DB 'INVALID ENTRY!$'
    thankYouMsg DB 'Thank you. Come back soon.$'
    
    ; Month names
    janName DB 'January 2025$'
    febName DB 'February 2025$'
    marName DB 'March 2025$'
    aprName DB 'April 2025$'
    mayName DB 'May 2025$'
    junName DB 'June 2025$'
    julName DB 'July 2025$'
    augName DB 'August 2025$'
    sepName DB 'September 2025$'
    octName DB 'October 2025$'
    novName DB 'November 2025$'
    decName DB 'December 2025$'

    ; Day headers
    dayHeader DB ' S  M  T  W  T  F  S ', '$'
    
    ; Month data
    jan_start DB 3
    jan_days DB 31
    feb_start DB 6
    feb_days DB 28
    mar_start DB 6
    mar_days DB 31
    apr_start DB 2
    apr_days DB 30
    may_start DB 4
    may_days DB 31
    jun_start DB 0
    jun_days DB 30
    jul_start DB 2
    jul_days DB 31
    aug_start DB 5
    aug_days DB 31
    sep_start DB 1
    sep_days DB 30
    oct_start DB 3
    oct_days DB 31
    nov_start DB 6
    nov_days DB 30
    dec_start DB 1
    dec_days DB 31
    
    ; Variables
    inputBuffer DB 4, 0, 4 DUP('$')
    choice DB ?
    startDay DB ?
    numDays DB ?
    currentDay DB ?
    currentCol DB ?
    monthNum DB ?
    textAttr DB ?
    
.CODE
MAIN PROC
    MOV AX, @DATA
    MOV DS, AX
    
MAIN_LOOP:
    CALL CLEAR_SCREEN
    CALL DISPLAY_MENU
    CALL GET_CHOICE_INPUT
    
  
    MOV SI, OFFSET inputBuffer
    INC SI  
    MOV CL, [SI] 
    MOV CH, 0
    

    CMP CL, 0
    JNE CHECK_LENGTH
    JMP INVALID_INPUT
    
CHECK_LENGTH:
    INC SI  
    MOV AL, [SI]  
    
    
    CMP CL, 1
    JNE CHECK_TWO_DIGIT_LEN
    
  
    CMP AL, '1'
    JB INVALID_INPUT
    CMP AL, '9'
    JA INVALID_INPUT
    
    ; Valid single digit
    SUB AL, '1'
    MOV monthNum, AL
    JMP DISPLAY_CALENDAR
    
CHECK_TWO_DIGIT_LEN:
    ; Check if length is 2
    CMP CL, 2
    JNE INVALID_INPUT
    
    ; Must start with '1'
    CMP AL, '1'
    JNE INVALID_INPUT
    
    ; Check second digit
    INC SI
    MOV AL, [SI]
    
    CMP AL, '0'
    JNE CHECK_11
    ; It's 10
    MOV monthNum, 9
    JMP DISPLAY_CALENDAR
    
CHECK_11:
    CMP AL, '1'
    JNE CHECK_12
    ; It's 11
    MOV monthNum, 10
    JMP DISPLAY_CALENDAR
    
CHECK_12:
    CMP AL, '2'
    JNE INVALID_INPUT
    ; It's 12
    MOV monthNum, 11
    JMP DISPLAY_CALENDAR
    
DISPLAY_CALENDAR:
    ;CALL CLEAR_SCREEN
    CALL SHOW_MONTH
    JMP ASK_AGAIN
    
INVALID_INPUT:
    CALL NEW_LINE
    ;MOV AH, 09h
    ;LEA DX, invalidMsg
    ;INT 21h
    mov dx, offset invalidMsg
    call DISPLAY_ERROR
    
ASK_AGAIN:
    CALL NEW_LINE
    MOV AH, 09h
    LEA DX, againPrompt
    INT 21h
    
    MOV AH, 01h
    INT 21h
    
    CMP AL, 'Y'
    JNE CHECK_LOWER_Y
    JMP MAIN_LOOP
    
CHECK_LOWER_Y:
    CMP AL, 'y'
    JNE CHECK_N
    JMP MAIN_LOOP
    
CHECK_N:
    CMP AL, 'N'
    JNE CHECK_LOWER_N
    JMP EXIT_PROGRAM
    
CHECK_LOWER_N:
    CMP AL, 'n'
    JNE INVALID_AGAIN
    JMP EXIT_PROGRAM
    
INVALID_AGAIN:
    CALL NEW_LINE
    ;MOV AH, 09h
    ;LEA DX, invalidMsg
    ;INT 21h
    
    mov dx, offset invalidMsg
    call DISPLAY_ERROR
    JMP ASK_AGAIN
    
EXIT_PROGRAM:
    CALL NEW_LINE
    MOV AH, 09h
    LEA DX, thankYouMsg
    INT 21h
    
    MOV AH, 4Ch
    INT 21h
MAIN ENDP

DISPLAY_ERROR proc
    CALL CHECK_SCREEN_LIMIT
    mov si, dx
    mov bl, 0CEh          ; Blinking yellow text on yellow background

ERROR_LOOP:
    lodsb                 ; Load character from [SI] into AL, increment SI
    cmp al, '$'           ; Check for end of string
    je ERROR_DONE
    
    mov ah, 09h           ; Write character with attribute
    mov bh, 0             ; Page number
    mov cx, 1             ; Write 1 character
    int 10h
    
    ; Move cursor forward
    mov ah, 03h           ; Get cursor position
    int 10h
    inc dl                ; Move column right
    mov ah, 02h           ; Set cursor position
    int 10h
    
    jmp ERROR_LOOP

ERROR_DONE:
    ret
DISPLAY_ERROR endp
CHECK_SCREEN_LIMIT PROC
    PUSH AX
    PUSH BX
    PUSH DX

    MOV AH, 03h
    MOV BH, 0
    INT 10h       ; get cursor pos -> DH=row, DL=col

    CMP DH, 24    ; last row = 24
    JB OK
    CALL CLEAR_SCREEN

OK:
    POP DX
    POP BX
    POP AX
    RET
CHECK_SCREEN_LIMIT ENDP
CLEAR_SCREEN PROC
    MOV AH, 06h
    MOV AL, 0
    MOV BH, 07h
    MOV CX, 0
    MOV DX, 184Fh
    INT 10h
    
    MOV AH, 02h
    MOV BH, 0
    MOV DX, 0
    INT 10h
    RET
CLEAR_SCREEN ENDP
DISPLAY_TOP PROC
    push ax
    push cx
    push dx

    mov ah, 02h
    mov dl, 0C9h       ; ╔
    int 21h

    mov dl, 0CDh       ; ═
    mov cl, 41         ; length of top border
top_loop:
    int 21h
    loop top_loop

    mov dl, 0BBh       ; ╗
    int 21h

    ; newline
    mov dl, 13
    int 21h
    mov dl, 10
    int 21h

    pop dx
    pop cx
    pop ax
    ret
DISPLAY_TOP ENDP
DISPLAY_BOT PROC
    push ax
    push cx
    push dx

    ; print bottom-left corner ╚ (0C8h)
    mov ah, 02h
    mov dl, 0C8h
    int 21h

    ; print horizontal lines ═ (0CDh)
    mov dl, 0CDh
    mov cl, 41          ; number of lines to match top border
bot_loop:
    int 21h
    loop bot_loop

    ; print bottom-right corner ╝ (0BCh)
    mov dl, 0BCh
    int 21h

    ; newline (CR + LF)
    mov dl, 13
    int 21h
    mov dl, 10
    int 21h

    pop dx
    pop cx
    pop ax
    ret
DISPLAY_BOT ENDP

DISPLAY_MENU PROC
    ;CALL PRINT_UPPER_BORDER
    MOV AH, 09h
    LEA DX, title1
    INT 21h
    CALL NEW_LINE
    
    MOV AH, 09h
    LEA DX, programmer
    INT 21h
    CALL NEW_LINE
    
    MOV AH, 09h
    LEA DX, dateFinished
    INT 21h
    CALL NEW_LINE
    
    MOV AH, 09h
    LEA DX, menuTitle
    INT 21h
    CALL NEW_LINE

    CALL DISPLAY_TOP

    MOV AH, 09h
    LEA DX, menu1
    INT 21h
    CALL NEW_LINE
    
    MOV AH, 09h
    LEA DX, menu2
    INT 21h
    CALL NEW_LINE
    
    MOV AH, 09h
    LEA DX, menu3
    INT 21h
    CALL NEW_LINE
    
    MOV AH, 09h
    LEA DX, menu4
    INT 21h
    CALL NEW_LINE

    CALL DISPLAY_BOT

    MOV AH, 09h
    LEA DX, enterChoice
    INT 21h
    RET
DISPLAY_MENU ENDP

GET_CHOICE_INPUT PROC
    MOV AH, 0Ah
    LEA DX, inputBuffer
    INT 21h
    RET
GET_CHOICE_INPUT ENDP

PRINT_CHAR_COLOR PROC
    ; Prints character in DL with color in textAttr
    ; Preserves all registers
    PUSH AX
    PUSH BX
    PUSH CX
    
    MOV AH, 09h
    MOV AL, DL
    MOV BH, 0
    MOV BL, textAttr
    MOV CX, 1
    INT 10h
    
    ; Move cursor forward
    MOV AH, 03h
    MOV BH, 0
    INT 10h
    
    INC DL
    MOV AH, 02h
    INT 10h
    
    POP CX
    POP BX
    POP AX
    RET
PRINT_CHAR_COLOR ENDP

PRINT_STRING_COLOR PROC
    ; Prints string at DX with color in textAttr
    PUSH SI
    PUSH AX
    
    MOV SI, DX
PRINT_LOOP:
    MOV AL, [SI]
    CMP AL, '$'
    JE PRINT_DONE
    
    MOV DL, AL
    CALL PRINT_CHAR_COLOR
    INC SI
    JMP PRINT_LOOP
    
PRINT_DONE:
    POP AX
    POP SI
    RET
PRINT_STRING_COLOR ENDP

SHOW_MONTH PROC
    CALL NEW_LINE
    MOV AL, monthNum
    
    ; Set text attribute based on month
    CMP AL, 0
    JNE SET_FEB_COLOR
    MOV textAttr, 1Fh  ; January: White on Blue
    JMP COLOR_SET
    
SET_FEB_COLOR:
    CMP AL, 1
    JNE SET_MAR_COLOR
    MOV textAttr, 2Fh  ; February: White on Green
    JMP COLOR_SET
    
SET_MAR_COLOR:
    CMP AL, 2
    JNE SET_APR_COLOR
    MOV textAttr, 30h  ; March: Black on Cyan
    JMP COLOR_SET
    
SET_APR_COLOR:
    CMP AL, 3
    JNE SET_MAY_COLOR
    MOV textAttr, 4Fh  ; April: White on Red
    JMP COLOR_SET
    
SET_MAY_COLOR:
    CMP AL, 4
    JNE SET_JUN_COLOR
    MOV textAttr, 5Fh  ; May: White on Magenta
    JMP COLOR_SET
    
SET_JUN_COLOR:
    CMP AL, 5
    JNE SET_JUL_COLOR
    MOV textAttr, 6Fh  ; June: White on Brown
    JMP COLOR_SET
    
SET_JUL_COLOR:
    CMP AL, 6
    JNE SET_AUG_COLOR
    MOV textAttr, 70h  ; July: Black on Light Gray
    JMP COLOR_SET
    
SET_AUG_COLOR:
    CMP AL, 7
    JNE SET_SEP_COLOR
    MOV textAttr, 2Fh  ; August: White on Green
    JMP COLOR_SET
    
SET_SEP_COLOR:
    CMP AL, 8
    JNE SET_OCT_COLOR
    MOV textAttr, 30h  ; September: Black on Light Blue
    JMP COLOR_SET
    
SET_OCT_COLOR:
    CMP AL, 9
    JNE SET_NOV_COLOR
    MOV textAttr, 1Fh  ; October: White on Blue
    JMP COLOR_SET
    
SET_NOV_COLOR:
    CMP AL, 10
    JNE SET_DEC_COLOR
    MOV textAttr, 6Fh  ; November: White on Orange
    JMP COLOR_SET
    
SET_DEC_COLOR:
    MOV textAttr, 4Fh  ; December: White on Red
    
COLOR_SET:
    ; Get month info first
    MOV BL, monthNum
    CMP BL, 0
    JNE TRY_FEB
    LEA DX, janName
    MOV AL, jan_start
    MOV startDay, AL
    MOV AL, jan_days
    MOV numDays, AL
    JMP PRINT_MONTH_NAME
    
TRY_FEB:
    CMP BL, 1
    JNE TRY_MAR
    LEA DX, febName
    MOV AL, feb_start
    MOV startDay, AL
    MOV AL, feb_days
    MOV numDays, AL
    JMP PRINT_MONTH_NAME
    
TRY_MAR:
    CMP BL, 2
    JNE TRY_APR
    LEA DX, marName
    MOV AL, mar_start
    MOV startDay, AL
    MOV AL, mar_days
    MOV numDays, AL
    JMP PRINT_MONTH_NAME
    
TRY_APR:
    CMP BL, 3
    JNE TRY_MAY
    LEA DX, aprName
    MOV AL, apr_start
    MOV startDay, AL
    MOV AL, apr_days
    MOV numDays, AL
    JMP PRINT_MONTH_NAME
    
TRY_MAY:
    CMP BL, 4
    JNE TRY_JUN
    LEA DX, mayName
    MOV AL, may_start
    MOV startDay, AL
    MOV AL, may_days
    MOV numDays, AL
    JMP PRINT_MONTH_NAME
    
TRY_JUN:
    CMP BL, 5
    JNE TRY_JUL
    LEA DX, junName
    MOV AL, jun_start
    MOV startDay, AL
    MOV AL, jun_days
    MOV numDays, AL
    JMP PRINT_MONTH_NAME
    
TRY_JUL:
    CMP BL, 6
    JNE TRY_AUG
    LEA DX, julName
    MOV AL, jul_start
    MOV startDay, AL
    MOV AL, jul_days
    MOV numDays, AL
    JMP PRINT_MONTH_NAME
    
TRY_AUG:
    CMP BL, 7
    JNE TRY_SEP
    LEA DX, augName
    MOV AL, aug_start
    MOV startDay, AL
    MOV AL, aug_days
    MOV numDays, AL
    JMP PRINT_MONTH_NAME
    
TRY_SEP:
    CMP BL, 8
    JNE TRY_OCT
    LEA DX, sepName
    MOV AL, sep_start
    MOV startDay, AL
    MOV AL, sep_days
    MOV numDays, AL
    JMP PRINT_MONTH_NAME
    
TRY_OCT:
    CMP BL, 9
    JNE TRY_NOV
    LEA DX, octName
    MOV AL, oct_start
    MOV startDay, AL
    MOV AL, oct_days
    MOV numDays, AL
    JMP PRINT_MONTH_NAME
    
TRY_NOV:
    CMP BL, 10
    JNE TRY_DEC
    LEA DX, novName
    MOV AL, nov_start
    MOV startDay, AL
    MOV AL, nov_days
    MOV numDays, AL
    JMP PRINT_MONTH_NAME
    
TRY_DEC:
    LEA DX, decName
    MOV AL, dec_start
    MOV startDay, AL
    MOV AL, dec_days
    MOV numDays, AL
    
PRINT_MONTH_NAME:
    ; Print month name as normal text (no border, no color)
    PUSH DX
    MOV AH, 09h
    INT 21h
    CALL NEW_LINE
    POP DX
    
    ; Now print top border
    MOV DL, 0C9h  ; ╔
    CALL PRINT_CHAR_COLOR
    
    MOV CX, 21
PRINT_TOP_BORDER:
    PUSH CX
    MOV DL, 0CDh  ; ═
    CALL PRINT_CHAR_COLOR
    POP CX
    LOOP PRINT_TOP_BORDER
    
    MOV DL, 0BBh  ; ╗
    CALL PRINT_CHAR_COLOR
    CALL NEW_LINE
    
    ; Print day header
    MOV DL, 0BAh  ; ║
    CALL PRINT_CHAR_COLOR
    
    LEA DX, dayHeader
    CALL PRINT_STRING_COLOR
    
    MOV DL, 0BAh  ; ║
    CALL PRINT_CHAR_COLOR
    CALL NEW_LINE
    
    ; Print separator
    MOV DL, 0CCh  ; ╠
    CALL PRINT_CHAR_COLOR
    
    MOV CX, 21
PRINT_SEP2:
    PUSH CX
    MOV DL, 0CDh  ; ═
    CALL PRINT_CHAR_COLOR
    POP CX
    LOOP PRINT_SEP2
    
    MOV DL, 0B9h  ; ╣
    CALL PRINT_CHAR_COLOR
    CALL NEW_LINE
    
    ; Start printing days
    MOV DL, 0BAh  ; ║
    CALL PRINT_CHAR_COLOR
    
    ; Print leading spaces
    MOV CL, startDay
    MOV CH, 0
    CMP CL, 0
    JE START_DAYS
    
PRINT_SPACES:
    PUSH CX
    MOV DL, ' '
    CALL PRINT_CHAR_COLOR
    MOV DL, ' '
    CALL PRINT_CHAR_COLOR
    MOV DL, ' '
    CALL PRINT_CHAR_COLOR
    POP CX
    LOOP PRINT_SPACES
    
START_DAYS:
    MOV AL, startDay
    MOV currentCol, AL
    MOV currentDay, 1
    
PRINT_DAYS:
    MOV AL, currentDay
    CMP AL, numDays
    JA FINISH_LAST_LINE
    
    ; Print day number
    MOV AL, currentDay
    MOV AH, 0
    MOV BL, 10
    DIV BL
    
    ; AL = tens, AH = ones
    CMP AL, 0
    JE SINGLE_DIGIT
    
    ; Two digits
    ADD AL, '0'
    MOV DL, AL
    CALL PRINT_CHAR_COLOR
    
    MOV AL, AH
    ADD AL, '0'
    MOV DL, AL
    CALL PRINT_CHAR_COLOR
    JMP AFTER_PRINT
    
SINGLE_DIGIT:
    MOV DL, ' '
    CALL PRINT_CHAR_COLOR
    
    MOV AL, AH
    ADD AL, '0'
    MOV DL, AL
    CALL PRINT_CHAR_COLOR
    
AFTER_PRINT:
    INC currentDay
    INC currentCol
    
    MOV AL, currentCol
    CMP AL, 7
    JNE SAME_LINE
    
    ; End of week
    MOV DL, ' '  ; SPACE
    CALL PRINT_CHAR_COLOR
    MOV DL, 0BAh  ; ║
    CALL PRINT_CHAR_COLOR
    CALL NEW_LINE
    
    MOV AL, currentDay
    CMP AL, numDays
    JA DONE_MONTH
    
    ; Next line
    MOV DL, 0BAh  ; ║
    CALL PRINT_CHAR_COLOR
    
    MOV currentCol, 0
    JMP PRINT_DAYS
    
SAME_LINE:
    MOV DL, ' '
    CALL PRINT_CHAR_COLOR
    JMP PRINT_DAYS

FINISH_LAST_LINE:
    MOV AL, currentCol
    CMP AL, 0
    JE DONE_MONTH
    
FILL_SPACES:
    CMP AL, 7
    JE END_LAST_LINE
    
    PUSH AX
    MOV DL, ' '
    CALL PRINT_CHAR_COLOR
    MOV DL, ' '
    CALL PRINT_CHAR_COLOR
    MOV DL, ' '
    CALL PRINT_CHAR_COLOR
    POP AX
    INC AL
    JMP FILL_SPACES
    
END_LAST_LINE:
    MOV DL, 0BAh  ; ║
    CALL PRINT_CHAR_COLOR
    CALL NEW_LINE
    
DONE_MONTH:
    ; Print bottom border
    MOV DL, 0C8h  ; ╚
    CALL PRINT_CHAR_COLOR
    
    MOV CX, 21
PRINT_BOTTOM:
    PUSH CX
    MOV DL, 0CDh  ; ═
    CALL PRINT_CHAR_COLOR
    POP CX
    LOOP PRINT_BOTTOM
    
    MOV DL, 0BCh  ; ╝
    CALL PRINT_CHAR_COLOR
    
    RET
SHOW_MONTH ENDP

NEW_LINE PROC
    MOV AH, 02h
    MOV DL, 0Dh
    INT 21h
    MOV DL, 0Ah
    INT 21h
    RET
NEW_LINE ENDP

END MAIN
    
    ; Month data
    jan_start DB 3
    jan_days DB 31
    feb_start DB 6
    feb_days DB 28
    mar_start DB 6
    mar_days DB 31
    apr_start DB 2
    apr_days DB 30
    may_start DB 4
    may_days DB 31
    jun_start DB 0
    jun_days DB 30
    jul_start DB 2
    jul_days DB 31
    aug_start DB 5
    aug_days DB 31
    sep_start DB 1
    sep_days DB 30
    oct_start DB 3
    oct_days DB 31
    nov_start DB 6
    nov_days DB 30
    dec_start DB 1
    dec_days DB 31
    
    ; Variables
    inputBuffer DB 4, 0, 4 DUP('$')
    choice DB ?
    startDay DB ?
    numDays DB ?
    currentDay DB ?
    currentCol DB ?
    monthNum DB ?
    textAttr DB ?
    
.CODE
MAIN PROC
    MOV AX, @DATA
    MOV DS, AX
    
MAIN_LOOP:
    CALL CLEAR_SCREEN
    CALL DISPLAY_MENU
    CALL GET_CHOICE_INPUT
    
    ; Parse the input
    MOV SI, OFFSET inputBuffer
    INC SI  ; Point to actual length entered
    MOV CL, [SI]  ; Get length of input
    MOV CH, 0
    
    ; Check if length is 0
    CMP CL, 0
    JNE CHECK_LENGTH
    JMP INVALID_INPUT
    
CHECK_LENGTH:
    INC SI  ; Point to first character
    MOV AL, [SI]  ; First character
    
    ; Check if length is 1 (single digit)
    CMP CL, 1
    JNE CHECK_TWO_DIGIT_LEN
    
    ; Single digit - must be 1-9
    CMP AL, '1'
    JB INVALID_INPUT
    CMP AL, '9'
    JA INVALID_INPUT
    
    ; Valid single digit
    SUB AL, '1'
    MOV monthNum, AL
    JMP DISPLAY_CALENDAR
    
CHECK_TWO_DIGIT_LEN:
    ; Check if length is 2
    CMP CL, 2
    JNE INVALID_INPUT
    
    ; Must start with '1'
    CMP AL, '1'
    JNE INVALID_INPUT
    
    ; Check second digit
    INC SI
    MOV AL, [SI]
    
    CMP AL, '0'
    JNE CHECK_11
    ; It's 10
    MOV monthNum, 9
    JMP DISPLAY_CALENDAR
    
CHECK_11:
    CMP AL, '1'
    JNE CHECK_12
    ; It's 11
    MOV monthNum, 10
    JMP DISPLAY_CALENDAR
    
CHECK_12:
    CMP AL, '2'
    JNE INVALID_INPUT
    ; It's 12
    MOV monthNum, 11
    JMP DISPLAY_CALENDAR
    
DISPLAY_CALENDAR:
    ;CALL CLEAR_SCREEN
    CALL SHOW_MONTH
    JMP ASK_AGAIN
    
INVALID_INPUT:
    ;CALL CLEAR_SCREEN
    ;MOV AH, 09h
    ;LEA DX, invalidMsg
    ;INT 21h
    ;CALL NEW_LINE

    mov ah, 09h
    mov dx, invalidMsg
    int 21h
    
    mov dx, offset invalidMsg
    call DISPLAY_ERROR
    
    CALL NEW_LINE
    
    
ASK_AGAIN:
    CALL NEW_LINE
    MOV AH, 09h
    LEA DX, againPrompt
    INT 21h
    
    MOV AH, 01h
    INT 21h
    
    CMP AL, 'Y'
    JNE CHECK_LOWER_Y
    JMP MAIN_LOOP
    
CHECK_LOWER_Y:
    CMP AL, 'y'
    JNE CHECK_N
    JMP MAIN_LOOP
    
CHECK_N:
    CMP AL, 'N'
    JNE CHECK_LOWER_N
    JMP EXIT_PROGRAM
    
CHECK_LOWER_N:
    CMP AL, 'n'
    JNE INVALID_AGAIN
    JMP EXIT_PROGRAM
    
INVALID_AGAIN:
    MOV AH, 09h
    LEA DX, invalidMsg
    INT 21h
    JMP ASK_AGAIN
    
EXIT_PROGRAM:
    CALL NEW_LINE
    MOV AH, 09h
    LEA DX, thankYouMsg
    INT 21h
    
    MOV AH, 4Ch
    INT 21h
MAIN ENDP

CLEAR_SCREEN PROC
    MOV AH, 06h
    MOV AL, 0
    MOV BH, 07h
    MOV CX, 0
    MOV DX, 184Fh
    INT 10h
    
    MOV AH, 02h
    MOV BH, 0
    MOV DX, 0
    INT 10h
    RET
CLEAR_SCREEN ENDP

DISPLAY_MENU PROC

    MOV AH, 09h
    LEA DX, title1
    INT 21h
    CALL NEW_LINE
    
    MOV AH, 09h
    LEA DX, programmer
    INT 21h
    CALL NEW_LINE
    
    MOV AH, 09h
    LEA DX, dateFinished
    INT 21h
    CALL NEW_LINE
    CALL NEW_LINE
    
    MOV AH, 09h
    LEA DX, menuTitle
    INT 21h
    CALL NEW_LINE
    
    MOV AH, 09h
    LEA DX, menu1
    INT 21h
    CALL NEW_LINE
    
    MOV AH, 09h
    LEA DX, menu2
    INT 21h
    CALL NEW_LINE
    
    MOV AH, 09h
    LEA DX, menu3
    INT 21h
    CALL NEW_LINE
    
    MOV AH, 09h
    LEA DX, menu4
    INT 21h
    CALL NEW_LINE
    CALL NEW_LINE
    
    MOV AH, 09h
    LEA DX, enterChoice
    INT 21h
    RET
DISPLAY_MENU ENDP

GET_CHOICE_INPUT PROC
    MOV AH, 0Ah
    LEA DX, inputBuffer
    INT 21h
    RET
GET_CHOICE_INPUT ENDP

PRINT_CHAR_COLOR PROC
    ; Prints character in DL with color in textAttr
    ; Preserves all registers
    PUSH AX
    PUSH BX
    PUSH CX
    
    MOV AH, 09h
    MOV AL, DL
    MOV BH, 0
    MOV BL, textAttr
    MOV CX, 1
    INT 10h
    
    ; Move cursor forward
    MOV AH, 03h
    MOV BH, 0
    INT 10h
    
    INC DL
    MOV AH, 02h
    INT 10h
    
    POP CX
    POP BX
    POP AX
    RET
PRINT_CHAR_COLOR ENDP

PRINT_STRING_COLOR PROC
    ; Prints string at DX with color in textAttr
    PUSH SI
    PUSH AX
    
    MOV SI, DX
PRINT_LOOP:
    MOV AL, [SI]
    CMP AL, '$'
    JE PRINT_DONE
    
    MOV DL, AL
    CALL PRINT_CHAR_COLOR
    INC SI
    JMP PRINT_LOOP
    
PRINT_DONE:
    POP AX
    POP SI
    RET
PRINT_STRING_COLOR ENDP

SHOW_MONTH PROC
    MOV AL, monthNum
    
    ; Set text attribute based on month
    CMP AL, 0
    JNE SET_FEB_COLOR
    MOV textAttr, 1Fh  ; January: White on Blue
    JMP COLOR_SET
    
SET_FEB_COLOR:
    CMP AL, 1
    JNE SET_MAR_COLOR
    MOV textAttr, 2Fh  ; February: White on Green
    JMP COLOR_SET
    
SET_MAR_COLOR:
    CMP AL, 2
    JNE SET_APR_COLOR
    MOV textAttr, 30h  ; March: Black on Cyan
    JMP COLOR_SET
    
SET_APR_COLOR:
    CMP AL, 3
    JNE SET_MAY_COLOR
    MOV textAttr, 4Fh  ; April: White on Red
    JMP COLOR_SET
    
SET_MAY_COLOR:
    CMP AL, 4
    JNE SET_JUN_COLOR
    MOV textAttr, 5Fh  ; May: White on Magenta
    JMP COLOR_SET
    
SET_JUN_COLOR:
    CMP AL, 5
    JNE SET_JUL_COLOR
    MOV textAttr, 6Fh  ; June: White on Brown
    JMP COLOR_SET
    
SET_JUL_COLOR:
    CMP AL, 6
    JNE SET_AUG_COLOR
    MOV textAttr, 70h  ; July: Black on Light Gray
    JMP COLOR_SET
    
SET_AUG_COLOR:
    CMP AL, 7
    JNE SET_SEP_COLOR
    MOV textAttr, 8Fh  ; August: White on Dark Gray
    JMP COLOR_SET
    
SET_SEP_COLOR:
    CMP AL, 8
    JNE SET_OCT_COLOR
    MOV textAttr, 90h  ; September: Black on Light Blue
    JMP COLOR_SET
    
SET_OCT_COLOR:
    CMP AL, 9
    JNE SET_NOV_COLOR
    MOV textAttr, 0A0h  ; October: Black on Light Green
    JMP COLOR_SET
    
SET_NOV_COLOR:
    CMP AL, 10
    JNE SET_DEC_COLOR
    MOV textAttr, 0B0h  ; November: Black on Light Cyan
    JMP COLOR_SET
    
SET_DEC_COLOR:
    MOV textAttr, 0C0h  ; December: Black on Light Red
    
COLOR_SET:
    ; Print top border (23 chars for "S  M  T  W  T  F  S" + 2 spaces + 2 borders = 27 total)
    MOV DL, 0C9h  ; ╔
    CALL PRINT_CHAR_COLOR
    
    MOV CX, 23
PRINT_TOP_BORDER:
    PUSH CX
    MOV DL, 0CDh  ; ═
    CALL PRINT_CHAR_COLOR
    POP CX
    LOOP PRINT_TOP_BORDER
    
    MOV DL, 0BBh  ; ╗
    CALL PRINT_CHAR_COLOR
    CALL NEW_LINE
    
    ; Print left border for month name line
    MOV DL, 0BAh  ; ║
    CALL PRINT_CHAR_COLOR
    
    ; Get month info
    MOV BL, monthNum
    CMP BL, 0
    JNE TRY_FEB
    LEA DX, janName
    MOV AL, jan_start
    MOV startDay, AL
    MOV AL, jan_days
    MOV numDays, AL
    JMP PRINT_MONTH_NAME
    
TRY_FEB:
    CMP BL, 1
    JNE TRY_MAR
    LEA DX, febName
    MOV AL, feb_start
    MOV startDay, AL
    MOV AL, feb_days
    MOV numDays, AL
    JMP PRINT_MONTH_NAME
    
TRY_MAR:
    CMP BL, 2
    JNE TRY_APR
    LEA DX, marName
    MOV AL, mar_start
    MOV startDay, AL
    MOV AL, mar_days
    MOV numDays, AL
    JMP PRINT_MONTH_NAME
    
TRY_APR:
    CMP BL, 3
    JNE TRY_MAY
    LEA DX, aprName
    MOV AL, apr_start
    MOV startDay, AL
    MOV AL, apr_days
    MOV numDays, AL
    JMP PRINT_MONTH_NAME
    
TRY_MAY:
    CMP BL, 4
    JNE TRY_JUN
    LEA DX, mayName
    MOV AL, may_start
    MOV startDay, AL
    MOV AL, may_days
    MOV numDays, AL
    JMP PRINT_MONTH_NAME
    
TRY_JUN:
    CMP BL, 5
    JNE TRY_JUL
    LEA DX, junName
    MOV AL, jun_start
    MOV startDay, AL
    MOV AL, jun_days
    MOV numDays, AL
    JMP PRINT_MONTH_NAME
    
TRY_JUL:
    CMP BL, 6
    JNE TRY_AUG
    LEA DX, julName
    MOV AL, jul_start
    MOV startDay, AL
    MOV AL, jul_days
    MOV numDays, AL
    JMP PRINT_MONTH_NAME
    
TRY_AUG:
    CMP BL, 7
    JNE TRY_SEP
    LEA DX, augName
    MOV AL, aug_start
    MOV startDay, AL
    MOV AL, aug_days
    MOV numDays, AL
    JMP PRINT_MONTH_NAME
    
TRY_SEP:
    CMP BL, 8
    JNE TRY_OCT
    LEA DX, sepName
    MOV AL, sep_start
    MOV startDay, AL
    MOV AL, sep_days
    MOV numDays, AL
    JMP PRINT_MONTH_NAME
    
TRY_OCT:
    CMP BL, 9
    JNE TRY_NOV
    LEA DX, octName
    MOV AL, oct_start
    MOV startDay, AL
    MOV AL, oct_days
    MOV numDays, AL
    JMP PRINT_MONTH_NAME
    
TRY_NOV:
    CMP BL, 10
    JNE TRY_DEC
    LEA DX, novName
    MOV AL, nov_start
    MOV startDay, AL
    MOV AL, nov_days
    MOV numDays, AL
    JMP PRINT_MONTH_NAME
    
TRY_DEC:
    LEA DX, decName
    MOV AL, dec_start
    MOV startDay, AL
    MOV AL, dec_days
    MOV numDays, AL
    
PRINT_MONTH_NAME:
    ; Center the month name (13 chars) in 23-char space
    ; Padding: (23-13)/2 = 5 spaces on left, 5 on right
    MOV CX, 5
PRINT_LEFT_PAD:
    PUSH CX
    MOV DL, ' '
    CALL PRINT_CHAR_COLOR
    POP CX
    LOOP PRINT_LEFT_PAD
    
    CALL PRINT_STRING_COLOR
    
    MOV CX, 5
PRINT_RIGHT_PAD:
    PUSH CX
    MOV DL, ' '
    CALL PRINT_CHAR_COLOR
    POP CX
    LOOP PRINT_RIGHT_PAD
    
    ; Print right border
    MOV DL, 0BAh  ; ║
    CALL PRINT_CHAR_COLOR
    CALL NEW_LINE
    
    ; Print separator
    MOV DL, 0CCh  ; ╠
    CALL PRINT_CHAR_COLOR
    
    MOV CX, 23
PRINT_SEP1:
    PUSH CX
    MOV DL, 0CDh  ; ═
    CALL PRINT_CHAR_COLOR
    POP CX
    LOOP PRINT_SEP1
    
    MOV DL, 0B9h  ; ╣
    CALL PRINT_CHAR_COLOR
    CALL NEW_LINE
    
    ; Print day header
    MOV DL, 0BAh  ; ║
    CALL PRINT_CHAR_COLOR
    
    LEA DX, dayHeader
    CALL PRINT_STRING_COLOR
    
    MOV DL, 0BAh  ; ║
    CALL PRINT_CHAR_COLOR
    CALL NEW_LINE
    
    ; Print separator
    MOV DL, 0CCh  ; ╠
    CALL PRINT_CHAR_COLOR
    
    MOV CX, 23
PRINT_SEP2:
    PUSH CX
    MOV DL, 0CDh  ; ═
    CALL PRINT_CHAR_COLOR
    POP CX
    LOOP PRINT_SEP2
    
    MOV DL, 0B9h  ; ╣
    CALL PRINT_CHAR_COLOR
    CALL NEW_LINE
    
    ; Start printing days
    MOV DL, 0BAh  ; ║
    CALL PRINT_CHAR_COLOR
    
    ; Print leading spaces
    MOV CL, startDay
    MOV CH, 0
    CMP CL, 0
    JE START_DAYS
    
PRINT_SPACES:
    PUSH CX
    MOV DL, ' '
    CALL PRINT_CHAR_COLOR
    MOV DL, ' '
    CALL PRINT_CHAR_COLOR
    MOV DL, ' '
    CALL PRINT_CHAR_COLOR
    POP CX
    LOOP PRINT_SPACES
    
START_DAYS:
    MOV AL, startDay
    MOV currentCol, AL
    MOV currentDay, 1
    
PRINT_DAYS:
    MOV AL, currentDay
    CMP AL, numDays
    JA FINISH_LAST_LINE
    
    ; Print day number
    MOV AL, currentDay
    MOV AH, 0
    MOV BL, 10
    DIV BL
    
    ; AL = tens, AH = ones
    CMP AL, 0
    JE SINGLE_DIGIT
    
    ; Two digits
    ADD AL, '0'
    MOV DL, AL
    CALL PRINT_CHAR_COLOR
    
    MOV AL, AH
    ADD AL, '0'
    MOV DL, AL
    CALL PRINT_CHAR_COLOR
    JMP AFTER_PRINT
    
SINGLE_DIGIT:
    MOV DL, ' '
    CALL PRINT_CHAR_COLOR
    
    MOV AL, AH
    ADD AL, '0'
    MOV DL, AL
    CALL PRINT_CHAR_COLOR
    
AFTER_PRINT:
    INC currentDay
    INC currentCol
    
    MOV AL, currentCol
    CMP AL, 7
    JNE SAME_LINE
    
    ; End of week
    MOV DL, 0BAh  ; ║
    CALL PRINT_CHAR_COLOR
    CALL NEW_LINE
    
    MOV AL, currentDay
    CMP AL, numDays
    JA DONE_MONTH
    
    ; Next line
    MOV DL, 0BAh  ; ║
    CALL PRINT_CHAR_COLOR
    
    MOV currentCol, 0
    JMP PRINT_DAYS
    
SAME_LINE:
    MOV DL, ' '
    CALL PRINT_CHAR_COLOR
    JMP PRINT_DAYS

FINISH_LAST_LINE:
    MOV AL, currentCol
    CMP AL, 0
    JE DONE_MONTH
    
FILL_SPACES:
    CMP AL, 7
    JE END_LAST_LINE
    
    PUSH AX
    MOV DL, ''
    CALL PRINT_CHAR_COLOR
    MOV DL, ' '
    CALL PRINT_CHAR_COLOR
    MOV DL, ' '
    CALL PRINT_CHAR_COLOR
    POP AX
    INC AL
    JMP FILL_SPACES
    
END_LAST_LINE:
    MOV DL, 0BAh  ; ║
    CALL PRINT_CHAR_COLOR
    CALL NEW_LINE
    
DONE_MONTH:
    ; Print bottom border
    MOV DL, 0C8h  ; ╚
    CALL PRINT_CHAR_COLOR
    
    MOV CX, 23
PRINT_BOTTOM:
    PUSH CX
    MOV DL, 0CDh  ; ═
    CALL PRINT_CHAR_COLOR
    POP CX
    LOOP PRINT_BOTTOM
    
    MOV DL, 0BCh  ; ╝
    CALL PRINT_CHAR_COLOR
    
    RET
SHOW_MONTH ENDP

NEW_LINE PROC
    MOV AH, 02h
    MOV DL, 0Dh
    INT 21h
    MOV DL, 0Ah
    INT 21h
    RET
NEW_LINE ENDP

END MAIN