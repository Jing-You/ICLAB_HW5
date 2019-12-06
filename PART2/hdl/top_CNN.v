module top_CNN(
	input clk,
	input rst_n,
	input [4:0] cnn_state,
	input [5:0] state,
	input [127:0] sram_rdata_a0,
	input [127:0] sram_rdata_a1,
	input [127:0] sram_rdata_a2,
	input [127:0] sram_rdata_a3,
	input [127:0] sram_rdata_b0,
	input [127:0] sram_rdata_b1,
	input [127:0] sram_rdata_b2,
	input [127:0] sram_rdata_b3,
	input [35:0] sram_rdata_weight,  //read data from SRAM weight
	input signed [3:0] sram_rdata_bias,      //read data from SRAM bias
	input [4:0] x_cnt,
	input [4:0] y_cnt,
	input [4:0] x_cnt_p,
	input [4:0] y_cnt_p,
	input [4:0] x_cnt_pp,
	input [4:0] y_cnt_pp,
	input read_weight_finish,
	input [10:0] read_cnt,
	output  reg signed [7:0] feature_maps_o0,
	output  reg signed [7:0] feature_maps_o1,
	output  reg signed [7:0] feature_maps_o2,
	output  reg signed [7:0] feature_maps_o3
);

parameter LAYER1_WIDTH = 14, LAYER1_HEIGHT = 14;
parameter IDLE = 0, UNSHUFFLE = 1, CONV1 = 2;
parameter READ_WEIGHT = 0, DOCNN = 1;

reg  [7:0]  X[0:15][0:2][0:2];
reg  [3:0]  W[0:3][0:2][0:2];
wire signed [15:0] Y[0:15];	
reg [1:0] raed_type;
reg x_r2, y_r2;
reg [7:0] ch0_pixels[0:3][0:3];
reg [7:0] ch1_pixels[0:3][0:3];
reg [7:0] ch2_pixels[0:3][0:3];
reg [7:0] ch3_pixels[0:3][0:3];
reg signed [15:0] conv_out0;
reg signed [15:0] conv_out1;
reg signed [15:0] conv_out2;
reg signed [15:0] conv_out3;
reg load_weight_finish;
integer i, j, k, l;

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
					W[i][j][k] <= 0;
				end
			end
		end
	end
	else if (state == CONV1 && !load_weight_finish) begin
		if (read_cnt % 4 == 1) begin
			W[0][0][0] <= sram_rdata_weight[35:32];
			W[0][0][1] <= sram_rdata_weight[31:28];
			W[0][0][2] <= sram_rdata_weight[27:24];
			W[0][1][0] <= sram_rdata_weight[23:20];
			W[0][1][1] <= sram_rdata_weight[19:16];
			W[0][1][2] <= sram_rdata_weight[15:12];
			W[0][2][0] <= sram_rdata_weight[11:8];
			W[0][2][1] <= sram_rdata_weight[7:4];
			W[0][2][2] <= sram_rdata_weight[3:0];
		end
		else if (read_cnt % 4 == 2) begin
			W[1][0][0] <= sram_rdata_weight[35:32];
			W[1][0][1] <= sram_rdata_weight[31:28];
			W[1][0][2] <= sram_rdata_weight[27:24];
			W[1][1][0] <= sram_rdata_weight[23:20];
			W[1][1][1] <= sram_rdata_weight[19:16];
			W[1][1][2] <= sram_rdata_weight[15:12];
			W[1][2][0] <= sram_rdata_weight[11:8];
			W[1][2][1] <= sram_rdata_weight[7:4];
			W[1][2][2] <= sram_rdata_weight[3:0];
		end
		else if (read_cnt % 4== 3) begin
			W[2][0][0] <= sram_rdata_weight[35:32];
			W[2][0][1] <= sram_rdata_weight[31:28];
			W[2][0][2] <= sram_rdata_weight[27:24];
			W[2][1][0] <= sram_rdata_weight[23:20];
			W[2][1][1] <= sram_rdata_weight[19:16];
			W[2][1][2] <= sram_rdata_weight[15:12];
			W[2][2][0] <= sram_rdata_weight[11:8];
			W[2][2][1] <= sram_rdata_weight[7:4];
			W[2][2][2] <= sram_rdata_weight[3:0];
		end
		else if (read_cnt % 4 == 0 && read_weight_finish) begin
			W[3][0][0] <= sram_rdata_weight[35:32];
			W[3][0][1] <= sram_rdata_weight[31:28];
			W[3][0][2] <= sram_rdata_weight[27:24];
			W[3][1][0] <= sram_rdata_weight[23:20];
			W[3][1][1] <= sram_rdata_weight[19:16];
			W[3][1][2] <= sram_rdata_weight[15:12];
			W[3][2][0] <= sram_rdata_weight[11:8];
			W[3][2][1] <= sram_rdata_weight[7:4];
			W[3][2][2] <= sram_rdata_weight[3:0];
		end
	end
	else begin
	end
end

