#include <stdio.h>
#include <stdint.h>

uint64_t fib(uint64_t n) {
  if (n == 1 || n == 2) return 1;
  return fib(n - 1) + fib(n - 2);
}

static const uint64_t N = 20;

int main() {
  uint64_t r = fib(N);
  printf("fib(%d) = %d (%08x)\n", N, r, r);
  return 0;
}