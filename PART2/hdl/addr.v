module addr(
	input clk,
	input rst_n,
	input [4:0] x_cnt,
	input [4:0] y_cnt,
	input [4:0] x_cnt_pp,
	input [4:0] y_cnt_pp,
	input [4:0] cnn_state,
	input [10:0] read_cnt,
	input [5:0] state,
	input read_weight_finish,
	input read_bias_finish,
	input [10:0] conv_cnt,
	input [10:0] conv_cnt_p,
	output reg [5:0] sram_waddr_a,
	output reg [5:0] sram_waddr_b,
	output reg [6:0] sram_raddr_bias,
	output reg [10:0] sram_raddr_weight,
	output reg [5:0] sram_raddr_a0,
	output reg [5:0] sram_raddr_a1,
	output reg [5:0] sram_raddr_a2,
	output reg [5:0] sram_raddr_a3,
	output reg [5:0] sram_raddr_b0,
	output reg [5:0] sram_raddr_b1,
	output reg [5:0] sram_raddr_b2,
	output reg [5:0] sram_raddr_b3
);

parameter LAYER1_WIDTH = 14, LAYER1_HEIGHT = 14;
parameter IDLE = 0, UNSHUFFLE = 1, CONV1 = 2, C1_2_C2=3,CONV2 = 4, C2_2_C3 = 5,
	CONV3=6, C3_2_P=7, POOL=8, FINISH = 9;
parameter READ_WEIGHT = 0, DOCNN = 1;


reg [4:0] x_offset0;
reg [4:0] y_offset0;
reg [4:0] x_offset1;
reg [4:0] y_offset1;
reg [4:0] x_offset_pp0;
reg [4:0] y_offset_pp0;
reg [4:0] x_offset_pp1;
reg [4:0] y_offset_pp1;


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
	else if (state == C1_2_C2) begin
		sram_raddr_weight <= 16;
	end
	else if (state == CONV2) begin
		if (cnn_state == READ_WEIGHT && !read_weight_finish)
			sram_raddr_weight <= sram_raddr_weight + 1;
		else begin
			sram_raddr_weight <= sram_raddr_weight;
		end
	end
end

always @(posedge clk) begin
	if (state == UNSHUFFLE)
		sram_waddr_a <= y_cnt / 8 * 6 + x_cnt / 8;
	else if (state == CONV2) begin
		case ((conv_cnt_p/4) % 4)
		0: begin
			sram_waddr_a = x_offset_pp1 + y_offset_pp1;
		end
		1: begin
			sram_waddr_a = x_offset_pp1 + y_offset_pp1 + 3;
		end
		2: begin
			sram_waddr_a = x_offset_pp1 + y_offset_pp1 + 18;
		end
		3: begin
			sram_waddr_a = x_offset_pp1 + y_offset_pp1 + 21;
		end
		endcase
 	end
end

always @(posedge clk) begin
	sram_waddr_b <= y_cnt_pp / 2 * 6 + x_cnt_pp / 2;
end

always @(posedge clk) begin
	if(!rst_n) begin
		sram_raddr_bias <= 0;
	end
	else if (state == CONV1) begin
		sram_raddr_bias <= conv_cnt;
	end
	else if (state == C1_2_C2) begin
		sram_raddr_bias <= 4;
	end
	else if (state == CONV2 && read_cnt % 4 < 3 && cnn_state == READ_WEIGHT) begin
		sram_raddr_bias <= conv_cnt + 4;
	end
	else if (state == C2_2_C3) begin
		sram_raddr_bias <= 20;
	end
end

always @* begin
	x_offset0 = (x_cnt + 1) / 2;
	y_offset0 = (y_cnt + 1) / 2 * 6;
	x_offset1 = (x_cnt) / 2;
	y_offset1 = (y_cnt) / 2 * 6;
end

always @* begin
	x_offset_pp0 = (x_cnt_pp + 1) / 2;
	y_offset_pp0 = (y_cnt_pp + 1) / 2 * 6;
	x_offset_pp1 = (x_cnt_pp) / 2;
	y_offset_pp1 = (y_cnt_pp) / 2 * 6;
end

always @(posedge clk) begin
	if(state == CONV1) begin
		sram_raddr_a0 <= x_offset0 + y_offset0;
		sram_raddr_a1 <= x_offset1 + y_offset0;
		sram_raddr_a2 <= x_offset0 + y_offset1;
		sram_raddr_a3 <= x_offset1 + y_offset1;
	end
end

always @(posedge clk) begin
	if(state == CONV2) begin
		sram_raddr_b0 <= x_offset0 + y_offset0;
		sram_raddr_b1 <= x_offset1 + y_offset0;
		sram_raddr_b2 <= x_offset0 + y_offset1;
		sram_raddr_b3 <= x_offset1 + y_offset1;
	end
end

endmodule