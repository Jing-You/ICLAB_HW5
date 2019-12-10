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
output  [5:0] sram_raddr_a0,
output  [5:0] sram_raddr_a1,
output  [5:0] sram_raddr_a2,
output  [5:0] sram_raddr_a3,
//read address from SRAM group B
output  [5:0] sram_raddr_b0,
output  [5:0] sram_raddr_b1,
output  [5:0] sram_raddr_b2,
output  [5:0] sram_raddr_b3,

output  [10:0] sram_raddr_weight,       //read address from SRAM weight  
output  [6:0] sram_raddr_bias,          //read address from SRAM bias 

output reg busy,
output reg test_layer_finish,
output reg valid,                         //output valid to check the final answer (after POOL)

//write enable for SRAM groups A & B
output sram_wen_a0,
output sram_wen_a1,
output sram_wen_a2,
output sram_wen_a3,
output sram_wen_b0,
output sram_wen_b1,
output sram_wen_b2,
output sram_wen_b3,

//bytemask for SRAM groups A & B
output [CH_NUM*ACT_PER_ADDR-1:0] sram_bytemask_a,
output [CH_NUM*ACT_PER_ADDR-1:0] sram_bytemask_b,
//write addrress to SRAM groups A & B
output  [5:0] sram_waddr_a,
output  [5:0] sram_waddr_b,

//write data to SRAM groups A & B
output reg [CH_NUM*ACT_PER_ADDR*BW_PER_ACT-1:0] sram_wdata_a,
output reg [CH_NUM*ACT_PER_ADDR*BW_PER_ACT-1:0] sram_wdata_b
);

reg [5:0] state;
reg [10:0] read_cnt;
reg [4:0] x_cnt, x_cnt_p;
reg [4:0] y_cnt, y_cnt_p;
reg [1:0] bank_num;
reg [3:0] position_offset;
reg [9:0] conv_cnt;
reg [7:0] weight_cnt;
reg [7:0] bias_cnt;
reg [4:0] cnn_state, cnn_state_p, cnn_state_pp, cnn_state_ppp;
reg read_weight_finish;
reg read_bias_finish;
reg [1:0] read_input_cnt, read_input_cnt_pp;
parameter LAYER1_WIDTH = 14, LAYER1_HEIGHT = 14;
parameter IDLE = 0, UNSHUFFLE = 1, CONV1 = 2, C1_2_C2=3, CONV2 = 4, C2_2_C3 = 5,
	CONV3=6, C3_2_P=7, POOL=8, FINISH = 9;
parameter READ_WEIGHT = 0, DOCNN = 1, WAIT = 2;
integer i, j, k;
reg [4:0] x_cnt_pp;
reg [4:0] y_cnt_pp;
wire [15:0] feature_maps_o0;
wire [15:0] feature_maps_o1;
wire [15:0] feature_maps_o2;
wire [15:0] feature_maps_o3;
reg [1:0] read_input_cnt_p;
reg [9:0] conv_cnt_p, conv_cnt_pp;
always @(posedge clk)
	x_cnt_p <= x_cnt;
always @(posedge clk)
	y_cnt_p <= y_cnt;
always @(posedge clk) begin
	x_cnt_pp <= x_cnt_p;
	y_cnt_pp <= y_cnt_p;
	conv_cnt_p <= conv_cnt;
	cnn_state_pp <= cnn_state_p;
	cnn_state_ppp <= cnn_state_pp;
	read_input_cnt_p <= read_input_cnt;
	read_input_cnt_pp <= read_input_cnt_p;
	cnn_state_p <= cnn_state;
end

bytemask bytemask
(
	.clk(clk),
	.rst_n(rst_n),
	.x_cnt(x_cnt),
	.y_cnt(y_cnt),
	.x_cnt_pp(x_cnt_pp),
	.y_cnt_pp(y_cnt_pp),
	.state(state),
	.conv_cnt(conv_cnt),
	.conv_cnt_p(conv_cnt_p),
	.sram_bytemask_a(sram_bytemask_a),
	.sram_bytemask_b(sram_bytemask_b)
);

