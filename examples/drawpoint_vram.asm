org 100h

mov ah, 0
mov al, 13h
int 10h

mov ax, 0A000h  ; VGA memory segment
mov es, ax      ; point ES to the VGA memory segment

posx dw 100     ; X position
posy dw 100     ; Y position

; calculate the offset in video memory
; offset = Y * 320 + X
mov ax, [posy]  ; load Y position into AX
mov bx, 320     ; BX = 320 (screen width)
mul bx          ; AX = Y * 320
add ax, [posx]  ; AX = Y * 320 + X
mov di, ax      ; DI = offset

mov al, 1 ;red

; vram
mov [es:di], al

infloop: 
    jmp infloop

; otherwise text mode memory gets corrupted and writes random chars to the screen
mov ah, 0
mov al, 3
int 10h