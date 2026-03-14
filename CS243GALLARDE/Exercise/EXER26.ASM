; Filename: EXER26.ASM
; Name: Joel Theo C. Gallarde
; Date: September 14, 2025

.model small
.stack 100h

.data

formTemplate db '                Cebu Institute of Technology - University               ',0Dh,0Ah
             db '                     VEHICLE STICKER APPLICATION FORM                   ',0Dh,0Ah
             db '                      Please fill up the form below.                    ',0Dh,0Ah,0Ah
             db '  Personnel Type:            [       V]     Vehicle Sticker Type: [         V]',0Dh,0Ah
             db '  Name of Applicant/Driver:  [        ]     ID Number:            [          ]',0Dh,0Ah
             db '  Mobile Number:             [        ]     Address:              [          ]',0Dh,0Ah
             db '  Vehicle Make(s)/Brand:     [        ]     Plate Number:         [          ]',0Dh,0Ah
             db '  Vehicle Color:             [       V]     Vehicle Type:         [         V]',0Dh,0Ah,0Ah,0Ah
             db '                                      SUBMIT                      ',0Dh,0Ah,0Ah
             db '                   Copyright 2025 JOEL THEO C. GALLARDE         ',0Dh,0Ah,0Ah,0Ah
             db '                                   Thank You!            ',0Dh,0Ah,'$'

; Prompts
pIntro db 0Dh,0Ah,'Please enter the needed information (press ENTER after each):',0Dh,0Ah,'$'
pPersonnel db 0Dh,0Ah,'Personnel Type: $'
pSticker   db 0Dh,0Ah,'Vehicle Sticker Type: $'
pName      db 0Dh,0Ah,'Name of Applicant/Driver: $'
pID        db 0Dh,0Ah,'ID Number: $'
pMobile    db 0Dh,0Ah,'Mobile Number: $'
pAddress   db 0Dh,0Ah,'Address: $'
pMake      db 0Dh,0Ah,'Vehicle Make(s)/Brand: $'
pPlate     db 0Dh,0Ah,'Plate Number: $'
pColor     db 0Dh,0Ah,'Vehicle Color: $'
pVType     db 0Dh,0Ah,'Vehicle Type: $'

; Input buffers (maxLen, actualLen, data...)
; choose reasonable max lengths
personnelBuf db 12,0, 12 dup(0)
stickerBuf   db 12,0, 12 dup(0)
nameBuf      db 30,0, 30 dup(0)
idBuf        db 12,0, 12 dup(0)
mobileBuf    db 15,0, 15 dup(0)
addressBuf   db 30,0, 30 dup(0)
makeBuf      db 20,0, 20 dup(0)
plateBuf     db 12,0, 12 dup(0)
colorBuf     db 12,0, 12 dup(0)
vtypeBuf     db 12,0, 12 dup(0)

.code
start:
    mov ax,@data
    mov ds,ax

    ; --- Clear screen to mode 3 ---
    mov ax, 3
    int 10h

    ; Intro prompt (simple text-mode prompting)
    mov ah,09h
    lea dx,pIntro
    int 21h

    ; Ask all fields (buffered input AH=0Ah)
    ; Personnel Type
    mov ah,09h
    lea dx,pPersonnel
    int 21h
    mov ah,0Ah
    lea dx,personnelBuf
    int 21h

    ; Vehicle Sticker Type
    mov ah,09h
    lea dx,pSticker
    int 21h
    mov ah,0Ah
    lea dx,stickerBuf
    int 21h

    ; Name
    mov ah,09h
    lea dx,pName
    int 21h
    mov ah,0Ah
    lea dx,nameBuf
    int 21h

    ; ID
    mov ah,09h
    lea dx,pID
    int 21h
    mov ah,0Ah
    lea dx,idBuf
    int 21h

    ; Mobile
    mov ah,09h
    lea dx,pMobile
    int 21h
    mov ah,0Ah
    lea dx,mobileBuf
    int 21h

    ; Address
    mov ah,09h
    lea dx,pAddress
    int 21h
    mov ah,0Ah
    lea dx,addressBuf
    int 21h

    ; Make/Brand
    mov ah,09h
    lea dx,pMake
    int 21h
    mov ah,0Ah
    lea dx,makeBuf
    int 21h

    ; Plate Number
    mov ah,09h
    lea dx,pPlate
    int 21h
    mov ah,0Ah
    lea dx,plateBuf
    int 21h

    ; Vehicle Color
    mov ah,09h
    lea dx,pColor
    int 21h
    mov ah,0Ah
    lea dx,colorBuf
    int 21h

    ; Vehicle Type
    mov ah,09h
    lea dx,pVType
    int 21h
    mov ah,0Ah
    lea dx,vtypeBuf
    int 21h

    ; Pause briefly then draw colored form and display summary
    ; You could show a message but we proceed to draw
    call DrawForm
    call PrintTemplate
    ; Now print each buffer at the appropriate coordinates
    ; Coordinates chosen to align with the template layout:
    ; (row, col) values are 0-indexed

    ; Personnel Type -> row 4, col 30
    mov dh,4
    mov dl,30
    call PrintBufferAt_personnel

    ; Vehicle Sticker Type -> row 4, col 62
    mov dh,4
    mov dl,62
    call PrintBufferAt_sticker

    ; Name -> row 5, col 30
    mov dh,5
    mov dl,30
    call PrintBufferAt_name

    ; ID -> row 5, col 62
    mov dh,5
    mov dl,62
    call PrintBufferAt_id

    ; Mobile -> row 6, col 30
    mov dh,6
    mov dl,30
    call PrintBufferAt_mobile

    ; Address -> row 6, col 62
    mov dh,6
    mov dl,62
    call PrintBufferAt_address

    ; Make/Brand -> row 7, col 30
    mov dh,7
    mov dl,30
    call PrintBufferAt_make

    ; Plate -> row 7, col 62
    mov dh,7
    mov dl,62
    call PrintBufferAt_plate

    ; Color -> row 8, col 30
    mov dh,8
    mov dl,30
    call PrintBufferAt_color

    ; Vehicle Type -> row 8, col 62
    mov dh,8
    mov dl,62
    call PrintBufferAt_vtype

    ; Move cursor below form
    mov ah,02h
    mov bh,0
    mov dh,18
    mov dl,0
    int 10h

    ; Exit cleanly
    mov ax,4C00h
    int 21h

