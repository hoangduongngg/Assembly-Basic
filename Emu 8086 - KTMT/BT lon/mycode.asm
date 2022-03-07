
; You may customize this and other start-up templates; 
; The location of this template is c:\emu8086\inc\0_com_template.txt

org 100h

Ondinh:
    
    Call SINH_SUCO    ; tao suco --> AND TT,SUCO --> TT

    ;Check if exist SUCO
        cmp SUCO,0
        je LED:

    
    ;Thong bao len CONSOLE neu co 
        Call THONGBAO

    LED:
        out 4,TT
        CALL WAITT    
        
            
        CALL SUCO_KETTHUC
                
Vonglap:    
jmp Ondinh 
ret

;   BIEN TOAN CUC
TT1 DW  0000_0011_0000_1100b
TT2 DW  0000_0010_1000_0110b
TT3 DW  0000_1000_0110_0001b
TT4 DW  0000_0100_0101_0001b
sit_end = $

SUCO DW ?
TT  DW  ?
ENDSUCO DW ?

; neu muon them bien nao thi them vao sau ham su dung bien do


SUCO_KETTHUC PROC
    ; ta mac dinh la SUCO se ketthuc sau 30s
    
    ; 

Ketthuc:
ret
SUCO_KETTHUC ENDP





SINH_SUCO PROC
   ; chon tuan tu cac suco o duoi.
   
   
   ;sau khi sinh duoc SUCO :   NOT SUCO
                              ;AND TT,SUCO
   
   

Ketthuc:
ret
SINH_SUCO ENDP

        ;FEDC BA98 7654 3210

 SUCO DW 0000_0000_0000_0000b
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




THONGBAO PROC
    ; push si (neu can) ( ko hieu cho nay bao t nhe)
    ; hien thi dong chu "Co SUCO xay ra"
    ; sau do hien thi tuyen duong gap su co.
    ; code here
    
    ; su dung bien SUCO de hien thi cac den thuoc tuyen
    ; duong gap SUCO
    ; pop si (neu can)
Ketthuc:
ret
THONGBAO ENDP

    
WAITT PROC

        AND CHECK,TT
        cmp CHECK,0
        je RED_GREEN
    
    
    YELLOW:
        CALL WAIT_3s   
        jmp Ketthuc 
    
    
    RED_GREEN:
        CALL WAIT_30s
     
Ketthuc:
ret
WAITT ENDP           


WAIT_30s PROC
mov ax,30
push ax
x1:
  pop ax
  out 199, ax  
  sub ax,1
  cmp ax,0
  je Ketthuc
  push ax
  mov     cx, 0Ch    ;    code ae tham khao, toi uu lai nhe
  mov     dx, 4B40h
  mov     ah, 86h
  int     15h
  jmp x1
Ketthuc:
ret
WAIT_30s ENDP



WAIT_3s PROC
mov ax,30
push ax
x1:
  pop ax
  out 199, ax  
  sub ax,1
  cmp ax,0
  je Ketthuc
  push ax
  mov     cx, 0Ch    ;    AE tim gia tri 3 giay giup nhe
  mov     dx, 4B40h
  mov     ah, 86h
  int     15h
  jmp x1
Ketthuc:
ret
WAIT_3s ENDP

