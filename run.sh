# assemble and run NASM program in macOS

cd examples

nasm -f macho64 ${1}.asm
ld -macosx_version_min 10.7.0 -lSystem -o ${1} ${1}.o asm_io.o

./${1}
