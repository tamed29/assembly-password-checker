org 100h
jmp start

; ---------------- HEADER DATA ----------------
header db 13,10
       db "==============================================",13,10
       db "   MICROPROCESSOR AND ASSEMBLY LANGUAGE",13,10
       db "==============================================",13,10
       db " Title      : PASSWORD STRENGTH CHECKER",13,10
       db " Name       : Tamirat Dereje",13,10
       db " ID Number  : NSR/926/16",13,10
       db " Instructor : Eyasu T.",13,10
       db " Course     : Microprocessor and Assembly",13,10
       db "==============================================",13,10,"$"

; ---------------- DATA ----------------
buffer db 20
       db 0
       db 20 dup(0)

msgIntro db 13,10,"PASSWORD STRENGTH CHECKER",13,10,"$"
askPass  db 13,10,"Enter password: $"

msgAgain db 13,10,"Try again? (Y/N): $"

msgVeryStrong db 13,10,"Very Strong Password$"
msgStrong     db 13,10,"Strong Password$"
msgMedium     db 13,10,"Medium Password$"
msgWeak       db 13,10,"Weak Password$"
msgVeryWeak   db 13,10,"Very Weak Password$"

; ---------------- CODE ----------------
start:

    ; Print header (ONCE)
    mov dx, offset header
    mov ah, 09h
    int 21h

main_loop:

    ; Show title
    mov dx, offset msgIntro
    mov ah, 09h
    int 21h

    ; Ask password
    mov dx, offset askPass
    mov ah, 09h
    int 21h

    ; Input password
    mov dx, offset buffer
    mov ah, 0Ah
    int 21h

    ; Initialize
    mov cl, [buffer+1]
    mov si, offset buffer+2

    xor bl, bl   ; uppercase
    xor bh, bh   ; lowercase
    xor dl, dl   ; digit
    xor dh, dh   ; special

scan:
    cmp cl, 0
    je scoring

    mov al, [si]

    ; Uppercase
    cmp al, 'A'
    jb chk_lower
    cmp al, 'Z'
    ja chk_lower
    mov bl, 1
    jmp next

chk_lower:
    cmp al, 'a'
    jb chk_digit
    cmp al, 'z'
    ja chk_digit
    mov bh, 1
    jmp next

chk_digit:
    cmp al, '0'
    jb chk_special
    cmp al, '9'
    ja chk_special
    mov dl, 1
    jmp next

chk_special:
    cmp al, '@'
    je spec
    cmp al, '#'
    je spec
    cmp al, '$'
    je spec
    cmp al, '%'
    je spec
    cmp al, '!'
    je spec
    jmp next
spec:
    mov dh, 1

next:
    inc si
    dec cl
    jmp scan

; -------- SCORING --------
scoring:
    xor al, al

    mov cl, [buffer+1]
    cmp cl, 8
    jb no_len
    inc al
no_len:

    cmp bl, 0
    je no_u
    inc al
no_u:
    cmp bh, 0
    je no_l
    inc al
no_l:
    cmp dl, 0
    je no_d
    inc al
no_d:
    cmp dh, 0
    je result
    inc al

; -------- RESULT --------
result:
    cmp al, 5
    je very_strong
    cmp al, 4
    je strong
    cmp al, 3
    je medium
    cmp al, 2
    je weak
    jmp very_weak

very_strong:
    mov dx, offset msgVeryStrong
    jmp show
strong:
    mov dx, offset msgStrong
    jmp show
medium:
    mov dx, offset msgMedium
    jmp show
weak:
    mov dx, offset msgWeak
    jmp show
very_weak:
    mov dx, offset msgVeryWeak

show:
    mov ah, 09h
    int 21h

    ; Ask again
    mov dx, offset msgAgain
    mov ah, 09h
    int 21h

    mov ah, 01h
    int 21h
    cmp al, 'Y'
    je main_loop
    cmp al, 'y'
    je main_loop

    mov ah, 4Ch
    int 21h
