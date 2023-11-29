;nasm
;draw pixel

org 100h

mov ah, 0                   ; set video mode
mov al, 13h                 ; VGA 320x200 256 color
int 10h                     ;

mov ah, 0Ch                 ; write pixel
mov bh, 0                   ; DisplayPage (?)
mov dx, 5                   ; Y
mov cx, 5                   ; X
mov al, 2                   ; color

int 10h