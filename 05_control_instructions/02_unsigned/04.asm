; JBE / JNA → Jump if Below or Equal

section .data
    str_be db "AX <= BX (Below or Equal) - Ian Omwenga, Student No: 161270",10,0
    len_be equ $ - str_be

    str_above db "AX > BX (Above) - Ian Omwenga, Student No: 161270",10,0
    len_above equ $ - str_above

section .text
    global _start
_start:
    mov ax,5
    mov bx,5
    cmp ax,bx
    jbe below_equal

    mov ecx, str_above
    mov edx, len_above
    jmp print

below_equal:
    mov ecx, str_be
    mov edx, len_be

print:
    mov eax,4       ; syscall: sys_write
    mov ebx,1       ; stdout
    int 0x80

    mov eax,1       ; syscall: sys_exit
    xor ebx,ebx
    int 0x80
