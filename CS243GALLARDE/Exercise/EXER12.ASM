; Filename: Exer12.asm
; Displaying text using string variables
; Name: Joel Theo C. Gallarde
; Date: August 22, 2025

.model small
.stack 100h

.data
    line1 db "Joel Theo C. Gallarde", 0Ah, '$'
    line2 db "Bachelor of Science in Computer Science 2nd Year", 0Ah, '$'
    line3 db "College of Computer Studies", 0Ah, '$'
    line4 db "Cebu Institute of Technology - University", 0Ah, '$'

.code
start:
    mov ax, @data
    mov ds, ax

    mov ah, 09h
    mov dx, offset line1
    int 21h

    mov ah, 09h
    mov dx, offset line2
    int 21h

    mov ah, 09h
    mov dx, offset line3
    int 21h

    mov ah, 09h
    mov dx, offset line4
    int 21h



    int 27h    

end start