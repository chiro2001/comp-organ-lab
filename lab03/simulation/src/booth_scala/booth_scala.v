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
`endif // RANDOMIZE_REG_INIT
  reg [16:0] yReg; // @[Booth.scala 11:21]
  reg [31:0] sumReg; // @[Booth.scala 12:23]
  reg [7:0] cnt; // @[Booth.scala 13:20]
  reg [1:0] state; // @[Booth.scala 17:22]
  wire [1:0] _T = io_start ? 2'h1 : 2'h0; // @[Booth.scala 20:21]
  wire  _nextState_T = 2'h0 == state; // @[Mux.scala 81:61]
  wire  _nextState_T_2 = 2'h1 == state; // @[Mux.scala 81:61]
  wire  _nextState_T_4 = 2'h2 == state; // @[Mux.scala 81:61]
  reg [31:0] xReg; // @[Booth.scala 29:21]
  reg [31:0] lastResultReg; // @[Booth.scala 31:30]
  wire [15:0] _xReg_T = io_x; // @[Booth.scala 50:28]
  wire [16:0] _yReg_T = {io_y, 1'h0}; // @[Booth.scala 53:20]
  wire [31:0] _T_10 = 32'sh0 - $signed(xReg); // @[Booth.scala 65:10]
  wire [31:0] _T_11 = 32'sh0 - $signed(xReg); // @[Booth.scala 65:17]
  wire  _T_13 = ~reset; // @[Booth.scala 58:13]
  wire [31:0] _T_19 = 2'h1 == yReg[1:0] ? $signed(xReg) : $signed(32'sh0); // @[Mux.scala 81:58]
  wire [31:0] _add_T_1 = 2'h2 == yReg[1:0] ? $signed(_T_10) : $signed(_T_19); // @[Booth.scala 36:32]
  wire [286:0] _GEN_7 = {{255{_add_T_1[31]}},_add_T_1}; // @[Booth.scala 36:54]
  wire [286:0] add = $signed(_GEN_7) << cnt; // @[Booth.scala 36:54]
  wire [286:0] _GEN_16 = {{255{sumReg[31]}},sumReg}; // @[Booth.scala 37:22]
  wire [286:0] _sumReg_T_2 = $signed(_GEN_16) + $signed(add); // @[Booth.scala 37:22]
  wire [16:0] _yReg_T_1 = {{1'd0}, yReg[16:1]}; // @[Booth.scala 38:18]
  wire [7:0] _cnt_T_1 = cnt + 8'h1; // @[Booth.scala 68:18]
  wire [31:0] _GEN_1 = _nextState_T_4 ? sumReg : 32'h0; // @[Booth.scala 47:17 74:12 28:8]
  wire [286:0] _GEN_4 = _nextState_T_2 ? $signed(_sumReg_T_2) : $signed({{255{sumReg[31]}},sumReg}); // @[Booth.scala 37:12 47:17 12:23]
  wire [31:0] _GEN_8 = _nextState_T_2 ? 32'h0 : _GEN_1; // @[Booth.scala 47:17 28:8]
  wire [286:0] _GEN_12 = _nextState_T ? $signed(287'sh0) : $signed(_GEN_4); // @[Booth.scala 47:17 52:14]
  wire [286:0] _GEN_18 = reset ? $signed(287'sh0) : $signed(_GEN_12); // @[Booth.scala 12:{23,23}]
  wire  _GEN_20 = ~_nextState_T; // @[Booth.scala 58:13]
  wire  _GEN_21 = ~_nextState_T & _nextState_T_2; // @[Booth.scala 58:13]
  assign io_busy = _nextState_T ? 1'h0 : _nextState_T_2; // @[Booth.scala 27:11 47:17]
  assign io_z = _nextState_T ? lastResultReg : _GEN_8; // @[Booth.scala 47:17 51:12]
  always @(posedge clock) begin
    if (reset) begin // @[Booth.scala 11:21]
      yReg <= 17'h0; // @[Booth.scala 11:21]
    end else if (_nextState_T) begin // @[Booth.scala 47:17]
      yReg <= _yReg_T; // @[Booth.scala 53:12]
    end else if (_nextState_T_2) begin // @[Booth.scala 47:17]
      yReg <= _yReg_T_1; // @[Booth.scala 38:10]
    end
    sumReg <= _GEN_18[31:0]; // @[Booth.scala 12:{23,23}]
    if (reset) begin // @[Booth.scala 13:20]
      cnt <= 8'h0; // @[Booth.scala 13:20]
    end else if (_nextState_T) begin // @[Booth.scala 47:17]
      cnt <= 8'h0; // @[Booth.scala 49:11]
    end else if (_nextState_T_2) begin // @[Booth.scala 47:17]
      cnt <= _cnt_T_1; // @[Booth.scala 68:11]
    end else if (_nextState_T_4) begin // @[Booth.scala 47:17]
      cnt <= 8'h0; // @[Booth.scala 72:11]
    end
    if (reset) begin // @[Booth.scala 17:22]
      state <= 2'h0; // @[Booth.scala 17:22]
    end else if (2'h2 == state) begin // @[Mux.scala 81:58]
      state <= 2'h0;
    end else if (2'h1 == state) begin // @[Mux.scala 81:58]
      if (cnt == 8'hf) begin // @[Booth.scala 21:24]
        state <= 2'h2;
      end else begin
        state <= 2'h1;
      end
    end else if (2'h0 == state) begin // @[Mux.scala 81:58]
      state <= _T;
    end else begin
      state <= 2'h0;
    end
    if (reset) begin // @[Booth.scala 29:21]
      xReg <= 32'sh0; // @[Booth.scala 29:21]
    end else if (_nextState_T) begin // @[Booth.scala 47:17]
      xReg <= {{16{_xReg_T[15]}},_xReg_T}; // @[Booth.scala 50:12]
    end
    if (reset) begin // @[Booth.scala 31:30]
      lastResultReg <= 32'h0; // @[Booth.scala 31:30]
    end else if (!(_nextState_T)) begin // @[Booth.scala 47:17]
      if (_nextState_T_2) begin // @[Booth.scala 47:17]
        lastResultReg <= 32'h0; // @[Booth.scala 57:21]
      end else if (_nextState_T_4) begin // @[Booth.scala 47:17]
        lastResultReg <= sumReg; // @[Booth.scala 76:21]
      end
    end
    `ifndef SYNTHESIS
    `ifdef PRINTF_COND
      if (`PRINTF_COND) begin
    `endif
        if (~_nextState_T & _nextState_T_2 & ~reset) begin
          $fwrite(32'h80000002,"[%d state=%b], yReg=%b, yRegLast=%b, x=%b, -x=%b\n",cnt,state,yReg,yReg[1:0],xReg,_T_11
            ); // @[Booth.scala 58:13]
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef PRINTF_COND
      if (`PRINTF_COND) begin
    `endif
        if (_GEN_21 & _T_13) begin
          $fwrite(32'h80000002,"yRegExtra = %b, addValue = %b, sum = %b\n",yReg,add,sumReg); // @[Booth.scala 39:11]
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef PRINTF_COND
      if (`PRINTF_COND) begin
    `endif
        if (_GEN_20 & ~_nextState_T_2 & _nextState_T_4 & _T_13) begin
          $fwrite(32'h80000002,"result = %b\n",sumReg); // @[Booth.scala 75:13]
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
  yReg = _RAND_0[16:0];
  _RAND_1 = {1{`RANDOM}};
  sumReg = _RAND_1[31:0];
  _RAND_2 = {1{`RANDOM}};
  cnt = _RAND_2[7:0];
  _RAND_3 = {1{`RANDOM}};
  state = _RAND_3[1:0];
  _RAND_4 = {1{`RANDOM}};
  xReg = _RAND_4[31:0];
  _RAND_5 = {1{`RANDOM}};
  lastResultReg = _RAND_5[31:0];
`endif // RANDOMIZE_REG_INIT
  `endif // RANDOMIZE
end // initial
`ifdef FIRRTL_AFTER_INITIAL
`FIRRTL_AFTER_INITIAL
`endif
`endif // SYNTHESIS
endmodule
