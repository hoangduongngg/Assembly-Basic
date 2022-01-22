.model small
.stack 100h
.data     
    hello db "hello world$"
.code
main proc  
        
    ; nhap gia tri tu ban phim : ah 1
    mov ah, 1
    int 21h
    
    ; in ra mot ki tu   : ah 2
    mov ah,2 
    mov dl,35h
    int 21h
         
    ; in mot chuoi      :ah 9
    mov ax, @data
    mov ds, ax
    mov ah, 9
    lea dx, hello
    int 21h     
    
    ; dung chuong trinh : ah 4ch
    mov ah, 4ch
    int 21h
    
main endp
end main                         
