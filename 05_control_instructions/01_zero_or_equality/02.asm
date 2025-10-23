; jne_jnz.asm

section .data
    msg_equal db "AX == BX (Equal, ZF=1) - Ian Omwenga, Student No: 161270",10,0
    len_equal equ $ - msg_equal

    msg_not_equal db "AX != BX (Not Equal, ZF=0) - Ian Omwenga, Student No: 161270",10,0
    len_not_equal equ $ - msg_not_equal

section .text
    global _start
_start:
    mov ax, 5
    mov bx, 3
    cmp ax, bx
    jne not_equal

    mov ecx, msg_equal
    mov edx, len_equal
    jmp print

not_equal:
    mov ecx, msg_not_equal
    mov edx, len_not_equal

print:
    mov eax,4       ; syscall: sys_write
    mov ebx,1       ; file descriptor (stdout)
    int 0x80

    mov eax,1       ; syscall: sys_exit
    xor ebx,ebx
    int 0x80