addr addr(
	.clk(clk),
	.rst_n(rst_n),
	.x_cnt(x_cnt),
	.y_cnt(y_cnt),
	.x_cnt_pp(x_cnt_pp),
	.y_cnt_pp(y_cnt_pp),
	.read_input_cnt(read_input_cnt),
	.read_cnt(read_cnt),
	.cnn_state(cnn_state),
	.state(state),
	.read_weight_finish(read_weight_finish),
	.read_bias_finish(read_bias_finish),
	.conv_cnt(conv_cnt),
	.conv_cnt_p(conv_cnt_p),
	.sram_waddr_a(sram_waddr_a),
	.sram_waddr_b(sram_waddr_b),
	.sram_raddr_bias(sram_raddr_bias),
	.sram_raddr_weight(sram_raddr_weight),
	.sram_raddr_a0(sram_raddr_a0),
	.sram_raddr_a1(sram_raddr_a1),
	.sram_raddr_a2(sram_raddr_a2),
	.sram_raddr_a3(sram_raddr_a3),
	.sram_raddr_b0(sram_raddr_b0),
	.sram_raddr_b1(sram_raddr_b1),
	.sram_raddr_b2(sram_raddr_b2),
	.sram_raddr_b3(sram_raddr_b3)
);

top_CNN top_CNN(
	.clk(clk),
	.rst_n(rst_n),
	.cnn_state(cnn_state),
	.cnn_state_ppp(cnn_state_ppp),
	.state(state),
	.sram_rdata_a0(sram_rdata_a0),
	.sram_rdata_a1(sram_rdata_a1),
	.sram_rdata_a2(sram_rdata_a2),
	.sram_rdata_a3(sram_rdata_a3),
	.sram_rdata_b0(sram_rdata_b0),
	.sram_rdata_b1(sram_rdata_b1),
	.sram_rdata_b2(sram_rdata_b2),
	.sram_rdata_b3(sram_rdata_b3),
	.sram_rdata_weight(sram_rdata_weight),  //read data from SRAM weight
	.sram_rdata_bias(sram_rdata_bias),      //read data from SRAM bias
	.x_cnt(x_cnt),
	.y_cnt(y_cnt),
	.x_cnt_pp(x_cnt_pp),
	.y_cnt_pp(y_cnt_pp),
	.x_cnt_p(x_cnt_p),
	.y_cnt_p(y_cnt_p),
	.read_input_cnt(read_input_cnt),
	.read_input_cnt_p(read_input_cnt_p),
	.read_cnt(read_cnt),
	.read_weight_finish(read_weight_finish),
	.read_bias_finish(read_bias_finish),
	.feature_maps_o0(feature_maps_o0),
	.feature_maps_o1(feature_maps_o1),
	.feature_maps_o2(feature_maps_o2),
	.feature_maps_o3(feature_maps_o3)
);

wen wen(
	.clk(clk),
	.x_cnt(x_cnt),
	.y_cnt(y_cnt),
	.x_cnt_pp(x_cnt_pp),
	.y_cnt_pp(y_cnt_pp),
	.state(state),
	.sram_wen_a0(sram_wen_a0),
	.sram_wen_a1(sram_wen_a1),
	.sram_wen_a2(sram_wen_a2),
	.sram_wen_a3(sram_wen_a3),
	.sram_wen_b0(sram_wen_b0),
	.sram_wen_b1(sram_wen_b1),
	.sram_wen_b2(sram_wen_b2),
	.sram_wen_b3(sram_wen_b3)
);

always @(posedge clk) begin
	if (!rst_n) begin
	end
	else begin
		
	end
