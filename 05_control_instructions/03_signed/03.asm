; JL / JNGE → Jump if Less

section .data
    msg_less db "AX < BX (Signed Less) - Ian Omwenga, Student No: 161270",10,0
    len_less equ $ - msg_less

    msg_not_less db "AX >= BX (Not Less) - Ian Omwenga, Student No: 161270",10,0
    len_not_less equ $ - msg_not_less

section .text
    global _start
_start:
    mov ax,2
    mov bx,5
    cmp ax,bx
    jl less

    mov ecx, msg_not_less
    mov edx, len_not_less
    jmp print

less:
    mov ecx, msg_less
    mov edx, len_less

print:
    mov eax,4       ; syscall: sys_write
    mov ebx,1       ; stdout
    int 0x80

    mov eax,1       ; syscall: sys_exit
    xor ebx,ebx
    int 0x80
