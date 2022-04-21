#include <stdio.h>
#include <stdint.h>

// 200110619 -> 0xBED721B

uint32_t get_hex(uint32_t value) {
  uint32_t count[8];
  uint32_t *p = count;
  while (value > 0) {
    *p = value % 16;
    // value /= 16;
    value >>= 4;
    p++;
  }
  uint32_t result = 0;
  // for (int i = 0; i < 8; i++) {
  //   printf("%1x", count[i]);
  // }
  // puts("");
  while (p != count - 1) {
    result <<= 4;
    result += *p;
    p--;
  }
  return result;
}

int main() {
  // uint32_t code = 200110619;
  // uint32_t res = get_hex(code);
  // printf("res = 0x%08x; code = 0x%08x\n", res, code);

  uint32_t res = get_hex(200110619);
  asm volatile (
    "addi s3, %[r], 0"
    :[r]"=r"(res)
  );
  return 0;
}