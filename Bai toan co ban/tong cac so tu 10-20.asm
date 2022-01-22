; tinh tong cac so tu 10-20

.model small
.stack 100h
.data
.code

main proc
    mov ax,10
    mov bx,0    ; tong
    mov cx,11   ; lap lai 10 lan: so so hang
    
    LAP:
    add bx,ax   
    inc ax      ;ax++
    LOOP LAP
    
main endp
end main