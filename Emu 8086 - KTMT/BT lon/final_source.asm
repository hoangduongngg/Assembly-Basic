#start=led_display.exe#

#start=Traffic_Lights.exe#

include 'emu8086.inc'
org 100h
mov SUCO,0000_0000_0000_1001b
mov TT,0000_0011_0000_1100b 
mov ax,TT
out 4,ax ; khoi tao trang thai ban dau
Ondinh:
    
    Call SINH_SUCO    ; tao suco.

    ;Kiem tra co su co khong?
        cmp SUCO,0
        je LED:          
        
    
    ;Thong bao len CONSOLE neu co 
        Call THONGBAO

    LED:
        CALL _PORT4
        CALL WAITT    
        
            
        CALL SUCO_KETTHUC 
        
        CALL WAITT
                
Vonglap:    
jmp Ondinh 
ret

SUCO DW ?
TT DW ?

SINH_SUCO proc 
    ; lay 1 gia tri ngau nhien, luu vao dl
    mov ax,0  
    mov ah,0 
    int 1ah   
    
    mov al,dl ;luu gia tri dl vao al
    mov dl,0  ;clear gia tri dl
    mov bl,10  ;mod cho bl de lay so du luu vao al
    div bl    ; so du tu 0-9
    cmp ah,1       ; neu du=1=co su co, du!1=khong su co, xac suat 1/10
    je sinhSuco
    jmp nothing  
sinhSuco:  
    mov ah,0
    int 1ah               ;lay thoi gian cua he thong luu vao dx
    
    mov al,dl             ;luu gia tri dl vao al
    mov dl,0              ;clear gia tri dl
    mov bl,10           
    div bl                ;mod cho 10 de lay so tu 0 den 9
    mov al,ah             ;ah chua phan du.
    mov bl,2                ; bl.al
    mul bl 
    
    mov si, offset SUCO0
    add si,ax 
    mov ax,[si]
    mov SUCO,ax                   ;nhan voi 2 de duoc so chan tu 0 den 18
nothing:    
ret
SINH_SUCO ENDP 


SUCO0 DW 0000_0010_0000_0001b
SUCO1 DW 0000_0000_0000_0001b   ;den 6 do
SUCO2 DW 0000_0000_0100_0000b   ;den 0 do
SUCO3 DW 0000_0000_0100_1001b   ;den 6 va 0 do
SUCO4 DW 0000_0010_0000_1000b   ;den 3 va 9 do
SUCO5 DW 0000_0000_0000_1000b   ;den 3 do
SUCO6 DW 0000_0010_0000_0000b   ;den 9 do
SUCO7 DW 0000_0010_0100_1001b   ; 0 3 6 9 do
SUCO8 DW 0000_0010 0100_0000b   ; 9 va 6 do
SUCO9 DW 0000_0000_0100_1000b   ; 6 va 3 do
ENDSUCO DW 0000_0000_0000_1000b  

BATDEN proc   
    ; ktra neu su co gay mau thuan khong?
    mov ax,TT
    and ax,Do_39  ; kiem tra truc ngang co den do ko
    cmp ax,0
    je  tuyen1
    
    mov ax,TT
    and ax,Do_06  ; neu truc ngang co, kiem tra truc doc
    cmp ax,0
    je  tuyen1
    ; neu ca 2 deu co , bien doi truc ngang thanh xanh.
    mov ax,TT
    or  ax,Xanh_B5
    and ax,turnGreen5
    and ax,turnGreenB  
    mov TT,ax   
    

tuyen1: 
    ;Vang_1,Xang_2,Do_0,turnGREEN2,turnRED0,turnY1

    
    ; Kiem tra co su co hay k
    mov ax,SUCO
    and ax,Do_0
    cmp ax,0
    jne cosuco1
    DENXANHX1:
    mov ax,TT
    and ax,Xanh_2
    cmp ax,0
    je DENVANGX1
    mov ax,Vang_1 ; neu co bat den vang tuong ung
    or  TT,ax
    mov ax,turnY1
    and TT,ax
    jmp ketthuc_batden_tuyen1
    DENVANGX1:
    mov ax,TT
    and ax,Vang_1
    cmp ax,0
    je DENDOX1  
    
    cosuco1:
    mov ax,Do_0 ; neu co bat den vang tuong ung
    or  TT,ax
    mov ax,turnRED0
    and TT,ax
    jmp ketthuc_batden_tuyen1
    DENDOX1:
    mov ax,Xanh_2 ; neu co bat den vang tuong ung
    or  TT,ax
    mov ax,turnGREEN2
    and TT,ax
ketthuc_batden_tuyen1:    
    
