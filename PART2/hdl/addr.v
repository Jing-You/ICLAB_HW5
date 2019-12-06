module addr(
	input clk,
	input rst_n,
	input [4:0] x_cnt,
	input [4:0] y_cnt,
	input [4:0] x_cnt_pp,
	input [4:0] y_cnt_pp,
	input [4:0] cnn_state,
	input [5:0] state,
	input read_weight_finish,
	input [10:0] conv_cnt,
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
parameter IDLE = 0, UNSHUFFLE = 1, CONV1 = 2;
parameter READ_WEIGHT = 0, DOCNN = 1;



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
	sram_waddr_a <= y_cnt / 8 * 6 + x_cnt / 8;
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
end

reg [4:0] x_offset0;
reg [4:0] y_offset0;
reg [4:0] x_offset1;
reg [4:0] y_offset1;
always @* begin
	x_offset0 = (x_cnt + 1) / 2;
	y_offset0 = (y_cnt + 1) / 2 * 6;
	x_offset1 = (x_cnt) / 2;
	y_offset1 = (y_cnt) / 2 * 6;

end

always @(posedge clk) begin
	if(state == CONV1) begin
		sram_raddr_a0 <= x_offset0 + y_offset0;
		sram_raddr_a1 <= x_offset1 + y_offset0;
		sram_raddr_a2 <= x_offset0 + y_offset1;
		sram_raddr_a3 <= x_offset1 + y_offset1;
		// $display("a0 = %d, a1=%d, a2=%d, a3=%d", sram_raddr_a0, sram_raddr_a1, sram_raddr_a2, sram_raddr_a3);
	end
end

endmodule