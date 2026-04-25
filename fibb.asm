.model small
.stack 100h

.data
msg1 db 0Dh,0Ah,"Enter 1st number : $"
msg2 db 0Dh,0Ah,"Enter 2nd number : $"
msg3 db 0Dh,0Ah,"Series is : $"

num1 db ?
num2 db ?

.code
main proc
    mov ax,@data
    mov ds,ax

    ; First number input
    lea dx,msg1
    mov ah,09h
    int 21h

    mov ah,01h
    int 21h
    sub al,30h
    mov num1,al

    ; Second number input
    lea dx,msg2
    mov ah,09h
    int 21h

    mov ah,01h
    int 21h
    sub al,30h
    mov num2,al

    ; Print heading
    lea dx,msg3
    mov ah,09h
    int 21h

    ; Print first number
    mov dl,num1
    add dl,30h
    mov ah,02h
    int 21h

    mov dl,' '
    mov ah,02h
    int 21h

    ; Print second number
    mov dl,num2
    add dl,30h
    mov ah,02h
    int 21h

    mov dl,' '
    mov ah,02h
    int 21h

    ; Setup Fibonacci
    mov bl,num1
    mov bh,num2
    mov cl,8

fibbo:
    mov al,bl
    add al,bh

    ; Print number (supports 2 digits)
    mov ah,0
    mov dl,10
    div dl          ; AL = tens, AH = units

    cmp al,0
    je print_unit

    ; Print tens digit
    add al,30h
    mov dl,al
    mov ah,02h
    int 21h

print_unit:
    ; Print units digit
    mov dl,ah
    add dl,30h
    mov ah,02h
    int 21h

    ; Space
    mov dl,' '
    mov ah,02h
    int 21h

    ; Update Fibonacci values
    mov al,bl
    add al,bh
    mov bl,bh
    mov bh,al

    dec cl
    jnz fibbo

exit_proc:
    mov ah,4Ch
    int 21h

main endp
end main
