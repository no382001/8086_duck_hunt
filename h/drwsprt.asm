;===========================
; START          draw_sprite
; 
; expected stack:
; 1. WORD sprite addr
; 2. WORD Y coord
; 3. WORD X coord
; 4. WORD sprite height
; 5. WORD sprite width  
;===========================
draw_sprite:
    raddr dw 0
    pop ax
    mov [raddr], ax         ; save return address, push bf ret 

    mov ax, 0A000h          ; VGA memory segment
    mov es, ax
    pop si                  ; pop sprite address into si
                            ; offset = Y * 320 + X
    pop ax                  ; load Y position into AX
    mov bx, 320             ; BX = 320 (screen width)
    mul bx                  ; AX = Y * 320
    pop bx                  ; load X position into BX
    add ax, bx              ; AX = Y * 320 + X
    mov di, ax              ; DI = offset

    pop cx                  ; number of rows
    pop dx                  ; number of columns

    outer:
        push cx             ; save row
        push dx             ; save column

        mov cx, dx          ; column to CX

    inner:                  ; draw column
        lodsb
        mov [es:di], al     ; copy the pixel to vram
        inc di              ;
        loop inner          ; repeat for cx > 0; cx--

        pop dx              ; restore column to DX
        add di, 320         ; move to next row in vram
        sub di,dx           ; 320 - width

        pop cx              ; restore row to CX
        loop outer          ; repeat for cx > 0; cx--
    
    push word [raddr]       ; push back return address
    ret
;===========================
; END            draw_sprite
;===========================