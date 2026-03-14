;Library Management System - Assembly Version
.MODEL SMALL
.STACK 100h
 
.DATA
    ; ===== UI ELEMENTS =====
    
    ; Top Banner (Cyan Background)
    HEADER_TXT   DB '  STACKED LIBRARY SYSTEM                        $'
    
    ; Bottom Banner (Cyan Background)
    FOOTER_TXT   DB '  [ESC] Exit   |   Created by: Joel Theo C. Gallarde                           $'

    ; ===== SPLASH SCREEN (TITLE) =====
    ; Box Width: 50 Characters Internal
    
    SPLASH_MSG   DB 13,10,13,10,13,10
                 ; Top Border
                 DB '           ',201, 50 DUP(205), 187,13,10
                 ; Title Section
                 DB '           ',186,'                                                  ',186,176,176,13,10
                 DB '           ',186,'            LIBRARY MANAGEMENT SYSTEM             ',186,176,176,13,10
                 DB '           ',186,'                                                  ',186,176,176,13,10
                 ; Divider
                 DB '           ',204, 50 DUP(205), 185,176,176,13,10
                 ; Author Section
                 DB '           ',186,'                                                  ',186,176,176,13,10
                 DB '           ',186,'        Created By: Joel Theo C. Gallarde         ',186,176,176,13,10
                 DB '           ',186,'                                                  ',186,176,176,13,10
                 ; Bottom Border
                 DB '           ',200, 50 DUP(205), 188,176,176,13,10
                 ; Shadow
                 DB '             ', 50 DUP(176), 13,10
                 DB 13,10,13,10,'           >> Press any key to continue...$'

    ; ===== MENU MESSAGES (ALIGNED) =====
    ; Box Width: 42 Characters Internal
    
    WELCOME_MSG  DB 13,10,13,10
                 ; Top Border
                 DB '               ',201, 42 DUP(205), 187,13,10
                 ; Title
                 DB '               ',186,'           STUDENT LOGIN PANEL            ',186,176,176,13,10
                 ; Separator
                 DB '               ',204, 42 DUP(205), 185,176,176,13,10
                 ; Empty Line
                 DB '               ',186,'                                          ',186,176,176,13,10
                 ; Options
                 DB '               ',186,'    1. Register New Student               ',186,176,176,13,10
                 DB '               ',186,'    2. Login to System                    ',186,176,176,13,10
                 DB '               ',186,'    3. Exit                               ',186,176,176,13,10
                 ; Empty Line
                 DB '               ',186,'                                          ',186,176,176,13,10
                 ; Bottom Border
                 DB '               ',200, 42 DUP(205), 188,176,176,13,10
                 ; Bottom Shadow
                 DB '                 ', 42 DUP(176), 13,10
                 DB 13,10,'               >> Enter Choice: $'
   
    MAIN_MENU    DB 13,10,13,10
                 ; Top Border
                 DB '               ',201, 42 DUP(205), 187,13,10
                 ; Title
                 DB '               ',186,'              MAIN DASHBOARD              ',186,176,176,13,10
                 ; Separator
                 DB '               ',204, 42 DUP(205), 185,176,176,13,10
                 ; Empty Line
                 DB '               ',186,'                                          ',186,176,176,13,10
                 ; Options
                 DB '               ',186,'    1. Add New Book                       ',186,176,176,13,10
                 DB '               ',186,'    2. View Catalog                       ',186,176,176,13,10
                 DB '               ',186,'    3. Update Book                        ',186,176,176,13,10
                 DB '               ',186,'    4. Remove Book                        ',186,176,176,13,10
                 DB '               ',186,'    5. Check Capacity                     ',186,176,176,13,10
                 DB '               ',186,'    6. Logout                             ',186,176,176,13,10
                 ; Empty Line
                 DB '               ',186,'                                          ',186,176,176,13,10
                 ; Bottom Border
                 DB '               ',200, 42 DUP(205), 188,176,176,13,10
                 ; Bottom Shadow
                 DB '                 ', 42 DUP(176), 13,10
                 DB 13,10,'               >> Enter Choice: $'
   
    ; ===== USER DATA (Students) =====
    MAX_USERS     EQU 10
    USER_COUNT    DW 0
    CURR_USER_IDX DW 0
   
    USER_NAMES    DB 200 DUP('$')
    USER_PASSES   DB 200 DUP('$')
    FULL_NAMES    DB 300 DUP('$')
   
    ; ===== BOOK DATA =====
    MAX_BOOKS     EQU 20
    BOOK_COUNT    DW 0
   
    BOOK_IDS      DB 200 DUP('$') 
    BOOK_AUTHS    DB 400 DUP('$') 
    BOOK_TITLES   DB 800 DUP('$') 
    BOOK_INDEX    DB 20 DUP(0)    
    BOOK_OWNERS   DW 20 DUP(0FFFFh) 
   
    ; ===== INPUT PROMPTS =====
    PROMPT_USER     DB 13,10,'   Username: $'
    PROMPT_PASS     DB '   Password: $'
    PROMPT_NAME     DB '   Full Name: $'
   
    PROMPT_PICK_LOC DB 13,10,'   [?] Shelf Position (1-20): $'
    PROMPT_AUTH     DB '   [?] Author Name: $'
    PROMPT_TITLE    DB '   [?] Book Title:  $'
   
    PROMPT_BOOKID   DB '   [!] Book ID (e.g. BOOK-05): $'
    PROMPT_NEWAUTH  DB '   [?] New Author: $'
    PROMPT_NEWTITLE DB '   [?] New Title:  $'
   
    ; ===== MESSAGES =====
    MSG_SUCCESS     DB 13,10,'   ',251,' OK: Done.',13,10,'$'
    MSG_REGSUCCESS  DB 13,10,'   ',251,' OK: Registered.',13,10,'$'
    MSG_LOGINSUCCESS DB 13,10,'   ',251,' OK: Welcome, $'
   
    MSG_LOGINFAIL   DB 13,10,'   X ERROR: Invalid credentials.',13,10,'$'
    MSG_FULL        DB 13,10,'   X ERROR: Library Full.',13,10,'$'
    MSG_NOTFOUND    DB 13,10,'   X ERROR: Not Found / Access Denied.',13,10,'$'
    MSG_DELETED     DB 13,10,'   ',251,' OK: Deleted.',13,10,'$'
    MSG_UPDATED     DB 13,10,'   ',251,' OK: Updated.',13,10,'$'
    MSG_NOBOOKS     DB 13,10,'   (i) Catalog is empty.',13,10,'$'
   
    MSG_USERFULL    DB 13,10,'   X ERROR: User DB Full.',13,10,'$'
    MSG_USEREXISTS  DB 13,10,'   X ERROR: User exists.',13,10,'$'
   
    MSG_INV_LOC     DB 13,10,'   X ERROR: Invalid Range.',13,10,'$'
    MSG_LOC_OCC     DB 13,10,'   X ERROR: Position Occupied.',13,10,'$'
    MSG_DUP_TITLE   DB 13,10,'   X ERROR: Duplicate Title.',13,10,'$'
   
    ; ===== CATALOG DISPLAY (FIXED ALIGNMENT) =====
    HEADER_BOOKS    DB 13,10,'   === CATALOG DISPLAY ===',13,10,'$'
    
    ; POS(5) | ID(12) | AUTHOR(22) | TITLE(29)
    BOOK_HEADER     DB 13,10
                    DB ' POS ',179,' ID         ',179,' AUTHOR               ',179,' TITLE                       ',13,10
                    DB '-----',197,'------------',197,'----------------------',197,'-----------------------------',13,10,'$'
    
    FOOTER_LINE     DB '-----',193,'------------',193,'----------------------',193,'-----------------------------',13,10,'$'
   
    AVAIL_MSG       DB 13,10,'   Slots Free: $'
    OCCUPIED_MSG    DB 13,10,'   Books Owned: $'
    
    CONTINUE_MSG    DB 13,10,13,10,'   [ Press any key ]$'
    
    NEWLINE         DB 13,10,'$'
    PIPE            DB ' ',179,' $' 
    SPACE           DB ' $'
   
    ; ===== BUFFERS =====
    INPUT_BUFFER    DB 50 DUP('$')
    TEMP_BUFFER     DB 50 DUP('$')
    SELECTED_LOC    DB 0
    TEMP_VAR        DB 0
 
