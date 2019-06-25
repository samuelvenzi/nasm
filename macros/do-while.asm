

%macro doo 0
    %push doo
    %$begin:
%endmacro

%macro while 1
    j%-1 %$begin
    %pop
%endmacro


    global start
    section .text

start:
    doo
        mov rax, 0x02000004   ; system call for write
        mov rdi, 1            ; file handle 1 is stdout
        mov rsi, message      ; address of string to output
        mov rdx, 13           ; number of bytes
        syscall

    section .data
message:  db        "Hello, World", 10      ; note the newline at the end
