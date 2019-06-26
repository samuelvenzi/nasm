# assemble and run NASM program inside nasm Docker
set -v
cd lfsr

nasm -f elf -d ELF_TYPE -o asm_io.o asm_io.asm
nasm -f elf -o lfsr.o lfsr.asm
gcc -m32 -o lfsr lfsr.o asm_io.o 
# ld -o lfsr lfsr.o asm_io.o

./lfsr
