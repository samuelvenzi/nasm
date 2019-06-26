# NASM 

## Set-up environment and run your ASM program

* Install Docker
* Build image with `./dockerBuild.sh`
* Bring container up `./dockerUp.sh`
* Run your program (that should be inside `macros` folder for now) `./dockerRun.sh yourprogram` (without .asm)

Make sure that `yourprogram` has a `yourprogram.asm` and a `yourprogram.c` that calls it. Also, make sure that Paul Carter's libraries for I/O (`asm_io.asm` and `asm_io.inc`) are in the same folder as your program. Finally, make sure you include it in the `.asm` file with `%include "asm_io.inc"`.

## Macros
### do while

```./dockerRun doWhile```

### while do

### for

### switch



