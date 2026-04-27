ORG 0000H

START:
    MOV TMOD, #01H      ; Timer0 Mode1 (16-bit timer)

BACK:
    CPL P1.0            ; Toggle LED on P1.0

    MOV TH0, #0FCH      ; Load timer high byte
    MOV TL0, #018H      ; Load timer low byte

    SETB TR0            ; Start Timer0

WAIT:
    JNB TF0, WAIT       ; Wait until timer overflow

    CLR TR0             ; Stop Timer0
    CLR TF0             ; Clear overflow flag

    SJMP BACK           ; Repeat forever

END
