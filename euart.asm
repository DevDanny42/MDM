ORG 0000H

MOV SCON, #50H      ; Serial mode 1, REN enabled
MOV TMOD, #20H      ; Timer1 mode 2 (auto reload)
MOV TH1, #0FDH      ; Baud rate 9600
SETB TR1            ; Start Timer1

MOV DPTR, #MYDATA   ; Point to string

BACK:
    CLR A
    MOVC A, @A+DPTR ; Read character from code memory
    JZ EXIT         ; If 00H found, stop

    MOV SBUF, A     ; Send character

HERE:
    JNB TI, HERE    ; Wait until transmit complete
    CLR TI          ; Clear transmit flag

    INC DPTR
    SJMP BACK

EXIT:
    SJMP EXIT

ORG 0050H

MYDATA:
DB 'HELLO WORLD',00H

END
