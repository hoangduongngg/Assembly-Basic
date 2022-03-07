.model small
.stack 100h
.data 
    a db " moi ban nhap mot chuoi so: $"
    b db 10,13, " So chan trong day la:$ "
    c db 10,13, " Tong cua cac so chan la: $"
.code
main proc
    mov ax,@data
    mov ds,ax
    
    mov ah,9
    lea dx,a
    int 21h
    
    mov cx,0
    nhap:
    mov dx,0
    mov ah,1
    int 21h
    cmp al,13
    je xuat
    sub al,30h
    mov ah,0
    push ax
    mov bx,2
    div bx
    cmp dx,1
    je dem
    pop dx
    add cl,dl
    jmp nhap
    
    dem:
    add ch,1
    jmp nhap
    
    xuat:
    mov ah,9
    lea dx,b
    int 21h
    
    mov bl,ch
    mov ch,0
    push cx
    mov cx,0
    mov ax,bx
    mov bx,10
    chia:
    mov dx,0
    div bx
    push dx
    inc cx
    cmp ax,0
    je xuat2
    jmp chia
    
    xuat2:
    mov ah,2
    pop dx
    add dx,30h
    int 21h
    loop xuat2
    
    mov ah,9
    lea dx,c
    int 21h
     
    pop dx
    mov ax,dx
    mov bx,10
    chia2:
    mov dx,0
    div bx
    push dx
    inc cx
    cmp ax,0
    je xuat3
    jmp chia2
    
    xuat3:
    mov ah,2
    pop dx
    add dx,30h
    int 21h
    loop xuat3
    jmp ketthuc
    
    ketthuc:
    mov ah,4ch
    int 21h
    
    main endp
end main
     