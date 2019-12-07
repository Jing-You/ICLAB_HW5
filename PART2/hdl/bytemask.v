module bytemask
(

	input clk,
	input rst_n,
	input [4:0] x_cnt,
	input [4:0] y_cnt,
	input [4:0] x_cnt_pp,
	input [4:0] y_cnt_pp,
	input [5:0] state,
	input [7:0] conv_cnt,
	input [7:0] conv_cnt_p,
	output reg [15:0] sram_bytemask_a,
	output reg [15:0] sram_bytemask_b

);

parameter LAYER1_WIDTH = 14, LAYER1_HEIGHT = 14;
parameter IDLE = 0, UNSHUFFLE = 1, CONV1 = 2, C1_2_C2=3,CONV2 = 4, C2_2_C3 = 5,
	CONV3=6, C3_2_P=7, POOL=8, FINISH = 9;
parameter READ_WEIGHT = 0, DOCNN = 1;


reg [3:0] position_offset;


always @* begin
	position_offset = y_cnt % 4 * 4 + x_cnt % 4;
end

always @(posedge clk) begin
		case (position_offset)
		0: 	sram_bytemask_a <=  16'b0111_1111_1111_1111;
		1: 	sram_bytemask_a <=  16'b1111_0111_1111_1111;
		2: 	sram_bytemask_a <=  16'b1011_1111_1111_1111;
		3: 	sram_bytemask_a <=  16'b1111_1011_1111_1111;
		4: 	sram_bytemask_a <=  16'b1111_1111_0111_1111;
		5: 	sram_bytemask_a <=  16'b1111_1111_1111_0111;
		6: 	sram_bytemask_a <=  16'b1111_1111_1011_1111;
		7: 	sram_bytemask_a <=  16'b1111_1111_1111_1011;
		8: 	sram_bytemask_a <=  16'b1101_1111_1111_1111;
		9: 	sram_bytemask_a <=  16'b1111_1101_1111_1111;
		10: sram_bytemask_a <= 16'b1110_1111_1111_1111;
		11: sram_bytemask_a <= 16'b1111_1110_1111_1111;
		12: sram_bytemask_a <= 16'b1111_1111_1101_1111;
		13: sram_bytemask_a <= 16'b1111_1111_1111_1101;
		14: sram_bytemask_a <= 16'b1111_1111_1110_1111;
		15: sram_bytemask_a <= 16'b1111_1111_1111_1110;
	endcase
end


reg x_cnt_pp_r;
reg y_cnt_pp_r;

always @* begin
	x_cnt_pp_r = x_cnt_pp % 2;
	y_cnt_pp_r = y_cnt_pp % 2;
end

always @(posedge clk) begin
	if (state == CONV1) begin
		sram_bytemask_b <= 0;
		// case (conv_cnt_p)
		// 	0: sram_bytemask_b <= 16'b0000_1111_1111_1111;
		// 	1: sram_bytemask_b <= 16'b1111_0000_1111_1111;
		// 	2: sram_bytemask_b <= 16'b1111_1111_0000_1111;
		// 	3: sram_bytemask_b <= 16'b1111_1111_1111_0000;
		// 	default: sram_bytemask_b <= 16'b1111_1111_1111_1111;
		// endcase
	end
	else begin
		sram_bytemask_b <= 16'b1111_1111_1111_1111;
	end
end

endmodule