# comp-organ-lab
计算机组成原理实验

## 实验1说明

文件位于 `lab01/` 目录下。

**文件：**

1. C语言程序：
   1. `calc.c`：解析、反编译使用的 C 代码，对输出做了简化（即不调用 `printf`，否则反编译出的 `libc` 可能对反编译产生影响）
   2. `calc_prirnt.c`：运行使用的 C 代码，通过 `printf` 输出结果（$19^2 = 6859$）
2. 汇编程序：
   1. `calc.s`：`calc.c`生成的汇编代码
   2. `docs/calc_comment.s`：已经注释了的汇编代码
3. 机器码
   1. `calc.o`：.o文件
   2. `calc`：最后的可执行文件

## 实验2说明

文件位于 `lab02/` 目录下；作为作业提交时需要的两个 `.asm` 文件在根目录下。

**文件：**

1. `dec_to_hex.asm`：十进制转二进制程序
2. `fibonacci_sequence.asm`：斐波那契求 `fib(20)` 的程序

## 实验3说明

实验文件位于 `lab03/` 目录下；作为作业提交的 `booth.v/booth2.v` 和实验报告（Word）在根目录下。

**文件：**

1. `booth.v`：verilog 实现的 1 位 Booth 算法
2. `booth2.v`：verilog 实现的 2 位 Booth 算法
3. `lab03/chisel/src/main/scala/booth/Booth.scala`：Chisel 实现的 1 位 Booth 算法
4. `lab03/chisel/src/main/scala/booth/BetterBooth.scala`：Chisel 实现的 2 位 Booth 算法
5. `lab03/simulation/tmp/dump_booth(2).vcd`：仿真产生的波形文件

## 实验4说明

实验文件位于 `lab04/` 目录下；作为作业提交的 `cache.v` 和实验报告（PDF）在根目录下。

**文件：**

1. `cache.v`：直接相连的 Cache 主逻辑
2. `/实验4 直接映射Cache设计-实验报告.pdf`：实验报告
3. `lab04/cache/`：Vivado 工程