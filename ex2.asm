org 100h

mov ah, 0
mov al, 13h
int 10h

push word 16    ;w
push word 16    ;h
push word 50    ;x
push word 50    ;y
push crosshair  ;addr
call draw_sprite

xpos dw 50
ypos dw 50

infloop:
    push xpos
    push ypos
    call handle_key

    push word 16    ;w
    push word 16    ;h
    push xpos
    push ypos
    push crosshair  ;addr
    call draw_sprite

    jmp infloop


mov ah, 0
mov al, 3
int 10h

crosshair:
    DB 0Fh,0Fh,0Fh,0Fh,0Fh,0Fh,0Fh,00h,00h,0Fh,0Fh,0Fh,0Fh,0Fh,0Fh,0Fh     ;  0
    DB 0Fh,0Fh,0Fh,0Fh,0Fh,0Fh,0Fh,00h,00h,0Fh,0Fh,0Fh,0Fh,0Fh,0Fh,0Fh     ;  1
    DB 0Fh,0Fh,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,0Fh,0Fh     ;  2
    DB 0Fh,0Fh,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,0Fh,0Fh     ;  3
    DB 0Fh,0Fh,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,0Fh,0Fh     ;  4
    DB 0Fh,0Fh,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,0Fh,0Fh     ;  5
    DB 0Fh,0Fh,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,0Fh,0Fh     ;  6
    DB 00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h     ;  7
    DB 00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h 
    DB 0Fh,0Fh,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,0Fh,0Fh      
    DB 0Fh,0Fh,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,0Fh,0Fh     
    DB 0Fh,0Fh,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,0Fh,0Fh      
    DB 0Fh,0Fh,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,0Fh,0Fh     
    DB 0Fh,0Fh,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,0Fh,0Fh     
    DB 0Fh,0Fh,0Fh,0Fh,0Fh,0Fh,0Fh,00h,00h,0Fh,0Fh,0Fh,0Fh,0Fh,0Fh,0Fh     
    DB 0Fh,0Fh,0Fh,0Fh,0Fh,0Fh,0Fh,00h,00h,0Fh,0Fh,0Fh,0Fh,0Fh,0Fh,0Fh


%include "h\drwsprt.asm"
;%include "h\handlekb.asm"

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