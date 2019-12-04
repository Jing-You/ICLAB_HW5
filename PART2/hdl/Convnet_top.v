module Convnet_top #(
parameter CH_NUM = 4,
parameter ACT_PER_ADDR = 4,
parameter BW_PER_ACT = 8,
parameter WEIGHT_PER_ADDR = 9, 
parameter BIAS_PER_ADDR = 1,
parameter BW_PER_PARAM = 4
)
(
input clk,                           //clock input
input rst_n,                         //synchronous reset (active low)

input enable,
input [BW_PER_ACT-1:0] input_data,    //input image

//read data from SRAM group A
input [CH_NUM*ACT_PER_ADDR*BW_PER_ACT-1:0] sram_rdata_a0,
input [CH_NUM*ACT_PER_ADDR*BW_PER_ACT-1:0] sram_rdata_a1,
input [CH_NUM*ACT_PER_ADDR*BW_PER_ACT-1:0] sram_rdata_a2,
input [CH_NUM*ACT_PER_ADDR*BW_PER_ACT-1:0] sram_rdata_a3,
//read data from SRAM group B
input [CH_NUM*ACT_PER_ADDR*BW_PER_ACT-1:0] sram_rdata_b0,
input [CH_NUM*ACT_PER_ADDR*BW_PER_ACT-1:0] sram_rdata_b1,
input [CH_NUM*ACT_PER_ADDR*BW_PER_ACT-1:0] sram_rdata_b2,
input [CH_NUM*ACT_PER_ADDR*BW_PER_ACT-1:0] sram_rdata_b3,

input [WEIGHT_PER_ADDR*BW_PER_PARAM-1:0] sram_rdata_weight,  //read data from SRAM weight
input [BIAS_PER_ADDR*BW_PER_PARAM-1:0] sram_rdata_bias,      //read data from SRAM bias

//read address from SRAM group A
output reg [5:0] sram_raddr_a0,
output reg [5:0] sram_raddr_a1,
output reg [5:0] sram_raddr_a2,
output reg [5:0] sram_raddr_a3,
//read address from SRAM group B
output reg [5:0] sram_raddr_b0,
output reg [5:0] sram_raddr_b1,
output reg [5:0] sram_raddr_b2,
output reg [5:0] sram_raddr_b3,

output reg [10:0] sram_raddr_weight,       //read address from SRAM weight  
output reg [6:0] sram_raddr_bias,          //read address from SRAM bias 

output reg busy,
output reg test_layer_finish,
output reg valid,                         //output valid to check the final answer (after POOL)

//write enable for SRAM groups A & B
output reg sram_wen_a0,
output reg sram_wen_a1,
output reg sram_wen_a2,
output reg sram_wen_a3,
output reg sram_wen_b0,
output reg sram_wen_b1,
output reg sram_wen_b2,
output reg sram_wen_b3,

//bytemask for SRAM groups A & B
output [CH_NUM*ACT_PER_ADDR-1:0] sram_bytemask_a,
output [CH_NUM*ACT_PER_ADDR-1:0] sram_bytemask_b,

//write addrress to SRAM groups A & B
output reg [5:0] sram_waddr_a,
output reg [5:0] sram_waddr_b,

//write data to SRAM groups A & B
output reg [CH_NUM*ACT_PER_ADDR*BW_PER_ACT-1:0] sram_wdata_a,
output reg [CH_NUM*ACT_PER_ADDR*BW_PER_ACT-1:0] sram_wdata_b
);

reg [5:0] state;
reg [10:0] read_cnt;
reg [4:0] x_cnt;
reg [4:0] y_cnt;
reg [1:0] bank_num;
reg [3:0] position_offset;
reg [7:0] conv_cnt;
reg [7:0] weight_cnt;
reg [7:0] bias_cnt;
reg [4:0] cnn_state;
reg read_weight_finish;
reg load_weight_finish;
parameter LAYER1_WIDTH = 14, LAYER1_HEIGHT = 14;
parameter IDLE = 0, UNSHUFFLE = 1, CONV1 = 2;
parameter READ_WEIGHT = 0, DOCNN = 1;
integer i, j, k;
reg [3:0] weights[0:3][0:2][0:2];

