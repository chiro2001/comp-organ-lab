#include <stdint.h>
#include <stdio.h>
#include <stdlib.h>

#define concat_temp(x, y) x##y
#define concat(x, y) concat_temp(x, y)
#define concat3(x, y, z) concat(concat(x, y), z)
#define concat4(x, y, z, w) concat3(concat(x, y), z, w)
#define concat5(x, y, z, v, w) concat4(concat(x, y), z, v, w)

#define SEXT(x, len)     \
  ({                     \
    struct {             \
      int64_t n : (len); \
    } __x = {.n = x};    \
    (int64_t) __x.n;     \
  })

struct lookup_result_t {
  uint32_t imm;
  uint32_t rs1;
  uint32_t rs2;
  uint32_t rd;
  uint32_t fun3;
  uint32_t fun7;
};
typedef struct lookup_result_t lookup_result;

lookup_result lookup_error = {
    .imm = 0, .rs1 = 0, .rs2 = 0, .rd = 0, .fun3 = 0, .fun7 = 0};

int lookup_table(const char *string, uint32_t inst) {
  const char *p = string;
  int skip = 0;
  int ok = 1;
  while (p && *p) {
    if (*p == '?') {
      p++;
      continue;
    } else if (*p == ' ') {
      p++;
      skip++;
      continue;
    } else if ((((inst << (uint32_t)(p - string - skip)) & 0x80000000)
                    ? 1
                    : 0) == (*p - '0')) {
      p++;
      continue;
    } else {
      ok = 0;
      break;
    }
  }
  return ok;
}

lookup_result t_I(uint32_t i) {
  lookup_result r = {.imm = SEXT(i >> 20, 12),
                     .rs1 = (i >> 15) & 0x1f,
                     .rs2 = 0,
                     .rd = (i >> 7) & 0x1f,
                     .fun3 = (i >> 12) & 0x3,
                     .fun7 = 0};
  return r;
}

lookup_result t_R(uint32_t i) {
  lookup_result r = {.imm = 0,
                     .rs1 = (i >> 15) & 0x1f,
                     .rs2 = (i >> 20) & 0x1f,
                     .rd = (i >> 7) & 0x1f,
                     .fun3 = (i >> 12) & 0x3,
                     .fun7 = (i >> 25) & 0x7f};
  return r;
}

lookup_result t_S(uint32_t i) {
  lookup_result r = {.imm = (i >> 7) & 0x1f + SEXT((i >> 25), 7),
                     .rs1 = (i >> 15) & 0x1f,
                     .rs2 = (i >> 20) & 0x1f,
                     .rd = 0,
                     .fun3 = (i >> 12) & 0x3,
                     .fun7 = 0};
  return r;
}

lookup_result t_B(uint32_t i) {
  lookup_result r = {
      .imm = SEXT((((i >> 8) & 0xf) << 1) + (((i >> 25) & 0x3f) << 5) +
                      (((i & 0x80) ? 1 : 0) << 11) +
                      (((i & 0x80000000) ? 1 : 0) << 12),
                  12),
      .rs1 = (i >> 15) & 0x1f,
      .rs2 = (i >> 20) & 0x1f,
      .rd = 0,
      .fun3 = (i >> 12) & 0x3,
      .fun7 = 0};
  return r;
}

lookup_result t_U(uint32_t i) {
  lookup_result r = {.imm = SEXT(i >> 12, 20),
                     .rs1 = 0,
                     .rs2 = 0,
                     .rd = (i >> 7) & 0x1f,
                     .fun3 = 0,
                     .fun7 = 0};
  return r;
}

lookup_result t_J(uint32_t i) {
  lookup_result r = {.imm = SEXT((((i >> 21) & 0x3ff) << 1) + (((i & 0x80000) ? 1 : 0) << 11) +
                                     (((i >> 12) & 0xff) << 12) +
                                     (((i & 0x80000000) ? 1 : 0) >> 12),
                                 20),
                     .rs1 = 0,
                     .rs2 = 0,
                     .rd = (i >> 7) & 0x1f,
                     .fun3 = 0,
                     .fun7 = 0};
  return r;
}

const char *r_regs[] = {"$0", "ra", "sp",  "gp",  "tp", "t0", "t1", "t2",
                        "s0", "s1", "a0",  "a1",  "a2", "a3", "a4", "a5",
                        "a6", "a7", "s2",  "s3",  "s4", "s5", "s6", "s7",
                        "s8", "s9", "s10", "s11", "t3", "t4", "t5", "t6"};

char *disp(uint32_t inst, lookup_result r) {
  char *buf = malloc(128);
  char *p = buf;
  sprintf(p, "inst: %08x ", inst);
  p += 15;
  if (r.rs1) {
    sprintf(p, "rs1: %-3s ", r_regs[r.rs1]);
    p += 9;
  }
  if (r.rs2) {
    sprintf(p, "rs2: %-3s ", r_regs[r.rs2]);
    p += 9;
  }
  sprintf(p, "imm: %08x ", r.imm);
  p += 14;
  if (r.rd) {
    sprintf(p, "rd: %-3s ", r_regs[r.rd]);
    p += 8;
  }
  *p = '\0';
  return buf;
}

#define lookup(string, inst, type)    \
  do {                                \
    if (lookup_table(string, inst)) { \
      return concat(t_, type)(inst);  \
    }                                 \
  } while (0)

lookup_result lookup_instr(uint32_t inst) {
  lookup("????????????????? ??? ????? 0000011", inst, I);
  lookup("????????????????? ??? ????? 0010011", inst, I);
  lookup("????????????????? ??? ????? 0011011", inst, I);
  lookup("????????????????? ??? ????? 0111011", inst, I);
  lookup("????????????????? ??? ????? 0100011", inst, S);
  lookup("????????????????? ??? ????? 0110011", inst, R);
  lookup("????????????????? ??? ????? 0010011", inst, R);
  lookup("????????????????? ??? ????? 1100011", inst, B);
  lookup("????????????????? ??? ????? 1101111", inst, J);
  lookup("????????????????? ??? ????? 1100111", inst, I);
  return lookup_error;
}

int is_lookup_err(lookup_result res) {
  return res.imm == lookup_error.imm && res.rs1 == lookup_error.rs1 &&
         res.rs2 == lookup_error.rs2 && res.rd == lookup_error.rd &&
         res.fun3 == lookup_error.fun3 && res.fun7 == lookup_error.fun7;
}

#define rAssert(x, string)         \
  do {                             \
    if (!(x)) {                    \
      printf("Error: %s", string); \
      return 1;                    \
    }                              \
  } while (0)

int main(int argc, char **argv) {
  uint32_t inst = argc == 2 ? (uint32_t)atoi(argv[1]) : 0x01430513;
  lookup_result res = lookup_instr(inst);
  if (is_lookup_err(res)) {
    printf("Error inst: %08x", inst);
  } else {
    printf("%s", disp(inst, res));
  }
  return 0;
}