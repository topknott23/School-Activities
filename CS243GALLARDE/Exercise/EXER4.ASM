;Filename: Exer4.asm
;Displaying single characters, numbers. and symbols
; Name: Joel Theo Gallarde
;Date: August 14, 2025

.model small ; directive to use "small" memory model
.code ; section of program containing executable code.
.stack 100 ; define the size of the program stack
start: ; start of program

        mov ah,02h

      ;a
        mov cl,41h
        mov dl,cl   
        int 21h  
;b

        mov cl,42h
        mov dl,cl   
        int 21h 
;o
  
        mov cl,4Fh
        mov dl,cl
        int 21h
;u
        mov cl, 55h
        mov dl,cl
        int 21h
;t
        mov cl, 54h
        mov dl,cl 
        int 21h
        
        mov cl, 20h
        mov dl,cl       
        int 21h


        mov cl, 4Dh 
        mov dl,cl        
        int 21h 

        mov cl, 45h
        mov dl,cl      
        int 21h

        mov cl, 20h
        mov dl,cl     
        int 21h

        mov cl, 0Ah
        mov dl,cl
        int 21h

        mov cl, 0Ah
        mov dl,cl
        int 21h

   




        mov cl, 49h
        mov dl,cl 
        int 21h

        mov cl, 44h
        mov dl,cl
        int 21h

        mov cl, 20h
        mov dl,cl
        int 21h

        mov cl, 4Eh
        mov dl,cl
        int 21h

        mov cl, 55h
        mov dl, cl
        int 21h  

        mov cl, 4Dh
        mov dl,cl 
        int 21h

        mov cl, 42h
        mov dl,cl
        int 21h

        mov cl, 45h
        mov dl,cl 
        int 21h

        mov cl, 52h
        mov dl,cl
        int 21h

        mov cl, 3Ah
        mov dl,cl
        int 21h

        mov cl, 20h
        mov dl,cl
        int 21h 

        mov cl,32h
        mov dl,cl   
        int 21h 

        
        mov cl,34h
        mov dl,cl   
        int 21h  

        
        mov cl, 2Dh
        mov dl,cl
        int 21h

        mov cl,34h
        mov dl,cl   
        int 21h 

        mov cl,37h
        mov dl,cl   
        int 21h 

        mov cl,30h
        mov dl,cl   
        int 21h 

        mov cl,31h
        mov dl,cl   
        int 21h 

        mov cl,2Dh
        mov dl,cl   
        int 21h 

        mov cl,33h
        mov dl,cl   
        int 21h 
        mov cl,38h
        mov dl,cl   
        int 21h 
        mov cl,39h
        mov dl,cl   
        int 21h 



        mov cl, 0Ah
        mov dl,cl 
        int 21h


        ;ANSWER HERE
        
        mov cl, 46h
        mov dl,cl 
        int 21h

        
        mov cl, 49h
        mov dl,cl 
        int 21h

        mov cl, 52h
        mov dl,cl
        int 21h

        mov cl, 53h
        mov dl, cl
        int 21h  

        mov cl, 54h
        mov dl, cl
        int 21h 

        mov cl, 20h
        mov dl, cl
        int 21h 

        mov cl, 4Eh
        mov dl,cl
        int 21h

        mov cl,41h 
        mov dl,cl  
        int 21h

        mov cl, 4Dh
        mov dl,cl 
        int 21h

        mov cl, 45h
        mov dl,cl 
        int 21h

        mov cl, 3Ah
        mov dl,cl
        int 21h

        mov cl, 20h
        mov dl,cl
        int 21h

         mov cl, 4Ah
        mov dl,cl
        int 21h 

        mov ah, 02h
        mov cl, 4Fh
        mov dl,cl 
        int 21h

         mov cl, 45h
        mov dl,cl 
        int 21h

        mov cl, 4Ch
        mov dl,cl 
        int 21h

        mov cl, 20h
        mov dl,cl 
        int 21h

        mov cl, 54h
        mov dl, cl
        int 21h  

        mov cl, 48h
        mov dl,cl 
        int 21h

        mov cl, 45h
        mov dl,cl 
        int 21h

        mov cl, 4Fh
        mov dl,cl 
        int 21h



        ;ANSWER HERE

        
        mov cl, 0Ah
        mov dl,cl  
        int 21h

        mov cl, 4Dh
        mov dl,cl 
        int 21h

        mov cl, 49h
        mov dl,cl 
        int 21h

        mov cl, 44h
        mov dl,cl
        int 21h

        mov cl, 44h
        mov dl,cl
        int 21h
        
        mov cl, 4Ch
        mov dl,cl 
        int 21h

        mov cl, 45h
        mov dl,cl 
        int 21h

        mov cl, 20h  
        mov dl,cl
        int 21h

        mov cl, 4Eh
        mov dl,cl
        int 21h

        mov cl,41h 
        mov dl,cl   
        int 21h

        mov cl, 4Dh
        mov dl,cl 
        int 21h

        mov cl, 45h
        mov dl,cl 
        int 21h

        mov cl, 3Ah
        mov dl,cl
        int 21h

        mov cl, 20h
        mov dl,cl 
        int 21h

     mov cl,43h 
        mov dl,cl   
        int 21h 

        mov cl, 41h
        mov dl,cl
        int 21h

        mov cl, 50h
        mov dl,cl 
        int 21h

        mov cl, 55h
        mov dl, cl
        int 21h  
        mov cl, 54h
        mov dl, cl
        int 21h 
        mov cl, 4Ch
        mov dl,cl 
        int 21h
        mov cl, 49h
        mov dl,cl 
        int 21h

    

        mov cl, 0Ah
        mov dl,cl
        int 21h 

        ; ANSWER HERE

        mov cl, 4Ch
        mov dl,cl 
        int 21h

        mov cl,41h 
        mov dl,cl   
        int 21h  

        mov cl, 53h
        mov dl, cl
        int 21h

        mov cl, 54h
        mov dl, cl
        int 21h   

        mov cl, 20h
        mov dl, cl
        int 21h;

        mov cl, 4Eh
        mov dl,cl
        int 21h

        mov cl,41h 
        mov dl,cl   
        int 21h

        mov cl, 4Dh
        mov dl,cl 
        int 21h

        mov cl, 45h
        mov dl,cl 
        int 21h

        mov cl, 3Ah
        mov dl, cl
        int 21h 
        
        mov cl, 20h
        mov dl, cl
        int 21h 

        mov cl, 47h
        mov dl,cl 
        int 21h

        mov cl,41h 
        mov dl,cl   
        int 21h  
        mov cl, 4Ch
        mov dl,cl 
        int 21h
        mov cl, 4Ch
        mov dl,cl 
        int 21h
        mov cl,41h 
        mov dl,cl   
        int 21h
        mov cl, 52h
        mov dl,cl
        int 21h
        mov cl, 44h
        mov dl,cl
        int 21h
        mov cl, 45h
        mov dl,cl 
        int 21h


        ;ANSWER HERE

        mov cl, 0Ah
        mov dl, cl
        int 21h

        mov cl, 43h
        mov dl,cl 
        int 21h

        mov cl, 4Fh
        mov dl,cl 
        int 21h

        mov cl, 55h
        mov dl, cl
        int 21h 

        mov cl, 52h
        mov dl,cl
        int 21h

        mov cl, 53h
        mov dl, cl
        int 21h

        mov cl, 45h
        mov dl,cl 
        int 21h

        mov cl, 20h
        mov dl, cl
        int 21h

        mov cl,41h 
        mov dl,cl   
        int 21h 

        mov cl, 4Eh
        mov dl,cl
        int 21h

        mov cl, 44h
        mov dl,cl
        int 21h

        mov cl, 20h
        mov dl,cl 
        int 21h


        mov cl, 59h
        mov dl, cl
        int 21h 

        mov cl, 45h
        mov dl,cl 
        int 21h

        mov cl,41h 
        mov dl,cl   
        int 21h  
        
        mov cl, 52h
        mov dl,cl
        int 21h

        mov cl, 3Ah
        mov dl, cl
        int 21h
        
        mov cl, 20h
        mov dl, cl
        int 21h

        mov cl, 42h
        mov dl,cl
        int 21h

        mov cl, 53h
        mov dl, cl
        int 21h
        mov cl, 43h
        mov dl,cl 
        int 21h
        mov cl, 53h
        mov dl, cl
        int 21h  

        mov cl, 2Dh
        mov dl, cl
        int 21h
        mov cl, 32h
        mov dl, cl
        int 21h

        ;ANSWER HERE

        mov cl, 0Ah
        mov dl, cl
        int 21h

        mov cl, 53h
        mov dl, cl
        int 21h  

        mov cl, 43h
        mov dl,cl 
        int 21h

        mov cl, 48h
        mov dl,cl 
        int 21h
        
        mov cl, 4Fh
        mov dl,cl 
        int 21h

        mov cl, 4Fh
        mov dl,cl 
        int 21h

        mov cl, 4Ch
        mov dl,cl 
        int 21h

        mov cl, 3Ah
        mov dl,cl
        int 21h

        mov cl, 20h
        mov dl,cl
        int 21h

        

        ; mov cl, 0Ah
        ; mov dl,cl
        ; int 21h


    mov cl, 43h
        mov dl,cl 
        int 21h

        mov cl, 45h
        mov dl,cl 
        int 21h

        mov cl, 42h
        mov dl,cl
        int 21h
        mov cl, 55h
        mov dl, cl
        int 21h 
        mov cl, 20h
        mov dl, cl
        int 21h

        mov cl, 49h
        mov dl,cl 
        int 21h
        mov cl, 4Eh
        mov dl,cl
        int 21h
        mov cl, 53h
        mov dl, cl
        int 21h  
        mov cl, 54h
        mov dl, cl
        int 21h   
        mov cl, 49h
        mov dl,cl 
        int 21h
        mov cl, 54h
        mov dl, cl
        int 21h 
        mov cl, 55h
        mov dl, cl
        int 21h
        mov cl, 54h
        mov dl, cl
        int 21h 
        mov cl, 45h
        mov dl,cl 
        int 21h
        mov cl, 20h
        mov dl,cl 
        int 21h

        mov cl, 4Fh
        mov dl,cl 
        int 21h
        mov cl, 46h
        mov dl,cl 
        int 21h
        mov cl, 20h
        mov dl,cl
        int 21h

        mov cl, 54h
        mov dl, cl
        int 21h 
        mov cl, 45h
        mov dl,cl 
        int 21h
        mov cl, 43h
        mov dl,cl 
        int 21h
        mov cl, 48h
        mov dl,cl 
        int 21h
        mov cl, 4Eh
        mov dl,cl
        int 21h
        mov cl, 4Fh
        mov dl,cl 
        int 21h
        mov cl, 4Ch
        mov dl,cl 
        int 21h
        mov cl, 4Fh
        mov dl,cl 
        int 21h
        mov cl, 47h
        mov dl,cl 
        int 21h
        mov cl, 59h
        mov dl, cl
        int 21h 
        mov cl, 2Dh
        mov dl,cl
        int 21h
        mov cl, 55h
        mov dl, cl
        int 21h 
        mov cl, 4Eh
        mov dl,cl
        int 21h
        mov cl, 49h
        mov dl,cl 
        int 21h
        mov cl, 56h
        mov dl, cl
        int 21h
         mov cl, 45h
        mov dl,cl 
        int 21h
        mov cl, 52h
        mov dl,cl
        int 21h
         mov cl, 53h
        mov dl, cl
        int 21h
        mov cl, 49h
        mov dl,cl 
        int 21h
         mov cl, 54h
        mov dl, cl
        int 21h 
        mov cl, 59h
        mov dl, cl
        int 21h 




int 27h 
end start