; Filename: Exer21.asm
; Programmer Name: Gallarde, Joel Theo C..
; Date: SEPTEMBER 18, 2025
; Description: This assembly language program will ask input for information, then
; display the inputted information.

.MODEL SMALL
.STACK 100h

.DATA
; --- Titles & Prompts ---
    Title1       DB 13,10,'FISHBOOK ACCOUNT REGISTRATION',13,10,'$'
    PromptName   DB 13,10,'Enter Full Name: $'
    PromptBday   DB 13,10,'Enter Birthday: $'
    PromptGender DB 13,10,'Enter Gender: $'
    PromptEmail  DB 13,10,'Enter Email Address: $'
    PromptPass   DB 13,10,'Enter Password: $'

; --- Buffers ---
    BufName      DB 50,0,50 DUP('$')
    BufBday      DB 50,0,50 DUP('$')
    BufGender    DB 50,0,50 DUP('$')
    BufEmail     DB 50,0,50 DUP('$')
    BufPass      DB 50,0,50 DUP('$')

; --- Labels ---
    LblReview    DB 13,10,'Please review your account registration details:',13,10,'$'
    LblFullName  DB 'Full Name:         |',0
    LblBirthday  DB 'Birthday:          |',0
    LblGender    DB 'Gender:            |',0
    LblEmail     DB 'Email Address:     |',0
    LblPassword  DB 'Password:          |',0

; --- Buttons ---
    BtnSubmit    DB ' SUBMIT ',0
    BtnCancel    DB ' CANCEL ',0
    BtnEdit      DB ' EDIT ',0

; --- Colors ---
    ATTR_SUMMARY EQU 17h   ; Blue bg, white fg
    ATTR_BUTTON  EQU 47h   ; Red bg, white fg
    ATTR_BORDER  EQU 0Fh   ; White border (changed from 07h)

; --- Box drawing chars (CP437) - THIN single lines ---
    UL EQU 218   ; ┌ (thin upper left)
    UR EQU 191   ; ┐ (thin upper right)
    LL EQU 192   ; └ (thin lower left)
    LR EQU 217   ; ┘ (thin lower right)
    H  EQU 196   ; ─ (thin horizontal)
    V  EQU 179   ; │ (thin vertical)
    LefT EQU 195   ; ├ (thin left T-junction)
    RT EQU 180   ; ┤ (thin right T-junction)

; --- Box coordinates ---
    TopRow   EQU 10
    LeftCol  EQU 6
    BotRow   EQU 20
    RightCol EQU 55  ; Make table narrower - removed right margin

