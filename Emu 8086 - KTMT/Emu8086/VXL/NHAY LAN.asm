; multi-segment executable file template.

data segment
    PA EQU 0
    PB EQU 2
    PC EQU 4
    PD EQU 6
ends

stack segment
    dw   128  dup(0)
ends

code segment
start:
    MOV AL,88H
    OUT PD,AL
    
    TOP:
    IN AL,PC
    TEST AL,10H
    JE NHAY
    MOV AL,FFH
    OUT PA,AL
    JMP TOP
    
    NHAY:
    MOV AL,1H
    OUT PA,AL
    CALL TIMER
    MOV CX,7
    LAP:
    ROL AL,1
    OUT PA,AL
    CALL TIMER
    LOOP LAP
    JMP TOP
    
    TIMER:
    MOV CX,30000
    LAP1:
    NOP
    NOP
    NOP
    LOOP LAP1
    RET
    
    mov ax, 4c00h ; exit to operating system.
    int 21h    
ends

end start ; set entry point and stop the assembler.
