#include <stdio.h>
#include <stdint.h>

uint32_t hex(uint32_t value) {
  uint32_t stack[8];
  uint32_t *p = stack;
  while (value > 0) {
    *p = value % 16;
    value >>= 4;
    p++;
  }
  --p;
  uint32_t result = 0;
  while (p != stack - 1) {
    result <<= 4;
    result += *p;
    p--;
  }
  return result;
}

int main() {
  uint32_t res = hex(200110619);
  asm volatile (
    "addi s3, %[r], 0"
    :[r]"=r"(res)
  );
  // printf("0x%08x\n", res);
  return 0;
}