always @* begin
	x_r2 = x_cnt_pp % 2;
	y_r2 = y_cnt_pp % 2;
	for(i=0; i<3; i=i+1) begin
		for (j=0;j<3;j=j+1) begin
			X[0][i][j] = ch0_pixels[i][j];
			X[1][i][j] = ch0_pixels[i][j+1];
			X[2][i][j] = ch0_pixels[i+1][j];
			X[3][i][j] = ch0_pixels[i+1][j+1];
		end
	end

	for(i=0; i<3; i=i+1) begin
		for (j=0;j<3;j=j+1) begin
			X[4][i][j] = ch1_pixels[i][j];
			X[5][i][j] = ch1_pixels[i][j+1];
			X[6][i][j] = ch1_pixels[i+1][j];
			X[7][i][j] = ch1_pixels[i+1][j+1];
		end
	end
	for(i=0; i<3; i=i+1) begin
		for (j=0;j<3;j=j+1) begin
			X[8][i][j] = ch2_pixels[i][j];
			X[9][i][j] = ch2_pixels[i][j+1];
			X[10][i][j] = ch2_pixels[i+1][j];
			X[11][i][j] = ch2_pixels[i+1][j+1];
		end
	end
	for(i=0; i<3; i=i+1) begin
		for (j=0;j<3;j=j+1) begin
			X[12][i][j] = ch3_pixels[i][j];
			X[13][i][j] = ch3_pixels[i][j+1];
			X[14][i][j] = ch3_pixels[i+1][j];
			X[15][i][j] = ch3_pixels[i+1][j+1];
		end
	end
end

reg signed [15:0] temp_conv_out0;
reg signed [15:0] temp_conv_out1;
reg signed [15:0] temp_conv_out2;
reg signed [15:0] temp_conv_out3;

always @* begin
	if (state == CONV1) begin
		temp_conv_out0 = Y[0] + Y[4] + Y[8]  + Y[12] + (sram_rdata_bias << (11-4)) + 2 ** 6;
		temp_conv_out1 = Y[1] + Y[5] + Y[9]  + Y[13] + (sram_rdata_bias << (11-4)) + 2 ** 6;
		temp_conv_out2 = Y[2] + Y[6] + Y[10] + Y[14] + (sram_rdata_bias << (11-4)) + 2 ** 6;
		temp_conv_out3 = Y[3] + Y[7] + Y[11] + Y[15] + (sram_rdata_bias << (11-4)) + 2 ** 6;
		conv_out0 = temp_conv_out0 >>> 7;
		conv_out1 = temp_conv_out1 >>> 7;
		conv_out2 = temp_conv_out2 >>> 7;
		conv_out3 = temp_conv_out3 >>> 7;

 		if (conv_out0 >= $signed(127))
 			feature_maps_o0 = 127;
		else if (conv_out0 < $signed(0))
 			feature_maps_o0 = 0;
		else
			feature_maps_o0 = conv_out0[7:0];
 		if (conv_out1 >= $signed(127))
 			feature_maps_o1 = 127;
		else if (conv_out1 < $signed(0))
 			feature_maps_o1 = 0;
		else
			feature_maps_o1 = conv_out1[7:0];
 		if (conv_out2 >= $signed(127))
 			feature_maps_o2 = 127;
		else if (conv_out2 < $signed(0))
 			feature_maps_o2 = 0;
		else
			feature_maps_o2 = conv_out2[7:0];
 		if (conv_out3 >= $signed(127))
 			feature_maps_o3 = 127;
		else if (conv_out3 < $signed(0))
 			feature_maps_o3 = 0;
		else
			feature_maps_o3 = conv_out3[7:0];
	end
end

always @(posedge clk) begin
	// if (state == CONV1 && cnn_state && DOCNN) begin
	// 	// $display("(%d, %d)", y_cnt_pp, x_cnt_pp);
	// 	// $display("ch1_pixels:");
	// 	for(i=0; i<4; i=i+1) begin
	// 		for (j=0;j<4;j=j+1) begin
	// 			$write("%d ", ch1_pixels[i][j]);
	// 		end
	// 		$write("\n");
	// 	end
	// 	$display("%d %d %d %d", feature_maps_o0, feature_maps_o1, feature_maps_o2, feature_maps_o3);
	// end
end

