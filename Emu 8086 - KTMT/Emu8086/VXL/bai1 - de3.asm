.model small
.stack 100h
.data
    bien db " Moi ban nhap so thap phan thu nhat:$"
    bien1 db 10,13, " Moi ban nhap so thap phan thu hai:$"
    bien2 db 10,13, " Tich hai so do la:$" 
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
    mov bl,al
    
    mov ah,9
    lea dx,bien1
    int 21h
    
    mov dx,0
    mov ah,1
    int 21h
    sub al,30h
    mul bl
    mov bx,10
    div bx
    push dx
    push ax
    
    mov ah,9
    lea dx,bien2
    int 21h 
    
    mov cx,2
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
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    