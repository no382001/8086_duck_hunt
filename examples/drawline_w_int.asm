;nasm
;draw pixel

org 100h

mov ah, 0               ; set video mode
mov al, 13h             ; VGA 320x200 256 color
int 10h                 ;

mov bh, 0               ; DisplayPage
mov cx, 100             ; X
mov dx, 50              ; Y to start

more:
    mov ax, 0C04h       ; writepixel and color red
    int 10h
    inc dx              ; next Y
    cmp dx, 150
    jbe more