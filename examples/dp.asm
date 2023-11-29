;nasm
;draw pixel

org 100h

mov ah, 0                   ; set video mode
mov al, 13h                 ; VGA 320x200 256 color
int 10h                     ;

mov ah, 0Ch                 ;single pixel
mov bh, 0                   ;color
mov dx, 5                   ;x
mov cx, 5                   ;y
mov al, 4
int 10h