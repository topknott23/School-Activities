; a.Filename: FINALEXAM_RACHO.ASM
; b.CS243 Lab Hands-on Final Exam
; c.First Semester SY 2025-2026
; d.Student Name: JOEL THEO C. GALLARDE
; e.Date Finished: December 11, 2025
 
.MODEL SMALL
.STACK 100H
 
.DATA
    ; ================= COLORS & ATTRIBUTES =================
    BG_COLOR        DB 07h     ; Black Background, White Text (Global)
   
    ; Specific Attributes for Menu Items
    ATTR_VOTE       DB 0E0h    ; Yellow Background, Black Text
    ATTR_VIEW       DB 4Fh     ; Red Background, White Text
    ATTR_UPDATE     DB 2Fh     ; Green Background, White Text
    ATTR_DELETE     DB 1Fh     ; Blue Background, White Text
   
    ; ================= HEADERS =================
    header1         DB 'Cebu Institute of Technology - University$'
    header2         DB 'College of Computer Studies$'
    header3         DB 'FAVORITE CLASSMATE VOTING SYSTEM$'
    programmer      DB 'Programmer: JOEL THEO C. GALLARDE$'
    separator       DB '---------------------------------------------$'
   
    ; ================= MENUS =================
    menu_label      DB 'MAIN MENU$'
   
    ; Broken down menu parts to insert colors
    m_1             DB '1. $'
    m_2             DB '2. $'
    m_3             DB '3. $'
    m_4             DB '4. $'
    m_5             DB '5. Exit$'
   
    ; Colored Keywords
    txt_vote        DB 'Vote$'
    txt_view        DB 'View$'
    txt_update      DB 'Update$'
    txt_delete      DB 'Delete$'
   
    prompt_choice   DB 'Enter choice: $'
    invalid_msg     DB 'Invalid input! Press any key...$'
   
    ; ================= PROMPTS =================
    p_name          DB 'Enter candidate name: $'
    p_rating        DB 'Enter vote rating (0-100): $'
    p_rec_num       DB 'Enter record number to update: $'
    p_del_num       DB 'Enter record number to delete: $'
    p_new_name      DB 'Enter new candidate name: $'
    p_new_rating    DB 'Enter new vote rating (0-100): $'
    msg_deleted     DB 'Record deleted.$'
    msg_no_rec      DB 'No record found.$'
    msg_press_key   DB 'Press any key to go back to Main Menu...$'
    msg_exit        DB 'Exiting...$'
    msg_thank_you   DB 'Thank you for using Favorite Classmate Voting System.$'
    dash            DB ' - $'
    dot             DB '. $'
    newline         DB 13, 10, '$'
 
    ; ================= DATA STORAGE =================
    MAX_CANDIDATES  EQU 10
    NAME_SIZE       EQU 30
    RATING_SIZE     EQU 4
   
    candidate_count DB 0
   
    names_arr       DB 300 DUP ('$')
    ratings_arr     DB 40 DUP ('$')
   
    input_buffer    DB 31, ?, 31 DUP('$')
    num_buffer      DB 5, ?, 5 DUP('$')  
   
    curr_index      DB 0
    temp_char       DB 0
 
.CODE
 
MAIN PROC
    MOV AX, @DATA
    MOV DS, AX
    MOV ES, AX
 
    ; Disable Blinking to allow Bright Backgrounds (High Intensity)
    MOV AX, 1003H
    MOV BL, 0
    INT 10H
 
