%include "asm_io.inc"

section .data
    msg db "Soma acumulada: ", 0
section .text
    global foor 
    
%macro begin 0
    %push for
    jmp testa
%$continue:
%endmacro

%macro for 3
    %ifctx for
    cmp %1, %3
    j%2 %$fim
    jmp %$continue
    %$fim:
        %pop
    %endif
%endmacro
    
foor:         
    enter 0,0
    pusha  
    mov ecx, [ebp+8]
    mov edx, [ebp+12]
    mov ebx, [ebp+16]
    mov edi, [ebp+20]
    mov esi, 0   ; inicializa acumulador
main_loop:
    begin
    add esi, ecx     ; acumula resultado da soma
    add ecx, edi      ;soma indice com incremento do usuario
    jmp main_loop
testa:
    for ecx, ge, ebx



    mov eax, msg            ; printando a soma
    call print_string
    mov eax, esi
    call print_int
    call print_nl

    popa
    leave

    ret