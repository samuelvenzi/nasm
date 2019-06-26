%include "asm_io.inc"

%macro do 0
    %ifctx while
        jmp %$begin_loop
        %$end_loop:
        %pop
    %endif
%endmacro

%macro while 3
    %push while
    %ifctx while
        %$begin_loop:
        cmp %1, %3
        j%-2 %$end_loop
    %endif
%endmacro


    global whileDo
    section .text

whileDo:

    enter 0,0 
    pusha
    mov ecx, [ebp+8]
    mov al, [ebp+12]
    mov ebx, [ebp+16]

    while ecx, l, ebx
    inc ecx
    mov eax, ecx
    call print_int
    call print_nl
    ; call dump_regs 1
    do

    popa
    mov eax, 0
    leave 
    ret