MAIN_LOOP:
    CALL CLEAR_SCREEN
    CALL DISPLAY_HEADER
   
    ; Display MAIN MENU Label
    CALL PRINT_NEWLINE
    LEA DX, menu_label
    CALL PRINT_STR
    CALL PRINT_NEWLINE
   
    ; === 1. Vote (Yellow) ===
    LEA DX, m_1
    CALL PRINT_STR
    LEA DX, txt_vote
    MOV BL, ATTR_VOTE
    CALL PRINT_COLOR_STR
    CALL PRINT_NEWLINE
   
    ; === 2. View (Red) ===
    LEA DX, m_2
    CALL PRINT_STR
    LEA DX, txt_view
    MOV BL, ATTR_VIEW
    CALL PRINT_COLOR_STR
    CALL PRINT_NEWLINE
   
    ; === 3. Update (Green) ===
    LEA DX, m_3
    CALL PRINT_STR
    LEA DX, txt_update
    MOV BL, ATTR_UPDATE
    CALL PRINT_COLOR_STR
    CALL PRINT_NEWLINE
   
    ; === 4. Delete (Blue) ===
    LEA DX, m_4
    CALL PRINT_STR
    LEA DX, txt_delete
    MOV BL, ATTR_DELETE
    CALL PRINT_COLOR_STR
    CALL PRINT_NEWLINE
   
    ; === 5. Exit (Standard) ===
    LEA DX, m_5
    CALL PRINT_STR
    CALL PRINT_NEWLINE
   
    LEA DX, prompt_choice
    CALL PRINT_STR
   
    ; Get Input
    MOV AH, 01H
    INT 21H
    MOV temp_char, AL
   
    ; Check Input
    CMP temp_char, '1'
    JE GO_VOTE
    CMP temp_char, '2'
    JE GO_VIEW
    CMP temp_char, '3'
    JE GO_UPDATE
    CMP temp_char, '4'
    JE GO_DELETE
    CMP temp_char, '5'
    JE GO_EXIT
   
    ; Invalid Input
    CALL PRINT_NEWLINE
    LEA DX, invalid_msg
    CALL PRINT_STR
    MOV AH, 01H
    INT 21H
    JMP MAIN_LOOP
 
GO_VOTE:
    CALL PROC_VOTE
    JMP MAIN_LOOP
 
GO_VIEW:
    CALL PROC_VIEW_PAUSE
    JMP MAIN_LOOP
 
GO_UPDATE:
    CALL PROC_UPDATE
    JMP MAIN_LOOP
 
GO_DELETE:
    CALL PROC_DELETE
    JMP MAIN_LOOP
 
GO_EXIT:
    CALL CLEAR_SCREEN
    CALL DISPLAY_HEADER
    CALL PRINT_NEWLINE
    LEA DX, msg_exit
    CALL PRINT_STR
    CALL PRINT_NEWLINE
    LEA DX, msg_thank_you
    CALL PRINT_STR
   
    MOV AH, 4CH
    INT 21H
 
MAIN ENDP
 
; ================= PROCEDURES =================
 
; --- CLEAR SCREEN ---
CLEAR_SCREEN PROC
    MOV AH, 06H        
    MOV AL, 0          
    MOV BH, BG_COLOR    ; 07h Black
    MOV CX, 0          
    MOV DX, 184FH      
    INT 10H
   
    ; Reset cursor
    MOV AH, 02H
    MOV BH, 0
    MOV DX, 0
    INT 10H
    RET
CLEAR_SCREEN ENDP
 
; --- DISPLAY HEADER ---
DISPLAY_HEADER PROC
    LEA DX, header1
    CALL PRINT_STR
    CALL PRINT_NEWLINE
    LEA DX, header2
    CALL PRINT_STR
    CALL PRINT_NEWLINE
    LEA DX, header3
    CALL PRINT_STR
    CALL PRINT_NEWLINE
    LEA DX, programmer
    CALL PRINT_STR
    CALL PRINT_NEWLINE
    RET
DISPLAY_HEADER ENDP
 
