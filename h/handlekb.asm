;===========================
; START           handle_key
;
; expected stack:
; 1. WORD addr of Y coord
; 2. WORD addr of X coord
;===========================
handle_key:
    raddr2 dw 0
    pop ax
    mov [raddr2], ax        ; save return address, push bf ret

    xaddr dw 0
    pop ax
    mov [xaddr],ax          ; get addr of x

    yaddr dw 0
    pop ax
    mov [yaddr],ax          ; get addr of y

    mov ah, 01h             ; get state of the kb buffer   
    int 16h                 ; keyboard int
    jz handle_key
    
    mov ah,00h              ; read buffer to al
    int 16h
                            ; AL is ASCII of btn
    check_up:
        cmp al, 69h         ; i
        jnz check_down

        mov bx, yaddr
        inc byte [bx]  
    
    check_down:    
        cmp al, 6Bh         ; k
        jnz check_right
        
        mov bx, yaddr
        dec byte [bx]
    
    check_right:
        cmp al, 6Ch         ; l
        jnz check_left

        mov bx, xaddr
        inc byte [bx]
    
    check_left:
        cmp al, 6Ah         ; j
        jnz finish 
        
        mov bx, xaddr
        dec byte [bx]
    finish:

    push word [raddr2]       ; push back return address
    ret
;===========================
; END            draw_sprite
;===========================