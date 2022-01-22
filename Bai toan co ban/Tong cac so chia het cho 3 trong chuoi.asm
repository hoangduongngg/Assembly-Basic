.model small
.stack 100h
.data
    list db 10,6,7,8,5,3,9,2 
.code

main proc

    mov ax, @data
    mov ds,ax 
    
    lea SI,list
         
    mov cx,8       ; dem
    mov dl,0        ; dx=tong
    ktra:  
    lodsb           ; lay ra tu stack, so ->AL
    mov bl,3
    xor ah,ah
    div bl          ; so du luu vao ah
    cmp ah,0
    JNE next
    mul bl
    add dl,al
    next: 
    loop ktra 
    
    call hthi
         
    mov ah, 4ch
    int 21h    
main endp     
    
hthi proc
    mov bx,10
    mov ax,dx
    mov cx,0
chia:
    mov dx,0
    div bx     ; so du luu vao dx , thuong luu vao ax
    inc cx     ; c++
    push dx
    cmp ax,0
    je ht
    jmp chia
ht:
    pop dx 
    add dl,'0'
    mov ah,2
    int 21h
    dec cx
    cmp cx,0
    jne ht
    ret
hthi endp   

end main