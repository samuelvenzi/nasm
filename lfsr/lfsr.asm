%include "asm_io.inc"

%define M1 1048576
%define M16 16777215

global main
section .text

main: 

    mov edi, 0 ; group counter

    ; while:
    ;     mov edx, 0   ; counter
    ;     mov ebp, 0   
    ;     mov ebx, seed
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

            and eax, 0x00FFFFFF ; 24 bits

            inc edx
            cmp edx, 16777215 ; number of numbers to be generated
        jne do

    inc edi
    cmp edi, 16

    ; ; call dump_regs 1

    ; jne while

    mov eax, message
    call print_string

    ; mov edx, 0   
    ; print:
    ;     mov eax, message1
    ;     call print_string
    ;     mov eax, [array + edx*4]
	; 	call print_int
    ;     call print_nl
    ;     inc edx
    ;     cmp edx, 16
    ; jne print

    
    mov ebx, 0
	mov eax, 1
	int 0x80

section .data
    seed    dw 0xCAFE
    message db "Finished!", 10
    ; message1 db "group:", 10


section .bss
    array resd 16