.model small
.stack 100h
.data
    s1 db 100 dup(?)
    s2 db 100 dup(?)   
    s3 db 100 dup(?)
    newline db 10, 13, "$"
.code
    minh_wang proc      
        mov ax, @data
        mov ds, ax
        
        mov bx, 0
        mov si, 0 
        mov di, 0
        
    nhaptiep:
        mov ah, 1
        int 21h
        cmp al, 13
        je inday
        cmp al, 96
        jl nhohon
        jg lonhon
    
    nhohon:   
        cmp al, 64
        jl nhohonnua
        mov s1[bx], al
        inc bx
        jmp nhaptiep 
        
    lonhon:
        mov s2[si], al
        inc si
        jmp nhaptiep  
    nhohonnua:
        mov s3(di), al
        inc di
        jmp nhaptiep
        
    inday:
        mov ah, 9
        lea dx, newline
        int 21h 
        
        mov s1[bx], '$'
        mov s2(si), "$"
        mov s3(di), '$'
        
        lea dx, s1
        int 21h
        lea dx, newline
        int 21h
        lea dx, s2
        int 21h 
        lea dx, newline
        int 21h
        lea dx, s3
        int 21h
        
        mov ah, 4ch
        int 21h
    
    minh_wang endp
end