; MODERN_LOGIN_UI.ASM
; White background, solid red border, modern login form with input boxes
; Based on original code structure with improvements
 
.model small
.stack 100h
 
.data
row         db 1            ; 8-bit row counter for border loop
 
; UI Text strings
title1      db 'Please enter your details$'
title2      db 'Welcome back$'
emailLbl    db 'Email address$'
passLbl     db 'Password$'
rememberLbl db 'Remember for 30 days$'
forgotLbl   db 'Forgot password$'
signupBtn   db 'Sign up$'
googleBtn   db 'G   Sign in with Google$'
noacctLbl   db 'Don''t have an account? Sign up$'
creditLbl   db 'Created by: Joel Theo C. Gallarde$'
 
; Input field borders
inputTop    db '+--------------------------------------------+$'
inputMid    db '|                                            |$'
inputBot    db '+--------------------------------------------+$'
 
.code
start:
    mov ax, @data
    mov ds, ax
 
    ; Set 80x25 text mode
    mov ax, 0003h
    int 10h
 
    ; -------- Fill entire screen: white background (black text) --------
    mov ah, 06h
    xor al, al
    mov bh, 70h        ; attribute: black text (0) on white background (7) => 70h
    mov cx, 0000h      ; upper-left (row0,col0)
    mov dx, 184Fh      ; lower-right (row24,col79)
    int 10h
 
    ; -------- Draw red border around entire screen --------
    ; Top border (row 0)
    mov ah, 02h
    xor bh, bh
    xor dh, dh        ; dh = 0
    xor dl, dl        ; dl = 0
    int 10h
 
    mov ah, 09h       ; write character with attribute
    mov al, ' '       ; write spaces
    mov bl, 4Fh       ; white fg on red bg (attribute)
    xor bh, bh
    mov cx, 80
    int 10h
 
    ; Bottom border (row 24)
    mov ah, 02h
    xor bh, bh
    mov dh, 24
    xor dl, dl
    int 10h
 
    mov ah, 09h
    mov al, ' '
    mov bl, 4Fh
    xor bh, bh
    mov cx, 80
    int 10h
 
    ; Left & right columns (rows 1..23)
    mov cx, 23         ; number of rows to draw (1 through 23)
    mov byte ptr [row], 1
 