.CODE
MAIN PROC
    MOV AX, @DATA
    MOV DS, AX
   
    ; === 1. SHOW TITLE SCREEN FIRST ===
    CALL SHOW_SPLASH
   
    ; === 2. GO TO WELCOME LOOP ===
WELCOME_LOOP:
    CALL DRAW_GUI
    MOV DX, OFFSET WELCOME_MSG
    CALL PRINT_STRING
   
    CALL GET_CHAR
   
    CMP AL, 31h
    JNE WL_CHK2
    CALL REGISTER_USER
    JMP WELCOME_LOOP
   
WL_CHK2:
    CMP AL, 32h
    JNE WL_CHK3
    CALL LOGIN_USER
    CMP AL, 1
    JE MAIN_MENU_LOOP
    JMP WELCOME_LOOP
   
WL_CHK3:
    CMP AL, 33h
    JNE WELCOME_LOOP
    JMP EXIT_PROG
   
MAIN_MENU_LOOP:
    CALL DRAW_GUI
    MOV DX, OFFSET MAIN_MENU
    CALL PRINT_STRING
   
    CALL GET_CHAR
   
    CMP AL, 31h
    JNE MM_CHK2
    CALL ADD_BOOK
    JMP MAIN_MENU_LOOP
   
MM_CHK2:
    CMP AL, 32h
    JNE MM_CHK3
    CALL VIEW_CATALOG
    CALL PAUSE_SCREEN
    JMP MAIN_MENU_LOOP
   
MM_CHK3:
    CMP AL, 33h
    JNE MM_CHK4
    CALL UPDATE_BOOK
    JMP MAIN_MENU_LOOP
   
MM_CHK4:
    CMP AL, 34h
    JNE MM_CHK5
    CALL REMOVE_BOOK
    JMP MAIN_MENU_LOOP
   
MM_CHK5:
    CMP AL, 35h
    JNE MM_CHK6
    CALL SHOW_STATUS
    CALL PAUSE_SCREEN
    JMP MAIN_MENU_LOOP
   
MM_CHK6:
    CMP AL, 36h
    JNE MAIN_MENU_LOOP
    JMP WELCOME_LOOP
   
EXIT_PROG:
    MOV AH, 4Ch
    INT 21h
MAIN ENDP
 
; ========================================================================
; GRAPHICAL INTERFACE PROCEDURES
; ========================================================================

