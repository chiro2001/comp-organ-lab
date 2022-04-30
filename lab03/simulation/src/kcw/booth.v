module booth (
    input  wire        clk  ,
	input  wire        rst_n,
	input  wire [15:0] x    ,
	input  wire [15:0] y    ,
	input  wire        start,
	output reg  [31:0] z    ,
	output wire        busy 
);

reg [15:0] multiplicand;					// ������
reg [15:0] multiplier;						// ����
reg extraDigit;								// �����Ķ���λ��
reg [15:0] minusMultiplicand;				// �������ĸ���
reg [3:0] count;							// ������
reg run;									// �Ƿ���ɼ���ı�־����
assign busy = run;
// ��ʼ���߼�����ʼ����
always @(posedge clk or negedge rst_n) begin
	if (start || ~rst_n) begin
		multiplicand <= x;
		multiplier <= y;
		minusMultiplicand <= x;
		minusMultiplicand[15] <= ~multiplicand[15];		// ����λȡ��
		extraDigit <= 0;
		run <= 1;
		count <= 0; 
	end
end

reg [15:0] partialProduct;					// ���ֻ�
reg judgeFlag;								// �����λ����Ĳ�
reg [31:0] finalResult;						// �˻����

// booth�㷨�����߼�
always @(posedge clk or negedge rst_n) begin
	// ������λ���ж���λ�ƶ��ٴ�
	// while (count < 16) begin
		if(busy)begin
				judgeFlag <= extraDigit - multiplier[0];
			// �����λ����Ĳ�Ϊ1
			if (judgeFlag == 1) begin
				partialProduct <= multiplicand + partialProduct;		// ���²��ֻ���ֵ, ���ֻ� = ���ֻ� + ������	
				partialProduct <= partialProduct << 16;					// ���ֻ���������ȷλ��
				finalResult <= partialProduct + multiplier;				// ������
			end
			// �����λ����Ĳ�Ϊ-1
			else if (judgeFlag == -1) begin
				partialProduct <= minusMultiplicand + partialProduct;	// ���²��ֻ���ֵ�� ���ֻ� = ���ֻ� + (-������)
				partialProduct <= partialProduct << 16;					// ���ֻ���������ȷλ��
				finalResult <= partialProduct + multiplier;				// ������
			end
			// �����λ����Ĳ�Ϊ0(���Ƽ���)
			extraDigit <= finalResult[0];			// ���³�������λ
			finalResult <= finalResult >> 1;		// �������һλ
			partialProduct <= finalResult[31:0];	// ���²��ֻ�
			multiplier <= finalResult[15:0];		// ���³���
			count <= count + 1;
		end
	// end
end

endmodule