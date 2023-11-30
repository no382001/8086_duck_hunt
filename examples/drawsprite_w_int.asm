;nasm
;draw sprite

org 100h

mov ah, 0           ; set video mode
mov al, 13h         ; VGA 320x200 256 color
int 10h             ;

mov si, sprite
mov bh, 0           ; DisplayPage
mov dx, 33          ; Y to start


; LODSB
; Load byte at DS:[SI] into AL. Update SI.
;
; Algorithm:  
;
;    AL = DS:[SI]  
;    if DF = 0 then
;        SI = SI + 1 
;    else
;        SI = SI - 1

outer:
    mov cx, 200    ; xpos
inner:
    lodsb              ;  
    mov ah, 0Ch    ; write pixel
    int 10h
    inc cx         ; next X
    cmp cx, 209    ;
    jbe inner
    inc dx         ; next Y
    cmp dx, 35
    jbe outer

sprite:
    db 1, 3, 1, 3, 1, 3, 1, 3, 1, 3
    db 3, 1, 3, 1, 3, 1, 3, 1, 3, 1
    db 1, 3, 1, 3, 1, 3, 1, 3, 1, 3 