module BetterBooth(
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
  reg [18:0] yReg; // @[BetterBooth.scala 11:21]
  reg [31:0] sumReg; // @[BetterBooth.scala 12:23]
  reg [3:0] cnt; // @[BetterBooth.scala 13:20]
  reg [1:0] state; // @[BetterBooth.scala 17:22]
  wire [1:0] _T = io_start ? 2'h1 : 2'h0; // @[BetterBooth.scala 20:21]
  wire  _nextState_T = 2'h0 == state; // @[Mux.scala 81:61]
  wire  _nextState_T_2 = 2'h1 == state; // @[Mux.scala 81:61]
  wire  _nextState_T_4 = 2'h2 == state; // @[Mux.scala 81:61]
  reg [31:0] xReg; // @[BetterBooth.scala 29:21]
  reg [31:0] lastResultReg; // @[BetterBooth.scala 31:30]
  wire [15:0] _xReg_T = io_x; // @[BetterBooth.scala 52:28]
  wire [16:0] _yReg_T = {io_y, 1'h0}; // @[BetterBooth.scala 54:21]
  wire [49:0] _yReg_T_4 = $signed(io_y) < 16'sh0 ? 50'h60000 : 50'h0; // @[BetterBooth.scala 54:41]
  wire [49:0] _GEN_16 = {{33'd0}, _yReg_T}; // @[BetterBooth.scala 54:36]
  wire [49:0] _yReg_T_6 = _GEN_16 + _yReg_T_4; // @[BetterBooth.scala 54:36]
  wire [31:0] _T_10 = 32'sh0 - $signed(xReg); // @[BetterBooth.scala 67:10]
  wire [31:0] _T_11 = 32'sh0 - $signed(xReg); // @[BetterBooth.scala 67:17]
  wire  _T_13 = ~reset; // @[BetterBooth.scala 60:13]
  wire [32:0] _T_15 = {$signed(xReg), 1'h0}; // @[BetterBooth.scala 47:24]
  wire [32:0] _T_19 = 33'sh0 - $signed(_T_15); // @[BetterBooth.scala 77:25]
  wire [31:0] _T_27 = 3'h1 == yReg[2:0] ? $signed(xReg) : $signed(32'sh0); // @[Mux.scala 81:58]
  wire [31:0] _T_29 = 3'h2 == yReg[2:0] ? $signed(xReg) : $signed(_T_27); // @[Mux.scala 81:58]
  wire [32:0] _T_31 = 3'h3 == yReg[2:0] ? $signed(_T_15) : $signed({{1{_T_29[31]}},_T_29}); // @[Mux.scala 81:58]
  wire [32:0] _T_33 = 3'h4 == yReg[2:0] ? $signed(_T_19) : $signed(_T_31); // @[Mux.scala 81:58]
  wire [32:0] _T_35 = 3'h5 == yReg[2:0] ? $signed({{1{_T_10[31]}},_T_10}) : $signed(_T_33); // @[Mux.scala 81:58]
  wire [32:0] _add_T_1 = 3'h6 == yReg[2:0] ? $signed({{1{_T_10[31]}},_T_10}) : $signed(_T_35); // @[BetterBooth.scala 36:32]
  wire [4:0] _add_T_2 = {cnt, 1'h0}; // @[BetterBooth.scala 36:62]
  wire [31:0] _add_WIRE = _add_T_1[31:0]; // @[BetterBooth.scala 36:{32,32}]
  wire [62:0] _GEN_7 = {{31{_add_WIRE[31]}},_add_WIRE}; // @[BetterBooth.scala 36:54]
  wire [62:0] add = $signed(_GEN_7) << _add_T_2; // @[BetterBooth.scala 36:54]
  wire [62:0] _GEN_18 = {{31{sumReg[31]}},sumReg}; // @[BetterBooth.scala 37:22]
  wire [62:0] _sumReg_T_2 = $signed(_GEN_18) + $signed(add); // @[BetterBooth.scala 37:22]
  wire [18:0] _yReg_T_7 = {{2'd0}, yReg[18:2]}; // @[BetterBooth.scala 38:18]
  wire [3:0] _cnt_T_1 = cnt + 4'h1; // @[BetterBooth.scala 83:18]
  wire [31:0] _GEN_1 = _nextState_T_4 ? sumReg : 32'h0; // @[BetterBooth.scala 49:17 89:12 28:8]
  wire [62:0] _GEN_4 = _nextState_T_2 ? $signed(_sumReg_T_2) : $signed({{31{sumReg[31]}},sumReg}); // @[BetterBooth.scala 37:12 49:17 12:23]
  wire [18:0] _GEN_5 = _nextState_T_2 ? _yReg_T_7 : yReg; // @[BetterBooth.scala 38:10 49:17 11:21]
  wire [31:0] _GEN_8 = _nextState_T_2 ? 32'h0 : _GEN_1; // @[BetterBooth.scala 49:17 28:8]
  wire [49:0] _GEN_12 = _nextState_T ? _yReg_T_6 : {{31'd0}, _GEN_5}; // @[BetterBooth.scala 49:17 54:12]
  wire [62:0] _GEN_13 = _nextState_T ? $signed(63'sh0) : $signed(_GEN_4); // @[BetterBooth.scala 49:17 55:14]
  wire [49:0] _GEN_20 = reset ? 50'h0 : _GEN_12; // @[BetterBooth.scala 11:{21,21}]
  wire [62:0] _GEN_21 = reset ? $signed(63'sh0) : $signed(_GEN_13); // @[BetterBooth.scala 12:{23,23}]
  wire  _GEN_23 = ~_nextState_T; // @[BetterBooth.scala 60:13]
  wire  _GEN_24 = ~_nextState_T & _nextState_T_2; // @[BetterBooth.scala 60:13]
  assign io_busy = _nextState_T ? 1'h0 : _nextState_T_2; // @[BetterBooth.scala 27:11 49:17]
  assign io_z = _nextState_T ? lastResultReg : _GEN_8; // @[BetterBooth.scala 49:17 53:12]
  always @(posedge clock) begin
    yReg <= _GEN_20[18:0]; // @[BetterBooth.scala 11:{21,21}]
    sumReg <= _GEN_21[31:0]; // @[BetterBooth.scala 12:{23,23}]
    if (reset) begin // @[BetterBooth.scala 13:20]
      cnt <= 4'h0; // @[BetterBooth.scala 13:20]
    end else if (_nextState_T) begin // @[BetterBooth.scala 49:17]
      cnt <= 4'h0; // @[BetterBooth.scala 51:11]
    end else if (_nextState_T_2) begin // @[BetterBooth.scala 49:17]
      cnt <= _cnt_T_1; // @[BetterBooth.scala 83:11]
    end else if (_nextState_T_4) begin // @[BetterBooth.scala 49:17]
      cnt <= 4'h0; // @[BetterBooth.scala 87:11]
    end
    if (reset) begin // @[BetterBooth.scala 17:22]
      state <= 2'h0; // @[BetterBooth.scala 17:22]
    end else if (2'h2 == state) begin // @[Mux.scala 81:58]
      state <= 2'h0;
    end else if (2'h1 == state) begin // @[Mux.scala 81:58]
      if (cnt == 4'h8) begin // @[BetterBooth.scala 21:24]
        state <= 2'h2;
      end else begin
        state <= 2'h1;
      end
    end else if (2'h0 == state) begin // @[Mux.scala 81:58]
      state <= _T;
    end else begin
      state <= 2'h0;
    end
    if (reset) begin // @[BetterBooth.scala 29:21]
      xReg <= 32'sh0; // @[BetterBooth.scala 29:21]
    end else if (_nextState_T) begin // @[BetterBooth.scala 49:17]
      xReg <= {{16{_xReg_T[15]}},_xReg_T}; // @[BetterBooth.scala 52:12]
    end
    if (reset) begin // @[BetterBooth.scala 31:30]
      lastResultReg <= 32'h0; // @[BetterBooth.scala 31:30]
    end else if (!(_nextState_T)) begin // @[BetterBooth.scala 49:17]
      if (_nextState_T_2) begin // @[BetterBooth.scala 49:17]
        lastResultReg <= 32'h0; // @[BetterBooth.scala 59:21]
      end else if (_nextState_T_4) begin // @[BetterBooth.scala 49:17]
        lastResultReg <= sumReg; // @[BetterBooth.scala 91:21]
      end
    end
    `ifndef SYNTHESIS
    `ifdef PRINTF_COND
      if (`PRINTF_COND) begin
    `endif
        if (~_nextState_T & _nextState_T_2 & ~reset) begin
          $fwrite(32'h80000002,"[%d state=%b], yReg=%b, yRegLast=%b, x=%b, -x=%b\n",cnt,state,yReg,yReg[2:0],xReg,_T_11
            ); // @[BetterBooth.scala 60:13]
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef PRINTF_COND
      if (`PRINTF_COND) begin
    `endif
        if (_GEN_24 & _T_13) begin
          $fwrite(32'h80000002,"yRegExtra = %b, addValue = %b, sum = %b\n",yReg,add,sumReg); // @[BetterBooth.scala 39:11]
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef PRINTF_COND
      if (`PRINTF_COND) begin
    `endif
        if (_GEN_23 & ~_nextState_T_2 & _nextState_T_4 & _T_13) begin
          $fwrite(32'h80000002,"result = %b\n",sumReg); // @[BetterBooth.scala 90:13]
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
  yReg = _RAND_0[18:0];
  _RAND_1 = {1{`RANDOM}};
  sumReg = _RAND_1[31:0];
  _RAND_2 = {1{`RANDOM}};
  cnt = _RAND_2[3:0];
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
