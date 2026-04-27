ORG 0000H

MOV R0, #30H      ; Starting address of array
MOV 30H, #25H
MOV 31H, #10H
MOV 32H, #45H
MOV 33H, #05H
MOV 34H, #30H

MOV R1, #04H      ; Remaining elements to compare

; First value as initial MAX and MIN
MOV A, 30H
MOV R2, A         ; R2 = MAX
MOV R3, A         ; R3 = MIN

INC R0            ; Move to next element

CHECK:
    MOV A, @R0

    ; ----- Check MAX -----
    CLR C
    SUBB A, R2
    JC CHECK_MIN
    MOV A, @R0
    MOV R2, A

CHECK_MIN:
    MOV A, R3
    CLR C
    SUBB A, @R0
    JC NEXT
    MOV A, @R0
    MOV R3, A

NEXT:
    INC R0
    DJNZ R1, CHECK

; Final Result:
; R2 = MAX = 45H
; R3 = MIN = 05H

END