; -------------------------
; DrawForm: create colored rectangles (similar to your earlier code)
; -------------------------
DrawForm proc
    ; header red background rows 0-1 (attribute 4Fh)
    mov ah,06h
    xor al,al
    xor cx,cx
    mov dh,1
    mov dl,80
    mov bh,4Fh
    int 10h

    ; row 2 highlight yellow on red (0CEh)
    mov ah,06h
    mov ch,2
    mov cl,0
    mov dh,2
    mov dl,80
    mov bh,0CEh
    int 10h

    ; grey background row 3
    mov ah,06h
    mov ch,3
    mov cl,0
    mov dh,3
    mov dl,80
    mov bh,7Fh
    int 10h

    ; rows 4 - 9 main area: fill background grey
    mov ah,06h
    mov ch,4
    mov cl,0
    mov dh,9
    mov dl,80
    mov bh,070h
    int 10h

    ; V buttons (red background) at (row4,col37) and (row4,col76)
    mov ah,06h
    mov ch,4
    mov cl,37
    mov dh,4
    mov dl,37
    mov bh,4Fh
    int 10h

    mov ah,06h
    mov ch,4
    mov cl,76
    mov dh,4
    mov dl,76
    mov bh,4Fh
    int 10h

    ; V buttons (row8) at col37 and col76
    mov ah,06h
    mov ch,8
    mov cl,37
    mov dh,8
    mov dl,37
    mov bh,4Fh
    int 10h

    mov ah,06h
    mov ch,8
    mov cl,76
    mov dh,8
    mov dl,76
    mov bh,4Fh
    int 10h

    ; Submit button (rows 10-12 cols 37-44) yellow text on red bg (4Eh)
    mov ah,06h
    mov ch,10
    mov cl,37
    mov dh,12
    mov dl,44
    mov bh,4Eh
    int 10h

    ; bottom black band rows 13-16
    mov ah,06h
    mov ch,13
    mov cl,0
    mov dh,16
    mov dl,80
    mov bh,0F0h   ; black bg, light color
    int 10h

    ret
DrawForm endp

; -------------------------
; PrintTemplate: prints the static form text (uses DS)
; -------------------------
PrintTemplate proc
    ; set cursor to top-left then print the multi-line template
    mov ah,02h
    mov bh,0
    mov dh,0
    mov dl,0
    int 10h

    mov ah,09h
    lea dx,formTemplate
    int 21h
    ret
PrintTemplate endp

; -------------------------
; Routines to print buffers at (DH=row, DL=col)
; Each PrintBufferAt_x uses the buffer and its length
; -------------------------
; Generic behaviour:
; - DH = row, DL = col
; - uses BH=0 video page when setting cursor
; - prints up to actualLen characters stored at buffer+2

; Personnel
PrintBufferAt_personnel proc
    push ax
    push bx
    push cx
    push dx
    push si
    ; set cursor
    mov ah,02h
    mov bh,0
    int 10h         ; uses DH,DL already
    ; print characters from personnelBuf
    lea si,personnelBuf+2
    mov cl,[personnelBuf+1]
    xor ch,ch
    cmp cl,0
    je .done
