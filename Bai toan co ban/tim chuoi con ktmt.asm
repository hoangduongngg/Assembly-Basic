.model small
.stack 100h
.data 
.code

main proc

    mov ax, @data
    mov ds,ax 
    mov es,ax
    mov cx,0
    cld
    
    Nhapchuoi:
    mov ah,1
    int 21h
    cmp al,'#'
    je next  
    inc cx
    push ax
    jmp Nhapchuoi 
    
    next:
    pop ax
    xor ah,ah
    dec cx
    cmp cx,0
    JE NO
    
    cmp ax,'t'
    jne next
    pop ax
    xor ah,ah 
    dec cx
    cmp ax,'m'
    jne next
    pop ax
    xor ah,ah 
    dec cx
    cmp ax,'t'
    jne next
    pop ax
    xor ah,ah 
    dec cx
    cmp ax,'k'
    jne next
    
    jmp YES
    
    NO:
    cld
    mov ah,2
    mov dl,30h
    int 21h
    jmp ketthuc
    
    YES: 
    cld
    mov ah,2
    mov dl,31h
    int 21h   

    ketthuc:
    mov ah, 4ch
    int 21h    
main endp   



end main