# include <stdint.h>


int main()
{
    uint32_t seed = 0xCAFE;  
    uint32_t number = seed;
    uint32_t newBit;                  
    unsigned long int count = 0;

    do
    {  
        newBit = ((number >> 0) ^ (number >> 2) ^ (number >> 3) ^ (number >> 5) ^ (number >> 8) ^(number >> 13) ^(number >> 21)) & 1;
        number = (number >> 1) | (newBit << 23);
        number = number & 0x00FFFFFF;
        count++;
        
        // printf("%X\n", number);
    }
    while (count != 16777215);
    
    return 0;
} 