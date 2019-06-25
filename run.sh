# assemble and run NASM program inside nasm Docker

cd macros

nasm -f elf64 ${1}.asm
ld -o ${1} ${1}.o

./${1}
