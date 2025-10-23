; JO → Jump if Overflow

section .data
    msg_ov    db "Overflow occurred (OF=1) - Ian Omwenga, Student No: 161270",10,0
    len_ov    equ $ - msg_ov

    msg_noov  db "No overflow (OF=0) - Ian Omwenga, Student No: 161270",10,0
    len_noov  equ $ - msg_noov

section .text
    global _start
_start:
    mov ax,7FFFh      ; largest positive signed 16-bit integer
    add ax,1          ; causes signed overflow (7FFFh + 1 = 8000h, negative)
    jo overflow

    mov ecx, msg_noov
    mov edx, len_noov
    jmp print

overflow:
    mov ecx, msg_ov
    mov edx, len_ov

print:
    mov eax,4         ; sys_write
    mov ebx,1         ; stdout
    int 0x80

    mov eax,1         ; sys_exit
    xor ebx,ebx
    int 0x80