BorderLoop:
    ; Left column: set cursor to (row,0)
    mov dh, byte ptr [row]
    xor dl, dl
    mov ah, 02h
    xor bh, bh
    int 10h
 
    ; draw one space with red background at left
    push cx
    mov ah, 09h
    mov al, ' '
    mov bl, 4Fh
    xor bh, bh
    mov cx, 1
    int 10h
    pop cx
 
    ; Right column: set cursor to (row,79)
    mov dh, byte ptr [row]
    mov dl, 79
    mov ah, 02h
    xor bh, bh
    int 10h
 
    ; draw one space with red background at right
    push cx
    mov ah, 09h
    mov al, ' '
    mov bl, 4Fh
    xor bh, bh
    mov cx, 1
    int 10h
    pop cx
 
    ; increment row and loop
    inc byte ptr [row]
    loop BorderLoop
 
    ; -------- Place UI content (black on white) --------
    ; "Please enter your details" at row 3, centered
    mov ah, 02h
    xor bh, bh
    mov dh, 2
    mov dl, 17
    int 10h
    mov ah, 09h
    mov dx, offset title1
    int 21h
 
    ; "Welcome back" at row 5, centered and prominent
    mov ah, 02h
    xor bh, bh
    mov dh, 3
    mov dl, 17
    int 10h
    mov ah, 09h
    mov dx, offset title2
    int 21h
 
    ; -------- Email input field with box --------
    ; Top border at row 8
    mov ah, 02h
    xor bh, bh
    mov dh, 6
    mov dl, 17
    int 10h
    mov ah, 09h
    mov dx, offset inputTop
    int 21h
 
    ; Middle with label at row 9
    mov ah, 02h
    xor bh, bh
    mov dh, 7
    mov dl, 17
    int 10h
    mov ah, 09h
    mov dx, offset inputMid
    int 21h
 
    ; Email label inside box
    mov ah, 02h
    xor bh, bh
    mov dh, 7
    mov dl, 19
    int 10h
    mov ah, 09h
    mov dx, offset emailLbl
    int 21h
 
    ; Bottom border at row 10
    mov ah, 02h
    xor bh, bh
    mov dh, 8
    mov dl, 17
    int 10h
    mov ah, 09h
    mov dx, offset inputBot
    int 21h
 
    ; -------- Password input field with box --------
    ; Top border at row 12
    mov ah, 02h
    xor bh, bh
    mov dh, 10
    mov dl, 17
    int 10h
    mov ah, 09h
    mov dx, offset inputTop
    int 21h
 
    ; Middle with label at row 13
    mov ah, 02h
    xor bh, bh
    mov dh, 11
    mov dl, 17
    int 10h
    mov ah, 09h
    mov dx, offset inputMid
    int 21h
 
    ; Password label inside box
    mov ah, 02h
    xor bh, bh
    mov dh, 11
    mov dl, 19
    int 10h
    mov ah, 09h
    mov dx, offset passLbl
    int 21h
 
    ; Bottom border at row 14
    mov ah, 02h
    xor bh, bh
    mov dh, 12
    mov dl, 17
    int 10h
    mov ah, 09h
    mov dx, offset inputBot
    int 21h
 
    ; -------- Checkbox and options at row 16 --------
    ; Checkbox
    mov ah, 02h
    xor bh, bh
    mov dh, 13
    mov dl, 17
    int 10h
    mov ah, 0Eh
    mov al, '['
    int 10h
    mov al, ']'
    int 10h
    mov al, ' '
    int 10h
 
    ; Remember text
    mov ah, 09h
    mov dx, offset rememberLbl
    int 21h
 
    ; Forgot password (right aligned)
    mov ah, 02h
    xor bh, bh
    mov dh, 13
    mov dl, 48
    int 10h
    mov ah, 09h
    mov dx, offset forgotLbl
    int 21h
 
    ; -------- Blue Sign up button at row 18 --------
    mov ah, 02h
    xor bh, bh
    mov dh, 18
    mov dl, 17
    int 10h
 
    ; Draw blue button background
    mov ah, 09h
    mov al, ' '
    mov bl, 1Fh        ; white text on blue background
    xor bh, bh
    mov cx, 44         ; button width
    int 10h
 
    ; Center "Sign up" text in button
    mov ah, 02h
    xor bh, bh
    mov dh, 18
    mov dl, 37         ; centered position
    int 10h
    mov ah, 0Eh
    mov al, 'S'
    int 10h
    mov al, 'i'
    int 10h
    mov al, 'g'
    int 10h
    mov al, 'n'
    int 10h
    mov al, ' '
    int 10h
    mov al, 'u'
    int 10h
    mov al, 'p'
    int 10h
 
    ; -------- Google button with border at row 20-22 --------
    ; Top border
    mov ah, 02h
    xor bh, bh
    mov dh, 20
    mov dl, 17
    int 10h
    mov ah, 09h
    mov dx, offset inputTop
    int 21h
 
    ; Middle with Google text
    mov ah, 02h
    xor bh, bh
    mov dh, 21
    mov dl, 17
    int 10h
    mov ah, 09h
    mov dx, offset inputMid
    int 21h
 
    ; Google text inside box
    mov ah, 02h
    xor bh, bh
    mov dh, 21
    mov dl, 23
    int 10h
    mov ah, 09h
    mov dx, offset googleBtn
    int 21h
 
    ; Bottom border
    mov ah, 02h
    xor bh, bh
    mov dh, 22
    mov dl, 17
    int 10h
    mov ah, 09h
    mov dx, offset inputBot
    int 21h

     ; -------- "Don't have an account? Sign up" under Google button --------
    mov ah, 02h
    xor bh, bh
    mov dh, 23       ; row just below Google box
    mov dl, 25       ; a bit centered
    int 10h
    mov ah, 09h
    mov dx, offset noacctLbl
    int 21h
 
    ; -------- Footer text at bottom --------
    ; "Don't have an account" text (removed as not in target)
    ; Created by text at row 23
    mov ah, 02h
    xor bh, bh
    mov dh, 23
    mov dl, 2
    int 10h
    mov ah, 09h
    mov dx, offset creditLbl
    int 21h
 
    ; Wait for keypress, then exit
    mov ah, 00h
    int 16h
 
    mov ax, 4C00h
    int 21h
 
end start