reg  [7:0]  X_00[0:15];
reg  [7:0]  X_01[0:15];
reg  [7:0]  X_02[0:15];
reg  [7:0]  X_10[0:15];
reg  [7:0]  X_11[0:15];
reg  [7:0]  X_12[0:15];
reg  [7:0]  X_20[0:15];
reg  [7:0]  X_21[0:15];
reg  [7:0]  X_22[0:15];
reg  [3:0]  W_00[0:15];
reg  [3:0]  W_01[0:15];
reg  [3:0]  W_02[0:15];
reg  [3:0]  W_10[0:15];
reg  [3:0]  W_11[0:15];
reg  [3:0]  W_12[0:15];
reg  [3:0]  W_20[0:15];
reg  [3:0]  W_21[0:15];
reg  [3:0]  W_22[0:15];
wire  [11:0] Y_00[0:15];	
wire  [11:0] Y_01[0:15];	
wire  [11:0] Y_02[0:15];	
wire  [11:0] Y_10[0:15];	
wire  [11:0] Y_11[0:15];	
wire  [11:0] Y_12[0:15];	
wire  [11:0] Y_20[0:15];	
wire  [11:0] Y_21[0:15];	
wire  [11:0] Y_22[0:15];

bytemask bytemask
(

	.clk(clk),
	.rst_n(rst_n),
	.x_cnt(x_cnt),
	.y_cnt(y_cnt),
	.state(state),
	.position_offset(position_offset),
	.sram_bytemask_a(sram_bytemask_a),
	.sram_bytemask_b(sram_bytemask_b)
);


always @(posedge clk) begin
	if(!rst_n) begin
		state <= 0;
	end
	else if (state == IDLE && enable) begin
		state <= UNSHUFFLE;
	end
	else if (state == UNSHUFFLE) begin
		if (read_cnt == 28*28) begin
			state <= CONV1;
		end else begin
			state <= state;
		end
	end
	else begin
		state <= state;
	end
end

always @(posedge clk) begin
	if (!rst_n) begin
		cnn_state <= READ_WEIGHT;
	end
	else if (state == CONV1) begin
		if (cnn_state == READ_WEIGHT) begin
			if (read_weight_finish) begin
				cnn_state <= DOCNN;
			end else begin
				cnn_state <= READ_WEIGHT;
			end
		end
		else if (x_cnt == 12 && y_cnt == 12)
			cnn_state <= READ_WEIGHT;
		else
			cnn_state <= DOCNN;
	end
end

// cnt

always @(posedge clk) begin
	if(!rst_n) begin
		conv_cnt <= 0;
	end
	else if (state == CONV1) begin
		if(cnn_state == DOCNN && x_cnt == 12 && y_cnt == 12) begin
			conv_cnt = conv_cnt + 1;
		end
		else begin
			conv_cnt <= conv_cnt;
		end
	end
	else begin
		conv_cnt <= conv_cnt;
	end
end


always @(posedge clk) begin
	if(!rst_n) begin
		read_cnt <= 0;
	end
	else if (enable && state == UNSHUFFLE) begin
		if (read_cnt < 28 *28) begin
			read_cnt <= 1 + read_cnt;
		end
		else
			read_cnt <= 0;
	end
	else if (state == CONV1) begin
		if (!read_weight_finish && cnn_state == READ_WEIGHT)
			read_cnt <= 1 + read_cnt;
		else begin
			read_cnt <= read_cnt;
		end
	end
	else begin
		read_cnt <= 0;
	end
end


// weight addr
always @(posedge clk) begin
	if (!rst_n) begin
		sram_raddr_weight <= 0;
	end
	else if (state == CONV1) begin
		if (cnn_state == READ_WEIGHT && !read_weight_finish)
			sram_raddr_weight <= sram_raddr_weight + 1;
		else begin
			sram_raddr_weight <= sram_raddr_weight;
		end
	end
end



