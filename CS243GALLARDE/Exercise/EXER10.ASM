; Filename: Exer10.asm
; Displaying a duck with blinking eyes
; Name: Joel Theo C. Gallarde
; Date: August 22, 2025
.model small
.stack 100

.data
    ts db "  $", 0Ah
    px db " $", 0Ah
    px2 db "        $", 0Ah
    px3 db "                $", 0Ah
    nl db 0Ah, '$'

.code
start:
    mov ax, @data
    mov ds, ax
    
    mov ah, 09h

    mov bl, 00h
    mov cx, 1d
    int 10h

    mov dx, offset px
    int 21h


    mov bl, 00h
    mov cx, 1d
    int 10h

    mov dx, offset px
    int 21h


    mov bl, 00h
    mov cx, 1d
    int 10h

    mov dx, offset px
    int 21h


    mov bl, 00h
    mov cx, 1d
    int 10h

    mov dx, offset px
    int 21h


    mov bl, 00h
    mov cx, 1d
    int 10h

    mov dx, offset px
    int 21h


    mov bl, 00h
    mov cx, 1d
    int 10h

    mov dx, offset px
    int 21h

    mov bl, 00h
    mov cx, 1d
    int 10h

    mov dx, offset px
    int 21h

    mov bl, 00h
    mov cx, 1d
    int 10h

    mov dx, offset px
    int 21h

    mov bl, 6Eh
    mov cx, 8d
    int 10h

    mov dx, offset px2
    int 21h

    mov dx, offset nl
    int 21h

    ; ROW 2

    mov bl, 00h
    mov cx, 1d
    int 10h

    mov dx, offset px
    int 21h


    mov bl, 00h
    mov cx, 1d
    int 10h

    mov dx, offset px
    int 21h


    mov bl, 00h
    mov cx, 1d
    int 10h

    mov dx, offset px
    int 21h


    mov bl, 00h
    mov cx, 1d
    int 10h

    mov dx, offset px

    int 21h
    mov bl, 00h
    mov cx, 1d
    int 10h

    mov dx, offset px
    int 21h

    mov bl, 00h
    mov cx, 1d
    int 10h

    mov dx, offset px
    int 21h

    mov bl, 6Eh
    mov cx, 12d
    int 10h

    mov dx, offset px3
    int 21h

    mov dx, offset nl
    int 21h
               
    ; ROW 3

    mov bl, 00h
    mov cx, 1d
    int 10h

    mov dx, offset px
    int 21h


    mov bl, 00h
    mov cx, 1d
    int 10h

    mov dx, offset px
    int 21h


    mov bl, 00h
    mov cx, 1d
    int 10h

    mov dx, offset px
    int 21h


    mov bl, 00h
    mov cx, 2d
    int 10h

    mov dx, offset ts
    int 21h

    mov bl, 00h
    mov cx, 1d
    int 10h

    mov dx, offset px
    int 21h

    mov bl, 44h
    mov cx, 2d
    int 10h

    mov dx, offset ts
    int 21h

    mov bl, 6Eh
    mov cx, 2d
    int 10h

    mov dx, offset ts
    int 21h
    
    mov bl, 00h
    mov cx, 2d
    int 10h

    mov dx, offset ts
    int 21h

    mov bl, 6Eh
    mov cx, 2d
    int 10h

    mov dx, offset ts
    int 21h
    mov bl, 6Eh
    mov cx, 2d
    int 10h

    mov dx, offset ts
    int 21h
    mov bl, 6Eh
    mov cx, 2d
    int 10h

    mov dx, offset ts
    int 21h
    ; WE PUT BLINKING HERE


    mov dx, offset nl
    int 21h


    mov bl, 00h
    mov cx, 1d
    int 10h

    mov dx, offset px
    int 21h



    mov bl, 00h
    mov cx, 1d
    int 10h

    mov dx, offset px
    int 21h

    mov bl, 44h
    mov cx, 2d
    int 10h

    mov dx, offset ts
    int 21h

    mov bl, 44h
    mov cx, 2d
    int 10h

    mov dx, offset ts
    int 21h

    mov bl, 44h
    mov cx, 2d
    int 10h

    mov dx, offset ts
    int 21h



    mov bl, 6Eh
    mov cx, 10d
    int 10h

    mov dx, offset px3
    int 21h

    mov dx, offset nl
    int 21h

    ; ROW 5
    ; ROW 4

    mov bl, 00h
    mov cx, 1d
    int 10h

    mov dx, offset px
    int 21h

    mov bl, 00h
    mov cx, 1d
    int 10h

    mov dx, offset px
    int 21h
    mov bl, 00h
    mov cx, 1d
    int 10h

    mov dx, offset px
    int 21h

    mov bl, 00h
    mov cx, 1d
    int 10h

    mov dx, offset px
    int 21h

    mov bl, 44h
    mov cx, 2d
    int 10h

    mov dx, offset ts
    int 21h

    mov bl, 44h
    mov cx, 2d
    int 10h

    mov dx, offset ts
    int 21h


    mov bl, 44h
    mov cx, 2d
    int 10h

    mov dx, offset ts
    int 21h

    mov bl, 6Eh
    mov cx, 6d
    int 10h

    mov dx, offset px3
    int 21h

    mov dx, offset nl
    int 21h

    ; ROW 6
    mov bl, 00h
    mov cx, 2d
    int 10h

    mov dx, offset ts
    int 21h
    mov bl, 00h
    mov cx, 2d
    int 10h

    mov dx, offset ts
    int 21h
    mov bl, 00h
    mov cx, 2d
    int 10h

    mov dx, offset ts
    int 21h
    mov bl, 00h
    mov cx, 2d
    int 10h

    mov dx, offset ts
    int 21h

    mov bl, 6eh
    mov cx, 2d
    int 10h

    mov dx, offset ts
    int 21h
    mov bl, 6eh
    mov cx, 2d
    int 10h

    mov dx, offset ts
    int 21h
    mov bl, 6eh
    mov cx, 2d
    int 10h

    mov dx, offset ts
    int 21h

    mov bl, 00h
    mov cx, 2d
    int 10h

    mov dx, offset ts
    int 21h

    mov bl, 6eh
    mov cx, 2d
    int 10h

    mov dx, offset ts
    int 21h
    mov bl, 6eh
    mov cx, 2d
    int 10h

    mov dx, offset ts
    int 21h

    mov bl, 6eh
    mov cx, 2d
    int 10h

    mov dx, offset ts
    int 21h

    mov bl, 00h
    mov cx, 2d
    int 10h

    mov dx, offset ts
    int 21h

    mov bl, 6eh
    mov cx, 2d
    int 10h

    mov dx, offset ts
    int 21h

    mov dx, offset nl
    int 21h

    mov bl, 00h
    mov cx, 2d
    int 10h

    mov dx, offset ts
    int 21h

    mov bl, 00h
    mov cx, 2d
    int 10h

    mov dx, offset ts
    int 21h

    mov bl, 00h
    mov cx, 2d
    int 10h

    mov dx, offset ts
    int 21h

    mov bl, 6eh
    mov cx, 2d
    int 10h

    mov dx, offset ts
    int 21h
    mov bl, 6eh
    mov cx, 2d
    int 10h

    mov dx, offset ts
    int 21h
    mov bl, 6eh
    mov cx, 2d
    int 10h

    mov dx, offset ts
    int 21h
    mov bl, 6eh
    mov cx, 2d
    int 10h

    mov dx, offset ts
    int 21h
    mov bl, 6eh
    mov cx, 2d
    int 10h

    mov dx, offset ts
    int 21h
    mov bl, 6eh
    mov cx, 2d
    int 10h

    mov dx, offset ts
    int 21h
    mov bl, 6eh
    mov cx, 2d
    int 10h

    mov dx, offset ts
    int 21h
    mov bl, 6eh
    mov cx, 2d
    int 10h

    mov dx, offset ts
    int 21h
    mov bl, 1Bh
    mov cx, 2d
    int 10h

    mov dx, offset ts
    int 21h
    mov bl, 6eh
    mov cx, 2d
    int 10h

    mov dx, offset ts
    int 21h

    mov dx, offset nl
    int 21h

    ; ROW 7

    mov bl, 00h
    mov cx, 2d
    int 10h

    mov dx, offset ts
    int 21h


    mov bl, 00h
    mov cx, 2d
    int 10h

    mov dx, offset ts
    int 21h


    mov bl, 6eh
    mov cx, 2d
    int 10h

    mov dx, offset ts
    int 21h

    mov bl, 6eh
    mov cx, 2d
    int 10h

    mov dx, offset ts
    int 21h

    mov bl, 6eh
    mov cx, 2d
    int 10h

    mov dx, offset ts
    int 21h

    mov bl, 6eh
    mov cx, 2d
    int 10h

    mov dx, offset ts
    int 21h

    mov bl, 1Bh
    mov cx, 2d
    int 10h

    mov dx, offset ts
    int 21h

    mov bl, 6eh
    mov cx, 2d
    int 10h

    mov dx, offset ts
    int 21h

    mov bl, 6eh
    mov cx, 2d
    int 10h

    mov dx, offset ts
    int 21h

    mov bl, 6eh
    mov cx, 2d
    int 10h

    mov dx, offset ts
    int 21h


    mov bl, 1Bh
    mov cx, 2d
    int 10h

    mov dx, offset ts
    int 21h

    mov bl, 6eh
    mov cx, 2d
    int 10h

    mov dx, offset ts
    int 21h

    mov bl, 6eh
    mov cx, 2d
    int 10h

    mov dx, offset ts
    int 21h

    mov dx, offset nl
    int 21h

    ; ROW 8 

    mov bl, 00h
    mov cx, 2d
    int 10h

    mov dx, offset ts
    int 21h

    mov bl, 00h
    mov cx, 2d
    int 10h

    mov dx, offset ts
    int 21h

    mov bl, 6Eh
    mov cx, 2d
    int 10h

    mov dx, offset ts
    int 21h

    mov bl, 6Eh
    mov cx, 2d
    int 10h

    mov dx, offset ts
    int 21h

    mov bl, 6Eh
    mov cx, 2d
    int 10h

    mov dx, offset ts
    int 21h

    mov bl, 6Eh
    mov cx, 2d
    int 10h

    mov dx, offset ts
    int 21h

    mov bl, 6Eh
    mov cx, 2d
    int 10h

    mov dx, offset ts
    int 21h

    mov bl, 1Bh
    mov cx, 2d
    int 10h

    mov dx, offset ts
    int 21h

    mov bl, 1Bh
    mov cx, 2d
    int 10h

    mov dx, offset ts
    int 21h

    mov bl, 1Bh
    mov cx, 2d
    int 10h

    mov dx, offset ts
    int 21h

    mov bl, 6Eh
    mov cx, 2d
    int 10h

    mov dx, offset ts
    int 21h

    mov bl, 6Eh
    mov cx, 2d
    int 10h

    mov dx, offset ts
    int 21h

    mov bl, 6Eh
    mov cx, 2d
    int 10h

    mov dx, offset ts
    int 21h

    mov dx, offset nl
    int 21h

    ; ROW 9

    mov bl, 00h
    mov cx, 2d
    int 10h

    mov dx, offset ts
    int 21h

    mov bl, 00h
    mov cx, 2d
    int 10h

    mov dx, offset ts
    int 21h

    mov bl, 6Eh
    mov cx, 2d
    int 10h

    mov dx, offset ts
    int 21h

    mov bl, 6Eh
    mov cx, 2d
    int 10h

    mov dx, offset ts
    int 21h

    mov bl, 6Eh
    mov cx, 2d
    int 10h

    mov dx, offset ts
    int 21h

    mov bl, 6Eh
    mov cx, 2d
    int 10h

    mov dx, offset ts
    int 21h

    mov bl, 6Eh
    mov cx, 2d
    int 10h

    mov dx, offset ts
    int 21h

    mov bl, 6Eh
    mov cx, 2d
    int 10h

    mov dx, offset ts
    int 21h

    mov bl, 6Eh
    mov cx, 2d
    int 10h

    mov dx, offset ts
    int 21h

    mov bl, 6Eh
    mov cx, 2d
    int 10h

    mov dx, offset ts
    int 21h

    mov bl, 6Eh
    mov cx, 2d
    int 10h

    mov dx, offset ts
    int 21h

    mov bl, 6Eh
    mov cx, 2d
    int 10h

    mov dx, offset ts
    int 21h

    mov bl, 6Eh
    mov cx, 2d
    int 10h

    mov dx, offset ts
    int 21h

    mov dx, offset nl
    int 21h

    ; ROW 10

    mov bl, 00h
    mov cx, 2d
    int 10h

    mov dx, offset ts
    int 21h

    mov bl, 00h
    mov cx, 2d
    int 10h

    mov dx, offset ts
    int 21h

    mov bl, 00h
    mov cx, 2d
    int 10h

    mov dx, offset ts
    int 21h

    mov bl, 6Eh
    mov cx, 2d
    int 10h

    mov dx, offset ts
    int 21h

    mov bl, 6Eh
    mov cx, 2d
    int 10h

    mov dx, offset ts
    int 21h

    mov bl, 6Eh
    mov cx, 2d
    int 10h

    mov dx, offset ts
    int 21h

    mov bl, 6Eh
    mov cx, 2d
    int 10h

    mov dx, offset ts
    int 21h

    mov bl, 6Eh
    mov cx, 2d
    int 10h

    mov dx, offset ts
    int 21h

    mov bl, 6Eh
    mov cx, 2d
    int 10h

    mov dx, offset ts
    int 21h

    mov bl, 6Eh
    mov cx, 2d
    int 10h

    mov dx, offset ts
    int 21h

    mov bl, 6Eh
    mov cx, 2d
    int 10h

    mov dx, offset ts
    int 21h

    mov bl, 6Eh
    mov cx, 2d
    int 10h

    mov dx, offset ts
    int 21h

    mov dx, offset nl
    int 21h

    ; ROW 11

    mov bl, 00h
    mov cx, 2d
    int 10h

    mov dx, offset ts
    int 21h

    mov bl, 00h
    mov cx, 2d
    int 10h

    mov dx, offset ts
    int 21h

    mov bl, 00h
    mov cx, 2d
    int 10h

    mov dx, offset ts
    int 21h

    mov bl, 00h
    mov cx, 2d
    int 10h

    mov dx, offset ts
    int 21h

    mov bl, 6Eh
    mov cx, 2d
    int 10h

    mov dx, offset ts
    int 21h

    mov bl, 6Eh
    mov cx, 2d
    int 10h

    mov dx, offset ts
    int 21h

    mov bl, 6Eh
    mov cx, 2d
    int 10h

    mov dx, offset ts
    int 21h

    mov bl, 6Eh
    mov cx, 2d
    int 10h

    mov dx, offset ts
    int 21h

    mov bl, 6Eh
    mov cx, 2d
    int 10h

    mov dx, offset ts
    int 21h

    mov bl, 6Eh
    mov cx, 2d
    int 10h

    mov dx, offset ts
    int 21h

    mov bl, 6Eh
    mov cx, 2d
    int 10h

    mov dx, offset ts
    int 21h

    mov ah, 02h
    mov bh, 0
    mov dh, 15     ; row number
    mov dl, 10     ; column number 
    int 10h

