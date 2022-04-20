#include <stdint.h>
#include <stdio.h>

int _start() {
  uint8_t code = 19;
  uint8_t i = 0;
  uint32_t sum = 0;
  while (i != 8) {
    if (code & (1 << i)) sum += code << i;
    i++;
  }
  uint32_t sq = sum;
  i = 0;
  sum = 0;
  while (i != 16) {
    if (code & (1 << i)) sum += sq << i;
    i++;
  }
  // printf("%d\n", sum);
  return (int)sum;
}
