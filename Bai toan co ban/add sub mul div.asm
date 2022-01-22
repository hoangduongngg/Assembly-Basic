.model small
.stack 100h
.data
.code
main proc
    mov al, 5
    mov bl,3
    
    add al,bl  ; al=5+3=8
    sub al,bl   ; al=8-3=5
    mul bl      ; al=al*3=5*3=15
    
    mov ax,20
    mov bx,3
    
    div bl      ; al=6, ah=2 ; chia tren thanh ghi 8bits   ; 20/3=6 du 2
    div bx      ; ax=