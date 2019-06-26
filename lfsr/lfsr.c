#include <stdint.h>
#include <stdio.h>
#include <stdlib.h>

#define M1 1048576
#define M16 16777215

int main()
{
    uint32_t seed = 0xCAFE;  
    uint32_t number = seed;
    uint32_t newBit;                  
    unsigned long int count = 0;
    unsigned long long int aleat[16];
    for(int i = 0; i < 16; i++) aleat[i] = -1;
    do
    {  
        newBit = ((number >> 0) ^ (number >> 2) ^ (number >> 3) ^ (number >> 5) ^ (number >> 8) ^(number >> 13) ^(number >> 21)) & 1;
        number = (number >> 1) | (newBit << 23);
        number = number & 0x00FFFFFF;
        for (unsigned int i = 0; i < 16; i++) {
            if (number >= i*M1 && number < (i+1)*M1) { 
                aleat[i] += 1;
                break;
            }
        }
        count++;
        
        // printf("%X\n", number);
    }
    while (count != M16);
    for (int i = 0; i < 16; i++) printf("freq: %lu\n", aleat[i]);
    float sum = 0;
    for (int i = 0; i < 16; i++) {
        sum += ((float)(abs(aleat[i]-M1)*abs(aleat[i]-M1))/M1);
    }
    printf("Chi: %lf\n", sum);
    return 0;
} 