; --- VOTE ---
PROC_VOTE PROC
    CALL CLEAR_SCREEN
    CALL DISPLAY_HEADER
    CALL PRINT_NEWLINE
   
    ; Title "Vote" in Yellow
    LEA DX, txt_vote
    MOV BL, ATTR_VOTE
    CALL PRINT_COLOR_STR
    CALL PRINT_NEWLINE
   
    LEA DX, p_name
    CALL PRINT_STR
    LEA DX, input_buffer
    MOV AH, 0AH
    INT 21H
   
    CALL SAVE_NAME
    CALL PRINT_NEWLINE
   
    LEA DX, p_rating
    CALL PRINT_STR
    LEA DX, input_buffer
    MOV AH, 0AH
    INT 21H
   
    CALL SAVE_RATING
    INC candidate_count
   
    CALL PRINT_NEWLINE
    CALL PRINT_NEWLINE
    LEA DX, msg_press_key
    CALL PRINT_STR
    MOV AH, 07H
    INT 21H
    RET
PROC_VOTE ENDP
 
; --- VIEW INTERNAL ---
PROC_VIEW_INTERNAL PROC
    CMP candidate_count, 0
    JE NO_RECORDS
   
    ; Title "View" in Red
    LEA DX, txt_view
    MOV BL, ATTR_VIEW
    CALL PRINT_COLOR_STR
    CALL PRINT_NEWLINE
   
    XOR CX, CX
    MOV CL, candidate_count
    MOV SI, 0
   
VIEW_LOOP:
    PUSH CX
   
    MOV AX, SI
    INC AX
    CALL PRINT_NUM
    LEA DX, dot
    CALL PRINT_STR
   
    CALL GET_NAME_OFFSET
    MOV DX, BX
    CALL PRINT_STR
   
    LEA DX, dash
    CALL PRINT_STR
   
    CALL GET_RATING_OFFSET
    MOV DX, BX
    CALL PRINT_STR
   
    CALL PRINT_NEWLINE
   
    INC SI
    POP CX
    LOOP VIEW_LOOP
    RET
 
NO_RECORDS:
    ; Title "View" in Red
    LEA DX, txt_view
    MOV BL, ATTR_VIEW
    CALL PRINT_COLOR_STR
    CALL PRINT_NEWLINE
   
    LEA DX, msg_no_rec
    CALL PRINT_STR
    CALL PRINT_NEWLINE
    RET
PROC_VIEW_INTERNAL ENDP
 
; --- VIEW PAUSE ---
PROC_VIEW_PAUSE PROC
    CALL CLEAR_SCREEN
    CALL DISPLAY_HEADER
    CALL PRINT_NEWLINE
   
    CALL PROC_VIEW_INTERNAL
   
    CALL PRINT_NEWLINE
    LEA DX, msg_press_key
    CALL PRINT_STR
    MOV AH, 07H
    INT 21H
    RET
PROC_VIEW_PAUSE ENDP
 
; --- UPDATE ---
PROC_UPDATE PROC
    CALL CLEAR_SCREEN
    CALL DISPLAY_HEADER
    CALL PRINT_NEWLINE
   
    ; Title "Update" in Green
    LEA DX, txt_update
    MOV BL, ATTR_UPDATE
    CALL PRINT_COLOR_STR
    CALL PRINT_NEWLINE
   
    CMP candidate_count, 0
    JNE START_UPDATE        
    JMP UPDATE_NO_REC      
   
START_UPDATE:
    XOR CX, CX
    MOV CL, candidate_count
    MOV SI, 0
   