always @* begin
	case({y_r2, x_r2})
	2'b00: begin
		ch0_pixels[0][0] =  sram_rdata_a0[15*8 +: 8];
		ch0_pixels[0][1] =  sram_rdata_a0[14*8 +: 8];
		ch0_pixels[0][2] =  sram_rdata_a1[15*8 +: 8];
		ch0_pixels[0][3] =  sram_rdata_a1[14*8 +: 8];
		ch0_pixels[1][0] =  sram_rdata_a0[13*8 +: 8];
		ch0_pixels[1][1] =  sram_rdata_a0[12*8 +: 8];
		ch0_pixels[1][2] =  sram_rdata_a1[13*8 +: 8];
		ch0_pixels[1][3] =  sram_rdata_a1[12*8 +: 8];
		ch0_pixels[2][0] =  sram_rdata_a2[15*8 +: 8];
		ch0_pixels[2][1] =  sram_rdata_a2[14*8 +: 8];
		ch0_pixels[2][2] =  sram_rdata_a3[15*8 +: 8];
		ch0_pixels[2][3] =  sram_rdata_a3[14*8 +: 8];
		ch0_pixels[3][0] =  sram_rdata_a2[13*8 +: 8];
		ch0_pixels[3][1] =  sram_rdata_a2[12*8 +: 8];
		ch0_pixels[3][2] =  sram_rdata_a3[13*8 +: 8];
		ch0_pixels[3][3] =  sram_rdata_a3[12*8 +: 8];
		ch1_pixels[0][0] =  sram_rdata_a0[11*8 +: 8];
		ch1_pixels[0][1] =  sram_rdata_a0[10*8 +: 8];
		ch1_pixels[0][2] =  sram_rdata_a1[11*8 +: 8];
		ch1_pixels[0][3] =  sram_rdata_a1[10*8 +: 8];
		ch1_pixels[1][0] =  sram_rdata_a0[9*8 +: 8];
		ch1_pixels[1][1] =  sram_rdata_a0[8*8 +: 8];
		ch1_pixels[1][2] =  sram_rdata_a1[9*8 +: 8];
		ch1_pixels[1][3] =  sram_rdata_a1[8*8 +: 8];
		ch1_pixels[2][0] =  sram_rdata_a2[11*8 +: 8];
		ch1_pixels[2][1] =  sram_rdata_a2[10*8 +: 8];
		ch1_pixels[2][2] =  sram_rdata_a3[11*8 +: 8];
		ch1_pixels[2][3] =  sram_rdata_a3[10*8 +: 8];
		ch1_pixels[3][0] =  sram_rdata_a2[9*8 +: 8];
		ch1_pixels[3][1] =  sram_rdata_a2[8*8 +: 8];
		ch1_pixels[3][2] =  sram_rdata_a3[9*8 +: 8];
		ch1_pixels[3][3] =  sram_rdata_a3[8*8 +: 8];
		ch2_pixels[0][0] =  sram_rdata_a0[7*8 +: 8];
		ch2_pixels[0][1] =  sram_rdata_a0[6*8 +: 8];
		ch2_pixels[0][2] =  sram_rdata_a1[7*8 +: 8];
		ch2_pixels[0][3] =  sram_rdata_a1[6*8 +: 8];
		ch2_pixels[1][0] =  sram_rdata_a0[5*8 +: 8];
		ch2_pixels[1][1] =  sram_rdata_a0[4*8 +: 8];
		ch2_pixels[1][2] =  sram_rdata_a1[5*8 +: 8];
		ch2_pixels[1][3] =  sram_rdata_a1[4*8 +: 8];
		ch2_pixels[2][0] =  sram_rdata_a2[7*8 +: 8];
		ch2_pixels[2][1] =  sram_rdata_a2[6*8 +: 8];
		ch2_pixels[2][2] =  sram_rdata_a3[7*8 +: 8];
		ch2_pixels[2][3] =  sram_rdata_a3[6*8 +: 8];
		ch2_pixels[3][0] =  sram_rdata_a2[5*8 +: 8];
		ch2_pixels[3][1] =  sram_rdata_a2[4*8 +: 8];
		ch2_pixels[3][2] =  sram_rdata_a3[5*8 +: 8];
		ch2_pixels[3][3] =  sram_rdata_a3[4*8 +: 8];
		ch3_pixels[0][0] =  sram_rdata_a0[3*8 +: 8];
		ch3_pixels[0][1] =  sram_rdata_a0[2*8 +: 8];
		ch3_pixels[0][2] =  sram_rdata_a1[3*8 +: 8];
		ch3_pixels[0][3] =  sram_rdata_a1[2*8 +: 8];
		ch3_pixels[1][0] =  sram_rdata_a0[1*8 +: 8];
		ch3_pixels[1][1] =  sram_rdata_a0[0*8 +: 8];
		ch3_pixels[1][2] =  sram_rdata_a1[1*8 +: 8];
		ch3_pixels[1][3] =  sram_rdata_a1[0*8 +: 8];
		ch3_pixels[2][0] =  sram_rdata_a2[3*8 +: 8];
		ch3_pixels[2][1] =  sram_rdata_a2[2*8 +: 8];
		ch3_pixels[2][2] =  sram_rdata_a3[3*8 +: 8];
		ch3_pixels[2][3] =  sram_rdata_a3[2*8 +: 8];
		ch3_pixels[3][0] =  sram_rdata_a2[1*8 +: 8];
		ch3_pixels[3][1] =  sram_rdata_a2[0*8 +: 8];
		ch3_pixels[3][2] =  sram_rdata_a3[1*8 +: 8];
		ch3_pixels[3][3] =  sram_rdata_a3[0*8 +: 8];
	end
	2'b01: begin
		ch0_pixels[0][0] =  sram_rdata_a1[15*8 +: 8];
		ch0_pixels[0][1] =  sram_rdata_a1[14*8 +: 8];
		ch0_pixels[0][2] =  sram_rdata_a0[15*8 +: 8];
		ch0_pixels[0][3] =  sram_rdata_a0[14*8 +: 8];
		ch0_pixels[1][0] =  sram_rdata_a1[13*8 +: 8];
		ch0_pixels[1][1] =  sram_rdata_a1[12*8 +: 8];
		ch0_pixels[1][2] =  sram_rdata_a0[13*8 +: 8];
		ch0_pixels[1][3] =  sram_rdata_a0[12*8 +: 8];
		ch0_pixels[2][0] =  sram_rdata_a3[15*8 +: 8];
		ch0_pixels[2][1] =  sram_rdata_a3[14*8 +: 8];
		ch0_pixels[2][2] =  sram_rdata_a2[15*8 +: 8];
		ch0_pixels[2][3] =  sram_rdata_a2[14*8 +: 8];
		ch0_pixels[3][0] =  sram_rdata_a3[13*8 +: 8];
		ch0_pixels[3][1] =  sram_rdata_a3[12*8 +: 8];
		ch0_pixels[3][2] =  sram_rdata_a2[13*8 +: 8];
		ch0_pixels[3][3] =  sram_rdata_a2[12*8 +: 8];
		ch1_pixels[0][0] =  sram_rdata_a1[11*8 +: 8];
		ch1_pixels[0][1] =  sram_rdata_a1[10*8 +: 8];
		ch1_pixels[0][2] =  sram_rdata_a0[11*8 +: 8];
		ch1_pixels[0][3] =  sram_rdata_a0[10*8 +: 8];
		ch1_pixels[1][0] =  sram_rdata_a1[9*8 +: 8];
		ch1_pixels[1][1] =  sram_rdata_a1[8*8 +: 8];
		ch1_pixels[1][2] =  sram_rdata_a0[9*8 +: 8];
		ch1_pixels[1][3] =  sram_rdata_a0[8*8 +: 8];
		ch1_pixels[2][0] =  sram_rdata_a3[11*8 +: 8];
		ch1_pixels[2][1] =  sram_rdata_a3[10*8 +: 8];
		ch1_pixels[2][2] =  sram_rdata_a2[11*8 +: 8];
		ch1_pixels[2][3] =  sram_rdata_a2[10*8 +: 8];
		ch1_pixels[3][0] =  sram_rdata_a3[9*8 +: 8];
		ch1_pixels[3][1] =  sram_rdata_a3[8*8 +: 8];
		ch1_pixels[3][2] =  sram_rdata_a2[9*8 +: 8];
		ch1_pixels[3][3] =  sram_rdata_a2[8*8 +: 8];
		ch2_pixels[0][0] =  sram_rdata_a1[7*8 +: 8];
		ch2_pixels[0][1] =  sram_rdata_a1[6*8 +: 8];
		ch2_pixels[0][2] =  sram_rdata_a0[7*8 +: 8];
		ch2_pixels[0][3] =  sram_rdata_a0[6*8 +: 8];
		ch2_pixels[1][0] =  sram_rdata_a1[5*8 +: 8];
		ch2_pixels[1][1] =  sram_rdata_a1[4*8 +: 8];
		ch2_pixels[1][2] =  sram_rdata_a0[5*8 +: 8];
		ch2_pixels[1][3] =  sram_rdata_a0[4*8 +: 8];
		ch2_pixels[2][0] =  sram_rdata_a3[7*8 +: 8];
		ch2_pixels[2][1] =  sram_rdata_a3[6*8 +: 8];
		ch2_pixels[2][2] =  sram_rdata_a2[7*8 +: 8];
		ch2_pixels[2][3] =  sram_rdata_a2[6*8 +: 8];
		ch2_pixels[3][0] =  sram_rdata_a3[5*8 +: 8];
		ch2_pixels[3][1] =  sram_rdata_a3[4*8 +: 8];
		ch2_pixels[3][2] =  sram_rdata_a2[5*8 +: 8];
		ch2_pixels[3][3] =  sram_rdata_a2[4*8 +: 8];
		ch3_pixels[0][0] =  sram_rdata_a1[3*8 +: 8];
		ch3_pixels[0][1] =  sram_rdata_a1[2*8 +: 8];
		ch3_pixels[0][2] =  sram_rdata_a0[3*8 +: 8];
		ch3_pixels[0][3] =  sram_rdata_a0[2*8 +: 8];
		ch3_pixels[1][0] =  sram_rdata_a1[1*8 +: 8];
		ch3_pixels[1][1] =  sram_rdata_a1[0*8 +: 8];
		ch3_pixels[1][2] =  sram_rdata_a0[1*8 +: 8];
		ch3_pixels[1][3] =  sram_rdata_a0[0*8 +: 8];
		ch3_pixels[2][0] =  sram_rdata_a3[3*8 +: 8];
		ch3_pixels[2][1] =  sram_rdata_a3[2*8 +: 8];
		ch3_pixels[2][2] =  sram_rdata_a2[3*8 +: 8];
		ch3_pixels[2][3] =  sram_rdata_a2[2*8 +: 8];
		ch3_pixels[3][0] =  sram_rdata_a3[1*8 +: 8];
		ch3_pixels[3][1] =  sram_rdata_a3[0*8 +: 8];
		ch3_pixels[3][2] =  sram_rdata_a2[1*8 +: 8];
		ch3_pixels[3][3] =  sram_rdata_a2[0*8 +: 8];
	end
	2'b10: begin
		ch0_pixels[0][0] =  sram_rdata_a2[15*8 +: 8];
		ch0_pixels[0][1] =  sram_rdata_a2[14*8 +: 8];
		ch0_pixels[0][2] =  sram_rdata_a3[15*8 +: 8];
		ch0_pixels[0][3] =  sram_rdata_a3[14*8 +: 8];
		ch0_pixels[1][0] =  sram_rdata_a2[13*8 +: 8];
		ch0_pixels[1][1] =  sram_rdata_a2[12*8 +: 8];
		ch0_pixels[1][2] =  sram_rdata_a3[13*8 +: 8];
		ch0_pixels[1][3] =  sram_rdata_a3[12*8 +: 8];
		ch0_pixels[2][0] =  sram_rdata_a0[15*8 +: 8];
		ch0_pixels[2][1] =  sram_rdata_a0[14*8 +: 8];
		ch0_pixels[2][2] =  sram_rdata_a1[15*8 +: 8];
		ch0_pixels[2][3] =  sram_rdata_a1[14*8 +: 8];
		ch0_pixels[3][0] =  sram_rdata_a0[13*8 +: 8];
		ch0_pixels[3][1] =  sram_rdata_a0[12*8 +: 8];
		ch0_pixels[3][2] =  sram_rdata_a1[13*8 +: 8];
		ch0_pixels[3][3] =  sram_rdata_a1[12*8 +: 8];
		ch1_pixels[0][0] =  sram_rdata_a2[11*8 +: 8];
		ch1_pixels[0][1] =  sram_rdata_a2[10*8 +: 8];
		ch1_pixels[0][2] =  sram_rdata_a3[11*8 +: 8];
		ch1_pixels[0][3] =  sram_rdata_a3[10*8 +: 8];
		ch1_pixels[1][0] =  sram_rdata_a2[9*8 +: 8];
		ch1_pixels[1][1] =  sram_rdata_a2[8*8 +: 8];
		ch1_pixels[1][2] =  sram_rdata_a3[9*8 +: 8];
		ch1_pixels[1][3] =  sram_rdata_a3[8*8 +: 8];
		ch1_pixels[2][0] =  sram_rdata_a0[11*8 +: 8];
		ch1_pixels[2][1] =  sram_rdata_a0[10*8 +: 8];
		ch1_pixels[2][2] =  sram_rdata_a1[11*8 +: 8];
		ch1_pixels[2][3] =  sram_rdata_a1[10*8 +: 8];
		ch1_pixels[3][0] =  sram_rdata_a0[9*8 +: 8];
		ch1_pixels[3][1] =  sram_rdata_a0[8*8 +: 8];
		ch1_pixels[3][2] =  sram_rdata_a1[9*8 +: 8];
		ch1_pixels[3][3] =  sram_rdata_a1[8*8 +: 8];
		ch2_pixels[0][0] =  sram_rdata_a2[7*8 +: 8];
		ch2_pixels[0][1] =  sram_rdata_a2[6*8 +: 8];
		ch2_pixels[0][2] =  sram_rdata_a3[7*8 +: 8];
		ch2_pixels[0][3] =  sram_rdata_a3[6*8 +: 8];
		ch2_pixels[1][0] =  sram_rdata_a2[5*8 +: 8];
		ch2_pixels[1][1] =  sram_rdata_a2[4*8 +: 8];
		ch2_pixels[1][2] =  sram_rdata_a3[5*8 +: 8];
		ch2_pixels[1][3] =  sram_rdata_a3[4*8 +: 8];
		ch2_pixels[2][0] =  sram_rdata_a0[7*8 +: 8];
		ch2_pixels[2][1] =  sram_rdata_a0[6*8 +: 8];
		ch2_pixels[2][2] =  sram_rdata_a1[7*8 +: 8];
		ch2_pixels[2][3] =  sram_rdata_a1[6*8 +: 8];
		ch2_pixels[3][0] =  sram_rdata_a0[5*8 +: 8];
		ch2_pixels[3][1] =  sram_rdata_a0[4*8 +: 8];
		ch2_pixels[3][2] =  sram_rdata_a1[5*8 +: 8];
		ch2_pixels[3][3] =  sram_rdata_a1[4*8 +: 8];
		ch3_pixels[0][0] =  sram_rdata_a2[3*8 +: 8];
		ch3_pixels[0][1] =  sram_rdata_a2[2*8 +: 8];
		ch3_pixels[0][2] =  sram_rdata_a3[3*8 +: 8];
		ch3_pixels[0][3] =  sram_rdata_a3[2*8 +: 8];
		ch3_pixels[1][0] =  sram_rdata_a2[1*8 +: 8];
		ch3_pixels[1][1] =  sram_rdata_a2[0*8 +: 8];
		ch3_pixels[1][2] =  sram_rdata_a3[1*8 +: 8];
		ch3_pixels[1][3] =  sram_rdata_a3[0*8 +: 8];
		ch3_pixels[2][0] =  sram_rdata_a0[3*8 +: 8];
		ch3_pixels[2][1] =  sram_rdata_a0[2*8 +: 8];
		ch3_pixels[2][2] =  sram_rdata_a1[3*8 +: 8];
		ch3_pixels[2][3] =  sram_rdata_a1[2*8 +: 8];
		ch3_pixels[3][0] =  sram_rdata_a0[1*8 +: 8];
		ch3_pixels[3][1] =  sram_rdata_a0[0*8 +: 8];
		ch3_pixels[3][2] =  sram_rdata_a1[1*8 +: 8];
		ch3_pixels[3][3] =  sram_rdata_a1[0*8 +: 8];
	end
	2'b11: begin
		ch0_pixels[0][0] =  sram_rdata_a3[15*8 +: 8];
		ch0_pixels[0][1] =  sram_rdata_a3[14*8 +: 8];
		ch0_pixels[0][2] =  sram_rdata_a2[15*8 +: 8];
		ch0_pixels[0][3] =  sram_rdata_a2[14*8 +: 8];
		ch0_pixels[1][0] =  sram_rdata_a3[13*8 +: 8];
		ch0_pixels[1][1] =  sram_rdata_a3[12*8 +: 8];
		ch0_pixels[1][2] =  sram_rdata_a2[13*8 +: 8];
		ch0_pixels[1][3] =  sram_rdata_a2[12*8 +: 8];
		ch0_pixels[2][0] =  sram_rdata_a1[15*8 +: 8];
		ch0_pixels[2][1] =  sram_rdata_a1[14*8 +: 8];
		ch0_pixels[2][2] =  sram_rdata_a0[15*8 +: 8];
		ch0_pixels[2][3] =  sram_rdata_a0[14*8 +: 8];
		ch0_pixels[3][0] =  sram_rdata_a1[13*8 +: 8];
		ch0_pixels[3][1] =  sram_rdata_a1[12*8 +: 8];
		ch0_pixels[3][2] =  sram_rdata_a0[13*8 +: 8];
		ch0_pixels[3][3] =  sram_rdata_a0[12*8 +: 8];
		ch1_pixels[0][0] =  sram_rdata_a3[11*8 +: 8];
		ch1_pixels[0][1] =  sram_rdata_a3[10*8 +: 8];
		ch1_pixels[0][2] =  sram_rdata_a2[11*8 +: 8];
		ch1_pixels[0][3] =  sram_rdata_a2[10*8 +: 8];
		ch1_pixels[1][0] =  sram_rdata_a3[9*8 +: 8];
		ch1_pixels[1][1] =  sram_rdata_a3[8*8 +: 8];
		ch1_pixels[1][2] =  sram_rdata_a2[9*8 +: 8];
		ch1_pixels[1][3] =  sram_rdata_a2[8*8 +: 8];
		ch1_pixels[2][0] =  sram_rdata_a1[11*8 +: 8];
		ch1_pixels[2][1] =  sram_rdata_a1[10*8 +: 8];
		ch1_pixels[2][2] =  sram_rdata_a0[11*8 +: 8];
		ch1_pixels[2][3] =  sram_rdata_a0[10*8 +: 8];
		ch1_pixels[3][0] =  sram_rdata_a1[9*8 +: 8];
		ch1_pixels[3][1] =  sram_rdata_a1[8*8 +: 8];
		ch1_pixels[3][2] =  sram_rdata_a0[9*8 +: 8];
		ch1_pixels[3][3] =  sram_rdata_a0[8*8 +: 8];
		ch2_pixels[0][0] =  sram_rdata_a3[7*8 +: 8];
		ch2_pixels[0][1] =  sram_rdata_a3[6*8 +: 8];
		ch2_pixels[0][2] =  sram_rdata_a2[7*8 +: 8];
		ch2_pixels[0][3] =  sram_rdata_a2[6*8 +: 8];
		ch2_pixels[1][0] =  sram_rdata_a3[5*8 +: 8];
		ch2_pixels[1][1] =  sram_rdata_a3[4*8 +: 8];
		ch2_pixels[1][2] =  sram_rdata_a2[5*8 +: 8];
		ch2_pixels[1][3] =  sram_rdata_a2[4*8 +: 8];
		ch2_pixels[2][0] =  sram_rdata_a1[7*8 +: 8];
		ch2_pixels[2][1] =  sram_rdata_a1[6*8 +: 8];
		ch2_pixels[2][2] =  sram_rdata_a0[7*8 +: 8];
		ch2_pixels[2][3] =  sram_rdata_a0[6*8 +: 8];
		ch2_pixels[3][0] =  sram_rdata_a1[5*8 +: 8];
		ch2_pixels[3][1] =  sram_rdata_a1[4*8 +: 8];
		ch2_pixels[3][2] =  sram_rdata_a0[5*8 +: 8];
		ch2_pixels[3][3] =  sram_rdata_a0[4*8 +: 8];
		ch3_pixels[0][0] =  sram_rdata_a3[3*8 +: 8];
		ch3_pixels[0][1] =  sram_rdata_a3[2*8 +: 8];
		ch3_pixels[0][2] =  sram_rdata_a2[3*8 +: 8];
		ch3_pixels[0][3] =  sram_rdata_a2[2*8 +: 8];
		ch3_pixels[1][0] =  sram_rdata_a3[1*8 +: 8];
		ch3_pixels[1][1] =  sram_rdata_a3[0*8 +: 8];
		ch3_pixels[1][2] =  sram_rdata_a2[1*8 +: 8];
		ch3_pixels[1][3] =  sram_rdata_a2[0*8 +: 8];
		ch3_pixels[2][0] =  sram_rdata_a1[3*8 +: 8];
		ch3_pixels[2][1] =  sram_rdata_a1[2*8 +: 8];
		ch3_pixels[2][2] =  sram_rdata_a0[3*8 +: 8];
		ch3_pixels[2][3] =  sram_rdata_a0[2*8 +: 8];
		ch3_pixels[3][0] =  sram_rdata_a1[1*8 +: 8];
		ch3_pixels[3][1] =  sram_rdata_a1[0*8 +: 8];
		ch3_pixels[3][2] =  sram_rdata_a0[1*8 +: 8];
		ch3_pixels[3][3] =  sram_rdata_a0[0*8 +: 8];
	end
