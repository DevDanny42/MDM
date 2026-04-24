.model small
.stack 100h

.data
msg1 db 'Enter first number (0-9): $'
msg2 db 0Dh,0Ah,'Enter second number (1-9): $'

addmsg db 0Dh,0Ah,'Addition = $'
submsg db 0Dh,0Ah,'Subtraction = $'
mulmsg db 0Dh,0Ah,'Multiplication = $'
divmsg db 0Dh,0Ah,'Division = $'

num1 db ?
num2 db ?
result db ?

.code
main proc
    mov ax, @data
    mov ds, ax

    ; First input
    lea dx, msg1
    mov ah, 09h
    int 21h

    mov ah, 01h
    int 21h
    sub al, 30h
    mov num1, al

    ; Second input
    lea dx, msg2
    mov ah, 09h
    int 21h

    mov ah, 01h
    int 21h
    sub al, 30h
    mov num2, al

    ; ----------------
    ; ADDITION
    ; ----------------
    mov al, num1
    add al, num2

    lea dx, addmsg
    mov ah, 09h
    int 21h

    add al, 30h
    mov dl, al
    mov ah, 02h
    int 21h

    ; ----------------
    ; SUBTRACTION
    ; ----------------
    mov al, num1
    sub al, num2

    lea dx, submsg
    mov ah, 09h
    int 21h

    add al, 30h
    mov dl, al
    mov ah, 02h
    int 21h

    ; ----------------
    ; MULTIPLICATION
    ; ----------------
    mov al, num1
    mov bl, num2
    mul bl

    lea dx, mulmsg
    mov ah, 09h
    int 21h

    add al, 30h
    mov dl, al
    mov ah, 02h
    int 21h

    ; ----------------
    ; DIVISION
    ; ----------------
    mov al, num1
    mov ah, 00h
    mov bl, num2
    div bl

    lea dx, divmsg
    mov ah, 09h
    int 21h

    add al, 30h
    mov dl, al
    mov ah, 02h
    int 21h

    ; Exit
    mov ah, 4Ch
    int 21h

main endp
end main