.CODE
MAIN PROC
    mov ax,@data
    mov ds,ax

    ; Clear screen
    mov ax,0003h
    int 10h

    ; Title
    mov dx,OFFSET Title1
    mov ah,9
    int 21h

    ; Inputs
    mov dx,OFFSET PromptName
    mov ah,9
    int 21h
    mov dx,OFFSET BufName
    mov ah,0Ah
    int 21h

    mov dx,OFFSET PromptBday
    mov ah,9
    int 21h
    mov dx,OFFSET BufBday
    mov ah,0Ah
    int 21h

    mov dx,OFFSET PromptGender
    mov ah,9
    int 21h
    mov dx,OFFSET BufGender
    mov ah,0Ah
    int 21h

    mov dx,OFFSET PromptEmail
    mov ah,9
    int 21h
    mov dx,OFFSET BufEmail
    mov ah,0Ah
    int 21h

    mov dx,OFFSET PromptPass
    mov ah,9
    int 21h
    mov dx,OFFSET BufPass
    mov ah,0Ah
    int 21h

    ; Review header
    mov dx,OFFSET LblReview
    mov ah,9
    int 21h

    ; Draw filled blue table with white border
    call DrawFilledBox

    ; Print labels/values inside with thin white separators
    mov bl,ATTR_SUMMARY

    ; Full Name - Row 11
    mov dh,11
    mov dl,8
    lea si,LblFullName
    mov cx,0FFFFh
    call PrintStrColor
    mov dl,30  ; Adjusted column position for better alignment
    lea si,BufName+2
    mov cl,[BufName+1]
    mov ch,0
    call PrintStrColor

    ; Thin white line after Full Name
    mov dh,12
    call DrawThinHorizontalLine

    ; Birthday - Row 13
    mov dh,13
    mov dl,8
    lea si,LblBirthday
    mov cx,0FFFFh
    call PrintStrColor
    mov dl,30
    lea si,BufBday+2
    mov cl,[BufBday+1]
    mov ch,0
    call PrintStrColor

    ; Thin white line after Birthday
    mov dh,14
    call DrawThinHorizontalLine

    ; Gender - Row 15
    mov dh,15
    mov dl,8
    lea si,LblGender
    mov cx,0FFFFh
    call PrintStrColor
    mov dl,30
    lea si,BufGender+2
    mov cl,[BufGender+1]
    mov ch,0
    call PrintStrColor

    ; Thin white line after Gender
    mov dh,16
    call DrawThinHorizontalLine

    ; Email - Row 17
    mov dh,17
    mov dl,8
    lea si,LblEmail
    mov cx,0FFFFh
    call PrintStrColor
    mov dl,30
    lea si,BufEmail+2
    mov cl,[BufEmail+1]
    mov ch,0
    call PrintStrColor

    ; Thin white line after Email
    mov dh,18
    call DrawThinHorizontalLine

    ; Password - Row 19
    mov dh,19
    mov dl,8
    lea si,LblPassword
    mov cx,0FFFFh
    call PrintStrColor
    mov dl,30
    lea si,BufPass+2
    mov cl,[BufPass+1]
    mov ch,0
    call PrintStrColor

    ; Buttons (positioned to align with table)
    mov bl,ATTR_BUTTON
    mov dh,22  ; Move buttons to row 22 (2 rows below table)
    mov dl,8   ; Align with table left edge
    call SetCursorPosition
    lea si,BtnSubmit
    mov cx,0FFFFh
    call PrintStrColor

    mov dh,22
    mov dl,18  ; Closer spacing
    call SetCursorPosition
    lea si,BtnCancel
    mov cx,0FFFFh
    call PrintStrColor

    mov dh,22
    mov dl,28  ; Closer spacing
    call SetCursorPosition
    lea si,BtnEdit
    mov cx,0FFFFh
    call PrintStrColor

    ; Wait for key
    mov ah,1
    int 21h

    mov ax,4C00h
    int 21h
MAIN ENDP

; --- SetCursorPosition: helper to set cursor position ---
SetCursorPosition PROC
    push ax
    push bx
    mov ah, 02h
    mov bh, 0
    int 10h
    pop bx
    pop ax
    ret
; --- DrawThinHorizontalLine: draws a thin white line at row DH WITHOUT middle vertical ---
DrawThinHorizontalLine PROC
    push ax
    push bx
    push cx
    push dx

    mov bl, 0Fh  ; White on black for the thin separator line
    mov dl, LeftCol
    
    ; Left T-junction
    mov al, LefT       ; ├ (thin left T-junction)
    call PutCharAtAttr
    
    mov dl, LeftCol
    inc dl
thin_line_loop:
    cmp dl, RightCol
    jge thin_line_end
    
    mov al, H        ; ─ (thin horizontal line) - no interruption
    call PutCharAtAttr
    
    inc dl
    jmp thin_line_loop
    
thin_line_end:
    ; Right T-junction
    mov al, RT       ; ┤ (thin right T-junction)
    call PutCharAtAttr

    pop dx
    pop cx
    pop bx
    pop ax
    ret
DrawThinHorizontalLine ENDP

