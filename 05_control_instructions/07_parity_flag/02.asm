; JNP / JPO → Jump if Parity Odd

section .data
    msg_even db "Parity Even (PF=1) - Ian Omwenga, Student No: 161270",10,0
    len_even equ $ - msg_even

    msg_odd  db "Parity Odd (PF=0) - Ian Omwenga, Student No: 161270",10,0
    len_odd  equ $ - msg_odd

section .text
    global _start
_start:
    mov al,5       ; 00000101b → two 1s → even parity
    test al,al
    jnp odd

    mov ecx, msg_even
    mov edx, len_even
    jmp print

odd:
    mov ecx, msg_odd
    mov edx, len_odd

print:
    mov eax,4      ; sys_write
    mov ebx,1      ; stdout
    int 0x80

    mov eax,1      ; sys_exit
    xor ebx,ebx
    int 0x80
