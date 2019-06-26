# assemble and run NASM program inside nasm Docker
set -v
cd macros

nasm -f elf -d ELF_TYPE -o asm_io.o asm_io.asm
nasm -f elf -o ${1}.o ${1}.asm
gcc -m32 -o ${1} ${1}.o ${1}.c asm_io.o 
# ld -o ${1} ${1}.o asm_io.o

./${1}
