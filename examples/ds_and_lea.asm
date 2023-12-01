;8086 nasm

section .data
xpos dw 50

section .text
global _start

_start:
    mov ax, 0x07C0      ; set data segment address to 0x07C0 (assuming bootloader or DOS COM format)
    mov ds, ax          ; without specifying ds, the default datasegment is assumed to be the code segment

    lea bx, [xpos]
    mov ax, [bx]        ; soad the value from memory into AX
    call print_value
    
    mov ax, 40
    mov [bx], ax        ; store the modified value back in memory
    
    mov ax, [xpos]      ; load the modified value from memory into AX
    call print_value
    
    int 20h

print_value:
    mov ah, 0x0E        ; AH = 0x0E for character output
    mov bh, 0x00        ; page number
    mov bl, 0x07        ; text attribute (white on black)
    int 10h
    ret