; --- DrawFilledBox: fills area with blue, NO middle vertical line ---
DrawFilledBox PROC
    push ax
    push bx
    push cx
    push dx

    ; Fill interior with blue - complete rows
    mov bl,ATTR_SUMMARY
    mov bh,0
    mov al,' '

    mov dh,TopRow
    inc dh
fill_rows:
    cmp dh,BotRow
    jge fill_done
    mov dl,LeftCol
    inc dl
    mov ah,02h
    mov bh,0
    int 10h
    mov cx,RightCol
    sub cx,LeftCol
    dec cx
    mov ah,09h
    mov al,' '
    mov bh,0
    int 10h
    inc dh
    jmp fill_rows
fill_done:

    ; White border - ONLY outer border, no middle vertical
    mov bl,ATTR_BORDER

    ; Top border
    mov dh,TopRow
    mov dl,LeftCol
    mov al,UL
    call PutCharAtAttr
    mov dl,LeftCol
    inc dl
top_h_loop:
    cmp dl,RightCol
    jge top_h_end
    mov al,H
    call PutCharAtAttr
    inc dl
    jmp top_h_loop
top_h_end:
    mov al,UR
    call PutCharAtAttr

    ; Bottom border
    mov dh,BotRow
    mov dl,LeftCol
    mov al,LL
    call PutCharAtAttr
    mov dl,LeftCol
    inc dl
bot_h_loop:
    cmp dl,RightCol
    jge bot_h_end
    mov al,H
    call PutCharAtAttr
    inc dl
    jmp bot_h_loop
bot_h_end:
    mov al,LR
    call PutCharAtAttr

    ; Left vertical ONLY
    mov dl,LeftCol
    mov dh,TopRow
    inc dh
left_v_loop:
    cmp dh,BotRow
    jge left_v_end
    mov al,V
    call PutCharAtAttr
    inc dh
    jmp left_v_loop
left_v_end:

    ; Right vertical ONLY
    mov dl,RightCol
    mov dh,TopRow
    inc dh
right_v_loop:
    cmp dh,BotRow
    jge right_v_end
    mov al,V
    call PutCharAtAttr
    inc dh
    jmp right_v_loop
right_v_end:

    ; NO MIDDLE VERTICAL LINE - removed completely

    pop dx
    pop cx
    pop bx
    pop ax
    ret
DrawFilledBox ENDP

; --- PutCharAtAttr: write AL at (DH,DL) with attr BL ---
; AL = character to print
; BL = attribute (color)
; DH = row, DL = column
PutCharAtAttr PROC
    push ax
    push bx
    push cx
    push dx

    ; Set cursor position
    mov ah, 02h
    mov bh, 0
    int 10h

    ; Print character with attribute
    mov ah, 09h
    mov bh, 0
    mov cx, 1
    int 10h

    pop dx
    pop cx
    pop bx
    pop ax
    ret
PutCharAtAttr ENDP

; --- PrintStrColor:
; If CX=0FFFFh → SI points to zero-terminated string
; Else CX = exact length (for 0Ah input buffers)
; Prints at (DH,DL) with attr BL
PrintStrColor PROC
    push ax
    push bx
    push cx
    push dx
    push si
    push di

    cmp cx, 0FFFFh
    jne  short len_known

    ; Compute length for zero-terminated string into CX
    xor cx, cx
    mov di, si
len_count:
    mov al, [di]
    cmp al, 0
    je  short len_known
    inc di
    inc cx
    jmp short len_count

len_known:
next_char:
    cmp cx, 0
    je  short str_done

    ; Set cursor
    mov ah, 02h
    mov bh, 0
    int 10h

    ; Print one char with attr
    mov al, [si]
    push cx
    mov ah, 09h
    mov bh, 0
    mov cx, 1
    int 10h
    pop  cx

    inc dl
    inc si
    dec cx
    jmp short next_char

str_done:
    pop di
    pop si
    pop dx
    pop cx
    pop bx
    pop ax
    ret
PrintStrColor ENDP

END MAIN