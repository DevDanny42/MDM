ORG 0000H

; Find GCD and LCM of 12 and 18

MOV R0, #12      ; First number
MOV R1, #18      ; Second number

; Save original numbers for LCM
MOV A, R0
MOV R2, A

MOV A, R1
MOV R3, A

; -------- GCD --------

GCD_LOOP:

    MOV A, R0
    CLR C
    SUBB A, R1

    JZ GCD_FOUND      ; if R0 == R1
    JC SMALLER        ; if R0 < R1

    ; R0 = R0 - R1
    MOV R0, A
    SJMP GCD_LOOP

SMALLER:
    MOV A, R1
    CLR C
    SUBB A, R0
    MOV R1, A
    SJMP GCD_LOOP

GCD_FOUND:
    MOV A, R0
    MOV R4, A         ; GCD stored in R4

; -------- LCM --------

LCM_PART:
    MOV A, R2
    MOV B, R3
    MUL AB            ; A × B

    MOV B, R4
    DIV AB

    MOV R5, A         ; LCM stored in R5

HERE:
    SJMP HERE

END
