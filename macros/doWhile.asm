%include "asm_io.inc"

%macro do 0
    %push do
    %$begin_loop:
%endmacro

%macro while 3
    %ifctx do 
    cmp %1, %3
    j%-2 %$end_loop
    jmp %$begin_loop
    %$end_loop:
        %pop
    %endif
%endmacro


    global doWhile
    section .text

doWhile:

    enter 0,0 
    pusha
    mov ecx, [ebp+8]
    mov al, [ebp+12]
    mov ebx, [ebp+16]

    do
    inc ecx
    mov eax, ecx
    call print_int
    call print_nl
    ; call dump_regs 1
    while ecx, l, ebx

    popa
    mov eax, 0
    leave 
    ret

