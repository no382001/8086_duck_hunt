org 100h
; this seems to make the mouse work, buttons and all, corrupted memory but good for demonstration
start:
    mov AX,01
    int 33h

infloop:
    mov AX,03
    int 33h
    and BX,3h

    cmp BX,1
    je  left
    cmp BX,2
    je  right

    cmp BX,0
    je  endss
    cmp bx,3 
    je  endss
    
    right:
        mov DX,[stringright]
        mov AH,09h
        int 21h

    jmp endss
  
    left:
        mov DX, [stringleft]
        mov AH,09h
        int 21h

endss:

    jmp infloop

    int 20h

stringright DB "Right Clicked $"
stringleft DB "Left Clicked $"