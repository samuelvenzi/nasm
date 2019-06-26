%include "asm_io.inc"


global main
section .text

main: 
    mov edx, 0   ; counter
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

    shr eax, 1
    shl ecx, 23
    or eax, ecx     ; (number >> 1) | (newBit << 23)
    mov ebx, eax
    
    ; call dump_regs 1

    and eax, 0x00FFFFFF ; 24 bits

    inc edx
    cmp edx, 16777215 ; number of numbers to be generated
    jne do

    mov eax, message
    call print_string

    mov ebx, 0
	mov eax, 1
	int 0x80

section .data
    seed    dw 0xCAFE
    message db "Finished!", 10