tuyen2:

    ;Vang_4,Xanh_5,Do_3,turnGREEN5,turnRED3,turnY4
    mov ax,SUCO
    and ax,Do_3
    cmp ax,0
    jne cosuco2
    DENXANHX2:
    mov ax,TT
    and ax,Xanh_5
    cmp ax,0
    je DENVANGX2
    mov ax,Vang_4 ; neu co bat den vang tuong ung
    or  TT,ax
    mov ax,turnY4
    and TT,ax
    jmp ketthuc_batden_tuyen2
    DENVANGX2:
    mov ax,TT
    and ax,Vang_4
    cmp ax,0
    je DENDOX2
    cosuco2:
    mov ax,Do_3 ; neu co bat den vang tuong ung
    or  TT,ax
    mov ax,turnRED3
    and TT,ax
    jmp ketthuc_batden_tuyen2
    DENDOX2:
    mov ax,Xanh_5 ; neu co bat den vang tuong ung
    or  TT,ax
    mov ax,turnGREEN5
    and TT,ax

ketthuc_batden_tuyen2: 

tuyen3:

    ;Vang_7,Xanh_8,Do_6,turnGREEN8,turnRED6,turnY7
    mov ax,SUCO
    and ax,Do_6
    cmp ax,0
    jne cosuco3
    DENXANHX3:
    mov ax,TT
    and ax,Xanh_8
    cmp ax,0      ; kiem tra co xanh8 hay k
    je DENVANGX3 
    
    mov ax,Vang_7 ; neu co bat den vang tuong ung
    or  TT,ax
    mov ax,turnY7
    and TT,ax
    jmp ketthuc_batden_tuyen3    
    DENVANGX3:
    mov ax,TT
    and ax,Vang_7
    cmp ax,0
    je DENDOX3
    cosuco3:
    mov ax,Do_6 ; neu co bat den do tuong ung
    or  TT,ax
    mov ax,turnRED6
    and TT,ax
    jmp ketthuc_batden_tuyen3
    DENDOX3:
    mov ax,Xanh_8 ; neu co bat den xanh tuong ung
    or  TT,ax
    mov ax,turnGREEN8
    and TT,ax
ketthuc_batden_tuyen3:

tuyen4:

    ;Vang_A,Xanh_B,Do_9,turnGREENB,turnRED9,turnYA
    mov ax,SUCO
    and ax,Do_9
    cmp ax,0
    jne cosuco4
    DENXANHX4:
    mov ax,TT
    and ax,Xanh_B
    cmp ax,0
    je DENVANGX4
    mov ax,Vang_A ; neu co bat den vang tuong ung
    or  TT,ax
    mov ax,turnYA
    and TT,ax
    jmp ketthucbatdentuyen4
    DENVANGX4:
    mov ax,TT
    and ax,Vang_A
    cmp ax,0
    je DENDOX4
    cosuco4:
    mov ax,Do_9 ; neu co bat den vang tuong ung
    or  TT,ax
    mov ax,turnRED9
    and TT,ax
    jmp ketthucbatdentuyen4
    DENDOX4:
    mov ax,Xanh_B ; neu co bat den vang tuong ung
    or  TT,ax
    mov ax,turnGREENB
    and TT,ax


ketthucbatdentuyen4: 
ret   
BATDEN ENDP


; Port4: chuyen trang thai hien tai sang tt ke tiep 
; neu co su co=bat den do tuong ung, khong co thi chuyen sang thuc te:muc hien thi ke tiep
_PORT4 proc
   begin:

      CALL BATDEN
                              
      mov ax,TT
      out 4,ax
ret    
_PORT4 ENDP

;turn : tat 2 den con lai
turnRED0 DW 1111_1111_1111_1001b  
turnRED3 DW 1111_1111_1100_1111b
turnRED6 DW 1111_1110_0111_1111b
turnRED9 DW 1111_0011_1111_1111b
turnY1 DW 1111_1111_1111_1010b
turnY4 DW 1111_1111_1101_0111b
turnY7 DW 1111_1110_1011_1111b
turnYA DW 1111_0101_1111_1111b
turnGREEN2 DW 1111_1111_1111_1100b
turnGREEN5 DW 1111_1111_1110_0111b
turnGREEN8 DW 1111_1111_0011_1111b
turnGREENB DW 1111_1001_1111_1111b  

all_green       DW          0000_1001_0010_0100b   
Xanh_B          DW          0000_1000_0000_0000b   ;den xanh B
Xanh_8          DW          0000_0001_0000_0000b   ;den xanh 8 
Xanh_82         DW          0000_0001_0000_0100b   ;den xanh 8
Xanh_5          DW          0000_0000_0010_0000b   ;den xanh 5
Xanh_B5         DW          0000_1000_0010_0000b   ;den xanh B5
Xanh_2          DW          0000_0000_0000_0100b   ;den xanh 2 

