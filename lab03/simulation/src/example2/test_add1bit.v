`timescale 1ps/1ps

module test_add1bit();
    parameter CLOCK_CYCLE = 100;
    parameter COUNTER_BIT_NUM = 3;
    parameter SIMULATION_PERIOD = 500;

    // signal defenition
    reg clk;
    reg reset;
    reg  [COUNTER_BIT_NUM -1:0] counter;
    wire  A  ;
    wire  B  ;
    wire  C_i;
    wire  O  ;
    wire  C_o;
    assign A   = counter[0];
    assign B   = counter[1];
    assign C_i = counter[2];

    // dump wave file
    initial begin
        $dumpfile("tmp/dump.vcd");
        $dumpvars(0, add1bit_1);
    end

    // monitor
    initial begin
        $monitor ("[%t] A=%b, B=%d, C_i=%d => O=%b C_o=%b", $time, 
            add1bit_1.A  ,
            add1bit_1.B  ,
            add1bit_1.C_i,
            add1bit_1.O  ,
            add1bit_1.C_o);
    end

    // simulation end
    initial begin
        #(CLOCK_CYCLE*SIMULATION_PERIOD) $finish;
    end

    // clock
    initial begin
        #10 clk <= 1'b0;
        forever begin
            #(CLOCK_CYCLE/2) clk <= ~clk;
        end
    end

    // reset
    initial begin
        #10 reset <= 1'b0;
        #300 reset <= 1'b1;
    end

    // counter
    always @(posedge clk or negedge reset) begin
        if(~reset)begin
            counter <= {COUNTER_BIT_NUM{1'b0}};
        end
        else begin
            counter <= counter + {{COUNTER_BIT_NUM-1{1'b0}},1'b1};
        end
    end


add1bit add1bit_1(
    .A  (    A  ),
    .B  (    B  ),
    .C_i(    C_i),
    .O  (    O  ),
    .C_o(    C_o)
);

endmodule