end

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
	else if (state == CONV1) begin
		if (x_cnt_pp == 5 && y_cnt_pp == 5 && conv_cnt == 3)
			state <= C1_2_C2;
		else
			state <= state;
	end
	else if (state == C1_2_C2) begin
		state <= CONV2;
	end
	else if (state == CONV2) begin
		if (conv_cnt_p == 15 && x_cnt_pp == 4 && y_cnt_pp == 4)
			state <= C2_2_C3;
		else
			state <= state;
	end
	else if (state == C2_2_C3) begin
		state <= CONV3;
	end
	else if (state == CONV3) begin
		if (conv_cnt == 63 && x_cnt == 3 && y_cnt == 3 && read_input_cnt == 3)
			state <= FINISH;
		else
			state <= state;
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
		else if (x_cnt == 5 && y_cnt == 5)
			cnn_state <= READ_WEIGHT;
		else
			cnn_state <= DOCNN;
	end
	else if (state == C1_2_C2) begin
		cnn_state <= READ_WEIGHT;
	end
	else if (state == CONV2) begin
		if (cnn_state == READ_WEIGHT) begin
			if (read_weight_finish) begin
				cnn_state <= DOCNN;
			end else begin
				cnn_state <= READ_WEIGHT;
			end
		end
		else if (x_cnt == 4 && y_cnt == 4)
			cnn_state <= READ_WEIGHT;
		else
			cnn_state <= DOCNN;
	end
	else if (state == CONV3) begin
		if (cnn_state == READ_WEIGHT) begin
			if (read_weight_finish) begin
				cnn_state <= DOCNN;
			end else begin
				cnn_state <= READ_WEIGHT;
			end
		end
		else if (x_cnt_pp == 3 && y_cnt_pp == 3 && read_input_cnt_pp == 3)
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
		if(x_cnt_pp == 5 && y_cnt_pp == 5) begin
			conv_cnt <= conv_cnt + 1;
		end
		else begin
			conv_cnt <= conv_cnt;
		end		
	end
	else if (state == C1_2_C2) begin
		conv_cnt <= 0;
	end
	else if (state == CONV2) begin
		if(x_cnt_pp == 4 && y_cnt_pp == 4) begin
			conv_cnt <= conv_cnt + 1;
		end
		else begin
			conv_cnt <= conv_cnt;
		end
	end
	else if (state == C2_2_C3) begin
		conv_cnt <= 0;
	end
	else if (state == CONV3) begin
		if(x_cnt_pp == 3 && y_cnt_pp == 3 && read_input_cnt == 3) begin
			conv_cnt <= conv_cnt + 1;
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
	else if (state == C1_2_C2 || state == C2_2_C3) begin
		read_cnt <= 0;
	end
	else if (state == CONV2) begin
		if (!read_weight_finish && cnn_state == READ_WEIGHT)
			read_cnt <= 1 + read_cnt;
		else begin
			read_cnt <= read_cnt;
		end
	end
	else if (state == CONV3) begin
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

always @(posedge clk) begin
	if (!rst_n) begin
		read_weight_finish <= 0;
	end
	else if (state == UNSHUFFLE || state == C1_2_C2 || state == C2_2_C3) begin
		read_weight_finish <= 0;
	end
	else if (state == CONV1) begin
		if (cnn_state == DOCNN) begin
			read_weight_finish <= 0;
		end
		else if (sram_raddr_weight % 4 == 3) begin
			read_weight_finish <= 1;
		end
	end
	else if (state == CONV2) begin
		if (cnn_state == DOCNN) begin
			read_weight_finish <= 0;
		end
		else if (sram_raddr_weight % 4 == 3) begin
			read_weight_finish <= 1;
		end		
	end
	else if (state == CONV3) begin
		if (cnn_state == DOCNN) begin
			read_weight_finish <= 0;
		end
		else if (sram_raddr_weight % 16 == 15) begin
			read_weight_finish <= 1;
		end		
	end	
end

always @(posedge clk) begin
	if (!rst_n) begin
		read_bias_finish <= 0;
	end
	else if (state == UNSHUFFLE || state == C1_2_C2 || state == C2_2_C3) begin
		read_bias_finish <= 0;
	end
	else if (state == CONV1) begin
		if (cnn_state == DOCNN) begin
			read_bias_finish <= 0;
		end
		else if (read_cnt % 4 == 0) begin
			read_bias_finish <= 1;
		end
	end
	else if (state == CONV2) begin
		if (cnn_state == DOCNN) begin
			read_bias_finish <= 0;
		end
		else if (sram_raddr_bias % 4 == 0) begin
			read_bias_finish <= 1;
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
	else if (cnn_state == READ_WEIGHT || state == C1_2_C2 || state == C2_2_C3) begin
		x_cnt <= 0;
		y_cnt <= 0;
	end
	else if (state == CONV1) begin
		if (cnn_state == DOCNN)
			if (x_cnt == 5) begin
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
	else if (state == CONV2) begin
		if (cnn_state == DOCNN)
			if (x_cnt == 4) begin
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
	else if (state == CONV3) begin
		if (cnn_state == DOCNN)
			if (read_input_cnt == 3) begin
				if (x_cnt == 3) begin
					x_cnt <= 0;
					y_cnt <= y_cnt + 1;
				end else begin
					x_cnt <= x_cnt + 1;
					y_cnt <= y_cnt;
				end
			end
			else begin
					
			end
		else begin
			x_cnt <= 0;
			y_cnt <= 0;
		end
	end
