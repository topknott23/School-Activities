; Filename: exer19.asm
; Name: Joel Theo C. Gallarde
; Date: September 11, 2025
; Description: This assembly language program will get string input and display back string.
.MODEL small
.STACK 200h

.DATA
    inputStr db 20 dup('$')  
    inputMsg db 'Enter a string: $' 
    outputMsg db 0Ah, 'You entered: $' 

.CODE
Main:
    mov ax, @data
    mov ds, ax

    mov dx, offset inputMsg
    mov ah, 09h
    int 21h

    mov si, offset inputStr  

get_input:

    mov ah, 01h               
    int 21h                  

    cmp al, 13               
    je done_input              

  
    mov [si], al               
    inc si                
    jmp get_input             

done_input:
   
    mov byte ptr [si], '$'     

    
    mov dx, offset outputMsg
    mov ah, 09h
    int 21h

   
    mov dx, offset inputStr
    mov ah, 09h
    int 21h

    
    mov ax, 4C00h
    int 21h

END Main