UPDATE_LIST_LOOP:
    PUSH CX
    MOV AX, SI
    INC AX
    CALL PRINT_NUM
    LEA DX, dot
    CALL PRINT_STR
    CALL GET_NAME_OFFSET
    MOV DX, BX
    CALL PRINT_STR
    LEA DX, dash
    CALL PRINT_STR
    CALL GET_RATING_OFFSET
    MOV DX, BX
    CALL PRINT_STR
    CALL PRINT_NEWLINE
    INC SI
    POP CX
    LOOP UPDATE_LIST_LOOP
   
    LEA DX, p_rec_num
    CALL PRINT_STR
   
    MOV AH, 01H
    INT 21H
    SUB AL, '1'
    MOV curr_index, AL
   
    CALL PRINT_NEWLINE
   
    LEA DX, p_new_name
    CALL PRINT_STR
    LEA DX, input_buffer
    MOV AH, 0AH
    INT 21H
   
    MOV AL, curr_index
    MOV AH, 0
    MOV BL, NAME_SIZE
    MUL BL          
    LEA DI, names_arr
    ADD DI, AX      
    LEA SI, input_buffer + 2
    MOV CL, [input_buffer + 1]
    MOV CH, 0
    REP MOVSB
    MOV BYTE PTR [DI], '$'
   
    CALL PRINT_NEWLINE
   
    LEA DX, p_new_rating
    CALL PRINT_STR
    LEA DX, input_buffer
    MOV AH, 0AH
    INT 21H
   
    MOV AL, curr_index
    MOV AH, 0
    MOV BL, RATING_SIZE
    MUL BL
    LEA DI, ratings_arr
    ADD DI, AX
    LEA SI, input_buffer + 2
    MOV CL, [input_buffer + 1]
    MOV CH, 0
    REP MOVSB
    MOV BYTE PTR [DI], '$'
   
    JMP UPDATE_DONE
 
UPDATE_NO_REC:
    LEA DX, msg_no_rec
    CALL PRINT_STR
 
UPDATE_DONE:
    CALL PRINT_NEWLINE
    CALL PRINT_NEWLINE
    LEA DX, msg_press_key
    CALL PRINT_STR
    MOV AH, 07H
    INT 21H
    RET
PROC_UPDATE ENDP
 
; --- DELETE ---
PROC_DELETE PROC
    CALL CLEAR_SCREEN
    CALL DISPLAY_HEADER
    CALL PRINT_NEWLINE
   
    ; Title "Delete" in Blue
    LEA DX, txt_delete
    MOV BL, ATTR_DELETE
    CALL PRINT_COLOR_STR
    CALL PRINT_NEWLINE
   
    CMP candidate_count, 0
    JNE START_DELETE      
    JMP DEL_NO_REC        
   
START_DELETE:
    XOR CX, CX
    MOV CL, candidate_count
    MOV SI, 0
DEL_LIST_LOOP:
    PUSH CX
    MOV AX, SI
    INC AX
    CALL PRINT_NUM
    LEA DX, dot
    CALL PRINT_STR
    CALL GET_NAME_OFFSET
    MOV DX, BX
    CALL PRINT_STR
    LEA DX, dash
    CALL PRINT_STR
    CALL GET_RATING_OFFSET
    MOV DX, BX
    CALL PRINT_STR
    CALL PRINT_NEWLINE
    INC SI
    POP CX
    LOOP DEL_LIST_LOOP
   
    LEA DX, p_del_num
    CALL PRINT_STR
   
    MOV AH, 01H
    INT 21H
    SUB AL, '1'
    MOV curr_index, AL
   
    CALL PRINT_NEWLINE
   
    MOV AL, curr_index
    MOV AH, 0
    MOV SI, AX
   
SHIFT_LOOP:
    MOV AX, SI
    INC AX    
    CMP AL, candidate_count
    JAE FINISH_SHIFT
   
    PUSH SI
   
    MOV AX, SI
    MOV BL, NAME_SIZE
    MUL BL
    LEA DI, names_arr
    ADD DI, AX
   
    MOV AX, SI
    INC AX
    MOV BL, NAME_SIZE
    MUL BL
    LEA BX, names_arr
    ADD BX, AX
    MOV SI, BX
   
    MOV CX, NAME_SIZE
    REP MOVSB
   
    POP SI
   
    PUSH SI
   
    MOV AX, SI
    MOV BL, RATING_SIZE
    MUL BL
    LEA DI, ratings_arr
    ADD DI, AX
   
    MOV AX, SI
    INC AX
    MOV BL, RATING_SIZE
    MUL BL
    LEA BX, ratings_arr
    ADD BX, AX
    MOV SI, BX
   
    MOV CX, RATING_SIZE
    REP MOVSB
   
    POP SI
   
    INC SI
    JMP SHIFT_LOOP
 
