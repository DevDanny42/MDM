\\.model small
.stack 100h

.data
msg1 db 'Enter first number (0-9): $'
msg2 db 0Dh,0Ah,'Enter second number (0-9): $'
msg3 db 0Dh,0Ah,'Addition is: $'

num1 db ?
num2 db ?
result db ?

.code
main proc
    mov ax, @data
    mov ds, ax

    ; Print first message
    lea dx, msg1
    mov ah, 09h
    int 21h

    ; Take first input
    mov ah, 01h
    int 21h
    sub al, 30h
    mov num1, al

    ; Print second message
    lea dx, msg2
    mov ah, 09h
    int 21h

    ; Take second input
    mov ah, 01h
    int 21h
    sub al, 30h
    mov num2, al

    ; Addition
    mov al, num1
    add al, num2
    mov result, al

    ; Print result message
    lea dx, msg3
    mov ah, 09h
    int 21h

    ; Print result
    mov al, result
    add al, 30h
    mov dl, al
    mov ah, 02h
    int 21h

    ; Exit
    mov ah, 4Ch
    int 21h

main endp
end main
