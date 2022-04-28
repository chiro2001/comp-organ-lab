module Booth(
  input         clock,
  input         reset,
  input  [15:0] io_x,
  input  [15:0] io_y,
  output        io_busy,
  input         io_start,
  output [31:0] io_z
);
`ifdef RANDOMIZE_REG_INIT
  reg [31:0] _RAND_0;
  reg [31:0] _RAND_1;
  reg [31:0] _RAND_2;
  reg [31:0] _RAND_3;
  reg [31:0] _RAND_4;
  reg [31:0] _RAND_5;
  reg [31:0] _RAND_6;
  reg [31:0] _RAND_7;
`endif // RANDOMIZE_REG_INIT
  reg [15:0] a; // @[Booth.scala 18:18]
  reg [15:0] q; // @[Booth.scala 19:18]
  reg  qExtra; // @[Booth.scala 20:23]
  reg [7:0] cnt; // @[Booth.scala 21:20]
  reg [1:0] state; // @[Booth.scala 25:22]
  wire [1:0] _T = io_start ? 2'h1 : 2'h0; // @[Booth.scala 28:21]
  wire  _nextState_T = 2'h0 == state; // @[Mux.scala 81:61]
  wire  _nextState_T_2 = 2'h1 == state; // @[Mux.scala 81:61]
  wire  _nextState_T_4 = 2'h2 == state; // @[Mux.scala 81:61]
  reg [15:0] xReg; // @[Booth.scala 37:21]
  reg [15:0] minusXReg; // @[Booth.scala 38:26]
  wire [15:0] minusX = 16'h0 - io_x; // @[Booth.scala 40:16]
  reg [31:0] lastResultReg; // @[Booth.scala 42:30]
  wire [1:0] _T_7 = {q[0],qExtra}; // @[Booth.scala 46:50]
  wire  _T_9 = ~reset; // @[Booth.scala 71:13]
  wire [15:0] _T_14 = 2'h1 == _T_7 ? xReg : 16'h0; // @[Mux.scala 81:58]
  wire [15:0] _T_16 = 2'h2 == _T_7 ? minusXReg : _T_14; // @[Mux.scala 81:58]
  wire [15:0] aNext = a + _T_16; // @[Booth.scala 49:20]
  wire [31:0] _aqNext_T_1 = {aNext,q}; // @[Booth.scala 50:57]
  wire [30:0] _GEN_19 = _aqNext_T_1[31:1]; // @[Booth.scala 50:64]
  wire [31:0] aqNext = {{1{_GEN_19[30]}},_GEN_19}; // @[Booth.scala 50:72]
  wire [7:0] _cnt_T_1 = cnt + 8'h1; // @[Booth.scala 74:18]
  wire [31:0] result = {a,q}; // @[Booth.scala 79:47]
  wire [31:0] _GEN_1 = _nextState_T_4 ? result : 32'h0; // @[Booth.scala 59:17 80:12 36:8]
  wire [31:0] _GEN_9 = _nextState_T_2 ? 32'h0 : _GEN_1; // @[Booth.scala 59:17 36:8]
  wire  _GEN_20 = ~_nextState_T; // @[Booth.scala 71:13]
  wire  _GEN_21 = ~_nextState_T & _nextState_T_2; // @[Booth.scala 71:13]
  assign io_busy = _nextState_T ? 1'h0 : _nextState_T_2; // @[Booth.scala 35:11 59:17]
  assign io_z = _nextState_T ? lastResultReg : _GEN_9; // @[Booth.scala 59:17 65:12]
  always @(posedge clock) begin
    if (reset) begin // @[Booth.scala 18:18]
      a <= 16'h0; // @[Booth.scala 18:18]
    end else if (_nextState_T) begin // @[Booth.scala 59:17]
      a <= 16'h0; // @[Booth.scala 66:9]
    end else if (_nextState_T_2) begin // @[Booth.scala 59:17]
      a <= aqNext[31:16]; // @[Booth.scala 53:7]
    end
    if (reset) begin // @[Booth.scala 19:18]
      q <= 16'h0; // @[Booth.scala 19:18]
    end else if (_nextState_T) begin // @[Booth.scala 59:17]
      q <= io_y; // @[Booth.scala 61:9]
    end else if (_nextState_T_2) begin // @[Booth.scala 59:17]
      q <= aqNext[15:0]; // @[Booth.scala 54:7]
    end
    if (reset) begin // @[Booth.scala 20:23]
      qExtra <= 1'h0; // @[Booth.scala 20:23]
    end else if (_nextState_T) begin // @[Booth.scala 59:17]
      qExtra <= 1'h0; // @[Booth.scala 67:14]
    end else if (_nextState_T_2) begin // @[Booth.scala 59:17]
      qExtra <= q[0]; // @[Booth.scala 52:12]
    end
    if (reset) begin // @[Booth.scala 21:20]
      cnt <= 8'h0; // @[Booth.scala 21:20]
    end else if (_nextState_T) begin // @[Booth.scala 59:17]
      cnt <= 8'h0; // @[Booth.scala 62:11]
    end else if (_nextState_T_2) begin // @[Booth.scala 59:17]
      cnt <= _cnt_T_1; // @[Booth.scala 74:11]
    end else if (_nextState_T_4) begin // @[Booth.scala 59:17]
      cnt <= 8'h0; // @[Booth.scala 78:11]
    end
    if (reset) begin // @[Booth.scala 25:22]
      state <= 2'h0; // @[Booth.scala 25:22]
    end else if (2'h2 == state) begin // @[Mux.scala 81:58]
      state <= 2'h0;
    end else if (2'h1 == state) begin // @[Mux.scala 81:58]
      if (cnt == 8'hf) begin // @[Booth.scala 29:24]
        state <= 2'h2;
      end else begin
        state <= 2'h1;
      end
    end else if (2'h0 == state) begin // @[Mux.scala 81:58]
      state <= _T;
    end else begin
      state <= 2'h0;
    end
    if (reset) begin // @[Booth.scala 37:21]
      xReg <= 16'h0; // @[Booth.scala 37:21]
    end else if (_nextState_T) begin // @[Booth.scala 59:17]
      xReg <= io_x; // @[Booth.scala 63:12]
    end
    if (reset) begin // @[Booth.scala 38:26]
      minusXReg <= 16'h0; // @[Booth.scala 38:26]
    end else if (_nextState_T) begin // @[Booth.scala 59:17]
      minusXReg <= minusX; // @[Booth.scala 64:17]
    end
    if (reset) begin // @[Booth.scala 42:30]
      lastResultReg <= 32'h0; // @[Booth.scala 42:30]
    end else if (!(_nextState_T)) begin // @[Booth.scala 59:17]
      if (_nextState_T_2) begin // @[Booth.scala 59:17]
        lastResultReg <= 32'h0; // @[Booth.scala 70:21]
      end else if (_nextState_T_4) begin // @[Booth.scala 59:17]
        lastResultReg <= result; // @[Booth.scala 82:21]
      end
    end
    `ifndef SYNTHESIS
    `ifdef PRINTF_COND
      if (`PRINTF_COND) begin
    `endif
        if (~_nextState_T & _nextState_T_2 & ~reset) begin
          $fwrite(32'h80000002,"[%b state=%b] a=%b, q=%b, qExtra=%b, pack=%b, x=%b, -x=%b\n",cnt,state,a,q,qExtra,_T_7,
            xReg,minusXReg); // @[Booth.scala 71:13]
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef PRINTF_COND
      if (`PRINTF_COND) begin
    `endif
        if (_GEN_21 & _T_9) begin
          $fwrite(32'h80000002,"a: %b -> %b; aqNext: %b; q_-1: %b -> %b; addValue = %b\n",a,aNext,aqNext,qExtra,q[0],
            _T_16); // @[Booth.scala 55:11]
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef PRINTF_COND
      if (`PRINTF_COND) begin
    `endif
        if (_GEN_20 & ~_nextState_T_2 & _nextState_T_4 & _T_9) begin
          $fwrite(32'h80000002,"result = %b\n",result); // @[Booth.scala 81:13]
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
  end
// Register and memory initialization
`ifdef RANDOMIZE_GARBAGE_ASSIGN
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_INVALID_ASSIGN
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_REG_INIT
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_MEM_INIT
`define RANDOMIZE
`endif
`ifndef RANDOM
`define RANDOM $random
`endif
`ifdef RANDOMIZE_MEM_INIT
  integer initvar;
`endif
`ifndef SYNTHESIS
`ifdef FIRRTL_BEFORE_INITIAL
`FIRRTL_BEFORE_INITIAL
`endif
initial begin
  `ifdef RANDOMIZE
    `ifdef INIT_RANDOM
      `INIT_RANDOM
    `endif
    `ifndef VERILATOR
      `ifdef RANDOMIZE_DELAY
        #`RANDOMIZE_DELAY begin end
      `else
        #0.002 begin end
      `endif
    `endif
`ifdef RANDOMIZE_REG_INIT
  _RAND_0 = {1{`RANDOM}};
  a = _RAND_0[15:0];
  _RAND_1 = {1{`RANDOM}};
  q = _RAND_1[15:0];
  _RAND_2 = {1{`RANDOM}};
  qExtra = _RAND_2[0:0];
  _RAND_3 = {1{`RANDOM}};
  cnt = _RAND_3[7:0];
  _RAND_4 = {1{`RANDOM}};
  state = _RAND_4[1:0];
  _RAND_5 = {1{`RANDOM}};
  xReg = _RAND_5[15:0];
  _RAND_6 = {1{`RANDOM}};
  minusXReg = _RAND_6[15:0];
  _RAND_7 = {1{`RANDOM}};
  lastResultReg = _RAND_7[31:0];
`endif // RANDOMIZE_REG_INIT
  `endif // RANDOMIZE
end // initial
`ifdef FIRRTL_AFTER_INITIAL
`FIRRTL_AFTER_INITIAL
`endif
`endif // SYNTHESIS
endmodule
