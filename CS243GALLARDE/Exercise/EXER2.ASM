;Filename: Exer2.asm
;Displaying single characters, numbers. and symbols
; Name: Joel Theo Gallarde
;Date: August 14, 2025

.model small ; directive to use "small" memory model
.code ; section of program containing executable code.
.stack 100 ; define the size of the program stack
start: ; start of program

        ;a
       mov ah,02h ; Set AH to display a character
        mov cl,41h 
        mov dl,cl   
        int 21h  
        ;b
        mov ah,02h
        mov cl, 42h
        mov dl,cl
        int 21h
;c

        mov ah,02h
        mov cl, 43h
        mov dl,cl 
        int 21h
  ;d
        mov ah,02h
        mov cl, 44h
        mov dl,cl
        int 21h
;e

        mov ah,02h
        mov cl, 45h
        mov dl,cl 
        int 21h
;f
        mov ah,02h
        mov cl, 46h
        mov dl,cl 
        int 21h
;g
        mov ah,02h
        mov cl, 47h
        mov dl,cl 
        int 21h
;h
        mov ah,02h
        mov cl, 48h
        mov dl,cl 
        int 21h
;i
        mov ah,02h
        mov cl, 49h
        mov dl,cl 
        int 21h
;j
        mov ah,02h
        mov cl, 4Ah
        mov dl,cl
        int 21h 
;k
        mov ah, 02h
        mov cl, 4Bh
        mov dl,cl 
        int 21h
;l
        mov ah, 02h
        mov cl, 4Ch
        mov dl,cl 
        int 21h
;m
        mov ah, 02h
        mov cl, 4Dh
        mov dl,cl 
        int 21h
;n
        mov ah, 02h
        mov cl, 4Eh
        mov dl,cl
        int 21h
;o
        mov ah, 02h
        mov cl, 4Fh
        mov dl,cl 
        int 21h
;p
        mov ah, 02h
        mov cl, 50h
        mov dl,cl 
        int 21h
;q
        mov ah, 02h
        mov cl, 51h
        mov dl,cl 
        int 21h 
;r
        mov ah, 02h
        mov cl, 52h
        mov dl,cl
        int 21h
;s
        mov ah, 02h
        mov cl, 53h
        mov dl, cl
        int 21h        
  ;t
        mov ah, 02h
        mov cl, 54h
        mov dl, cl
        int 21h   

       
;u
        mov ah, 02h
        mov cl, 55h
        mov dl, cl
        int 21h     
;v
        mov ah, 02h
        mov cl, 56h
        mov dl, cl
        int 21h     
;w
        mov ah, 02h
        mov cl, 57h
        mov dl, cl
        int 21h     
;x
        mov ah, 02h
        mov cl, 58h
        mov dl, cl
        int 21h     
;y
        mov ah, 02h
        mov cl, 59h
        mov dl, cl
        int 21h     
;z
        mov ah, 02h
        mov cl, 5Ah
        mov dl, cl
        int 21h     

          




int 27h ; terminate
end start ; end program