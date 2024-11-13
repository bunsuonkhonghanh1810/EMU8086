.model small
.stack 100h
.data               
    s db 100 dup(?)    
    newline db 0Dh, 0Ah, '$'
.code
    minh_wang proc
        mov ax, @data
        mov ds, ax
        
        mov bx, 0
        
    nhaptiep:
        mov ah, 1
        int 21h
        cmp al, 13
        je inday
        mov s[bx], al
        inc bx
        jmp nhaptiep
    
    inday:
        mov cx, bx
        mov bx, 0
    
    intiep:
        mov ah, 2
        mov dl, s[bx]
        int 21h
        inc bx 
        cmp bx, cx  
        jl intiep
        
        mov ah, 4ch
        int 21h
    minh_wang endp
end