DRAW_GUI PROC
    PUSH AX
    PUSH BX
    PUSH CX
    PUSH DX

    ; 1. Clear Screen to BLUE (1F)
    MOV AH, 06h
    MOV AL, 0
    MOV BH, 1Fh     ; White on Blue
    MOV CX, 0       ; Upper left (0,0)
    MOV DH, 24      ; Lower right (24,79)
    MOV DL, 79
    INT 10h

    ; 2. Draw Top Bar (Cyan Background 30h)
    MOV AH, 06h
    MOV AL, 0
    MOV BH, 30h     ; Black on Cyan
    MOV CH, 0       ; Line 0
    MOV CL, 0
    MOV DH, 0       ; Line 0
    MOV DL, 79
    INT 10h
    
    ; 3. Draw Bottom Bar (Cyan Background 30h)
    MOV AH, 06h
    MOV AL, 0
    MOV BH, 30h     ; Black on Cyan
    MOV CH, 24      ; Line 24
    MOV CL, 0
    MOV DH, 24      ; Line 24
    MOV DL, 79
    INT 10h

    ; 4. Draw Gold Frame around the Desktop
    MOV AH, 02h
    MOV BH, 0
    MOV DX, 0
    INT 10h
    
    MOV DX, OFFSET HEADER_TXT
    CALL PRINT_STRING
    
    MOV AH, 02h
    MOV BH, 0
    MOV DH, 24
    MOV DL, 0
    INT 10h
    
    MOV DX, OFFSET FOOTER_TXT
    CALL PRINT_STRING

    MOV AH, 02h
    MOV BH, 0
    MOV DH, 2
    MOV DL, 0
    INT 10h

    POP DX
    POP CX
    POP BX
    POP AX
    RET
DRAW_GUI ENDP

SHOW_SPLASH PROC
    PUSH AX
    PUSH DX
    
    ; Initialize the screen background
    CALL DRAW_GUI
    
    ; Print the large Splash Message
    MOV DX, OFFSET SPLASH_MSG
    CALL PRINT_STRING
    
    ; Wait for key press
    MOV AH, 01h     ; Or 07h for silent input
    INT 21h
    
    POP DX
    POP AX
    RET
SHOW_SPLASH ENDP

; ========================================================================
; STANDARD UTILITIES
; ========================================================================
 
PRINT_STRING PROC
    PUSH AX
    MOV AH, 09h
    INT 21h
    POP AX
    RET
PRINT_STRING ENDP
 
GET_CHAR PROC
    PUSH DX
    MOV AH, 01h
    INT 21h
    POP DX
    RET
GET_CHAR ENDP
 
PAUSE_SCREEN PROC
    PUSH AX
    PUSH DX
    MOV DX, OFFSET CONTINUE_MSG
    CALL PRINT_STRING
    CALL GET_CHAR
    POP DX
    POP AX
    RET
PAUSE_SCREEN ENDP
 
GET_STRING PROC
    PUSH AX
    PUSH BX
    PUSH CX
    PUSH SI
   
    MOV SI, DX
    XOR CX, CX
   
GET_STR_LOOP:
    MOV AH, 08h
    INT 21h
   
    CMP AL, 0Dh
    JE GET_STR_END
   
    CMP AL, 08h
    JE GET_STR_BACK
   
    CMP CX, 45
    JAE GET_STR_LOOP

    MOV [SI], AL
    INC SI
    INC CX
   
    MOV AH, 02h
    MOV DL, AL
    INT 21h
    JMP GET_STR_LOOP
   
GET_STR_BACK:
    CMP CX, 0
    JE GET_STR_LOOP
   
    DEC SI
    DEC CX
    MOV AH, 02h
    MOV DL, 08h
    INT 21h
    MOV DL, 20h
    INT 21h
    MOV DL, 08h
    INT 21h
    JMP GET_STR_LOOP
   
GET_STR_END:
    MOV BYTE PTR [SI], '$'
    MOV AH, 02h
    MOV DL, 0Dh
    INT 21h
    MOV DL, 0Ah
    INT 21h
    POP SI
    POP CX
    POP BX
    POP AX
    RET
GET_STRING ENDP
 
GET_PASSWORD PROC
    PUSH AX
    PUSH BX
    PUSH CX
    PUSH DX
    PUSH SI
    MOV SI, DX      
    XOR CX, CX      
GP_LOOP:
    MOV AH, 08h
    INT 21h
    CMP AL, 0Dh
    JE GP_END
    CMP AL, 08h
    JE GP_BACK
    CMP CX, 45
    JAE GP_LOOP
    MOV [SI], AL
    INC SI
    INC CX
    MOV AH, 02h
    MOV DL, '*'
    INT 21h
    JMP GP_LOOP
GP_BACK:
    CMP CX, 0
    JE GP_LOOP
    DEC SI
    DEC CX
    MOV AH, 02h
    MOV DL, 08h
    INT 21h
    MOV DL, 20h
    INT 21h
    MOV DL, 08h
    INT 21h
    JMP GP_LOOP
GP_END:
    MOV BYTE PTR [SI], '$'
    MOV AH, 02h
    MOV DL, 0Dh
    INT 21h
    MOV DL, 0Ah
    INT 21h
    POP SI
    POP DX
    POP CX
    POP BX
    POP AX
    RET
GET_PASSWORD ENDP
 
COPY_STRING PROC
    PUSH AX
    PUSH SI
    PUSH DI
COPY_LOOP:
    MOV AL, [DI]
    MOV [SI], AL
    CMP AL, '$'
    JE COPY_END
    INC SI
    INC DI
    JMP COPY_LOOP
COPY_END:
    POP DI
    POP SI
    POP AX
    RET
COPY_STRING ENDP
 
COMPARE_STRING PROC
    PUSH BX
    PUSH SI
    PUSH DI
CMP_LOOP:
    MOV AL, [SI]
    MOV BL, [DI]
    CMP AL, '$'
    JE CMP_CHECK_END
    CMP AL, BL
    JNE CMP_NOT_EQUAL
    INC SI
    INC DI
    JMP CMP_LOOP
CMP_CHECK_END:
    CMP BL, '$'
    JE CMP_EQUAL
