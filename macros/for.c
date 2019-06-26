#include <stdio.h>

void foor(int i, char cc, int stop, int inc);

int main() {
    printf("Loading .asm...\n");

    foor(1, 'g', 7, 1);

    return 0;
}