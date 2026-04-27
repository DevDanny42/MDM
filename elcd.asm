ORG 0000H

; 16x2 LCD Interfacing with 8051
; Data Pins D0-D7 -> Port 2
; RS -> P3.0
; RW -> P3.1
; EN -> P3.2

RS  BIT P3.0
RW  BIT P3.1
EN  BIT P3.2

START:

; LCD Initialization Only

MOV A, #38H      ; 8-bit mode, 2 line
ACALL CMD

MOV A, #0CH      ; Display ON, Cursor OFF
ACALL CMD

MOV A, #01H      ; Clear Display
ACALL CMD

MOV A, #06H      ; Cursor Auto Increment
ACALL CMD

HERE:
SJMP HERE

; -------------------
; Command Subroutine
; -------------------

CMD:
MOV P2, A
CLR RS
CLR RW
SETB EN
ACALL DELAY
CLR EN
RET

; -------------------
; Delay Subroutine
; -------------------

DELAY:
MOV R4, #05H

D1:
MOV R5, #0FFH

D2:
DJNZ R5, D2
DJNZ R4, D1
RET

END
