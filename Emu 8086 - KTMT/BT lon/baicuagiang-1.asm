#start=Traffic_Lights.exe#
org 100h  
    mov ah,0  ;lay thoi thoi gian chay cua he thong luu vao dx
    int 1ah   ;lay thoi thoi gian chay cua he thong luu vao dx
    
    mov al,dl ;luu gia tri dl vao al
    mov dl,0  ;clear gia tri dl
    mov bl,2  ;mod cho 2 de lay 0 hoac 1
    div bl    ;mod cho 2 de lay 0 hoac 1
    cmp ah,1
    je sinhSuco
    jmp nothing  
TT:
    mov ax,[si] ;dua o nho cua si ra cong 4
    out 4,ax

sinhSuco:  
    mov ah,0
    int 1ah               ;lay thoi gian cua he thong luu vao dx
    
    mov al,dl             ;luu gia tri dl vao al
    mov dl,0              ;clear gia tri dl
    mov bl,10             
    div bl                ;mod cho 10 de lay so tu 0 den 9
    mov al,ah
    mov bl,2              ;nhan voi 2 de duoc so chan tu 0 den 18
    mul bl 
    
    mov si, offset SUCO0
    add si,ax
    mov ax,[si]
    out 4,ax                  
nothing:    
ret 


SUCO0 DW 0000_0000_0000_0000b
SUCO1 DW 0000_0000_0000_0001b   ;den 6 do
SUCO2 DW 0000_0000_0100_0000b   ;den 0 do
SUCO3 DW 0000_0000_0100_0001b   ;den 6 va 0 do
SUCO4 DW 0000_0010_0000_1000b   ;den 3 va 9 do
SUCO5 DW 0000_0000_0000_1000b   ;den 3 do
SUCO6 DW 0000_0010_0000_0000b   ;den 9 do
SUCO7 DW 0000_0010_0100_1001b   ; 0 3 6 9 do
SUCO8 DW 0000_0010 0100_0000b   ; 9 va 6 do
SUCO9 DW 0000_0000_0100_1000b   ; 6 va 3 do
ENDSUCO = $