CMP_NOT_EQUAL:
    MOV AL, 0
    JMP CMP_END
CMP_EQUAL:
    MOV AL, 1
CMP_END:
    POP DI
    POP SI
    POP BX
    RET
COMPARE_STRING ENDP
 
PRINT_NUMBER PROC
    PUSH AX
    PUSH BX
    PUSH CX
    PUSH DX
    XOR AH, AH
    MOV BL, 10
    DIV BL
    MOV CX, AX
    CMP CL, 0
    JE PRINT_ONES
    MOV DL, CL
    ADD DL, 30h
    MOV AH, 02h
    INT 21h
PRINT_ONES:
    MOV DL, CH
    ADD DL, 30h
    MOV AH, 02h
    INT 21h
    POP DX
    POP CX
    POP BX
    POP AX
    RET
PRINT_NUMBER ENDP
 
; ========================================================================
; AUTHENTICATION PROCEDURES
; ========================================================================
REGISTER_USER PROC
    PUSH AX
    PUSH BX
    PUSH CX
    PUSH DX
    PUSH SI
    PUSH DI
   
    MOV AX, USER_COUNT
    CMP AX, MAX_USERS
    JB REG_OK
    JMP REG_FULL
   
REG_OK:
    CALL DRAW_GUI
   
    MOV DX, OFFSET NEWLINE
    CALL PRINT_STRING
    MOV DX, OFFSET PROMPT_USER
    CALL PRINT_STRING
   
    MOV DX, OFFSET INPUT_BUFFER
    CALL GET_STRING
   
    CALL CHECK_USER_EXISTS
    CMP AL, 1
    JE REG_EXISTS
   
    ; Store username
    MOV AX, USER_COUNT
    MOV BX, 20
    MUL BX
    MOV SI, OFFSET USER_NAMES
    ADD SI, AX
    MOV DI, OFFSET INPUT_BUFFER
    CALL COPY_STRING
   
    ; Get password
    MOV DX, OFFSET PROMPT_PASS
    CALL PRINT_STRING
    MOV DX, OFFSET INPUT_BUFFER
    CALL GET_PASSWORD
   
    ; Store password
    MOV AX, USER_COUNT
    MOV BX, 20
    MUL BX
    MOV SI, OFFSET USER_PASSES
    ADD SI, AX
    MOV DI, OFFSET INPUT_BUFFER
    CALL COPY_STRING
   
    ; Get full name
    MOV DX, OFFSET NEWLINE
    CALL PRINT_STRING
    MOV DX, OFFSET PROMPT_NAME
    CALL PRINT_STRING
    MOV DX, OFFSET INPUT_BUFFER
    CALL GET_STRING
   
    ; Store name
    MOV AX, USER_COUNT
    MOV BX, 30
    MUL BX
    MOV SI, OFFSET FULL_NAMES
    ADD SI, AX
    MOV DI, OFFSET INPUT_BUFFER
    CALL COPY_STRING
   
    INC USER_COUNT
   
    MOV DX, OFFSET MSG_REGSUCCESS
    CALL PRINT_STRING
    CALL PAUSE_SCREEN
    JMP REG_END
   
REG_FULL:
    CALL DRAW_GUI
    MOV DX, OFFSET MSG_USERFULL
    CALL PRINT_STRING
    CALL PAUSE_SCREEN
    JMP REG_END
   
REG_EXISTS:
    MOV DX, OFFSET MSG_USEREXISTS
    CALL PRINT_STRING
    CALL PAUSE_SCREEN
   
REG_END:
    POP DI
    POP SI
    POP DX
    POP CX
    POP BX
    POP AX
    RET
REGISTER_USER ENDP
 
CHECK_USER_EXISTS PROC
    PUSH BX
    PUSH CX
    PUSH SI
    PUSH DI
   
    MOV CX, USER_COUNT
    CMP CX, 0
    JE CHK_NOT_EXIST
   
    XOR BX, BX
   
CHK_LOOP:
    MOV AX, BX
    MOV DX, 20
    MUL DX
    MOV SI, OFFSET USER_NAMES
    ADD SI, AX
    MOV DI, OFFSET INPUT_BUFFER
    CALL COMPARE_STRING
    CMP AL, 1
    JE CHK_EXISTS
   
    INC BX
    DEC CX
    JNZ CHK_LOOP
   
CHK_NOT_EXIST:
    MOV AL, 0
    JMP CHK_END
   
CHK_EXISTS:
    MOV AL, 1
   
CHK_END:
    POP DI
    POP SI
    POP CX
    POP BX
    RET
CHECK_USER_EXISTS ENDP
 
LOGIN_USER PROC
    PUSH BX
    PUSH CX
    PUSH DX
    PUSH SI
    PUSH DI
   
    CALL DRAW_GUI
   
    MOV DX, OFFSET NEWLINE
    CALL PRINT_STRING
    MOV DX, OFFSET PROMPT_USER
    CALL PRINT_STRING
   
    MOV DX, OFFSET INPUT_BUFFER
    CALL GET_STRING
   
    MOV DX, OFFSET PROMPT_PASS
    CALL PRINT_STRING
    MOV DX, OFFSET TEMP_BUFFER
    CALL GET_PASSWORD
   
    MOV CX, USER_COUNT
    CMP CX, 0
    JE LOGIN_FAIL
   
    XOR BX, BX
   
