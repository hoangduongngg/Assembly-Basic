include 'emu8086.inc'
DATA SEGMENT
 TEMP DB 9,0,9 DUP(0) 

 Temp16 DB "****H$"
 S8421 DB 0
INPUT DB "Nhap xau nhi phan :$"
DATA ENDS

CODE SEGMENT
ASSUME CS:CODE,DS:DATA
do8421:
  
    MOV AL,8
    MUL TEMP[BX]
    ADD S8421,AL
    MOV AL,4
    MUL TEMP[BX+1]
    ADD S8421,AL
    MOV AL,2
    MUL TEMP[BX+2]
    ADD S8421,AL
    MOV AL,1
    MUL TEMP[BX+3]
    ADD S8421,AL
RET  
START:
    MOV AX,DATA
    MOV DS,AX

    MOV DX,OFFSET INPUT
    MOV AH,09H
    INT 21H

    MOV AH,02H
    MOV DL,0AH
    INT 21H

    MOV AH,02H
    MOV DL,0DH
    INT 21H
         ; Nhap chuoi nhi phan 8 bit DX->TEMP
    MOV DX,OFFSET TEMP
    MOV AH,0AH
    INT 21H
   
         ; Chuyen doi chuoi so thap luc phan trong TEMP thanh nhi phan
         MOV CX, 9; there are 8 bits

    TO:
           ; Chuyen ky tu 0,1 thanh so 0,1
    MOV BX,CX
         ; Loai bo don vi thu nhat va thu 2
    SUB TEMP[BX+1],48
    LOOP TO

         ; Thuc hien chuyen doi 8421 sau moi 4 bit
         ; Tong cua 4 chu so tren
    MOV BX,2;
    CALL do8421

    MOV DH,S8421
    MOV CL,4
    SHL DH,CL
         
    MOV S8421,0
         ; Tong cua 4 chu so duoi
    MOV BX,6
    CALL do8421

    MOV AL,DH
    OR AL,S8421
        
    SUB AH,AH
           
         MOV SI,OFFSET Temp16+3    
    XOR CX,CX
    MOV CL,4
    MainPart:
       ;    xuat ket qua cuoi cung
         MOV DH, AL
    
    SHR AX,1
    SHR AX,1
    SHR AX,1
    SHR AX,1

    AND DH,0FH
    ADD DH,48
         CMP DH,':'
         JA isLetter
         JB No

    isLetter:
         ADD DH,07H
    No:
         MOV [SI], DH
         DEC SI 
    LOOP MainPart
   
    MOV AH,02H
    MOV DL,0AH 
    INT 21H
    MOV AH,02H
    MOV DL,0DH 
    INT 21H
    
    MOV DX,OFFSET Temp16
    MOV AH,09H
    INT 21H
    
    MOV AH,4CH
    INT 21H
CODE ENDS
END Start