Do_9            DW          0000_0010_0000_0000b
Do_3            DW          0000_0000_0000_1000b
Do_39            DW          0000_0010_0000_1000b
Do_6            DW          0000_0000_0100_0000b
Do_0            DW          0000_0000_0000_0001b
Do_06           DW          0000_0000_0100_0001b
Vang_7          DW          0000_0000_1000_0000b
Vang_1          DW          0000_0000_0000_0010b
Vang_A          DW          0000_0100_0000_0000b
Vang_4          DW          0000_0000_0001_0000b         
Clear_ngang     DW          0000_0001_1100_0111b
Clear_doc       DW          0000_1110_0011_1000b
Clear           DW          0000_0000_0000_0000b

;ktra su co ket thuc chua, neu kthuc=thongbao
SUCO_KETTHUC PROC
    mov ah,0  ;lay thoi thoi gian chay cua he thong luu vao dx
    int 1ah   ;lay thoi thoi gian chay cua he thong luu vao dx
    
    mov al,dl ;luu gia tri dl vao al
    mov dl,0  ;clear gia tri dl
    mov bl,2  ;mod cho 2 de lay 0 hoac 1
    div bl    
    cmp ah,1  ; neu phan du la 1 vay la su co ket thuc
    je tieptuc
    mov SUCO,0000_0000_0000b
    CALL THONGBAO
    tieptuc: 
    
    CALL BATDEN
 
Ketthuc_SUCO:
mov ax,TT
out 4,ax
ret
SUCO_KETTHUC ENDP

CHECK	DW	0000_0100_1001_0001b ; Day la trang thai cua 4 den vang.
WAITT PROC
        mov ax,CHECK
        AND ax,TT  ; TT AND CHECK de kiem tra xem TT co den vang nao ko 
        cmp ax,0   ; neu ko co den vang thi doi 30s
        je 30s
    
        ; neu co thi bat den vang. 
        ; moi lan chi bat 1 loai den. bat xong chuyen sang trang thai moi.
    3s:
        CALL WAIT_3s   
        jmp Ketthuc 
    
    
    30s:
        CALL WAIT_30s
     
Ketthuc:
ret
WAITT ENDP           





WAIT_30s PROC
mov ax,5               ;ax co gia tri 30s, vi du la 5s chay chay nhanh hon
push ax                ; Boi vi mot ly do nao do ma khi  ( jmp x1 ) bien ax bi thay doi noi dung. Do vay luu noi dung ax vao stack.
x1:
  pop ax               ;Keo ax ra khoi stack de su dung.
  out 199, ax          ;Chuyen gia tri cua ax vao port 199 cua LED.
  sub ax,1             ;giam 1 giay.
  cmp ax,0             ;neu ax == 0 co nghia la thoi gian ket thuc. Chuyen sang trang thai moi.
  je Ket1
  push ax              ;Luu ax vao stack de dam bao ko bi thay doi noi dung thanh ghi.
  mov     cx, 0Ch      ;ah == 86h (int 15h) la ngat : dung de tam ngung hoat dong cua ung dung trong khoang thoi gian 1giay;
  mov     dx, 4B40h    ; 
  mov     ah, 86h
  int     15h
  jmp x1               ;dem xong 1 giay nhay tiep den giay tiep theo
Ket1:
ret
WAIT_30s ENDP


WAIT_3s PROC
mov ax,3               ;ax co gia tri 3s
push ax                ; Boi vi mot ly do nao do ma khi  ( jmp x1 ) bien ax bi thay doi noi dung. Do vay luu noi dung ax vao stack.
x2:
  pop ax               ;Keo ax ra khoi stack de su dung.
  out 199, ax          ;Chuyen gia tri cua ax vao port 199 cua LED.
  sub ax,1             ;giam 1 giay.
  cmp ax,0             ;neu ax == 0 co nghia la thoi gian ket thuc. Chuyen sang trang thai moi.
  je Ket2
  push ax              ;Luu ax vao stack de dam bao ko bi thay doi noi dung thanh ghi.
  mov     cx, 0Ch      ;ah == 86h (int 15h) la ngat : dung de tam ngung hoat dong cua ung dung trong khoang thoi gian 1giay;
  mov     dx, 4B40h    ; 
  mov     ah, 86h
  int     15h
  jmp x2               ;dem xong 1 giay nhay tiep den giay tiep theo
Ket2:
ret
WAIT_3s ENDP  


THONGBAO proc 
    
    mov ax,SUCO
    cmp ax,0
    je  KOSUCO
    mov dx,offset nhap
    mov ah,9
    int 21h

    mov ah,2h    ;xuong dong
    mov dl,0ah
    int 21h

    mov ah,2h    ;xuong dong
    mov dl,0dh
    int 21h
    
    jmp EndTB
    KOSUCO: 
    mov dx,offset nhap1
    mov ah,9
    int 21h

    mov ah,2h    ;xuong dong
    mov dl,0ah
    int 21h

    mov ah,2h    ;xuong dong
    mov dl,0dh
    int 21h
EndTB:
ret
THONGBAO ENDP

nhap db "Co SUCO !!!!!!!!!!!!! $"
nhap1 db "SUCO da ket thuc$"  