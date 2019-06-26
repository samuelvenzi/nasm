%include "asm_io.inc"

%macro switch 1
    mov rdx, $1
    %push switch

%endmacro

%macro case 1
    %ifctx switch
    %push case
    cmp rdx, %1
    
    %endif

%endmacro


    global switchCase
    section .text

switchCase: 
    mov ebx, 4
    switch ebx
    case 1
        mov eax, out1
        call print_string
        call print_nl
    case 2
        mov eax, out2
        call print_string
        call print_nl
    case 3
        mov eax, out3
        call print_string
        call print_nl
    ; default
    ;     mov eax, out4
    ;     call print_string
    ;     call print_nl
    ; endswitch
break:



section .data

out1 db "INSIDE CASE 1", 10
out2 db "INSIDE CASE 2", 10
out3 db "INSIDE CASE 3", 10
out4 db "INSIDE DEAFULT", 10