end

always @(posedge clk) begin
	if (!rst_n) begin
		read_input_cnt <= 0;
	end
	else if (cnn_state_p == READ_WEIGHT) begin
		read_input_cnt <= 0;
	end
	else if (cnn_state_p == DOCNN) begin
		read_input_cnt <= read_input_cnt + 1;
	end
	else begin
		read_input_cnt <= read_input_cnt;
	end
end

always @*
	test_layer_finish = state == FINISH;

always@(posedge clk) 
	if (read_cnt >= 28*28 && state == UNSHUFFLE) begin
		valid <= 0;
		busy <= 1;		
	end
	else begin
		valid <= 0;	
		busy <= 0;	
	end


wire [7:0] look = sram_wdata_a[7:0];
reg [7:0] input_data_delay;
always @(posedge clk) begin
	input_data_delay <= input_data;
end
always @* begin
	if (state == UNSHUFFLE) begin
		for(i=0; i< 16; i=i+1)
			sram_wdata_a[i*8 +:8] = input_data_delay;
	end
	else if (state == CONV1|| state == C1_2_C2) begin
		sram_wdata_b[15*8 +:8] = feature_maps_o0;
		sram_wdata_b[14*8 +:8] = feature_maps_o1;
		sram_wdata_b[13*8 +:8] = feature_maps_o2;
		sram_wdata_b[12*8 +:8] = feature_maps_o3;
		sram_wdata_b[11*8 +:8] = feature_maps_o0;
		sram_wdata_b[10*8 +:8] = feature_maps_o1;
		sram_wdata_b[9*8 +:8]  = feature_maps_o2;
		sram_wdata_b[8*8 +:8]  = feature_maps_o3;
		sram_wdata_b[7*8 +:8]  = feature_maps_o0;
		sram_wdata_b[6*8 +:8]  = feature_maps_o1;
		sram_wdata_b[5*8 +:8]  = feature_maps_o2;
		sram_wdata_b[4*8 +:8]  = feature_maps_o3;
		sram_wdata_b[3*8 +:8]  = feature_maps_o0;
		sram_wdata_b[2*8 +:8]  = feature_maps_o1;
		sram_wdata_b[1*8 +:8]  = feature_maps_o2;
		sram_wdata_b[0*8 +:8]  = feature_maps_o3;
	end
	else if (state == CONV2 || state == C2_2_C3) begin
		sram_wdata_a[15*8 +:8] = feature_maps_o0;
		sram_wdata_a[14*8 +:8] = feature_maps_o1;
		sram_wdata_a[13*8 +:8] = feature_maps_o2;
		sram_wdata_a[12*8 +:8] = feature_maps_o3;
		sram_wdata_a[11*8 +:8] = feature_maps_o0;
		sram_wdata_a[10*8 +:8] = feature_maps_o1;
		sram_wdata_a[9*8 +:8]  = feature_maps_o2;
		sram_wdata_a[8*8 +:8]  = feature_maps_o3;
		sram_wdata_a[7*8 +:8]  = feature_maps_o0;
		sram_wdata_a[6*8 +:8]  = feature_maps_o1;
		sram_wdata_a[5*8 +:8]  = feature_maps_o2;
		sram_wdata_a[4*8 +:8]  = feature_maps_o3;
		sram_wdata_a[3*8 +:8]  = feature_maps_o0;
		sram_wdata_a[2*8 +:8]  = feature_maps_o1;
		sram_wdata_a[1*8 +:8]  = feature_maps_o2;
		sram_wdata_a[0*8 +:8]  = feature_maps_o3;
	end
end

endmodule