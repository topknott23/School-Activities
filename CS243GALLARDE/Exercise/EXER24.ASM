; Filename: EXER24.ASM
; Programmer name: Joel Theo C. Gallarde
; Date: September 11, 2025
; This program asks the user for enrollment details:
;   ID Number, Name, Address, Course, Year, Birthday,
;   and Email Address.
; Then it displays a formatted summary of the inputs.
;
; Author: Your Name
; Date:   September 2025


.MODEL small
.STACK 200h

.DATA
    ; ---------------- Messages ----------------
    header1 db 0Dh,0Ah, 'Cebu Institute of Technology - University$'
    header2 db 0Dh,0Ah, 'STUDENT ENROLLMENT FORM$'

    askID db 0Dh,0Ah,0Dh,0Ah, 'Student ID Number: $'
    askFirst db 0Dh,0Ah, 'First Name: $'
    askMiddle db 0Dh,0Ah, 'Middle Name: $'
    askLast db 0Dh,0Ah, 'Last Name: $'
    askAddress db 0Dh,0Ah, 'Address: $'
    askCourse db 0Dh,0Ah, 'Course: $'
    askYear db 0Dh,0Ah, 'Year: $'
    askBMonth db 0Dh,0Ah, 'Birthday Month: $'
    askBDay db 0Dh,0Ah, 'Birthday Day: $'
    askBYear db 0Dh,0Ah, 'Birthday Year: $'
    askEmail db 0Dh,0Ah, 'Email Address: $'

    summaryTitle db 0Dh,0Ah,0Dh,0Ah, 'SUMMARY$'
    summaryCheck db 0Dh,0Ah, 'Please check if all pieces of information are correct.$'
    showID db 0Dh,0Ah,0Dh,0Ah, 'ID Number: $'
    showName db 0Dh,0Ah, 'Full Name: $'
    showAddress db 0Dh,0Ah, 'Address: $'
    showCourse db 0Dh,0Ah, 'Course & Year: $'
    
    showBday db 0Dh,0Ah, 'Birthday: $'
    showEmail db 0Dh,0Ah, 'Email: $'

    ; ---------------- Input Buffers ----------------
    idBuffer db 30,0,30 dup('$')
    firstName db 30,0,30 dup('$')
    middleName db 30,0,30 dup('$')
    lastName db 30,0,30 dup('$')
    address db 50,0,50 dup('$')
    course db 20,0,20 dup('$')
    yearBuffer db 5,0,5 dup('$')
    bMonth db 15,0,15 dup('$')
    bDay db 5,0,5 dup('$')
    bYear db 10,0,10 dup('$')
    email db 40,0,40 dup('$')

.CODE
Main:
    mov ax, @data
    mov ds, ax

    ; --- Header ---
    mov dx, offset header1
    mov ah, 09h
    int 21h
    mov dx, offset header2
    mov ah, 09h
    int 21h

    ; --- Input Fields ---
    call GetInputID
    call GetInputFirst
    call GetInputMiddle
    call GetInputLast
    call GetInputAddress
    call GetInputCourse
    call GetInputYear
    call GetInputBMonth
    call GetInputBDay
    call GetInputBYear
    call GetInputEmail

    ; --- Summary ---
    mov dx, offset summaryTitle
    mov ah, 09h
    int 21h
    mov dx, offset summaryCheck
    mov ah, 09h
    int 21h

    ; Show ID
    mov dx, offset showID
    mov ah, 09h
    int 21h
    lea si, idBuffer+2
    call PrintString

    ; Show Name
    mov dx, offset showName
    mov ah, 09h
    int 21h
    lea si, lastName+2
    call PrintString
    mov dl, ','
    mov ah, 02h
    int 21h
    mov dl, ' '
    mov ah, 02h
    int 21h
    lea si, firstName+2
    call PrintString
    mov dl, ' '
    mov ah, 02h
    int 21h
    lea si, middleName+2
    call PrintString

    ; Show Address
    mov dx, offset showAddress
    mov ah, 09h
    int 21h
    lea si, address+2
    call PrintString

    ; Show Course
    mov dx, offset showCourse
    mov ah, 09h
    int 21h
    lea si, course+2
    call PrintString

    mov dl, ' '
    mov ah, 02h
    int 21h
    lea si, yearBuffer+2
    call PrintString
   

    ; Show Birthday
    mov dx, offset showBday
    mov ah, 09h
    int 21h
    lea si, bMonth+2
    call PrintString
    mov dl, ' '
    mov ah, 02h
    int 21h
    lea si, bDay+2
    call PrintString
    mov dl, ','
    mov ah, 02h
    int 21h
    mov dl, ' '
    mov ah, 02h
    int 21h
    lea si, bYear+2
    call PrintString

    ; Show Email
    mov dx, offset showEmail
    mov ah, 09h
    int 21h
    lea si, email+2
    call PrintString

    ; Exit
    mov ax, 4C00h
    int 21h

