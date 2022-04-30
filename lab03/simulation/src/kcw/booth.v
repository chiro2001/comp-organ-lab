module booth (
    input  wire        clk  ,
	input  wire        rst_n,
	input  wire [15:0] x    ,
	input  wire [15:0] y    ,
	input  wire        start,
	output reg  [31:0] z    ,
	output wire        busy 
);

reg [15:0] multiplicand;					// 被乘数
reg [15:0] multiplier;						// 乘数
reg extraDigit;								// 乘数的额外位数
reg [15:0] minusMultiplicand;				// 被乘数的负数
reg [3:0] count;							// 计数器
reg run;									// 是否完成计算的标志变量
assign busy = run;
// 初始化逻辑，开始计算
always @(posedge clk or negedge rst_n) begin
	if (start || ~rst_n) begin
		multiplicand <= x;
		multiplier <= y;
		minusMultiplicand <= x;
		minusMultiplicand[15] <= ~multiplicand[15];		// 符号位取反
		extraDigit <= 0;
		run <= 1;
		count <= 0; 
	end
end

reg [15:0] partialProduct;					// 部分积
reg judgeFlag;								// 最后两位相减的差
reg [31:0] finalResult;						// 乘积结果

// booth算法核心逻辑
always @(posedge clk or negedge rst_n) begin
	// 除符号位外有多少位移多少次
	// while (count < 16) begin
		if(busy)begin
				judgeFlag <= extraDigit - multiplier[0];
			// 最后两位相减的差为1
			if (judgeFlag == 1) begin
				partialProduct <= multiplicand + partialProduct;		// 更新部分积的值, 部分积 = 部分积 + 被乘数	
				partialProduct <= partialProduct << 16;					// 部分积放置于正确位置
				finalResult <= partialProduct + multiplier;				// 计算结果
			end
			// 最后两位相减的差为-1
			else if (judgeFlag == -1) begin
				partialProduct <= minusMultiplicand + partialProduct;	// 更新部分积的值， 部分积 = 部分积 + (-被乘数)
				partialProduct <= partialProduct << 16;					// 部分积放置于正确位置
				finalResult <= partialProduct + multiplier;				// 计算结果
			end
			// 最后两位相减的差为0(右移即可)
			extraDigit <= finalResult[0];			// 更新乘数额外位
			finalResult <= finalResult >> 1;		// 结果右移一位
			partialProduct <= finalResult[31:0];	// 更新部分积
			multiplier <= finalResult[15:0];		// 更新乘数
			count <= count + 1;
		end
	// end
end

endmodule