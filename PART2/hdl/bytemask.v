module bytemask
(

	input clk,
	input rst_n,
	input [4:0] x_cnt,
	input [4:0] y_cnt,
	input [5:0] state,
	input [3:0] position_offset,
	output reg [15:0] sram_bytemask_a,
	output reg [15:0] sram_bytemask_b

);


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


always @(posedge clk) begin
		case (position_offset)
		0: 	sram_bytemask_b <=  16'b0111_1111_1111_1111;
		1: 	sram_bytemask_b <=  16'b1111_0111_1111_1111;
		2: 	sram_bytemask_b <=  16'b1011_1111_1111_1111;
		3: 	sram_bytemask_b <=  16'b1111_1011_1111_1111;
		4: 	sram_bytemask_b <=  16'b1111_1111_0111_1111;
		5: 	sram_bytemask_b <=  16'b1111_1111_1111_0111;
		6: 	sram_bytemask_b <=  16'b1111_1111_1011_1111;
		7: 	sram_bytemask_b <=  16'b1111_1111_1111_1011;
		8: 	sram_bytemask_b <=  16'b1101_1111_1111_1111;
		9: 	sram_bytemask_b <=  16'b1111_1101_1111_1111;
		10: sram_bytemask_b <= 16'b1110_1111_1111_1111;
		11: sram_bytemask_b <= 16'b1111_1110_1111_1111;
		12: sram_bytemask_b <= 16'b1111_1111_1101_1111;
		13: sram_bytemask_b <= 16'b1111_1111_1111_1101;
		14: sram_bytemask_b <= 16'b1111_1111_1110_1111;
		15: sram_bytemask_b <= 16'b1111_1111_1111_1110;
	endcase
end


endmodule