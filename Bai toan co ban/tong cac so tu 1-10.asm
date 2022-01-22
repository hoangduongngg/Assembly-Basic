; tinh tong cac so tu 1-10

.model small
.stack 100h
.data
.code

main proc
    mov ax,1
    mov bx,0
    mov cx,10
    
    LAP:
    add bx,ax   
    inc ax      ;ax++
    LOOP LAP
    
main endp
end main