org 100h

mov ah, 0
mov al, 13h
int 10h

push word 10  ; width
push word 3   ; height
push word 50  ; x
push word 50  ; y
push sprite   ; address of sprite
call draw_sprite

infloop: 
    jmp infloop


mov ah, 0
mov al, 3
int 10h

sprite:
    db 1, 3, 1, 3, 1, 3, 1, 3, 1, 3
    db 3, 1, 3, 1, 3, 1, 3, 1, 3, 1
    db 1, 3, 1, 3, 1, 3, 1, 3, 1, 3

%include "h\drwsprt.asm"