.model small
.stack 100h
.data
.code
    minh_wang proc
        mov ah, 1
        int 21h 
        
        sub al, 48 
         
        mov bl, 10  
        mul bl           
        mov bh, al    
        
        mov ah, 1
        int 21h   
        
        sub al, 48 
        
        add al, bh
        
        mov bl, 2
        mov cl, 0

    chiatiep:
        mov ah, 0
        div bl   
        push ax
        inc cl
        cmp al, 0
        je hienso
        jmp chiatiep
        
    hienso:
        mov ch, 0
        
    intiep: 
        mov ah, 2
        pop dx
        mov dl, dh
        add dl, 48
        int 21h
        
        loop intiep
        
        mov ah, 4ch
        int 21h     
    minh_wang endp
end