LOGIN_CHECK:
    ; Check username
    MOV AX, BX
    MOV DX, 20
    MUL DX
    MOV SI, OFFSET USER_NAMES
    ADD SI, AX
    MOV DI, OFFSET INPUT_BUFFER
    CALL COMPARE_STRING
    CMP AL, 0
    JE LOGIN_NEXT
   
    ; Check password
    MOV AX, BX
    MOV DX, 20
    MUL DX
    MOV SI, OFFSET USER_PASSES
    ADD SI, AX
    MOV DI, OFFSET TEMP_BUFFER
    CALL COMPARE_STRING
    CMP AL, 1
    JE LOGIN_SUCCESS
   
LOGIN_NEXT:
    INC BX
    DEC CX
    JNZ LOGIN_CHECK
   
LOGIN_FAIL:
    MOV DX, OFFSET MSG_LOGINFAIL
    CALL PRINT_STRING
    CALL PAUSE_SCREEN
    MOV AL, 0
    JMP LOGIN_END
   
LOGIN_SUCCESS:
    MOV CURR_USER_IDX, BX
    MOV DX, OFFSET MSG_LOGINSUCCESS
    CALL PRINT_STRING
   
    ; Display Name
    MOV AX, BX
    MOV DX, 30
    MUL DX
    MOV SI, OFFSET FULL_NAMES
    ADD SI, AX
    MOV DX, SI
    CALL PRINT_STRING
   
    MOV DX, OFFSET NEWLINE
    CALL PRINT_STRING
    CALL PAUSE_SCREEN
    MOV AL, 1
   
LOGIN_END:
    POP DI
    POP SI
    POP DX
    POP CX
    POP BX
    RET
LOGIN_USER ENDP
 
; ========================================================================
; LIBRARY CORE PROCEDURES
; ========================================================================
ADD_BOOK PROC
    PUSH AX
    PUSH BX
    PUSH CX
    PUSH DX
    PUSH SI
    PUSH DI
   
    MOV AX, BOOK_COUNT
    CMP AX, MAX_BOOKS
    JB ADD_START
    JMP ADD_FULL
   
ADD_START:
    CALL DRAW_GUI
   
    ; 1. SELECT SHELF LOCATION (1-20)
    MOV DX, OFFSET PROMPT_PICK_LOC
    CALL PRINT_STRING
    MOV DX, OFFSET INPUT_BUFFER
    CALL GET_STRING
   
    ; Convert String to Number & Validate
    CALL VALIDATE_LOCATION
    CMP AL, 0  
    JNE ADD_LOC_VALID
    JMP ADD_END      
   
ADD_LOC_VALID:
    MOV SELECTED_LOC, AL
    MOV BL, AL            
   
    ; 2. ENTER AUTHOR
    MOV DX, OFFSET PROMPT_AUTH
    CALL PRINT_STRING
    MOV DX, OFFSET INPUT_BUFFER
    CALL GET_STRING
   
    ; Store Author to Temp Buffer temporarily
    MOV SI, OFFSET TEMP_BUFFER
    MOV DI, OFFSET INPUT_BUFFER
    CALL COPY_STRING
   
    ; 3. ENTER TITLE (Check for duplicate titles)
    MOV DX, OFFSET PROMPT_TITLE
    CALL PRINT_STRING
    MOV DX, OFFSET INPUT_BUFFER
    CALL GET_STRING
   
    MOV SI, OFFSET BOOK_TITLES
    MOV CX, 40 
    CALL CHECK_DUPLICATE
    CMP AL, 1
    JNE ADD_SAVE_ALL
    JMP ADD_DUP_TITLE
   
ADD_SAVE_ALL:
    ; --- DATA IS VALID, SAVE IT ---
   
    ; Generate Book ID (BOOK-XX format)
    MOV AX, BOOK_COUNT
    MOV CX, 10
    MUL CX
    MOV SI, OFFSET BOOK_IDS
    ADD SI, AX
   
    MOV BYTE PTR [SI], 'B'
    MOV BYTE PTR [SI+1], 'O'
    MOV BYTE PTR [SI+2], 'O'
    MOV BYTE PTR [SI+3], 'K'
    MOV BYTE PTR [SI+4], '-'
   
    XOR AH, AH
    MOV AL, SELECTED_LOC
    MOV CL, 10
    DIV CL
    ADD AL, 30h
    ADD AH, 30h
    MOV BYTE PTR [SI+5], AL
    MOV BYTE PTR [SI+6], AH
    MOV BYTE PTR [SI+7], '$'
   
    ; Store Location Index
    MOV AX, BOOK_COUNT
    MOV SI, OFFSET BOOK_INDEX
    ADD SI, AX
    MOV AL, SELECTED_LOC
    MOV [SI], AL
   
    ; === SAVE OWNER ===
    MOV AX, BOOK_COUNT
    MOV BX, 2         ; Word array
    MUL BX
    MOV SI, OFFSET BOOK_OWNERS
    ADD SI, AX
    MOV AX, CURR_USER_IDX
    MOV [SI], AX
    ; ==================

    ; Store Author (From Temp Buffer)
    MOV AX, BOOK_COUNT
    MOV CX, 20
    MUL CX
    MOV SI, OFFSET BOOK_AUTHS
    ADD SI, AX
    MOV DI, OFFSET TEMP_BUFFER
    CALL COPY_STRING
   
    ; Store Title (From Input Buffer)
    MOV AX, BOOK_COUNT
    MOV CX, 40
    MUL CX
    MOV SI, OFFSET BOOK_TITLES
    ADD SI, AX
    MOV DI, OFFSET INPUT_BUFFER
    CALL COPY_STRING
   
    INC BOOK_COUNT
   
    MOV DX, OFFSET MSG_SUCCESS
    CALL PRINT_STRING
    CALL PAUSE_SCREEN
    JMP ADD_END
 