blink_loop:
    ; --- draw left eye ---
    mov ah, 02h
    mov bh, 0
    mov dh, 15       ; row
    mov dl, 10       ; col
    int 10h

    mov ah, 09h
    mov al, 219      ; █ full block
    mov bl, 07h
    mov bh, 0
    mov cx, 1
    int 10h

    ; --- draw right eye ---
    mov ah, 02h
    mov bh, 0
    mov dh, 15
    mov dl, 11       ; col for second eye
    int 10h

    mov ah, 09h
    mov al, 219
    mov bl, 07h
    mov bh, 0
    mov cx, 1
    int 10h

    call delay

    ; --- erase left eye ---
    mov ah, 02h
    mov bh, 0
    mov dh, 15
    mov dl, 10
    int 10h

    mov ah, 09h
    mov al, ' '
    mov bl, 07h
    mov bh, 0
    mov cx, 1
    int 10h

    ; --- erase right eye ---
    mov ah, 02h
    mov bh, 0
    mov dh, 15
    mov dl, 11
    int 10h

    mov ah, 09h
    mov al, ' '
    mov bl, 07h
    mov bh, 0
    mov cx, 1
    int 10h

    call delay
    jmp blink_loop

delay proc
    mov ah, 00h
    int 1Ah         
    add dx, 100     

wait_loop:
    mov ah, 00h
    int 1Ah
    cmp dx, dx       
    jb wait_loop
    ret
delay endp

    int 27h

end start