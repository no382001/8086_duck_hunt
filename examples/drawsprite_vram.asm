;nasm
;draw sprite

org 100h

mov ah, 0
mov al, 13h
int 10h

; LODSB
; Load byte at DS:[SI] into AL. Update SI.
;
;    AL = DS:[SI]  
;    if DF = 0 then
;        SI = SI + 1 
;    else
;        SI = SI - 1

mov ax, 0A000h          ; VGA memory segment
mov es, ax              ; point ES to the VGA memory segment
mov si, sprite          ; point SI to sprite data

posx dw 50             ; X position
posy dw 50             ; Y position

                        ; offset = Y * 320 + X
mov ax, [posy]          ; Load Y position into AX
mov bx, 320             ; BX = 320 (screen width)
mul bx                  ; AX = Y * 320
add ax, [posx]          ; AX = Y * 320 + X
mov di, ax              ; DI = offset

mov cx, 3               ; number of rows
mov dx, 10              ; number of columns

draw_sprite:
    push cx             ; Save CX (row)
    push dx             ; Save DX (column)

    mov cx, dx          ; column to CX


draw_column:
    lodsb
    mov [es:di], al     ; copy the pixel to vram
    inc di              ;
    loop draw_column    ; repeat for cx > 0; cx--

    pop dx              ; restore column to DX
    add di, 320 - 10    ; move to next row in vram

    pop cx              ; restore row to CX
    loop draw_sprite    ; repeat for cx > 0; cx--

infloop: 
    jmp infloop

                        ; restore text mode, otherwise text mode memory gets corrupted
                        ; and writes random chars to the screen
mov ah, 0
mov al, 3
int 10h

sprite:
    db 1, 3, 1, 3, 1, 3, 1, 3, 1, 3
    db 3, 1, 3, 1, 3, 1, 3, 1, 3, 1
    db 1, 3, 1, 3, 1, 3, 1, 3, 1, 3
