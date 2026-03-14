.model small
.code
.stack 100
start:
 
    mov ah, 09h
    mov bl,0Eh ; color
    mov cx, 6
    int 10h    
 
    mov ah, 02h
    mov cl, 73
    mov dl, cl
    int 21h
 
    mov ah, 02h
    mov cl, 32
    mov dl, cl
    int 21h
 
    mov ah, 09h
    mov bl, 04h
    mov cx, 1
    int 10h  
    mov ah, 09h
    mov bl, 84h ; BLINK
    mov cx, 1
    int 10h  
 
    mov ah, 02h
    mov cl, 03h
    mov dl, cl
    int 21h
 
    mov ah, 02h
    mov cl, 32
    mov dl, cl
    int 21h
 
    mov ah, 02h
    mov cl, 85
    mov dl, cl
    int 21h
 
    mov ah, 02h
    mov cl, 32
    mov dl, cl
    int 21h
 
int 27h
end start