; =================================================
; Input Procedures
; =================================================
GetInputID proc
    mov dx, offset askID
    mov ah, 09h
    int 21h
    mov dx, offset idBuffer
    mov ah, 0Ah
    int 21h
    ret
GetInputID endp

GetInputFirst proc
    mov dx, offset askFirst
    mov ah, 09h
    int 21h
    mov dx, offset firstName
    mov ah, 0Ah
    int 21h
    ret
GetInputFirst endp

GetInputMiddle proc
    mov dx, offset askMiddle
    mov ah, 09h
    int 21h
    mov dx, offset middleName
    mov ah, 0Ah
    int 21h
    ret
GetInputMiddle endp

GetInputLast proc
    mov dx, offset askLast
    mov ah, 09h
    int 21h
    mov dx, offset lastName
    mov ah, 0Ah
    int 21h
    ret
GetInputLast endp

GetInputAddress proc
    mov dx, offset askAddress
    mov ah, 09h
    int 21h
    mov dx, offset address
    mov ah, 0Ah
    int 21h
    ret
GetInputAddress endp

GetInputCourse proc
    mov dx, offset askCourse
    mov ah, 09h
    int 21h
    mov dx, offset course
    mov ah, 0Ah
    int 21h
    ret
GetInputCourse endp

GetInputYear proc
    mov dx, offset askYear
    mov ah, 09h
    int 21h
    mov dx, offset yearBuffer
    mov ah, 0Ah
    int 21h
    ret
GetInputYear endp

GetInputBMonth proc
    mov dx, offset askBMonth
    mov ah, 09h
    int 21h
    mov dx, offset bMonth
    mov ah, 0Ah
    int 21h
    ret
GetInputBMonth endp

GetInputBDay proc
    mov dx, offset askBDay
    mov ah, 09h
    int 21h
    mov dx, offset bDay
    mov ah, 0Ah
    int 21h
    ret
GetInputBDay endp

GetInputBYear proc
    mov dx, offset askBYear
    mov ah, 09h
    int 21h
    mov dx, offset bYear
    mov ah, 0Ah
    int 21h
    ret
GetInputBYear endp

GetInputEmail proc
    mov dx, offset askEmail
    mov ah, 09h
    int 21h
    mov dx, offset email
    mov ah, 0Ah
    int 21h
    ret
GetInputEmail endp

; =================================================
; Procedure: PrintString
; Purpose:   Prints user input string from buffer
; Input:     SI points to buffer+2 (start of text)
; =================================================
PrintString proc
    mov cl, [si-1]      ; length of input
    mov ch, 0
nextChar:
    cmp cx, 0
    je done
    lodsb
    cmp al, 0Dh         ; ignore Enter key
    je done
    mov dl, al
    mov ah, 02h
    int 21h
    loop nextChar
done:
    ret
PrintString endp

END Main