always @(posedge clk) begin
	if (!rst_n) begin
		read_weight_finish <= 0;
	end
	else if (state == UNSHUFFLE) begin
		read_weight_finish <= 0;
	end
	else if (state == CONV1) begin
		if (cnn_state == DOCNN) begin
			read_weight_finish	<= 0;
		end
		else if (sram_raddr_weight % 4 == 3) begin
			read_weight_finish	<= 1;
		end
	end
end

always@(posedge clk) begin
	if(!rst_n) begin
		x_cnt <= 0;
		y_cnt <= 0;
	end
	else if (UNSHUFFLE == state)begin
		if (x_cnt == 27) begin
			x_cnt <= 0;
			y_cnt <= y_cnt + 1;
		end else begin
			x_cnt <= x_cnt + 1;
			y_cnt <= y_cnt;
		end
	end
	else if (cnn_state == READ_WEIGHT) begin
		x_cnt <= 0;
		y_cnt <= 0;
	end
	else if (state == CONV1) begin
		if (cnn_state == DOCNN)
			if (x_cnt == 12) begin
				x_cnt <= 0;
				y_cnt <= y_cnt + 1;
			end else begin
				x_cnt <= x_cnt + 1;
				y_cnt <= y_cnt;
			end
		else begin
			x_cnt <= 0;
			y_cnt <= 0;
		end
	end
end



always @(posedge clk) begin
	if(!rst_n) begin
		sram_raddr_bias <= 0;
	end
	else if (state == CONV1) begin
		sram_raddr_bias <= conv_cnt;
	end
end

always @*
	test_layer_finish = state == CONV1 && read_cnt == 17;

always@(posedge clk) 
	if (read_cnt >= 28*28 && state == UNSHUFFLE) begin
		valid <= 0;
		busy <= 1;		
	end
	else begin
		valid <= 0;	
		busy <= 0;	
	end

reg [2:0] y_r8, x_r8;

always @* begin
	y_r8 = y_cnt % 8;
	x_r8 = x_cnt % 8;
	if (y_r8 <= 3) begin
		if (x_r8 <= 3) begin
			bank_num = 0;
		end else begin
			bank_num = 1;
		end
	end else begin
		if (x_r8 <= 3) begin
			bank_num = 2;
		end else begin
			bank_num = 3;
		end
	end
end

always @(posedge clk) begin
	if (state == UNSHUFFLE) begin
		if (y_r8 <= 3) begin
			if (x_r8 <= 3) begin
				sram_wen_a0 <= 0;
				sram_wen_a1	<= 1;
				sram_wen_a2 <= 1;
				sram_wen_a3 <= 1;
			end else begin
				sram_wen_a0 <= 1;
				sram_wen_a1 <= 0;
				sram_wen_a2 <= 1;
				sram_wen_a3 <= 1;
			end
		end else begin
			if (x_r8 <= 3) begin
				sram_wen_a0 <= 1;
				sram_wen_a1 <= 1;
				sram_wen_a2 <= 0;
				sram_wen_a3 <= 1;
			end else begin
				sram_wen_a0 <= 1;
				sram_wen_a1 <= 1;
				sram_wen_a2 <= 1;
				sram_wen_a3 <= 0;
			end
		end
	end
	else begin
		sram_wen_a0 <= 1;
		sram_wen_a1 <= 1;
		sram_wen_a2 <= 1;
		sram_wen_a3 <= 1;
	end
end

always @(posedge clk) begin
	sram_waddr_a <= y_cnt / 8 * 6 + x_cnt / 8;
end

always @* begin
	position_offset = y_cnt % 4 * 4 + x_cnt % 4;
end

always @(posedge clk) begin
	if (!rst_n) begin
		load_weight_finish <= 0;
	end
	else if (state == CONV1) begin
		if (state == UNSHUFFLE) begin
			load_weight_finish <= 0;
		end
		else if (state == CONV1) begin
			if (cnn_state == DOCNN) begin
				load_weight_finish <= 0;
			end
			else if (read_cnt % 4 == 0 && read_weight_finish) begin
				load_weight_finish <= 1;
			end
			else begin
				load_weight_finish <= load_weight_finish;
			end
		end
	end
