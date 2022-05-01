module booth2 #(
        parameter WIDTH = 16)
    (
        input wire clk,
        input wire rst_n,
        input wire signed [(WIDTH-1):0] x,
        input wire [(WIDTH-1):0] y,
        input wire start,
        output wire [(WIDTH*2-1):0] z,
        output wire busy
    );
    parameter IDLE = 4'b0;
    parameter RUNNING = 4'b1;
    parameter OUTPUT = 4'b11;
    reg [(WIDTH*2-1):0] z_reg;
    reg signed [(WIDTH*2-1):0] x_reg;
    reg [WIDTH+2:0] y_reg;
    reg [3:0] state;
    reg [7:0] cnt;

	assign busy = state == RUNNING;
	assign z = z_reg;

	wire [2:0] y_last;
	assign y_last = y_reg[2-:3];

	wire [(WIDTH*2-1):0] x_minus;
	assign x_minus = -x_reg;

    wire [(WIDTH*2-1):0] x_2;
    assign x_2 = x_reg << 1'b1;

    wire [(WIDTH*2-1):0] x_2_minus;
    assign x_2_minus = x_minus << 1'b1;

    always @(posedge clk or negedge rst_n) begin
        if (~rst_n) begin
            z_reg <= {(WIDTH*2){1'b0}};
            x_reg <= {(WIDTH*2){1'b0}};
            y_reg <= {(WIDTH+3){1'b0}};
            state <= IDLE;
            cnt <= 8'b0;
        end
        else begin
            if (state == IDLE) begin
                x_reg <= x;
				y_reg <= {((y >> (WIDTH-1)) ? 2'b11 : 2'b00), y, 1'b0};
            	cnt <= 8'b0;
				if (start) begin
					state <= RUNNING;
					z_reg <= {(WIDTH*2){1'b0}};
				end
            end
			else if (state == RUNNING) begin
				cnt <= cnt + 8'b1;
				y_reg <= y_reg >> 2'd2;
				case (y_last)
					3'b001: 		z_reg <= z_reg + (x_reg << (cnt << 8'b1));
					3'b010: 		z_reg <= z_reg + (x_reg << (cnt << 8'b1));
					3'b011: 		z_reg <= z_reg + (x_2 << (cnt << 8'b1));
					3'b100: 		z_reg <= z_reg + (x_2_minus << (cnt << 8'b1));
					3'b101: 		z_reg <= z_reg + (x_minus << (cnt << 8'b1));
					3'b110: 		z_reg <= z_reg + (x_minus << (cnt << 8'b1));
					default:     	z_reg <= z_reg + 1'b0;
				endcase
				if (cnt == (WIDTH >> 1)) begin
					state <= OUTPUT;
				end
			end
			else if (state == OUTPUT) begin
				cnt <= 8'b0;
				state <= IDLE;
			end
        end
    end
endmodule
