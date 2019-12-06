module wen(
	input clk,
	input [4:0] x_cnt,
	input [4:0] y_cnt,
	input [4:0] x_cnt_pp,
	input [4:0] y_cnt_pp,
	input [5:0] state,
	output reg sram_wen_a0,
	output reg sram_wen_a1,
	output reg sram_wen_a2,
	output reg sram_wen_a3,
	output reg sram_wen_b0,
	output reg sram_wen_b1,
	output reg sram_wen_b2,
	output reg sram_wen_b3
);


reg [2:0] y_r8, x_r8;
parameter LAYER1_WIDTH = 14, LAYER1_HEIGHT = 14;
parameter IDLE = 0, UNSHUFFLE = 1, CONV1 = 2, CONV2 = 3;
parameter READ_WEIGHT = 0, DOCNN = 1;

always @* begin
	y_r8 = y_cnt % 8;
	x_r8 = x_cnt % 8;
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


reg x_cnt_pp_r2;
reg y_cnt_pp_r2;

always @* begin
	x_cnt_pp_r2 = x_cnt_pp % 2;
	y_cnt_pp_r2 = y_cnt_pp % 2;
end

always @(posedge clk) begin
	if(state == CONV1) begin
		case({y_cnt_pp_r2, x_cnt_pp_r2})
			2'b00:begin
				sram_wen_b0 <= 0;
				sram_wen_b1 <= 1;
				sram_wen_b2 <= 1;
				sram_wen_b3 <= 1;
			end
			2'b01:begin
				sram_wen_b0 <= 1;
				sram_wen_b1 <= 0;
				sram_wen_b2 <= 1;
				sram_wen_b3 <= 1;
			end
			2'b10:begin
				sram_wen_b0 <= 1;
				sram_wen_b1 <= 1;
				sram_wen_b2 <= 0;
				sram_wen_b3 <= 1;
			end
			2'b11:begin
				sram_wen_b0 <= 1;
				sram_wen_b1 <= 1;
				sram_wen_b2 <= 1;
				sram_wen_b3 <= 0;
			end
		endcase
	end
end

endmodule