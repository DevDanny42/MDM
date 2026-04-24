.model small
.stack 100h

.data
msg1 db 'Enter a 5-digit number: $'
msg2 db 0Dh,0Ah,'The number is PALINDROME $'
msg3 db 0Dh,0Ah,'The number is NOT PALINDROME $'

num db 5 dup(?)     ; store 5 digits

.code
main proc
    mov ax, @data
    mov ds, ax

    ; Print input message
    lea dx, msg1
    mov ah, 09h
    int 21h

    ; Input 5 digits
    lea si, num
    mov cx, 5

input_loop:
    mov ah, 01h
    int 21h
    mov [si], al     ; store character directly
    inc si
    loop input_loop

    ; Compare first with last
    lea si, num
    lea di, num+4

    mov al, [si]
    cmp al, [di]
    jne not_palindrome

    ; Compare second with fourth
    mov al, [si+1]
    cmp al, [di-1]
    jne not_palindrome

    ; If both matched → palindrome
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
