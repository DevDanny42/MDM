.model small
.stack 100h

.data
msg1 db 'Enter 5 numbers (0-9): $'
msg2 db 0Dh,0Ah,'Ascending order: $'

arr db 5 dup(?)
i   db ?
j   db ?
temp db ?

.code
main proc
    mov ax, @data
    mov ds, ax

    ; Print input message
    lea dx, msg1
    mov ah, 09h
    int 21h

    ; Input 5 numbers
    mov cx, 5
    lea si, arr

input_loop:
    mov ah, 01h
    int 21h
    sub al, 30h      ; ASCII to number
    mov [si], al
    inc si
    loop input_loop

    ; Bubble Sort (Ascending)
    mov cl, 4

outer_loop:
    lea si, arr
    mov ch, cl

inner_loop:
    mov al, [si]
    mov bl, [si+1]

    cmp al, bl
    jbe no_swap

    ; Swap
    mov [si], bl
    mov [si+1], al

no_swap:
    inc si
    dec ch
    jnz inner_loop

    dec cl
    jnz outer_loop

    ; Print result message
    lea dx, msg2
    mov ah, 09h
    int 21h

    ; Print sorted array
    mov cx, 5
    lea si, arr

print_loop:
    mov dl, [si]
    add dl, 30h      ; number to ASCII
    mov ah, 02h
    int 21h

    mov dl, ' '      ; print space
    mov ah, 02h
    int 21h

    inc si
    loop print_loop

    ; Exit
    mov ah, 4Ch
    int 21h

main endp
end main
