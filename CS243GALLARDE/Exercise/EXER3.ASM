;Filename: Exer3.asm
;Displaying single characters, numbers. and symbols
; Name: Joel Theo Gallarde
;Date: August 14, 2025

.model small ; directive to use "small" memory model
.code ; section of program containing executable code.
.stack 100 ; define the size of the program stack
start: ; start of program

        ;A
        mov ah,02h 
        mov cl,31h
        mov dl,cl   
        int 21h  

        mov ah,02h 
        mov cl, 20h
        mov dl,cl   
        int 21h 
        ;B
        mov ah,02h 
        mov cl,32h
        mov dl,cl   
        int 21h 
        ;C
        mov ah,02h 
        mov cl, 20h
        mov dl,cl   
        int 21h  
        ;D
        mov ah,02h 
        mov cl,33h
        mov dl,cl   
        int 21h  
        ;E
        mov ah,02h 
        mov cl, 20h
        mov dl,cl   
        int 21h 
        ;F
        mov ah,02h 
        mov cl,34h
        mov dl,cl   
        int 21h  
        ;G
        mov ah,02h 
        mov cl, 20h
        mov dl,cl   
        int 21h 
        ;H
        mov ah,02h 
        mov cl,35h
        mov dl,cl   
        int 21h  
        ;I
        mov ah,02h 
        mov cl, 20h
        mov dl,cl   
        int 21h 
        ;J
        mov ah,02h 
        mov cl,36h
        mov dl,cl   
        int 21h  
        ;K
        mov ah,02h 
        mov cl, 20h
        mov dl,cl   
        int 21h 
        ;L
        mov ah,02h 
        mov cl,37h
        mov dl,cl   
        int 21h  
        ;M
        mov ah,02h 
        mov cl, 20h
        mov dl,cl   
        int 21h 
        ;N
        mov ah,02h 
        mov cl,38h
        mov dl,cl   
        int 21h  
        ;O
        mov ah,02h 
        mov cl, 20h
        mov dl,cl   
        int 21h 
    ;P
        mov ah,02h 
        mov cl,39h
        mov dl,cl   
        int 21h  



int 27h ; terminate
end start ; end program