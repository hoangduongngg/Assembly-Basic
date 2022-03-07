

CHECK	DW	0000 0100 1001 0001 ; Day la trang thai cua 4 den vang.

WAITT PROC

        AND CHECK,TT  ; TT AND CHECK de kiem tra xem TT co den vang nao ko 
        cmp CHECK,0   ; neu ko co thi bat den xanh.
        je RED_GREEN  
    
        ; neu co thi bat den vang. 
        ; moi lan chi bat 1 loai den. bat xong chuyen sang trang thai moi.
    YELLOW:
        CALL WAIT_3s   
        jmp Ketthuc 
    
    
    RED_GREEN:
        CALL WAIT_30s
     
Ketthuc:
ret
WAITT ENDP           





WAIT_30s PROC
mov ax,30          ;ax co gia tri 30s
push ax                ; Boi vi mot ly do nao do ma khi  ( jmp x1 ) bien ax bi thay doi noi dung. Do vay luu noi dung ax vao stack.
x1:
  pop ax               ;Keo ax ra khoi stack de su dung.
  out 199, ax          ;Chuyen gia tri cua ax vao port 199 cua LED.
  sub ax,1             ;giam 1 giay.
  cmp ax,0             ;neu ax == 0 co nghia la thoi gian ket thuc. Chuyen sang trang thai moi.
  je Ketthuc
  push ax              ;Luu ax vao stack de dam bao ko bi thay doi noi dung thanh ghi.
  mov     cx, 0Ch      ;ah == 86h (int 15h) la ngat : dung de tam ngung hoat dong cua ung dung trong khoang thoi gian 1giay;
  mov     dx, 4B40h    ; 
  mov     ah, 86h
  int     15h
  jmp x1               ;dem xong 1 giay nhay tiep den giay tiep theo
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
  mov     cx, 2Dh    ;    AE tim gia tri 3 giay giup nhe
  mov     dx, C6C0h
  mov     ah, 86h
  int     15h
  jmp x1
Ketthuc:
ret
WAIT_3s ENDP