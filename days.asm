.model small
.stack 100h
.data
    s db '00-00-0000$'
    s1 db '000 $'   
    days db 'montuewedthufrisatsun$'
.code
    minh_wang proc 
        mov ax, @data
        mov ds, ax
        
        mov ah, 2ah
        int 21h
        
        mov bl, 3
        mov ah, 0
        mul bl
        mov bx, ax
        mov cx, 3
        mov si, 0
    printdays:
        mov s1+si, days(bx)
        inc si
        inc bx
        loop printdays
        
        mov ah, 0
        mov al, dl
        mov bl, 10
        div bl
        add al, 48
        add ah, 48
        mov s, al
        mov s+1, ah
        
        mov ah, 0
        mov al, dh
        mov bl, 10
        div bl
        add al, 48
        add ah, 48
        mov s+3, al
        mov s+4, ah
        
        mov bx, 10
        mov ax, cx
        mov cx, 4
    chiatiep:
        mov dx, 0
        div bx
        push dx
        loop chiatiep
        
        mov cx, 4 
        mov bx, 6
    pushnam:
        pop dx
        add dl, 48
        mov s+bx, dl
        inc bx
        loop pushnam
         
        mov ah, 9
        lea dx, s1
        int 21h
        
        mov ah, 9
        lea dx, s
        int 21h 
        
        mov ah, 4ch
        int 21h
    minh_wang endp
end                