endcase
end


CNN2D CNN2D_0(
.X_00(X[0][0][0]),
.W_00(W[0][0][0]),
.X_01(X[0][0][1]),
.W_01(W[0][0][1]),
.X_02(X[0][0][2]),
.W_02(W[0][0][2]),
.X_10(X[0][1][0]),
.W_10(W[0][1][0]),
.X_11(X[0][1][1]),
.W_11(W[0][1][1]),
.X_12(X[0][1][2]),
.W_12(W[0][1][2]),
.X_20(X[0][2][0]),
.W_20(W[0][2][0]),
.X_21(X[0][2][1]),
.W_21(W[0][2][1]),
.X_22(X[0][2][2]),
.W_22(W[0][2][2]),
.Y(Y[0])
);
CNN2D CNN2D_1(
.X_00(X[1][0][0]),
.W_00(W[0][0][0]),
.X_01(X[1][0][1]),
.W_01(W[0][0][1]),
.X_02(X[1][0][2]),
.W_02(W[0][0][2]),
.X_10(X[1][1][0]),
.W_10(W[0][1][0]),
.X_11(X[1][1][1]),
.W_11(W[0][1][1]),
.X_12(X[1][1][2]),
.W_12(W[0][1][2]),
.X_20(X[1][2][0]),
.W_20(W[0][2][0]),
.X_21(X[1][2][1]),
.W_21(W[0][2][1]),
.X_22(X[1][2][2]),
.W_22(W[0][2][2])
,.Y(Y[1]));
CNN2D CNN2D_2(
.X_00(X[2][0][0]),
.W_00(W[0][0][0]),
.X_01(X[2][0][1]),
.W_01(W[0][0][1]),
.X_02(X[2][0][2]),
.W_02(W[0][0][2]),
.X_10(X[2][1][0]),
.W_10(W[0][1][0]),
.X_11(X[2][1][1]),
.W_11(W[0][1][1]),
.X_12(X[2][1][2]),
.W_12(W[0][1][2]),
.X_20(X[2][2][0]),
.W_20(W[0][2][0]),
.X_21(X[2][2][1]),
.W_21(W[0][2][1]),
.X_22(X[2][2][2]),
.W_22(W[0][2][2]),
.Y(Y[2]));
CNN2D CNN2D_3(
.X_00(X[3][0][0]),
.W_00(W[0][0][0]),
.X_01(X[3][0][1]),
.W_01(W[0][0][1]),
.X_02(X[3][0][2]),
.W_02(W[0][0][2]),
.X_10(X[3][1][0]),
.W_10(W[0][1][0]),
.X_11(X[3][1][1]),
.W_11(W[0][1][1]),
.X_12(X[3][1][2]),
.W_12(W[0][1][2]),
.X_20(X[3][2][0]),
.W_20(W[0][2][0]),
.X_21(X[3][2][1]),
.W_21(W[0][2][1]),
.X_22(X[3][2][2]),
.W_22(W[0][2][2]),
.Y(Y[3]));
CNN2D CNN2D_4(
.X_00(X[4][0][0]),
.W_00(W[1][0][0]),
.X_01(X[4][0][1]),
.W_01(W[1][0][1]),
.X_02(X[4][0][2]),
.W_02(W[1][0][2]),
.X_10(X[4][1][0]),
.W_10(W[1][1][0]),
.X_11(X[4][1][1]),
.W_11(W[1][1][1]),
.X_12(X[4][1][2]),
.W_12(W[1][1][2]),
.X_20(X[4][2][0]),
.W_20(W[1][2][0]),
.X_21(X[4][2][1]),
.W_21(W[1][2][1]),
.X_22(X[4][2][2]),
.W_22(W[1][2][2])
,.Y(Y[4]));
CNN2D CNN2D_5(
.X_00(X[5][0][0]),
.W_00(W[1][0][0]),
.X_01(X[5][0][1]),
.W_01(W[1][0][1]),
.X_02(X[5][0][2]),
.W_02(W[1][0][2]),
.X_10(X[5][1][0]),
.W_10(W[1][1][0]),
.X_11(X[5][1][1]),
.W_11(W[1][1][1]),
.X_12(X[5][1][2]),
.W_12(W[1][1][2]),
.X_20(X[5][2][0]),
.W_20(W[1][2][0]),
.X_21(X[5][2][1]),
.W_21(W[1][2][1]),
.X_22(X[5][2][2]),
.W_22(W[1][2][2]),
.Y(Y[5])
);
CNN2D CNN2D_6(
.X_00(X[6][0][0]),
.W_00(W[1][0][0]),
.X_01(X[6][0][1]),
.W_01(W[1][0][1]),
.X_02(X[6][0][2]),
.W_02(W[1][0][2]),
.X_10(X[6][1][0]),
.W_10(W[1][1][0]),
.X_11(X[6][1][1]),
.W_11(W[1][1][1]),
.X_12(X[6][1][2]),
.W_12(W[1][1][2]),
.X_20(X[6][2][0]),
.W_20(W[1][2][0]),
.X_21(X[6][2][1]),
.W_21(W[1][2][1]),
.X_22(X[6][2][2]),
.W_22(W[1][2][2]),
.Y(Y[6]));
CNN2D CNN2D_7(
.X_00(X[7][0][0]),
.W_00(W[1][0][0]),
.X_01(X[7][0][1]),
.W_01(W[1][0][1]),
.X_02(X[7][0][2]),
.W_02(W[1][0][2]),
.X_10(X[7][1][0]),
.W_10(W[1][1][0]),
.X_11(X[7][1][1]),
.W_11(W[1][1][1]),
.X_12(X[7][1][2]),
.W_12(W[1][1][2]),
.X_20(X[7][2][0]),
.W_20(W[1][2][0]),
.X_21(X[7][2][1]),
.W_21(W[1][2][1]),
.X_22(X[7][2][2]),
.W_22(W[1][2][2]),
.Y(Y[7]));
CNN2D CNN2D_8(
.X_00(X[8][0][0]),
.W_00(W[2][0][0]),
.X_01(X[8][0][1]),
.W_01(W[2][0][1]),
.X_02(X[8][0][2]),
.W_02(W[2][0][2]),
.X_10(X[8][1][0]),
.W_10(W[2][1][0]),
.X_11(X[8][1][1]),
.W_11(W[2][1][1]),
.X_12(X[8][1][2]),
.W_12(W[2][1][2]),
.X_20(X[8][2][0]),
.W_20(W[2][2][0]),
.X_21(X[8][2][1]),
.W_21(W[2][2][1]),
.X_22(X[8][2][2]),
.W_22(W[2][2][2]),
.Y(Y[8]));
CNN2D CNN2D_9(
.X_00(X[9][0][0]),
.W_00(W[2][0][0]),
.X_01(X[9][0][1]),
.W_01(W[2][0][1]),
.X_02(X[9][0][2]),
.W_02(W[2][0][2]),
.X_10(X[9][1][0]),
.W_10(W[2][1][0]),
.X_11(X[9][1][1]),
.W_11(W[2][1][1]),
.X_12(X[9][1][2]),
.W_12(W[2][1][2]),
.X_20(X[9][2][0]),
.W_20(W[2][2][0]),
.X_21(X[9][2][1]),
.W_21(W[2][2][1]),
.X_22(X[9][2][2]),
.W_22(W[2][2][2]),
.Y(Y[9]));
CNN2D CNN2D_10(
.X_00(X[10][0][0]),
.W_00(W[2][0][0]),
.X_01(X[10][0][1]),
.W_01(W[2][0][1]),
.X_02(X[10][0][2]),
.W_02(W[2][0][2]),
.X_10(X[10][1][0]),
.W_10(W[2][1][0]),
.X_11(X[10][1][1]),
.W_11(W[2][1][1]),
.X_12(X[10][1][2]),
.W_12(W[2][1][2]),
.X_20(X[10][2][0]),
.W_20(W[2][2][0]),
.X_21(X[10][2][1]),
.W_21(W[2][2][1]),
.X_22(X[10][2][2]),
.W_22(W[2][2][2]),
.Y(Y[10])
);
CNN2D CNN2D_11(
.X_00(X[11][0][0]),
.W_00(W[2][0][0]),
.X_01(X[11][0][1]),
.W_01(W[2][0][1]),
.X_02(X[11][0][2]),
.W_02(W[2][0][2]),
.X_10(X[11][1][0]),
.W_10(W[2][1][0]),
.X_11(X[11][1][1]),
.W_11(W[2][1][1]),
.X_12(X[11][1][2]),
.W_12(W[2][1][2]),
.X_20(X[11][2][0]),
.W_20(W[2][2][0]),
.X_21(X[11][2][1]),
.W_21(W[2][2][1]),
.X_22(X[11][2][2]),
.W_22(W[2][2][2]),
.Y(Y[11])
);
CNN2D CNN2D_12(
.X_00(X[12][0][0]),
.W_00(W[3][0][0]),
.X_01(X[12][0][1]),
.W_01(W[3][0][1]),
.X_02(X[12][0][2]),
.W_02(W[3][0][2]),
.X_10(X[12][1][0]),
.W_10(W[3][1][0]),
.X_11(X[12][1][1]),
.W_11(W[3][1][1]),
.X_12(X[12][1][2]),
.W_12(W[3][1][2]),
.X_20(X[12][2][0]),
.W_20(W[3][2][0]),
.X_21(X[12][2][1]),
.W_21(W[3][2][1]),
.X_22(X[12][2][2]),
.W_22(W[3][2][2]),
.Y(Y[12])
);
CNN2D CNN2D_13(
.X_00(X[13][0][0]),
.W_00(W[3][0][0]),
.X_01(X[13][0][1]),
.W_01(W[3][0][1]),
.X_02(X[13][0][2]),
.W_02(W[3][0][2]),
.X_10(X[13][1][0]),
.W_10(W[3][1][0]),
.X_11(X[13][1][1]),
.W_11(W[3][1][1]),
.X_12(X[13][1][2]),
.W_12(W[3][1][2]),
.X_20(X[13][2][0]),
.W_20(W[3][2][0]),
.X_21(X[13][2][1]),
.W_21(W[3][2][1]),
.X_22(X[13][2][2]),
.W_22(W[3][2][2]),
.Y(Y[13])
);