ADD_DUP_TITLE:
    MOV DX, OFFSET MSG_DUP_TITLE
    CALL PRINT_STRING
    CALL PAUSE_SCREEN
    JMP ADD_END
   
ADD_FULL:
    CALL DRAW_GUI
    MOV DX, OFFSET MSG_FULL
    CALL PRINT_STRING
    CALL PAUSE_SCREEN
   
ADD_END:
    POP DI
    POP SI
    POP DX
    POP CX
    POP BX
    POP AX
    RET
ADD_BOOK ENDP
 
VALIDATE_LOCATION PROC
    PUSH BX
    PUSH CX
    PUSH DX
    PUSH SI
   
    MOV SI, OFFSET INPUT_BUFFER
    XOR AX, AX
    XOR CX, CX
   
    ; Parse first digit
    MOV AL, [SI]
    CMP AL, '$'
    JE VL_INV
    CMP AL, '0'
    JB VL_INV
    CMP AL, '9'
    JA VL_INV
    SUB AL, 30h
    MOV CL, AL
   
    INC SI
    MOV AL, [SI]
    CMP AL, '$'
    JE VL_CHECK_RANGE ; Single digit
   
    ; Two digits
    CMP AL, '0'
    JB VL_INV
    CMP AL, '9'
    JA VL_INV
    SUB AL, 30h
    MOV BL, AL      ; Second digit
   
    MOV AL, CL
    MOV DL, 10
    MUL DL          ; First digit * 10
    ADD AL, BL      ; + Second digit
    MOV CL, AL
   
VL_CHECK_RANGE:
    CMP CL, 1
    JB VL_INV
    CMP CL, 20
    JA VL_INV
   
    ; Check if Location is Occupied
    MOV TEMP_VAR, CL
   
    MOV CX, BOOK_COUNT
    CMP CX, 0
    JE VL_FREE
   
    XOR BX, BX
    MOV DL, TEMP_VAR
   
VL_OCC_LOOP:
    MOV SI, OFFSET BOOK_INDEX
    ADD SI, BX
    MOV AL, [SI]
    CMP AL, DL
    JNE VL_NEXT_ITER ; Location doesn't match, keep checking
    
    ; LOCATION MATCHES: Check if it's MY book
    PUSH BX
    MOV AX, BX
    SHL AX, 1        ; * 2 for Word Array
    MOV SI, OFFSET BOOK_OWNERS
    ADD SI, AX
    MOV AX, [SI]     ; Get Owner of the book at this location
    POP BX
    
    CMP AX, CURR_USER_IDX
    JE VL_OCCUPIED   ; Only occupied if *I* already used this spot!

VL_NEXT_ITER:
    INC BX
    DEC CX
    JNZ VL_OCC_LOOP
   
VL_FREE:
    MOV AL, TEMP_VAR
    JMP VL_RET
   
VL_OCCUPIED:
    MOV DX, OFFSET MSG_LOC_OCC
    CALL PRINT_STRING
    CALL PAUSE_SCREEN
    MOV AL, 0
    JMP VL_RET
 
VL_INV:
    MOV DX, OFFSET MSG_INV_LOC
    CALL PRINT_STRING
    CALL PAUSE_SCREEN
    MOV AL, 0
 
VL_RET:
    POP SI
    POP DX
    POP CX
    POP BX
    RET
VALIDATE_LOCATION ENDP
 
CHECK_DUPLICATE PROC
    PUSH BX
    PUSH CX
    PUSH DX
    PUSH SI
    PUSH DI
    PUSH BP
   
    MOV BP, CX
   
    MOV CX, BOOK_COUNT
    CMP CX, 0
    JE CD_UNIQUE
   
    XOR BX, BX
   
CD_LOOP:
    ; Check ownership first!
    PUSH BX
    PUSH SI
    MOV AX, BX
    SHL AX, 1       ; Multiply by 2
    MOV SI, OFFSET BOOK_OWNERS
    ADD SI, AX
    MOV AX, [SI]
    CMP AX, CURR_USER_IDX
    POP SI
    POP BX
    JNE CD_SKIP     ; Not my book, skip check
    
    ; Compare strings
    MOV AX, BX
    MUL BP    
    MOV DI, SI
    ADD DI, AX
   
    PUSH SI    
    MOV SI, DI
    MOV DI, OFFSET INPUT_BUFFER
    CALL COMPARE_STRING
    POP SI    
   
    CMP AL, 1
    JE CD_FOUND
    
CD_SKIP:
    INC BX
    DEC CX
    JNZ CD_LOOP
   
CD_UNIQUE:
    MOV AL, 0
    JMP CD_END
   
CD_FOUND:
    MOV AL, 1
   
CD_END:
    POP BP
    POP DI
    POP SI
    POP DX
    POP CX
    POP BX
    RET
CHECK_DUPLICATE ENDP
 
VIEW_CATALOG PROC
    PUSH AX
    PUSH BX
    PUSH CX
    PUSH DX
    PUSH SI
    PUSH BP
   
    CALL DRAW_GUI
   
    MOV CX, BOOK_COUNT
    CMP CX, 0
    JNE VIEW_START
    JMP VIEW_EMPTY
    
VIEW_START:
    MOV DX, OFFSET HEADER_BOOKS
    CALL PRINT_STRING
    MOV DX, OFFSET BOOK_HEADER
    CALL PRINT_STRING
   
    XOR BX, BX
    MOV BP, 0      ; Count how many books belong to user
   