end

always @(posedge clk) begin
	if (!rst_n) begin
		for(i=0; i<4; i=i+1) begin
			for (j=0; j<3; j=j+1) begin
				for (k=0; k<3; k=k+1) begin
					weights[i][j][k] <= 0;
				end
			end
		end
	end
	else if (state == CONV1 && !load_weight_finish) begin
		if (read_cnt % 4 == 1) begin
			weights[0][0][0] <= sram_rdata_weight[35:32];
			weights[0][0][1] <= sram_rdata_weight[31:28];
			weights[0][0][2] <= sram_rdata_weight[27:24];
			weights[0][1][0] <= sram_rdata_weight[23:20];
			weights[0][1][1] <= sram_rdata_weight[19:16];
			weights[0][1][2] <= sram_rdata_weight[15:12];
			weights[0][2][0] <= sram_rdata_weight[11:8];
			weights[0][2][1] <= sram_rdata_weight[7:4];
			weights[0][2][2] <= sram_rdata_weight[3:0];
		end
		else if (read_cnt % 4 == 2) begin
			weights[1][0][0] <= sram_rdata_weight[35:32];
			weights[1][0][1] <= sram_rdata_weight[31:28];
			weights[1][0][2] <= sram_rdata_weight[27:24];
			weights[1][1][0] <= sram_rdata_weight[23:20];
			weights[1][1][1] <= sram_rdata_weight[19:16];
			weights[1][1][2] <= sram_rdata_weight[15:12];
			weights[1][2][0] <= sram_rdata_weight[11:8];
			weights[1][2][1] <= sram_rdata_weight[7:4];
			weights[1][2][2] <= sram_rdata_weight[3:0];
		end
		else if (read_cnt % 4== 3) begin
			weights[2][0][0] <= sram_rdata_weight[35:32];
			weights[2][0][1] <= sram_rdata_weight[31:28];
			weights[2][0][2] <= sram_rdata_weight[27:24];
			weights[2][1][0] <= sram_rdata_weight[23:20];
			weights[2][1][1] <= sram_rdata_weight[19:16];
			weights[2][1][2] <= sram_rdata_weight[15:12];
			weights[2][2][0] <= sram_rdata_weight[11:8];
			weights[2][2][1] <= sram_rdata_weight[7:4];
			weights[2][2][2] <= sram_rdata_weight[3:0];
		end
		else if (read_cnt % 4 == 0 && read_weight_finish) begin
			weights[3][0][0] <= sram_rdata_weight[35:32];
			weights[3][0][1] <= sram_rdata_weight[31:28];
			weights[3][0][2] <= sram_rdata_weight[27:24];
			weights[3][1][0] <= sram_rdata_weight[23:20];
			weights[3][1][1] <= sram_rdata_weight[19:16];
			weights[3][1][2] <= sram_rdata_weight[15:12];
			weights[3][2][0] <= sram_rdata_weight[11:8];
			weights[3][2][1] <= sram_rdata_weight[7:4];
			weights[3][2][2] <= sram_rdata_weight[3:0];
		end
	end
	else begin
	end
end
wire [7:0] look = sram_wdata_a[7:0];
always @(posedge clk) begin
	for(i=0; i< 16; i=i+1)
		sram_wdata_a[i*8 +:8] <= input_data;
end


