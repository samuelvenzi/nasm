%include "asm_io.inc"


global lsfr
section .text

lsfr: 
    mov edx, 0 
    mov ebx, seed

    do:
    mov ecx, ebx ; we will use ecx as the first operand in XOR
    mov eax, ebx ; we will use eax as the second operand in XOR

    shr eax, 2      ; (number >> 2) 
    xor ecx, eax    ; (number >> 0) ^ (number >> 2)
    shr eax, 1      ; (number >> 3) 
    xor ecx, eax    ; (number >> 0) ^ (number >> 2) ^ (number >> 3)
    shr eax, 2      ; (number >> 5) 
    xor ecx, eax    ; (number >> 0) ^ (number >> 2) ^ (number >> 3) ^ (number >> 5) 
    shr eax, 3      ; (number >> 8) 
    xor ecx, eax    ; (number >> 0) ^ (number >> 2) ^ (number >> 3) ^ (number >> 5) ^ (number >> 8)  
    shr eax, 5      ; (number >> 13) 
    xor ecx, eax    ; (number >> 0) ^ (number >> 2) ^ (number >> 3) ^ (number >> 5) ^ (number >> 8) ^ (number >> 13)
    shr eax, 8      ; (number >> 21) 
    xor ecx, eax    ; (number >> 0) ^ (number >> 2) ^ (number >> 3) ^ (number >> 5) ^ (number >> 8) ^ (number >> 13) ^ (number >> 21)


    jne do

    


section .data
    seed    dw 0xCAFE