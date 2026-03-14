; Filename: Exer13.asm
; Displaying August 2025 Calendar
; Name: Joel Theo C. Gallarde
; Date: August 22, 2025

.model small
.stack 100

.data 
    hl db "--------------------------------------------$", 0Ah
    nl db 0Ah, '$'
    sun db "SUN$", 0Ah
    mon db "MON$", 0Ah
    tues db "TUE$", 0Ah
    wed db "WED$", 0Ah
    thurs db "THUR$", 0Ah
    fri db "FRI$", 0Ah
    sat db "SAT$", 0Ah
    spc db "     $", 0Ah
    one db "  1  $", 0Ah
    two db "  2  $", 0Ah
    three db "  3  $", 0Ah
    four db "  4  $", 0Ah
    five db "  5  $", 0Ah
    six db "  6  $", 0Ah
    seven db "   7 $", 0Ah
    eight db "  8  $", 0Ah
    nine db "  9  $", 0Ah
    ten db " 10  $", 0Ah
    eleven db " 11  $", 0Ah
    twelve db "  12 $", 0Ah
    thirt db "  13 $", 0Ah
    fourt db "  14 $", 0Ah
    fift db " 15  $", 0Ah
    sixt db " 16  $", 0Ah
    sevent db " 17  $", 0Ah
    eightt db " 18  $", 0Ah
    ninet db "  19 $", 0Ah
    twenty db "  20 $", 0Ah
    tone db "  21 $", 0Ah
    ttwo db " 22  $", 0Ah
    tthree db " 23  $", 0Ah
    tfour db " 24  $", 0Ah
    tfive db " 25  $", 0Ah
    tsix db "  26 $", 0Ah
    tseven db "  27 $", 0Ah
    teight db "  28 $", 0Ah
    tnine db " 29  $", 0Ah
    thirty db " 30  $", 0Ah
    tttone db " 31  $", 0Ah
