.model small
.stack 100h

.data
msg1 db 'Enter a number (0-9): $'
msg2 db 0Dh,0Ah,'The number is EVEN $'
msg3 db 0Dh,0Ah,'The number is ODD $'

num db ?

.code
main proc
    mov ax, @data
    mov ds, ax

    ; Input number
    lea dx, msg1
    mov ah, 09h
    int 21h

    mov ah, 01h
    int 21h
    sub al, 30h      ; ASCII to number
    mov num, al

    ; Check odd or even
    mov al, num
    and al, 01h      ; check last bit

    jz even_number   ; if zero → even

odd_number:
    lea dx, msg3
    mov ah, 09h
    int 21h
    jmp exit_program

even_number:
    lea dx, msg2
    mov ah, 09h
    int 21h

exit_program:
    mov ah, 4Ch
    int 21h

main endp
end main
