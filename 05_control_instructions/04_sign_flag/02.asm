; JNS → Jump if Not Sign

section .data
    msg_neg db "Negative (SF=1) - Ian Omwenga, Student No: 161270",10,0
    len_neg equ $ - msg_neg

    msg_nonneg db "Non-Negative (SF=0) - Ian Omwenga, Student No: 161270",10,0
    len_nonneg equ $ - msg_nonneg

section .text
    global _start
_start:
    mov ax,5
    test ax,ax
    jns nonneg

    mov ecx, msg_neg
    mov edx, len_neg
    jmp print

nonneg:
    mov ecx, msg_nonneg
    mov edx, len_nonneg

print:
    mov eax,4       ; sys_write
    mov ebx,1       ; stdout
    int 0x80

    mov eax,1       ; sys_exit
    xor ebx,ebx
    int 0x80