.printloopP:
    mov al,[si]
    inc si
    mov dl,al
    mov ah,02h
    int 21h
    loop .printloopP
.done:
    pop si
    pop dx
    pop cx
    pop bx
    pop ax
    ret
PrintBufferAt_personnel endp

; Sticker
PrintBufferAt_sticker proc
    push ax bx cx dx si
    mov ah,02h
    mov bh,0
    int 10h
    lea si,stickerBuf+2
    mov cl,[stickerBuf+1]
    xor ch,ch
    cmp cl,0
    je .d
.slp:
    mov al,[si]
    inc si
    mov dl,al
    mov ah,02h
    int 21h
    loop .slp
.d:
    pop si dx cx bx ax
    ret
PrintBufferAt_sticker endp

; Name
PrintBufferAt_name proc
    push ax bx cx dx si
    mov ah,02h
    mov bh,0
    int 10h
    lea si,nameBuf+2
    mov cl,[nameBuf+1]
    xor ch,ch
    cmp cl,0
    je .d2
.nloop:
    mov al,[si]
    inc si
    mov dl,al
    mov ah,02h
    int 21h
    loop .nloop
.d2:
    pop si dx cx bx ax
    ret
PrintBufferAt_name endp

; ID
PrintBufferAt_id proc
    push ax bx cx dx si
    mov ah,02h
    mov bh,0
    int 10h
    lea si,idBuf+2
    mov cl,[idBuf+1]
    xor ch,ch
    cmp cl,0
    je .d3
.ilp:
    mov al,[si]
    inc si
    mov dl,al
    mov ah,02h
    int 21h
    loop .ilp
.d3:
    pop si dx cx bx ax
    ret
PrintBufferAt_id endp

; Mobile
PrintBufferAt_mobile proc
    push ax bx cx dx si
    mov ah,02h
    mov bh,0
    int 10h
    lea si,mobileBuf+2
    mov cl,[mobileBuf+1]
    xor ch,ch
    cmp cl,0
    je .d4
.mlp:
    mov al,[si]
    inc si
    mov dl,al
    mov ah,02h
    int 21h
    loop .mlp
.d4:
    pop si dx cx bx ax
    ret
PrintBufferAt_mobile endp

; Address
PrintBufferAt_address proc
    push ax bx cx dx si
    mov ah,02h
    mov bh,0
    int 10h
    lea si,addressBuf+2
    mov cl,[addressBuf+1]
    xor ch,ch
    cmp cl,0
    je .d5
.adlp:
    mov al,[si]
    inc si
    mov dl,al
    mov ah,02h
    int 21h
    loop .adlp
.d5:
    pop si dx cx bx ax
    ret
PrintBufferAt_address endp

; Make/Brand
PrintBufferAt_make proc
    push ax bx cx dx si
    mov ah,02h
    mov bh,0
    int 10h
    lea si,makeBuf+2
    mov cl,[makeBuf+1]
    xor ch,ch
    cmp cl,0
    je .d6
.mklp:
    mov al,[si]
    inc si
    mov dl,al
    mov ah,02h
    int 21h
    loop .mklp
.d6:
    pop si dx cx bx ax
    ret
PrintBufferAt_make endp

; Plate
PrintBufferAt_plate proc
    push ax bx cx dx si
    mov ah,02h
    mov bh,0
    int 10h
    lea si,plateBuf+2
    mov cl,[plateBuf+1]
    xor ch,ch
    cmp cl,0
    je .d7
.plp:
    mov al,[si]
    inc si
    mov dl,al
    mov ah,02h
    int 21h
    loop .plp
.d7:
    pop si dx cx bx ax
    ret
PrintBufferAt_plate endp

; Color
PrintBufferAt_color proc
    push ax bx cx dx si
    mov ah,02h
    mov bh,0
    int 10h
    lea si,colorBuf+2
    mov cl,[colorBuf+1]
    xor ch,ch
    cmp cl,0
    je .d8
.clp:
    mov al,[si]
    inc si
    mov dl,al
    mov ah,02h
    int 21h
    loop .clp
.d8:
    pop si dx cx bx ax
    ret
PrintBufferAt_color endp

; Vehicle type
PrintBufferAt_vtype proc
    push ax bx cx dx si
    mov ah,02h
    mov bh,0
    int 10h
    lea si,vtypeBuf+2
    mov cl,[vtypeBuf+1]
    xor ch,ch
    cmp cl,0
    je .d9
.vlp:
    mov al,[si]
    inc si
    mov dl,al
    mov ah,02h
    int 21h
    loop .vlp
.d9:
    pop si dx cx bx ax
    ret
PrintBufferAt_vtype endp

end start