VIEW_LOOP:
    ; === CHECK OWNERSHIP ===
    MOV AX, BX
    PUSH BX
    SHL AX, 1      ; Multiply by 2
    MOV SI, OFFSET BOOK_OWNERS
    ADD SI, AX
    MOV AX, [SI]
    POP BX
    CMP AX, CURR_USER_IDX
    JNE VIEW_NEXT_ITER  ; Skip if not owner
    
    INC BP         ; Found a book for this user
    ; =======================

    MOV AH, 09h
    MOV DX, OFFSET SPACE
    INT 21h
    
    ; Print ID aligned
    MOV SI, OFFSET BOOK_INDEX
    ADD SI, BX
    MOV AL, [SI]
    CALL PRINT_NUMBER
    
    ; Simple alignment logic for single digit numbers
    CMP AL, 10
    JAE VIEW_ALIGN1
    MOV DX, OFFSET SPACE
    MOV AH, 09h
    INT 21h
VIEW_ALIGN1:

    MOV DX, OFFSET PIPE
    MOV AH, 09h
    INT 21h
   
    MOV AX, BX
    MOV DX, 10
    MUL DX
    MOV SI, OFFSET BOOK_IDS
    ADD SI, AX
    MOV DX, SI
    CALL PRINT_STRING
   
    MOV AH, 09h
    MOV DX, OFFSET SPACE
    INT 21h
    MOV DX, OFFSET PIPE
    INT 21h
   
    MOV AX, BX
    MOV DX, 20
    MUL DX
    MOV SI, OFFSET BOOK_AUTHS
    ADD SI, AX
    MOV DX, SI
    CALL PRINT_STRING
   
    MOV AH, 09h
    MOV DX, OFFSET SPACE
    INT 21h
    MOV DX, OFFSET PIPE
    INT 21h
   
    MOV AX, BX
    MOV DX, 40
    MUL DX
    MOV SI, OFFSET BOOK_TITLES
    ADD SI, AX
    MOV DX, SI
    CALL PRINT_STRING
   
    MOV DX, OFFSET NEWLINE
    CALL PRINT_STRING
    
VIEW_NEXT_ITER:
    INC BX
    DEC CX
    
    ; FIX FOR JUMP OUT OF RANGE (Long Jump Pattern)
    CMP CX, 0
    JE VIEW_DONE_LOOP
    JMP VIEW_LOOP
    
VIEW_DONE_LOOP:
    CMP BP, 0      ; Did we print any books?
    JE VIEW_EMPTY
   
    MOV DX, OFFSET FOOTER_LINE
    CALL PRINT_STRING
    JMP VIEW_END
   
VIEW_EMPTY:
    MOV DX, OFFSET MSG_NOBOOKS
    CALL PRINT_STRING
   
VIEW_END:
    POP BP
    POP SI
    POP DX
    POP CX
    POP BX
    POP AX
    RET
VIEW_CATALOG ENDP
 
UPDATE_BOOK PROC
    PUSH AX
    PUSH BX
    PUSH CX
    PUSH DX
    PUSH SI
    PUSH DI
   
    MOV CX, BOOK_COUNT
    CMP CX, 0
    JNE UPD_OK
    JMP UPD_EMPTY
   
UPD_OK:
    CALL DRAW_GUI
   
    MOV DX, OFFSET NEWLINE
    CALL PRINT_STRING
    MOV DX, OFFSET PROMPT_BOOKID
    CALL PRINT_STRING
   
    MOV DX, OFFSET INPUT_BUFFER
    CALL GET_STRING
   
    CALL FIND_BOOK
    CMP AL, 0FFh
    JE UPD_NOTFOUND
   
    XOR AH, AH
    MOV BX, AX
   
    MOV DX, OFFSET PROMPT_NEWAUTH
    CALL PRINT_STRING
    MOV DX, OFFSET INPUT_BUFFER
    CALL GET_STRING
   
    MOV AX, BX
    MOV CX, 20
    MUL CX
    MOV SI, OFFSET BOOK_AUTHS
    ADD SI, AX
    MOV DI, OFFSET INPUT_BUFFER
    CALL COPY_STRING
   
    MOV DX, OFFSET PROMPT_NEWTITLE
    CALL PRINT_STRING
    MOV DX, OFFSET INPUT_BUFFER
    CALL GET_STRING
   
    MOV AX, BX
    MOV CX, 40
    MUL CX
    MOV SI, OFFSET BOOK_TITLES
    ADD SI, AX
    MOV DI, OFFSET INPUT_BUFFER
    CALL COPY_STRING
   
    MOV DX, OFFSET MSG_UPDATED
    CALL PRINT_STRING
    CALL PAUSE_SCREEN
    JMP UPD_END
   
UPD_NOTFOUND:
    MOV DX, OFFSET MSG_NOTFOUND
    CALL PRINT_STRING
    CALL PAUSE_SCREEN
    JMP UPD_END
   
UPD_EMPTY:
    CALL DRAW_GUI
    MOV DX, OFFSET MSG_NOBOOKS
    CALL PRINT_STRING
    CALL PAUSE_SCREEN
   
UPD_END:
    POP DI
    POP SI
    POP DX
    POP CX
    POP BX
    POP AX
    RET
UPDATE_BOOK ENDP
 
REMOVE_BOOK PROC
    PUSH AX
    PUSH BX
    PUSH CX
    PUSH DX
    PUSH SI
    PUSH DI
   
    MOV CX, BOOK_COUNT
    CMP CX, 0
    JNE DEL_OK
    JMP DEL_EMPTY
   
DEL_OK:
    CALL DRAW_GUI
   
    MOV DX, OFFSET NEWLINE
    CALL PRINT_STRING
    MOV DX, OFFSET PROMPT_BOOKID
    CALL PRINT_STRING
   
    MOV DX, OFFSET INPUT_BUFFER
    CALL GET_STRING
   
    CALL FIND_BOOK
    CMP AL, 0FFh
    JNE DEL_FOUND
    JMP DEL_NOTFOUND
   
