module wen(
	input clk,
	input [4:0] x_cnt,
	input [4:0] y_cnt,
	input [4:0] x_cnt_pp,
	input [4:0] y_cnt_pp,
	input [4:0] x_cnt_ppp,
	input [4:0] y_cnt_ppp,
	input [4:0] x_cnt_ppppp,
	input [4:0] y_cnt_ppppp,
	input [5:0] state,
	input [5:0] state_p,
	input [10:0] final_cnt,
	input cnn_state_pppppppp,
	input [1:0] read_input_cnt_ppp,
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
parameter IDLE = 0, UNSHUFFLE = 1, CONV1 = 2, C1_2_C2=3,CONV2 = 4, C2_2_C3 = 5,
	CONV3=6, C3_2_P=7, POOL=8, FINISH = 9;
parameter READ_WEIGHT = 0, DOCNN = 1;

reg x_cnt_ppppp_r2;
reg y_cnt_ppppp_r2;

always @* begin
	x_cnt_ppppp_r2 = x_cnt_ppppp % 2;
	y_cnt_ppppp_r2 = y_cnt_ppppp % 2;
end
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
	else if (state_p == CONV2) begin
		case({y_cnt_ppppp_r2, x_cnt_ppppp_r2})
			2'b00:begin
				sram_wen_a0 <= 0;
				sram_wen_a1 <= 1;
				sram_wen_a2 <= 1;
				sram_wen_a3 <= 1;
			end
			2'b01:begin
				sram_wen_a0 <= 1;
				sram_wen_a1 <= 0;
				sram_wen_a2 <= 1;
				sram_wen_a3 <= 1;
			end
			2'b10:begin
				sram_wen_a0 <= 1;
				sram_wen_a1 <= 1;
				sram_wen_a2 <= 0;
				sram_wen_a3 <= 1;
			end
			2'b11:begin
				sram_wen_a0 <= 1;
				sram_wen_a1 <= 1;
				sram_wen_a2 <= 1;
				sram_wen_a3 <= 0;
			end
		endcase		
	end
	else begin
		sram_wen_a0 <= 1;
		sram_wen_a1 <= 1;
		sram_wen_a2 <= 1;
		sram_wen_a3 <= 1;
	end
end



always @(posedge clk) begin
	if(state_p == CONV1 || state_p == C1_2_C2) begin
		case({y_cnt_ppppp_r2, x_cnt_ppppp_r2})
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
	else if (state == CONV3 && cnn_state_pppppppp == DOCNN && read_input_cnt_ppp == 2) begin
		if (final_cnt <= 575) begin
				sram_wen_b0 <= 0;
				sram_wen_b1 <= 1;
				sram_wen_b2 <= 1;
				sram_wen_b3 <= 1;
		end
		else begin
				sram_wen_b0 <= 1;
				sram_wen_b1 <= 0;
				sram_wen_b2 <= 1;
				sram_wen_b3 <= 1;
		end
	end
	else begin
				sram_wen_b0 <= 1;
				sram_wen_b1 <= 1;
				sram_wen_b2 <= 1;
				sram_wen_b3 <= 1;
	end
end

endmodule