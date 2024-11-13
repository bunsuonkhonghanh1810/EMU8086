.model small
.stack 100h
.data
    s db '00:00:00$'
.code 
    minh_wang proc 
        mov ax, @data
        mov ds, ax
        
        mov ah, 2ch
        int 21h
        
        mov ah, 0
        mov al, ch
        mov bl, 10
        div bl
        add al, 48
        add ah, 48
        mov s, al
        mov s+1, ah 
        
        mov ah, 0
        mov al, cl
        mov bl, 10
        div bl
        add al, 48
        add ah, 48
        mov s+3, al
        mov s+4, ah 
        
        mov ah, 0
        mov al, dh
        mov bl, 10
        div bl
        add al, 48
        add ah, 48
        mov s+6, al
        mov s+7, ah 
        
        mov ah,   9
        lea dx, s
        int 21h
        
        mov ah, 4ch
        int 21h   
    minh_wang endp
end