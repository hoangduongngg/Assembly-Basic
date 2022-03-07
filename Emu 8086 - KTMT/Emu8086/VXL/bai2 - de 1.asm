.model small
.stack 100h
.data
    bien db " Tong cua day da cho la:$ "
.code
main proc
    mov ax,@data
    mov ds,ax
    
    mov ah,9
    lea dx,bien
    int 21h
    
    mov dx,0
    mov bx,2
    tong:
    add bx,2
    add dx,bx
    cmp bx,222
    je xuat
    jmp tong
    
    xuat:
    mov cx,0
    mov ax,dx
    mov bx,16
    chia:
    mov dx,0
    div bx
    push dx
    inc cx
    cmp ax,0
    je xuat1
    jmp chia
    
    xuat1:
    mov ah,2
    pop dx
    cmp dx,9
    ja xuat2
    add dx,30h
    int 21h
    loop xuat1
    jmp  ketthuc
    
    xuat2:
    add dx,37h
    int 21h
    loop xuat2
    
    ketthuc:
    mov ah,4ch
    int 21h
    
    main endp
end main
    
    