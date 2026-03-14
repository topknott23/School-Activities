; Filename: Exer7.asm
; Display with different foreground and background colors
; Name: Joel Theo C. Gallarde
; Date: August 28, 2025
 
.model small
.code
.stack 100
start:
 
    ;(Yellow)College
    mov bl,60H
    mov ah,09H
    mov cx,7
    int 10h
 
    mov ah,02h
    mov dl,"C"
    int 21h
    mov dl,"o"
    int 21h
    mov dl,"l"
    int 21h
    mov dl,"l"
    int 21h
    mov dl,"e"
    int 21h
    mov dl,"g"
    int 21h
    mov dl,"e"
    int 21h
 
    ;newline
    mov dl,0AH
    int 21h
    mov ah,09H
    mov bl,00H
    mov cx,100
    int 10h
 
    ;(Red)of
    mov bl,40h
    mov ah,09H
    mov cx,2
    int 10h
 
    mov ah,02h
    mov dl,"o"
    int 21h
    mov dl,"f"
    int 21h
 
    ;newline
    mov dl,0AH
    int 21h
    mov ah,09H
    mov bl,00H
    mov cx,100
    int 10h
 
    ;(Blue)Computer
    mov bl,10h
    mov ah,09H
    mov cx,8
    int 10h
 
    mov ah,02h
    mov dl,"C"
    int 21h
    mov dl,"o"
    int 21h
    mov dl,"m"
    int 21h
    mov dl,"p"
    int 21h
    mov dl,"u"
    int 21h
    mov dl,"t"
    int 21h
    mov dl,"e"
    int 21h
    mov dl,"r"
    int 21h
 
    ;newline
    mov dl,0AH
    int 21h
    mov ah,09H
    mov bl,00H
    mov cx,100
    int 10h
 
    ;(Black)Studies
    mov bl,30h
    mov ah,09h
    mov cx,7
    int 10h
 
    mov ah,02h
    mov dl,"S"
    int 21h
    mov dl,"t"
    int 21h
    mov dl,"u"
    int 21h
    mov dl,"d"
    int 21h
    mov dl,"i"
    int 21h
    mov dl,"e"
    int 21h
    mov dl,"s"
    int 21h
 
int 27H
end start