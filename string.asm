[org 0x7c00]     ;This is an offset for starting of memory address
mov ah, 0x0e     ; TTY mode
mov bx, variable ; Move variable values to bx

print:
    mov al,[bx]  ; Pointer of bx
    cmp al, 0    ; Check if end of string
    je end
    int 0x10
    inc bx
    jmp print

end:

jmp $


variable:
    db "This is a variable", 0  ; Add null at the end to make it a string


times 510 - ($ - $$) db 0
dw 0xaa55