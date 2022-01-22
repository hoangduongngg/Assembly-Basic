.model small
.stack 100h
.data
    str1 db 10 DUP('')
          db '$'  
        
    x dw ?
    y dw ?
.code

main proc
    
main endp 
    mov ax, @data
    mov ds,ax
    mov es,ax 
    
    lea SI,stack
    lea DI,stack  
         
    mov cx,10 
    nhap: 
    call nhapso
    mov ax,x
    stosb
    cld
    loop nhap
           
           
    mov cx,10       ; dem
    mov dx,0        ; dx=tong
    ktra:       
    pop ax
    mov bl,3
    div bl          ; so du luu vao ah
    cmp ah,0
    JNE next
    mul bl
    add dl,al
    next: 
    loop ktra      
           
           
    mov ah, 4ch
    int 21h
    
       
       
       
       
nhapso proc
    mov x,0
    mov y,0
    mov bx,10
lap:
    mov ah,1
    int 21h
    cmp al,13     
    je thoat         ; neu Enter thi thoat
    sub al,30h       ; dua al ve dang so thap phan do cach nhau 30h (xem bang ma ascii)
    xor ah,ah        ; ah=0, de nhan bx.al ben duoi
    mov y,ax         ; y=ax=al vua nhap vao
    mov ax,x         ; ax=x; muc dich de nhan voi bx ben duoi
    mul bx
    add ax,y        
    mov x,ax         ; x=ax de tinh tiep
    jmp lap
thoat:
    ret                ; reset all gia tri ve ban dau 
nhapso endp

end main