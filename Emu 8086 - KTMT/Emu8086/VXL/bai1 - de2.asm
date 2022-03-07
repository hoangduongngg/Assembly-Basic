.model small
.stack 100h
.data
    
    bien db " Moi ban nhap so nhi phan 8 bit thu 1:$"
    bien1 db 10,13," Moi ban nhap so nhi phan 8 bit thu 2:$"
    bien2 db 10,13, " Tong cua 2 so da nhap la:$ "
.code
main proc
    mov ax,@data
    mov ds,ax
    
    mov ah,9
    lea dx,bien
    int 21h
    
    mov bx,0
    mov cx,8
    nhap:
    mov ah,1
    int 21h
    sub al,30h
    xor ah,ah 
    shl bx,1
    or bx,ax 
    loop nhap
    push bx
    
    mov ah,9
    lea dx,bien1
    int 21h
    
    mov bx,0
    mov cx,8
    nhap1:
    mov ah,1
    int 21h
    sub al,30h
    xor ah,ah 
    shl bx,1
    or bx,ax 
    loop nhap1
    
    pop dx
    add bx,dx 
    
    mov ah,9
    lea dx,bien2
    int 21h
    
    mov ax,bx
    mov bx,2
    mov cx,0 
    chia:
    mov dx,0
    div bx
    push dx
    inc cx
    cmp ax,0
    je xuat
    jmp chia
    
    xuat:
    mov ah,2
    pop dx
    add dx,30h
    int 21h
    loop xuat
    
    mov ah,4ch
    int 21h
    
    main endp
end main
    
    
    
    
    
    
    