DEL_FOUND:
    XOR AH, AH
    MOV BX, AX
   
    MOV CX, BOOK_COUNT
    DEC CX
    SUB CX, BX
    CMP CX, 0
    JE DEL_LAST
   
DEL_SHIFT_LOOP:
    ; Shift IDs
    MOV AX, BX
    MOV DX, 10
    MUL DX
    MOV SI, OFFSET BOOK_IDS
    ADD SI, AX
    MOV DI, SI
    ADD DI, 10
    PUSH CX
    MOV CX, 10
    CALL SHIFT_BYTES
    POP CX
    
    ; === SHIFT OWNERS (Words) ===
    MOV AX, BX
    SHL AX, 1       ; * 2
    MOV SI, OFFSET BOOK_OWNERS
    ADD SI, AX
    MOV DI, SI
    ADD DI, 2
    PUSH CX
    MOV CX, 2       ; Shift 2 bytes (1 word)
    CALL SHIFT_BYTES
    POP CX
    ; ===========================
   
    ; Shift Authors
    MOV AX, BX
    MOV DX, 20
    MUL DX
    MOV SI, OFFSET BOOK_AUTHS
    ADD SI, AX
    MOV DI, SI
    ADD DI, 20
    PUSH CX
    MOV CX, 20
    CALL SHIFT_BYTES
    POP CX
   
    ; Shift Titles
    MOV AX, BX
    MOV DX, 40
    MUL DX
    MOV SI, OFFSET BOOK_TITLES
    ADD SI, AX
    MOV DI, SI
    ADD DI, 40
    PUSH CX
    MOV CX, 40
    CALL SHIFT_BYTES
    POP CX
   
    ; Shift Indexes
    MOV SI, OFFSET BOOK_INDEX
    ADD SI, BX
    MOV DI, SI
    INC DI
    MOV AL, [DI]
    MOV [SI], AL
   
    INC BX
    DEC CX
    
    ; FIX FOR JUMP OUT OF RANGE
    ; We use an inverse jump to allow a Long Jump (JMP)
    CMP CX, 0
    JE DEL_SHIFT_DONE
    JMP DEL_SHIFT_LOOP
    
DEL_SHIFT_DONE:
    ; fall through to DEL_LAST
   
DEL_LAST:
    DEC BOOK_COUNT
    MOV DX, OFFSET MSG_DELETED
    CALL PRINT_STRING
    CALL PAUSE_SCREEN
    JMP DEL_END
   
DEL_NOTFOUND:
    MOV DX, OFFSET MSG_NOTFOUND
    CALL PRINT_STRING
    CALL PAUSE_SCREEN
    JMP DEL_END
   
DEL_EMPTY:
    CALL DRAW_GUI
    MOV DX, OFFSET MSG_NOBOOKS
    CALL PRINT_STRING
    CALL PAUSE_SCREEN
   
DEL_END:
    POP DI
    POP SI
    POP DX
    POP CX
    POP BX
    POP AX
    RET
REMOVE_BOOK ENDP
 
SHIFT_BYTES PROC
    PUSH AX
    PUSH CX
    PUSH SI
    PUSH DI
   
SHIFT_LOOP:
    MOV AL, [DI]
    MOV [SI], AL
    INC SI
    INC DI
    DEC CX
    JNZ SHIFT_LOOP
   
    POP DI
    POP SI
    POP CX
    POP AX
    RET
SHIFT_BYTES ENDP
 
SHOW_STATUS PROC
    PUSH AX
    PUSH BX
    PUSH DX
   
    CALL DRAW_GUI
   
    MOV DX, OFFSET NEWLINE
    CALL PRINT_STRING
   
    MOV AX, MAX_BOOKS
    SUB AX, BOOK_COUNT
   
    MOV DX, OFFSET AVAIL_MSG
    CALL PRINT_STRING
    CALL PRINT_NUMBER
   
    MOV DX, OFFSET OCCUPIED_MSG
    CALL PRINT_STRING
    MOV AX, BOOK_COUNT
    CALL PRINT_NUMBER
   
    MOV DX, OFFSET NEWLINE
    CALL PRINT_STRING
   
    POP DX
    POP BX
    POP AX
    RET
SHOW_STATUS ENDP
 
FIND_BOOK PROC
    PUSH BX
    PUSH CX
    PUSH SI
    PUSH DI
   
    XOR BX, BX
    MOV CX, BOOK_COUNT
    CMP CX, 0
    JE FIND_BK_NOT
   
FIND_BK_LOOP:
    ; 1. Check String Match
    MOV AX, BX
    MOV DX, 10
    MUL DX
    MOV SI, OFFSET BOOK_IDS
    ADD SI, AX
    MOV DI, OFFSET INPUT_BUFFER
    CALL COMPARE_STRING
    CMP AL, 1
    JNE FIND_BK_NEXT
    
    ; 2. Check Ownership
    MOV AX, BX
    SHL AX, 1       ; * 2
    MOV SI, OFFSET BOOK_OWNERS
    ADD SI, AX
    MOV AX, [SI]
    CMP AX, CURR_USER_IDX
    JE FIND_BK_FOUND
   
FIND_BK_NEXT:
    INC BX
    DEC CX
    JNZ FIND_BK_LOOP
   
FIND_BK_NOT:
    MOV AL, 0FFh
    JMP FIND_BK_END
   
FIND_BK_FOUND:
    MOV AL, BL
   
FIND_BK_END:
    POP DI
    POP SI
    POP CX
    POP BX
    RET
FIND_BOOK ENDP
 
END MAIN