.code 
start:
    mov ax, @data
    mov ds, ax

    mov ah, 09h

    mov dx, offset hl
    int 21h

    mov dx, offset nl
    int 21h

    mov ah, 02h
    mov dl, '|'
    int 21h

    mov ah, 02h
    mov dl, ' '
    int 21h

    mov ah, 09h

    mov dx, offset sun 
    int 21h

    mov ah, 02h    
    mov dl, ' '
    int 21h

    mov ah, 02h
    mov dl, '|'
    int 21h

    mov ah, 02h    
    mov dl, ' '
    int 21h

    mov ah, 09h

    mov dx, offset mon
    int 21h

    mov ah, 02h    
    mov dl, ' '
    int 21h

    mov ah, 02h
    mov dl, '|'
    int 21h

    mov ah, 02h    
    mov dl, ' '
    int 21h

    mov ah, 09h

    mov dx, offset tues
    int 21h

    mov ah, 02h    
    mov dl, ' '
    int 21h

    mov ah, 02h
    mov dl, '|'
    int 21h

    mov ah, 02h    
    mov dl, ' '
    int 21h

    mov ah, 09h

    mov dx, offset wed
    int 21h

    mov ah, 02h    
    mov dl, ' '
    int 21h

    mov ah, 02h
    mov dl, '|'
    int 21h

    mov ah, 02h    
    mov dl, ' '
    int 21h

    mov ah, 09h

    mov dx, offset thurs
    int 21h

    mov ah, 02h    
    mov dl, ' '
    int 21h

    mov ah, 02h
    mov dl, '|'
    int 21h

    mov ah, 02h    
    mov dl, ' '
    int 21h

    mov ah, 09h

    mov dx, offset fri
    int 21h

    mov ah, 02h    
    mov dl, ' '
    int 21h

    mov ah, 02h
    mov dl, '|'
    int 21h

    mov ah, 02h    
    mov dl, ' '
    int 21h

    mov ah, 09h

    mov dx, offset sat
    int 21h

    mov ah, 02h    
    mov dl, ' '
    int 21h

    mov ah, 02h
    mov dl, '|'
    int 21h

    mov ah, 09h
    mov dx, offset nl
    int 21h

    mov ah, 09h
    mov dx, offset hl
    int 21h

    mov ah, 09h
    mov dx, offset nl
    int 21h

    mov ah, 02h
    mov dl, '|'
    int 21h

    mov ah, 09h
    mov dx, offset spc
    int 21h 

    mov ah, 02h
    mov dl, '|'
    int 21h

    mov ah, 09h
    mov dx, offset spc
    int 21h 

    mov ah, 02h
    mov dl, '|'
    int 21h

    mov ah, 09h
    mov dx, offset spc
    int 21h 

    mov ah, 02h
    mov dl, '|'
    int 21h

    mov ah, 09h
    mov dx, offset spc
    int 21h 

    mov ah, 02h
    mov dl, '|'
    int 21h

    mov ah, 09h
    mov dx, offset spc
    int 21h 

    mov ah, 02h
    mov dl, ' '
    int 21h

    mov ah, 02h
    mov dl, '|'
    int 21h

    mov ah, 09h
    mov dx, offset one
    int 21h 

    mov ah, 02h
    mov dl, '|'
    int 21h

    mov ah, 09h
    mov bl, 09h
    mov cx, 3d
    int 10h

    mov ah, 09h
    mov dx, offset two
    int 21h 

    mov ah, 02h
    mov dl, '|'
    int 21h

    mov ah, 09h
    mov dx, offset nl
    int 21h

    mov dx, offset hl
    int 21h

    mov dx, offset nl
    int 21h

    mov ah, 02h
    mov dl, '|'
    int 21h

    mov ah, 09h

    mov bl, 0ch
    mov cx, 3d
    int 10h

    mov dx, offset three
    int 21h 

    mov ah, 02h
    mov dl, '|'
    int 21h

    mov ah, 09h
    mov dx, offset four
    int 21h 

    mov ah, 02h
    mov dl, '|'
    int 21h

    mov ah, 09h
    mov dx, offset five
    int 21h 

    mov ah, 02h
    mov dl, '|'
    int 21h

    mov ah, 09h
    mov dx, offset six
    int 21h 

    mov ah, 02h
    mov dl, '|'
    int 21h

    mov ah, 09h
    mov dx, offset seven
    int 21h 

    mov ah, 02h
    mov dl, ' '
    int 21h

    mov ah, 02h
    mov dl, '|'
    int 21h

    mov ah, 09h
    mov dx, offset eight
    int 21h 

    mov ah, 02h
    mov dl, '|'
    int 21h

    mov ah, 09h
    mov bl, 09h
    mov cx, 3d
    int 10h

    mov ah, 09h
    mov dx, offset nine
    int 21h 

    mov ah, 02h
    mov dl, '|'
    int 21h

    mov ah, 09h
    mov dx, offset nl
    int 21h

    mov dx, offset hl
    int 21h

    mov dx, offset nl
    int 21h

    mov ah, 02h
    mov dl, '|'
    int 21h
   
    mov ah, 09h

    mov bl, 0ch
    mov cx, 3d
    int 10h 

    mov ah, 09h
    mov dx, offset ten
    int 21h 

    mov ah, 02h
    mov dl, '|'
    int 21h

    mov ah, 09h
    mov dx, offset eleven
    int 21h 

    mov ah, 02h
    mov dl, '|'
    int 21h

    mov ah, 09h
    mov dx, offset twelve
    int 21h 

    mov ah, 02h
    mov dl, '|'
    int 21h

    mov ah, 09h
    mov dx, offset thirt
    int 21h 

    mov ah, 02h
    mov dl, '|'
    int 21h

    mov ah, 09h
    mov dx, offset fourt
    int 21h 

    mov ah, 02h
    mov dl, ' '
    int 21h

    mov ah, 02h
    mov dl, '|'
    int 21h

    mov ah, 09h
    mov dx, offset fift
    int 21h 

    mov ah, 02h
    mov dl, '|'
    int 21h

    mov ah, 09h
    mov bl, 09h
    mov cx, 3d
    int 10h

    mov ah, 09h
    mov dx, offset sixt
    int 21h 

    mov ah, 02h
    mov dl, '|'
    int 21h

    mov ah, 09h
    mov dx, offset nl
    int 21h

    mov dx, offset hl
    int 21h
    
    mov dx, offset nl
    int 21h

    mov ah, 02h
    mov dl, '|'
    int 21h


    mov ah, 09h

    mov bl, 0ch
    mov cx, 3d
    int 10h

    mov ah, 09h
    mov dx, offset sevent
    int 21h 

    mov ah, 02h
    mov dl, '|'
    int 21h

    mov ah, 09h
    mov dx, offset eightt
    int 21h 

    mov ah, 02h
    mov dl, '|'
    int 21h

    mov ah, 09h
    mov dx, offset ninet
    int 21h 

    mov ah, 02h
    mov dl, '|'
    int 21h

    mov ah, 09h
    mov dx, offset twenty
    int 21h 

    mov ah, 02h
    mov dl, '|'
    int 21h

    mov ah, 09h
    mov dx, offset tone
    int 21h 

    mov ah, 02h
    mov dl, ' '
    int 21h

    mov ah, 02h
    mov dl, '|'
    int 21h

    mov ah, 09h
    mov dx, offset ttwo
    int 21h 

    mov ah, 02h
    mov dl, '|'
    int 21h

    mov ah, 09h
    mov bl, 09h
    mov cx, 3d
    int 10h

    mov ah, 09h
    mov dx, offset tthree
    int 21h 

    mov ah, 02h
    mov dl, '|'
    int 21h

    mov ah, 09h
    mov dx, offset nl
    int 21h

    mov dx, offset hl
    int 21h

    mov dx, offset nl
    int 21h

    mov ah, 02h
    mov dl, '|'
    int 21h

    mov ah, 09h

    mov bl, 0ch
    mov cx, 3d
    int 10h

    mov ah, 09h
    mov dx, offset tfour
    int 21h 

    mov ah, 02h
    mov dl, '|'
    int 21h

    mov ah, 09h
    mov dx, offset tfive
    int 21h 

    mov ah, 02h
    mov dl, '|'
    int 21h

    mov ah, 09h
    mov dx, offset tsix
    int 21h 

    mov ah, 02h
    mov dl, '|'
    int 21h

    mov ah, 09h
    mov dx, offset tseven
    int 21h 

    mov ah, 02h
    mov dl, '|'
    int 21h

    mov ah, 09h
    mov dx, offset teight
    int 21h 

    mov ah, 02h
    mov dl, ' '
    int 21h

    mov ah, 02h
    mov dl, '|'
    int 21h

    mov ah, 09h
    mov dx, offset tnine
    int 21h 

    mov ah, 02h
    mov dl, '|'
    int 21h

    mov ah, 09h
    mov bl, 09h
    mov cx, 3d
    int 10h

    mov ah, 09h
    mov dx, offset thirty
    int 21h 

    mov ah, 02h
    mov dl, '|'
    int 21h

    mov ah, 09h
    mov dx, offset nl
    int 21h

    mov dx, offset hl
    int 21h

    mov dx, offset nl
    int 21h

    mov ah, 02h
    mov dl, '|'
    int 21h

    mov ah, 09h

    mov bl, 0ch
    mov cx, 3d
    int 10h

    mov ah, 09h
    mov dx, offset tttone
    int 21h 

    mov ah, 02h
    mov dl, '|'
    int 21h

    mov ah, 09h
    mov dx, offset spc
    int 21h 

    mov ah, 02h
    mov dl, '|'
    int 21h

    mov ah, 09h
    mov dx, offset spc
    int 21h 

    mov ah, 02h
    mov dl, '|'
    int 21h

    mov ah, 09h
    mov dx, offset spc
    int 21h 

    mov ah, 02h
    mov dl, '|'
    int 21h

    mov ah, 09h
    mov dx, offset spc
    int 21h 

    mov ah, 02h
    mov dl, ' '
    int 21h

    mov ah, 02h
    mov dl, '|'
    int 21h

    mov ah, 09h
    mov dx, offset spc
    int 21h 

    mov ah, 02h
    mov dl, '|'
    int 21h

    mov ah, 09h
    mov bl, 09h
    mov cx, 3d
    int 10h

    mov ah, 09h
    mov dx, offset spc
    int 21h 

    mov ah, 02h
    mov dl, '|'
    int 21h

    mov ah, 09h
    mov dx, offset nl
    int 21h

    mov dx, offset hl
    int 21h


    int 27h

end start