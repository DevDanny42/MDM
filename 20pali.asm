.model small
.stack 100h

.data
msg1 db 'Enter a number: $'
msg2 db 0Dh,0Ah,'The number is PALINDROME $'
msg3 db 0Dh,0Ah,'The number is NOT PALINDROME $'

num db 20 dup(?)      ; store up to 20 digits
len db ?               ; stores number of digits

.code
main proc
    mov ax, @data
    mov ds, ax

    ; Display message
    lea dx, msg1
    mov ah, 09h
    int 21h

    ; Input digits until Enter key is pressed
    lea si, num
    mov cl, 0

input_loop:
    mov ah, 01h
    int 21h

    cmp al, 0Dh        ; check Enter key
    je check_palindrome

    mov [si], al       ; store digit
    inc si
    inc cl
    jmp input_loop

check_palindrome:
    mov len, cl

    ; SI -> first digit
    lea si, num

    ; DI -> last digit
    lea di, num
    mov ch, 0
    mov cl, len
    dec cl
    add di, cx

compare_loop:
    mov al, [si]
    cmp al, [di]
    jne not_palindrome

    inc si
    dec di

    ; stop when SI >= DI
    cmp si, di
    jb compare_loop

    ; Palindrome
    lea dx, msg2
    mov ah, 09h
    int 21h
    jmp exit_program

not_palindrome:
    lea dx, msg3
    mov ah, 09h
    int 21h

exit_program:
    mov ah, 4Ch
    int 21h

main endp
end main
