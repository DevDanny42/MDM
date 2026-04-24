.model small
.stack 100h

.data
msg1 db 'Enter a number (0-9): $'
msg2 db 0Dh,0Ah,'Number of 1s in binary = $'
msg3 db 0Dh,0Ah,'Number of 0s in binary = $'

num   db ?
ones  db 0
zeros db 0
count db 8

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

    mov al, num
    mov cl, 8        ; check 8 bits

check_bits:
    shl al, 1        ; shift left, MSB goes to Carry

    jc one_found     ; if Carry = 1 → bit is 1

    inc zeros        ; else bit is 0
    jmp next

one_found:
    inc ones

next:
    loop check_bits

    ; Print number of 1s
    lea dx, msg2
    mov ah, 09h
    int 21h

    mov al, ones
    add al, 30h
    mov dl, al
    mov ah, 02h
    int 21h

    ; Print number of 0s
    lea dx, msg3
    mov ah, 09h
    int 21h

    mov al, zeros
    add al, 30h
    mov dl, al
    mov ah, 02h
    int 21h

    ; Exit
    mov ah, 4Ch
    int 21h

main endp
end main
