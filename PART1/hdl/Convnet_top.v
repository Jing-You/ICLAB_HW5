module Convnet_top #(
parameter CH_NUM = 4,
parameter ACT_PER_ADDR = 4,
parameter BW_PER_ACT = 8
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

//read address from SRAM group A
output [5:0] sram_raddr_a0,
output [5:0] sram_raddr_a1,
output [5:0] sram_raddr_a2,
output [5:0] sram_raddr_a3,

output reg busy,
output reg valid,                         //output valid to check the final answer (after POOL)

//write enable for SRAM group A 
output reg sram_wen_a0,
output reg sram_wen_a1,
output reg sram_wen_a2,
output reg sram_wen_a3,

//bytemask for SRAM group A 
output reg [CH_NUM*ACT_PER_ADDR-1:0] sram_bytemask_a,
//write addrress to SRAM group A 
output reg [5:0] sram_waddr_a,
//write data to SRAM group A 
output reg [CH_NUM*ACT_PER_ADDR*BW_PER_ACT-1:0] sram_wdata_a
);

reg [5:0]state;

reg [10:0] read_cnt;
reg [4:0] x_cnt;
reg [4:0] y_cnt;
reg [1:0] bank_num;
reg [3:0] position_offset;

parameter LAYER1_WIDTH = 14, LAYER1_HEIGHT = 14;
parameter IDLE = 0, UNSHUFFLE = 1;
integer i;

always @(posedge clk) begin
	if(!rst_n) begin
		state <= 0;
	end
	else if (enable) begin
		state <= UNSHUFFLE;
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
			read_cnt <= read_cnt;
	end
	else begin
		read_cnt <= read_cnt;
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
end

always@(posedge clk) 
	if (read_cnt >= 28*28) begin
		valid <= 1;
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
		sram_wen_a0 = 1;
		sram_wen_a1 = 1;
		sram_wen_a2 = 1;
		sram_wen_a3 = 1;
		if (y_r8 <= 3) begin
			if (x_r8 <= 3) begin
				bank_num = 0;
				sram_wen_a0 = 0;
			end else begin
				bank_num = 1;
				sram_wen_a1 = 0;
			end
		end else begin
			if (x_r8 <= 3) begin
				bank_num = 2;
				sram_wen_a2 = 0;
			end else begin
				bank_num = 3;
				sram_wen_a3 = 0;
			end
		end
end

always @* begin
	sram_waddr_a = y_cnt / 8 * 6 + x_cnt / 8;
end

always @* begin
	position_offset = y_cnt % 4 * 4 + x_cnt % 4;
	case (position_offset)
	0: 	sram_bytemask_a =  16'b0111_1111_1111_1111;
	1: 	sram_bytemask_a =  16'b1111_0111_1111_1111;
	2: 	sram_bytemask_a =  16'b1011_1111_1111_1111;
	3: 	sram_bytemask_a =  16'b1111_1011_1111_1111;
	4: 	sram_bytemask_a =  16'b1111_1111_0111_1111;
	5: 	sram_bytemask_a =  16'b1111_1111_1111_0111;
	6: 	sram_bytemask_a =  16'b1111_1111_1011_1111;
	7: 	sram_bytemask_a =  16'b1111_1111_1111_1011;
	8: 	sram_bytemask_a =  16'b1101_1111_1111_1111;
	9: 	sram_bytemask_a =  16'b1111_1101_1111_1111;
	10: sram_bytemask_a = 16'b1110_1111_1111_1111;
	11: sram_bytemask_a = 16'b1111_1110_1111_1111;
	12: sram_bytemask_a = 16'b1111_1111_1101_1111;
	13: sram_bytemask_a = 16'b1111_1111_1111_1101;
	14: sram_bytemask_a = 16'b1111_1111_1110_1111;
	15: sram_bytemask_a = 16'b1111_1111_1111_1110;
	endcase
end

always @* begin
	for(i=0; i< 16; i=i+1)
		sram_wdata_a[i*8 +:8] = input_data;
end

endmodule