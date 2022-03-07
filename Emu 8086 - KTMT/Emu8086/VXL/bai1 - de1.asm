.model small
.stack 100h
.data
    bien db " Moi ban nhap so thap phan thu nhat:$"
    bien2 db 10,13, " Moi ban nhap so thap phan thu hai:$"
    bien3 db 10,13, " Tong hai so do la:$"
.code
main proc
    mov ax,@data
    mov ds,ax
    
    mov ah,9
    lea dx,bien
    int 21h
    
    mov ah,1
    int 21h
    sub al,30h
    mov bl,10
    mul bl
    mov bl,al
    mov ah,1
    int 21h
    sub al,30h
    add bl,al
    mov cl,bl
    
    mov ah,9
    lea dx,bien2
    int 21h 
    
    mov ah,1
    int 21h
    sub al,30h
    mov bl,10
    mul bl
    mov bl,al
    mov ah,1
    int 21h
    sub al,30h
    add bl,al
    add cl,bl
    
    mov ah,9
    lea dx,bien3
    int 21h
    
    mov ch,0
    mov ax,cx
    mov cx,0
    mov bx,10
    chia:
    mov dx,0
    div bx
    push dx
    inc cx
    cmp ax,10
    jb xuat
    jmp chia
    xuat:
    push ax
    inc cx
    xuat2:
    mov ah,2
    pop dx
    add dx,30h
    int 21h
    loop xuat2 
    mov ah,4ch
    int 21h
    
    main endp
end main
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
     
    
    
    
    