CNN2D CNN2D0(
	.X_00(X_00[0]),
	.X_01(X_01[0]),
	.X_02(X_02[0]),
	.X_10(X_10[0]),
	.X_11(X_11[0]),
	.X_12(X_12[0]),
	.X_20(X_20[0]),
	.X_21(X_21[0]),
	.X_22(X_22[0]),
	.W_00(W_00[0]),
	.W_01(W_01[0]),
	.W_02(W_02[0]),
	.W_10(W_10[0]),
	.W_11(W_11[0]),
	.W_12(W_12[0]),
	.W_20(W_20[0]),
	.W_21(W_21[0]),
	.W_22(W_22[0]),
	.Y_00(Y_00[0]),	
	.Y_01(Y_01[0]),	
	.Y_02(Y_02[0]),	
	.Y_10(Y_10[0]),	
	.Y_11(Y_11[0]),	
	.Y_12(Y_12[0]),	
	.Y_20(Y_20[0]),	
	.Y_21(Y_21[0]),	
	.Y_22(Y_22[0])
);
CNN2D CNN2D1(
	.X_00(X_00[1]),
	.X_01(X_01[1]),
	.X_02(X_02[1]),
	.X_10(X_10[1]),
	.X_11(X_11[1]),
	.X_12(X_12[1]),
	.X_20(X_20[1]),
	.X_21(X_21[1]),
	.X_22(X_22[1]),
	.W_00(W_00[1]),
	.W_01(W_01[1]),
	.W_02(W_02[1]),
	.W_10(W_10[1]),
	.W_11(W_11[1]),
	.W_12(W_12[1]),
	.W_20(W_20[1]),
	.W_21(W_21[1]),
	.W_22(W_22[1]),
	.Y_00(Y_00[1]),	
	.Y_01(Y_01[1]),	
	.Y_02(Y_02[1]),	
	.Y_10(Y_10[1]),	
	.Y_11(Y_11[1]),	
	.Y_12(Y_12[1]),	
	.Y_20(Y_20[1]),	
	.Y_21(Y_21[1]),	
	.Y_22(Y_22[1])
);
CNN2D CNN2D2(
	.X_00(X_00[2]),
	.X_01(X_01[2]),
	.X_02(X_02[2]),
	.X_10(X_10[2]),
	.X_11(X_11[2]),
	.X_12(X_12[2]),
	.X_20(X_20[2]),
	.X_21(X_21[2]),
	.X_22(X_22[2]),
	.W_00(W_00[2]),
	.W_01(W_01[2]),
	.W_02(W_02[2]),
	.W_10(W_10[2]),
	.W_11(W_11[2]),
	.W_12(W_12[2]),
	.W_20(W_20[2]),
	.W_21(W_21[2]),
	.W_22(W_22[2]),
	.Y_00(Y_00[2]),	
	.Y_01(Y_01[2]),	
	.Y_02(Y_02[2]),	
	.Y_10(Y_10[2]),	
	.Y_11(Y_11[2]),	
	.Y_12(Y_12[2]),	
	.Y_20(Y_20[2]),	
	.Y_21(Y_21[2]),	
	.Y_22(Y_22[2])
);
CNN2D CNN2D3(
	.X_00(X_00[3]),
	.X_01(X_01[3]),
	.X_02(X_02[3]),
	.X_10(X_10[3]),
	.X_11(X_11[3]),
	.X_12(X_12[3]),
	.X_20(X_20[3]),
	.X_21(X_21[3]),
	.X_22(X_22[3]),
	.W_00(W_00[3]),
	.W_01(W_01[3]),
	.W_02(W_02[3]),
	.W_10(W_10[3]),
	.W_11(W_11[3]),
	.W_12(W_12[3]),
	.W_20(W_20[3]),
	.W_21(W_21[3]),
	.W_22(W_22[3]),
	.Y_00(Y_00[3]),	
	.Y_01(Y_01[3]),	
	.Y_02(Y_02[3]),	
	.Y_10(Y_10[3]),	
	.Y_11(Y_11[3]),	
	.Y_12(Y_12[3]),	
	.Y_20(Y_20[3]),	
	.Y_21(Y_21[3]),	
	.Y_22(Y_22[3])
);
CNN2D CNN2D4(
	.X_00(X_00[4]),
	.X_01(X_01[4]),
	.X_02(X_02[4]),
	.X_10(X_10[4]),
	.X_11(X_11[4]),
	.X_12(X_12[4]),
	.X_20(X_20[4]),
	.X_21(X_21[4]),
	.X_22(X_22[4]),
	.W_00(W_00[4]),
	.W_01(W_01[4]),
	.W_02(W_02[4]),
	.W_10(W_10[4]),
	.W_11(W_11[4]),
	.W_12(W_12[4]),
	.W_20(W_20[4]),
	.W_21(W_21[4]),
	.W_22(W_22[4]),
	.Y_00(Y_00[4]),	
	.Y_01(Y_01[4]),	
	.Y_02(Y_02[4]),	
	.Y_10(Y_10[4]),	
	.Y_11(Y_11[4]),	
	.Y_12(Y_12[4]),	
	.Y_20(Y_20[4]),	
	.Y_21(Y_21[4]),	
	.Y_22(Y_22[4])
);
CNN2D CNN2D5(
	.X_00(X_00[5]),
	.X_01(X_01[5]),
	.X_02(X_02[5]),
	.X_10(X_10[5]),
	.X_11(X_11[5]),
	.X_12(X_12[5]),
	.X_20(X_20[5]),
	.X_21(X_21[5]),
	.X_22(X_22[5]),
	.W_00(W_00[5]),
	.W_01(W_01[5]),
	.W_02(W_02[5]),
	.W_10(W_10[5]),
	.W_11(W_11[5]),
	.W_12(W_12[5]),
	.W_20(W_20[5]),
	.W_21(W_21[5]),
	.W_22(W_22[5]),
	.Y_00(Y_00[5]),	
	.Y_01(Y_01[5]),	
	.Y_02(Y_02[5]),	
	.Y_10(Y_10[5]),	
	.Y_11(Y_11[5]),	
	.Y_12(Y_12[5]),	
	.Y_20(Y_20[5]),	
	.Y_21(Y_21[5]),	
	.Y_22(Y_22[5])
);
CNN2D CNN2D6(
	.X_00(X_00[6]),
	.X_01(X_01[6]),
	.X_02(X_02[6]),
	.X_10(X_10[6]),
	.X_11(X_11[6]),
	.X_12(X_12[6]),
	.X_20(X_20[6]),
	.X_21(X_21[6]),
	.X_22(X_22[6]),
	.W_00(W_00[6]),
	.W_01(W_01[6]),
	.W_02(W_02[6]),
	.W_10(W_10[6]),
	.W_11(W_11[6]),
	.W_12(W_12[6]),
	.W_20(W_20[6]),
	.W_21(W_21[6]),
	.W_22(W_22[6]),
	.Y_00(Y_00[6]),	
	.Y_01(Y_01[6]),	
	.Y_02(Y_02[6]),	
	.Y_10(Y_10[6]),	
	.Y_11(Y_11[6]),	
	.Y_12(Y_12[6]),	
	.Y_20(Y_20[6]),	
	.Y_21(Y_21[6]),	
	.Y_22(Y_22[6])
);
CNN2D CNN2D7(
	.X_00(X_00[7]),
	.X_01(X_01[7]),
	.X_02(X_02[7]),
	.X_10(X_10[7]),
	.X_11(X_11[7]),
	.X_12(X_12[7]),
	.X_20(X_20[7]),
	.X_21(X_21[7]),
	.X_22(X_22[7]),
	.W_00(W_00[7]),
	.W_01(W_01[7]),
	.W_02(W_02[7]),
	.W_10(W_10[7]),
	.W_11(W_11[7]),
	.W_12(W_12[7]),
	.W_20(W_20[7]),
	.W_21(W_21[7]),
	.W_22(W_22[7]),
	.Y_00(Y_00[7]),	
	.Y_01(Y_01[7]),	
	.Y_02(Y_02[7]),	
	.Y_10(Y_10[7]),	
	.Y_11(Y_11[7]),	
	.Y_12(Y_12[7]),	
	.Y_20(Y_20[7]),	
	.Y_21(Y_21[7]),	
	.Y_22(Y_22[7])
);
CNN2D CNN2D8(
	.X_00(X_00[8]),
	.X_01(X_01[8]),
	.X_02(X_02[8]),
	.X_10(X_10[8]),
	.X_11(X_11[8]),
	.X_12(X_12[8]),
	.X_20(X_20[8]),
	.X_21(X_21[8]),
	.X_22(X_22[8]),
	.W_00(W_00[8]),
	.W_01(W_01[8]),
	.W_02(W_02[8]),
	.W_10(W_10[8]),
	.W_11(W_11[8]),
	.W_12(W_12[8]),
	.W_20(W_20[8]),
	.W_21(W_21[8]),
	.W_22(W_22[8]),
	.Y_00(Y_00[8]),	
	.Y_01(Y_01[8]),	
	.Y_02(Y_02[8]),	
	.Y_10(Y_10[8]),	
	.Y_11(Y_11[8]),	
	.Y_12(Y_12[8]),	
	.Y_20(Y_20[8]),	
	.Y_21(Y_21[8]),	
	.Y_22(Y_22[8])
);
CNN2D CNN2D9(
	.X_00(X_00[9]),
	.X_01(X_01[9]),
	.X_02(X_02[9]),
	.X_10(X_10[9]),
	.X_11(X_11[9]),
	.X_12(X_12[9]),
	.X_20(X_20[9]),
	.X_21(X_21[9]),
	.X_22(X_22[9]),
	.W_00(W_00[9]),
	.W_01(W_01[9]),
	.W_02(W_02[9]),
	.W_10(W_10[9]),
	.W_11(W_11[9]),
	.W_12(W_12[9]),
	.W_20(W_20[9]),
	.W_21(W_21[9]),
	.W_22(W_22[9]),
	.Y_00(Y_00[9]),	
	.Y_01(Y_01[9]),	
	.Y_02(Y_02[9]),	
	.Y_10(Y_10[9]),	
	.Y_11(Y_11[9]),	
	.Y_12(Y_12[9]),	
	.Y_20(Y_20[9]),	
	.Y_21(Y_21[9]),	
	.Y_22(Y_22[9])
);
CNN2D CNN2D10(
	.X_00(X_00[10]),
	.X_01(X_01[10]),
	.X_02(X_02[10]),
	.X_10(X_10[10]),
	.X_11(X_11[10]),
	.X_12(X_12[10]),
	.X_20(X_20[10]),
	.X_21(X_21[10]),
	.X_22(X_22[10]),
	.W_00(W_00[10]),
	.W_01(W_01[10]),
	.W_02(W_02[10]),
	.W_10(W_10[10]),
	.W_11(W_11[10]),
	.W_12(W_12[10]),
	.W_20(W_20[10]),
	.W_21(W_21[10]),
	.W_22(W_22[10]),
	.Y_00(Y_00[10]),	
	.Y_01(Y_01[10]),	
	.Y_02(Y_02[10]),	
	.Y_10(Y_10[10]),	
	.Y_11(Y_11[10]),	
	.Y_12(Y_12[10]),	
	.Y_20(Y_20[10]),	
	.Y_21(Y_21[10]),	
	.Y_22(Y_22[10])
);
CNN2D CNN2D11(
	.X_00(X_00[11]),
	.X_01(X_01[11]),
	.X_02(X_02[11]),
	.X_10(X_10[11]),
	.X_11(X_11[11]),
	.X_12(X_12[11]),
	.X_20(X_20[11]),
	.X_21(X_21[11]),
	.X_22(X_22[11]),
	.W_00(W_00[11]),
	.W_01(W_01[11]),
	.W_02(W_02[11]),
	.W_10(W_10[11]),
	.W_11(W_11[11]),
	.W_12(W_12[11]),
	.W_20(W_20[11]),
	.W_21(W_21[11]),
	.W_22(W_22[11]),
	.Y_00(Y_00[11]),	
	.Y_01(Y_01[11]),	
	.Y_02(Y_02[11]),	
	.Y_10(Y_10[11]),	
	.Y_11(Y_11[11]),	
	.Y_12(Y_12[11]),	
	.Y_20(Y_20[11]),	
	.Y_21(Y_21[11]),	
	.Y_22(Y_22[11])
);
CNN2D CNN2D12(
	.X_00(X_00[12]),
	.X_01(X_01[12]),
	.X_02(X_02[12]),
	.X_10(X_10[12]),
	.X_11(X_11[12]),
	.X_12(X_12[12]),
	.X_20(X_20[12]),
	.X_21(X_21[12]),
	.X_22(X_22[12]),
	.W_00(W_00[12]),
	.W_01(W_01[12]),
	.W_02(W_02[12]),
	.W_10(W_10[12]),
	.W_11(W_11[12]),
	.W_12(W_12[12]),
	.W_20(W_20[12]),
	.W_21(W_21[12]),
	.W_22(W_22[12]),
	.Y_00(Y_00[12]),	
	.Y_01(Y_01[12]),	
	.Y_02(Y_02[12]),	
	.Y_10(Y_10[12]),	
	.Y_11(Y_11[12]),	
	.Y_12(Y_12[12]),	
	.Y_20(Y_20[12]),	
	.Y_21(Y_21[12]),	
	.Y_22(Y_22[12])
);
CNN2D CNN2D13(
	.X_00(X_00[13]),
	.X_01(X_01[13]),
	.X_02(X_02[13]),
	.X_10(X_10[13]),
	.X_11(X_11[13]),
	.X_12(X_12[13]),
	.X_20(X_20[13]),
	.X_21(X_21[13]),
	.X_22(X_22[13]),
	.W_00(W_00[13]),
	.W_01(W_01[13]),
	.W_02(W_02[13]),
	.W_10(W_10[13]),
	.W_11(W_11[13]),
	.W_12(W_12[13]),
	.W_20(W_20[13]),
	.W_21(W_21[13]),
	.W_22(W_22[13]),
	.Y_00(Y_00[13]),	
	.Y_01(Y_01[13]),	
	.Y_02(Y_02[13]),	
	.Y_10(Y_10[13]),	
	.Y_11(Y_11[13]),	
	.Y_12(Y_12[13]),	
	.Y_20(Y_20[13]),	
	.Y_21(Y_21[13]),	
	.Y_22(Y_22[13])
);
CNN2D CNN2D14(
	.X_00(X_00[14]),
	.X_01(X_01[14]),
	.X_02(X_02[14]),
	.X_10(X_10[14]),
	.X_11(X_11[14]),
	.X_12(X_12[14]),
	.X_20(X_20[14]),
	.X_21(X_21[14]),
	.X_22(X_22[14]),
	.W_00(W_00[14]),
	.W_01(W_01[14]),
	.W_02(W_02[14]),
	.W_10(W_10[14]),
	.W_11(W_11[14]),
	.W_12(W_12[14]),
	.W_20(W_20[14]),
	.W_21(W_21[14]),
	.W_22(W_22[14]),
	.Y_00(Y_00[14]),	
	.Y_01(Y_01[14]),	
	.Y_02(Y_02[14]),	
	.Y_10(Y_10[14]),	
	.Y_11(Y_11[14]),	
	.Y_12(Y_12[14]),	
	.Y_20(Y_20[14]),	
	.Y_21(Y_21[14]),	
	.Y_22(Y_22[14])
);
CNN2D CNN2D15(
	.X_00(X_00[15]),
	.X_01(X_01[15]),
	.X_02(X_02[15]),
	.X_10(X_10[15]),
	.X_11(X_11[15]),
	.X_12(X_12[15]),
	.X_20(X_20[15]),
	.X_21(X_21[15]),
	.X_22(X_22[15]),
	.W_00(W_00[15]),
	.W_01(W_01[15]),
	.W_02(W_02[15]),
	.W_10(W_10[15]),
	.W_11(W_11[15]),
	.W_12(W_12[15]),
	.W_20(W_20[15]),
	.W_21(W_21[15]),
	.W_22(W_22[15]),
	.Y_00(Y_00[15]),	
	.Y_01(Y_01[15]),	
	.Y_02(Y_02[15]),	
	.Y_10(Y_10[15]),	
	.Y_11(Y_11[15]),	
	.Y_12(Y_12[15]),	
	.Y_20(Y_20[15]),	
	.Y_21(Y_21[15]),	
	.Y_22(Y_22[15])
);


endmodule