CNN2D CNN2D_14(
.X_00(X[14][0][0]),
.W_00(W[3][0][0]),
.X_01(X[14][0][1]),
.W_01(W[3][0][1]),
.X_02(X[14][0][2]),
.W_02(W[3][0][2]),
.X_10(X[14][1][0]),
.W_10(W[3][1][0]),
.X_11(X[14][1][1]),
.W_11(W[3][1][1]),
.X_12(X[14][1][2]),
.W_12(W[3][1][2]),
.X_20(X[14][2][0]),
.W_20(W[3][2][0]),
.X_21(X[14][2][1]),
.W_21(W[3][2][1]),
.X_22(X[14][2][2]),
.W_22(W[3][2][2]),
.Y(Y[14])
);
CNN2D CNN2D_15(
.X_00(X[15][0][0]),
.W_00(W[3][0][0]),
.X_01(X[15][0][1]),
.W_01(W[3][0][1]),
.X_02(X[15][0][2]),
.W_02(W[3][0][2]),
.X_10(X[15][1][0]),
.W_10(W[3][1][0]),
.X_11(X[15][1][1]),
.W_11(W[3][1][1]),
.X_12(X[15][1][2]),
.W_12(W[3][1][2]),
.X_20(X[15][2][0]),
.W_20(W[3][2][0]),
.X_21(X[15][2][1]),
.W_21(W[3][2][1]),
.X_22(X[15][2][2]),
.W_22(W[3][2][2]),
.Y(Y[15])
);



endmodule