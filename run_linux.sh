# assemble and run NASM program in macOS

cd macros

nasm -f elf64 ${1}.asm
ld ${1}.o

./${1}
