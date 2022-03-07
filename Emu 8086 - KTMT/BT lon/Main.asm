






Ondinh:
    
    Call SINH_SUCO    ; tao suco --> AND TT,SUCO --> TT

    ;Check if exist SUCO
        cmp SUCO,0
        je LED:

    
    ;Thong bao len CONSOLE neu co 
        Call THONGBAO

    LED:
        out 4,TT
        CALL WAITT    
        
            
        CALL SUCO_KETTHUC
                
Vonglap:    
jmp Ondinh 
ret
