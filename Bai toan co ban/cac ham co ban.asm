.model small
.stack 100h
.data  
    str1 db "Hello$"
.code 

main proc
    
    ; ham ngat 1: nhap gia tri tu ban phim
    mov ah,1
    int 21h
    
    ; ham ngat 2: in ra man hinh
    mov ah,2
    mov dl,41H
    int 21h
    
    ; ham 9: in ra mh 1 chuoi ky tu
    mov ax, @data
    mov ds, ax
    
    mov ah,9
    lea dx, str1
    int 21h
    
    ; ham 4ch: ket thuc chuong trinh
    mov ah, 4ch
    int 21h
    
main endp
    
    
end main