FINISH_SHIFT:
    DEC candidate_count
    LEA DX, msg_deleted
    CALL PRINT_STR
    JMP DEL_DONE
 
DEL_NO_REC:
    LEA DX, msg_no_rec
    CALL PRINT_STR
 
DEL_DONE:
    CALL PRINT_NEWLINE
    CALL PRINT_NEWLINE
    LEA DX, msg_press_key
    CALL PRINT_STR
    MOV AH, 07H
    INT 21H
    RET
PROC_DELETE ENDP
 
; ================= HELPERS =================
 
; Print a string using a specific attribute
PRINT_COLOR_STR PROC
    ; Input: DX = Offset of string (terminated by $), BL = Attribute
    PUSH AX
    PUSH BX
    PUSH CX
    PUSH SI
   
    MOV SI, DX
   
PRINT_COLOR_LOOP:
    MOV AL, [SI]
    CMP AL, '$'
    JE PRINT_COLOR_DONE
   
    ; Write Char/Attr at cursor position
    MOV AH, 09H
    MOV BH, 0 ; Page 0
    MOV CX, 1 ; Count 1
    INT 10H
   
    ; Advance Cursor manually (INT 10,09 doesn't advance)
    MOV AH, 03H ; Get cursor
    MOV BH, 0
    INT 10H
   
    INC DL      ; Next col
    MOV AH, 02H ; Set cursor
    INT 10H
   
    INC SI
    JMP PRINT_COLOR_LOOP
   
PRINT_COLOR_DONE:
    POP SI
    POP CX
    POP BX
    POP AX
    RET
PRINT_COLOR_STR ENDP
 
PRINT_STR PROC
    MOV AH, 09H
    INT 21H
    RET
PRINT_STR ENDP
 
PRINT_NEWLINE PROC
    LEA DX, newline
    MOV AH, 09H
    INT 21H
    RET
PRINT_NEWLINE ENDP
 
SAVE_NAME PROC
    MOV AL, candidate_count
    MOV BL, NAME_SIZE
    MUL BL
    LEA DI, names_arr
    ADD DI, AX
    LEA SI, input_buffer + 2
    MOV CL, [input_buffer + 1]
    MOV CH, 0
    REP MOVSB
    MOV BYTE PTR [DI], '$'
    RET
SAVE_NAME ENDP
 
SAVE_RATING PROC
    MOV AL, candidate_count
    MOV BL, RATING_SIZE
    MUL BL
    LEA DI, ratings_arr
    ADD DI, AX
    LEA SI, input_buffer + 2
    MOV CL, [input_buffer + 1]
    MOV CH, 0
    REP MOVSB
    MOV BYTE PTR [DI], '$'
    RET
SAVE_RATING ENDP
 
GET_NAME_OFFSET PROC
    MOV AX, SI
    MOV BL, NAME_SIZE
    MUL BL
    LEA BX, names_arr
    ADD BX, AX
    RET
GET_NAME_OFFSET ENDP
 
GET_RATING_OFFSET PROC
    MOV AX, SI
    MOV BL, RATING_SIZE
    MUL BL
    LEA BX, ratings_arr
    ADD BX, AX
    RET
GET_RATING_OFFSET ENDP
 
PRINT_NUM PROC
    PUSH AX
    PUSH BX
    PUSH DX
   
    MOV BL, 10
    DIV BL      
    MOV BX, AX  
   
    CMP BL, 0  
    JE SKIP_TENS
   
    MOV DL, BL
    ADD DL, '0'
    MOV AH, 02H
    INT 21H
   
SKIP_TENS:
    MOV DL, BH
    ADD DL, '0'
    MOV AH, 02H
    INT 21H
   
    POP DX
    POP BX
    POP AX
    RET
PRINT_NUM ENDP
 
END MAIN