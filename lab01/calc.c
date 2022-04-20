#include <stdio.h>
#include <stdint.h>

uint32_t times(uint8_t a, uint8_t b) {
    uint8_t i = 0;
    uint32_t sum = 0;
    while (i != 8) {
        if (b & (1 << i)) sum += a << i;
        i++;
    }
    return sum;
}

uint32_t square(uint8_t value) {
    return times(value, value);
}

uint32_t cube(uint8_t value) {
    return times(value, times(value, value));
}

int main() {
    uint8_t code = 19;
    // printf("square(%d) = %d\n", code, square(code));
    // printf("cube(%d) = %d\n", code, cube(code));
    printf("%d\n", cube(code));
    return 0;
}
