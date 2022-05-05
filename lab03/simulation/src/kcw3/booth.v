module booth 
# (parameter WIDTH = 16)
(
    input  wire        clk  ,
	input  wire        rst_n,
	input  wire [15:0] x    ,
	input  wire [15:0] y    ,
	input  wire        start,
	output reg  [31:0] z    ,
	output wire        busy 
);

parameter 	IDLE = 2'b00,
			CALCULATE = 2'b01,
			OUTPUT = 2'b10;
			// OUTPUT = 2'b11;

reg [1:0] current_state, next_state;
reg [2*WIDTH:0] a_reg, s_reg, p_reg, sum_reg;
reg [WIDTH-1:0] cnt;

reg [WIDTH-1:0] multiplicand;						// 被乘数
reg [WIDTH-1:0] multiplier;							// 乘数(多一位盈余留给y_i+1)
wire [WIDTH-1:0] minusMultiplicand;

reg busy_reg;
assign busy = busy_reg;
always @(posedge clk or negedge rst_n) begin
	if(!rst_n || start)begin
		current_state <= IDLE;
	end
	else begin
		current_state <= next_state;
	end
end

always @(*) begin
	next_state = 2'bx;
	case (current_state)
		IDLE: 		next_state <= CALCULATE;
		CALCULATE: 	if (cnt == WIDTH) begin
						next_state <= OUTPUT;
					end
					else begin
						next_state <= CALCULATE;
					end
		OUTPUT: 	next_state <= IDLE;
	endcase
end

// x的负数的补码
assign minusMultiplicand = -multiplicand;

always @(posedge clk or negedge rst_n) begin
	if (!rst_n || start) begin
		a_reg <= 0;
		s_reg <= 0;
		p_reg <= 0;
		sum_reg <= 0;
		cnt <= 0;
		multiplicand <= x;
		multiplier <= y;
		z <= 0;
		busy_reg <= 0;
	end else begin
		case (current_state)
			IDLE: begin
				a_reg <= {multiplicand, {(WIDTH+1){1'b0}}};
				s_reg <= {minusMultiplicand,{(WIDTH+1){1'b0}}};
				p_reg <= {{(WIDTH){1'b0}},multiplier,1'b0};
				cnt <= 0;
				busy_reg <= 1;
			end
			CALCULATE: begin
				case (p_reg[1:0])
					2'b01: sum_reg <= a_reg + p_reg;
					2'b10: sum_reg <= s_reg + p_reg;
					2'b00, 2'b11: sum_reg <= sum_reg; 
				endcase
				cnt <= cnt + 1;
				p_reg <= {sum_reg[2*WIDTH-1],sum_reg[2*WIDTH-1:1]};
			end
			OUTPUT: begin
				z <= p_reg[2*WIDTH-1:1] >> 12;
				busy_reg <= 0;
			end  
		endcase
	end
end
endmodule