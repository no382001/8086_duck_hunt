;nasm
;hello world

org  0x100        ; .com files always start 256 bytes into the segment

mov  dx, msg     ; address of msg in dx
mov  ah, 9       ; ah=9 output string at DS:DX terminated bz `$`
int  21h         ;

mov  ah, 0x4c    ; return control
int  21h         ; 

msg  db 'Hello, World!', 0x0d, 0x0a, '$'   ; $-terminated message