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
	input [1:0] read_input_cnt,
	input [1:0] read_input_cnt_p,
	input read_weight_finish,
	input read_bias_finish,
	input [10:0] read_cnt,
	input [4:0] cnn_state_ppp,
	output reg signed [7:0] feature_maps_o0,
	output reg signed [7:0] feature_maps_o1,
	output reg signed [7:0] feature_maps_o2,
	output reg signed [7:0] feature_maps_o3
);

parameter LAYER1_WIDTH = 14, LAYER1_HEIGHT = 14;
parameter IDLE = 0, UNSHUFFLE = 1, CONV1 = 2, C1_2_C2=3, CONV2 = 4, C2_2_C3 = 5,
	CONV3=6, C3_2_P=7, POOL=8, FINISH = 9;
parameter READ_WEIGHT = 0, DOCNN = 1;

reg  [7:0]  X[0:15][0:2][0:2];
reg  [3:0]  W[0:15][0:2][0:2];
wire signed [15:0] Y[0:15];	
reg [1:0] raed_type;
reg x_r2, y_r2;
reg [7:0] ch0_pixels[0:3][0:3];
reg [7:0] ch1_pixels[0:3][0:3];
reg [7:0] ch2_pixels[0:3][0:3];
reg [7:0] ch3_pixels[0:3][0:3];
reg signed [15:0] conv_out[0:15];
reg signed [15:0] feature_maps_o[0:15];
reg signed [15:0] temp_conv_out[0:15];
reg load_weight_finish;
reg load_bias_finish;
reg signed [3:0] bias[0:3];
integer i, j, k, l;

always @(posedge clk) begin
	if (!rst_n) begin
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
	else if (state == CONV2) begin
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
	else if (state == CONV3) begin
		if (cnn_state == DOCNN) begin
			load_weight_finish <= 0;
		end
		else if (read_cnt % 16 == 0 && read_weight_finish) begin
			load_weight_finish <= 1;
		end
		else begin
			load_weight_finish <= load_weight_finish;
		end
	end
end

always @(posedge clk) begin
	if (!rst_n) begin
		load_bias_finish <= 0;
	end
	else if (state == CONV1 || state == CONV2) begin
		if (state == UNSHUFFLE) begin
			load_bias_finish <= 0;
		end
		else if (state == CONV1) begin
			if (cnn_state == DOCNN) begin
				load_bias_finish <= 0;
			end
			else if (read_cnt / 16 == 3 && read_bias_finish) begin
				load_bias_finish <= 1;
			end
			else begin
				load_bias_finish <= load_bias_finish;
			end
		end
	end
end

always @(posedge clk) begin
	if (!rst_n) begin
		bias[0] <= 0;
	end
	else if (state == CONV1 || state == CONV2) begin
		bias[0] <= sram_rdata_bias;
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
	else if ((state == CONV1 || state == CONV2) && !load_weight_finish) begin
		for (i=1; i<= 3; i=i+1) begin
			if (read_cnt % 4 == i) begin
				W[i-1][0][0] <= sram_rdata_weight[35:32];
				W[i-1][0][1] <= sram_rdata_weight[31:28];
				W[i-1][0][2] <= sram_rdata_weight[27:24];
				W[i-1][1][0] <= sram_rdata_weight[23:20];
				W[i-1][1][1] <= sram_rdata_weight[19:16];
				W[i-1][1][2] <= sram_rdata_weight[15:12];
				W[i-1][2][0] <= sram_rdata_weight[11:8];
				W[i-1][2][1] <= sram_rdata_weight[7:4];
				W[i-1][2][2] <= sram_rdata_weight[3:0];				
			end
		end
		if (read_cnt % 4 == 0 && read_weight_finish) begin
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
	else if ((state == CONV3) && !load_weight_finish) begin
		if (cnn_state == READ_WEIGHT) begin
			for (i=1; i<= 15; i=i+1) begin
				if (read_cnt % 16 == i) begin
					W[i-1][0][0] <= sram_rdata_weight[35:32];
					W[i-1][0][1] <= sram_rdata_weight[31:28];
					W[i-1][0][2] <= sram_rdata_weight[27:24];
					W[i-1][1][0] <= sram_rdata_weight[23:20];
					W[i-1][1][1] <= sram_rdata_weight[19:16];
					W[i-1][1][2] <= sram_rdata_weight[15:12];
					W[i-1][2][0] <= sram_rdata_weight[11:8];
					W[i-1][2][1] <= sram_rdata_weight[7:4];
					W[i-1][2][2] <= sram_rdata_weight[3:0];				
				end
			end
			if (read_cnt % 16 == 0 && read_weight_finish) begin
				W[15][0][0] <= sram_rdata_weight[35:32];
				W[15][0][1] <= sram_rdata_weight[31:28];
				W[15][0][2] <= sram_rdata_weight[27:24];
				W[15][1][0] <= sram_rdata_weight[23:20];
				W[15][1][1] <= sram_rdata_weight[19:16];
				W[15][1][2] <= sram_rdata_weight[15:12];
				W[15][2][0] <= sram_rdata_weight[11:8];
				W[15][2][1] <= sram_rdata_weight[7:4];
				W[15][2][2] <= sram_rdata_weight[3:0];
			end
		end
		else if (cnn_state_ppp == DOCNN)begin
			for (i=0; i<12; i=i+1) begin
				W[i][0][0] <= W[i+4][0][0];
				W[i][0][1] <= W[i+4][0][1];
				W[i][0][2] <= W[i+4][0][2];
				W[i][1][0] <= W[i+4][1][0];
				W[i][1][1] <= W[i+4][1][1];
				W[i][1][2] <= W[i+4][1][2];
				W[i][2][0] <= W[i+4][2][0];
				W[i][2][1] <= W[i+4][2][1];
				W[i][2][2] <= W[i+4][2][2];				
			end
			for (i=0; i<4; i=i+1) begin
				
				W[i+12][0][0] <= W[i][0][0];
				W[i+12][0][1] <= W[i][0][1];
				W[i+12][0][2] <= W[i][0][2];
				W[i+12][1][0] <= W[i][1][0];
				W[i+12][1][1] <= W[i][1][1];
				W[i+12][1][2] <= W[i][1][2];
				W[i+12][2][0] <= W[i][2][0];
				W[i+12][2][1] <= W[i][2][1];
				W[i+12][2][2] <= W[i][2][2];			
			end

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


always @* begin
	if (state == CONV1) begin
		i = 0;
		temp_conv_out[i/4] =   Y[0+i] + Y[4+i] + Y[8+i]  + Y[12+i] + (bias[i / 16] << (11-4)) + 2 ** 6;
		temp_conv_out[i/4+1] = Y[1+i] + Y[5+i] + Y[9+i]  + Y[13+i] + (bias[i / 16] << (11-4)) + 2 ** 6;
		temp_conv_out[i/4+2] = Y[2+i] + Y[6+i] + Y[10+i] + Y[14+i] + (bias[i / 16] << (11-4)) + 2 ** 6;
		temp_conv_out[i/4+3] = Y[3+i] + Y[7+i] + Y[11+i] + Y[15+i] + (bias[i / 16] << (11-4)) + 2 ** 6;
		for (i=0; i<4 ;i=i+1) begin
			conv_out[i] = temp_conv_out[i] >>> 7;
		end
	end
	else if (state == CONV2) begin
		i = 0;
		temp_conv_out[i/4] =   Y[0+i] + Y[4+i] + Y[8+i]  + Y[12+i] + (bias[i / 16] << (3)) + 2 ** 4;
		temp_conv_out[i/4+1] = Y[1+i] + Y[5+i] + Y[9+i]  + Y[13+i] + (bias[i / 16] << (3)) + 2 ** 4;
		temp_conv_out[i/4+2] = Y[2+i] + Y[6+i] + Y[10+i] + Y[14+i] + (bias[i / 16] << (3)) + 2 ** 4;
		temp_conv_out[i/4+3] = Y[3+i] + Y[7+i] + Y[11+i] + Y[15+i] + (bias[i / 16] << (3)) + 2 ** 4;
		for (i=0; i<4 ;i=i+1) begin
			conv_out[i] = temp_conv_out[i] >>> 5;
		end
	end
	else begin
		// for(i=0; i<=48; i=i+16) begin
		// 	temp_conv_out[i/4] =   Y[0+i] + Y[4+i] + Y[8+i]  + Y[12+i] + (bias[i / 16] << (3)) + 2 ** 4;
		// 	temp_conv_out[i/4+1] = Y[1+i] + Y[5+i] + Y[9+i]  + Y[13+i] + (bias[i / 16] << (3)) + 2 ** 4;
		// 	temp_conv_out[i/4+2] = Y[2+i] + Y[6+i] + Y[10+i] + Y[14+i] + (bias[i / 16] << (3)) + 2 ** 4;
		// 	temp_conv_out[i/4+3] = Y[3+i] + Y[7+i] + Y[11+i] + Y[15+i] + (bias[i / 16] << (3)) + 2 ** 4;
		// end
		// for (i=0; i<16 ;i=i+1) begin
		// 	conv_out[i] = temp_conv_out[i] >>> 6;
		// end
	end

	for (i=0; i<4; i=i+1) begin
		if (conv_out[i] >= $signed(127))
			feature_maps_o[i] = 127;
		else if (conv_out[i] < $signed(0))
				feature_maps_o[i] = 0;
		else
			feature_maps_o[i] = conv_out[i][7:0];
	end
end

always@* begin
	feature_maps_o0 = feature_maps_o[0];
	feature_maps_o1 = feature_maps_o[1];
	feature_maps_o2 = feature_maps_o[2];
	feature_maps_o3 = feature_maps_o[3];
end

always @(posedge clk) begin
	if (state == CONV1 && cnn_state == DOCNN) begin
		// $display("(%d, %d)", y_cnt_pp, x_cnt_pp);
		// $display("feature_maps");
		// $display("%d %d %d %d", feature_maps_o0, feature_maps_o1, feature_maps_o2, feature_maps_o3);
		// $display("%d %d %d %d", feature_maps_o4, feature_maps_o5, feature_maps_o6, feature_maps_o7);
		// $display("%d %d %d %d", feature_maps_o8, feature_maps_o9, feature_maps_o10, feature_maps_o11);
		// $display("%d %d %d %d", feature_maps_o12, feature_maps_o13, feature_maps_o14, feature_maps_o15);
	end
end

reg [127:0] sram_rdata_0;
reg [127:0] sram_rdata_1;
reg [127:0] sram_rdata_2;
reg [127:0] sram_rdata_3;

always @*
	if (state == CONV2) begin
		sram_rdata_0 = sram_rdata_b0;
		sram_rdata_1 = sram_rdata_b1;
		sram_rdata_2 = sram_rdata_b2;
		sram_rdata_3 = sram_rdata_b3;

	end
	else begin
		sram_rdata_0 = sram_rdata_a0;
		sram_rdata_1 = sram_rdata_a1;
		sram_rdata_2 = sram_rdata_a2;
		sram_rdata_3 = sram_rdata_a3;
		
	end
always @* begin
	case({y_r2, x_r2})
		2'b00: begin
			ch0_pixels[0][0] =  sram_rdata_0[15*8 +: 8];
			ch0_pixels[0][1] =  sram_rdata_0[14*8 +: 8];
			ch0_pixels[0][2] =  sram_rdata_1[15*8 +: 8];
			ch0_pixels[0][3] =  sram_rdata_1[14*8 +: 8];
			ch0_pixels[1][0] =  sram_rdata_0[13*8 +: 8];
			ch0_pixels[1][1] =  sram_rdata_0[12*8 +: 8];
			ch0_pixels[1][2] =  sram_rdata_1[13*8 +: 8];
			ch0_pixels[1][3] =  sram_rdata_1[12*8 +: 8];
			ch0_pixels[2][0] =  sram_rdata_2[15*8 +: 8];
			ch0_pixels[2][1] =  sram_rdata_2[14*8 +: 8];
			ch0_pixels[2][2] =  sram_rdata_3[15*8 +: 8];
			ch0_pixels[2][3] =  sram_rdata_3[14*8 +: 8];
			ch0_pixels[3][0] =  sram_rdata_2[13*8 +: 8];
			ch0_pixels[3][1] =  sram_rdata_2[12*8 +: 8];
			ch0_pixels[3][2] =  sram_rdata_3[13*8 +: 8];
			ch0_pixels[3][3] =  sram_rdata_3[12*8 +: 8];
			ch1_pixels[0][0] =  sram_rdata_0[11*8 +: 8];
			ch1_pixels[0][1] =  sram_rdata_0[10*8 +: 8];
			ch1_pixels[0][2] =  sram_rdata_1[11*8 +: 8];
			ch1_pixels[0][3] =  sram_rdata_1[10*8 +: 8];
			ch1_pixels[1][0] =  sram_rdata_0[9*8 +: 8];
			ch1_pixels[1][1] =  sram_rdata_0[8*8 +: 8];
			ch1_pixels[1][2] =  sram_rdata_1[9*8 +: 8];
			ch1_pixels[1][3] =  sram_rdata_1[8*8 +: 8];
			ch1_pixels[2][0] =  sram_rdata_2[11*8 +: 8];
			ch1_pixels[2][1] =  sram_rdata_2[10*8 +: 8];
			ch1_pixels[2][2] =  sram_rdata_3[11*8 +: 8];
			ch1_pixels[2][3] =  sram_rdata_3[10*8 +: 8];
			ch1_pixels[3][0] =  sram_rdata_2[9*8 +: 8];
			ch1_pixels[3][1] =  sram_rdata_2[8*8 +: 8];
			ch1_pixels[3][2] =  sram_rdata_3[9*8 +: 8];
			ch1_pixels[3][3] =  sram_rdata_3[8*8 +: 8];
			ch2_pixels[0][0] =  sram_rdata_0[7*8 +: 8];
			ch2_pixels[0][1] =  sram_rdata_0[6*8 +: 8];
			ch2_pixels[0][2] =  sram_rdata_1[7*8 +: 8];
			ch2_pixels[0][3] =  sram_rdata_1[6*8 +: 8];
			ch2_pixels[1][0] =  sram_rdata_0[5*8 +: 8];
			ch2_pixels[1][1] =  sram_rdata_0[4*8 +: 8];
			ch2_pixels[1][2] =  sram_rdata_1[5*8 +: 8];
			ch2_pixels[1][3] =  sram_rdata_1[4*8 +: 8];
			ch2_pixels[2][0] =  sram_rdata_2[7*8 +: 8];
			ch2_pixels[2][1] =  sram_rdata_2[6*8 +: 8];
			ch2_pixels[2][2] =  sram_rdata_3[7*8 +: 8];
			ch2_pixels[2][3] =  sram_rdata_3[6*8 +: 8];
			ch2_pixels[3][0] =  sram_rdata_2[5*8 +: 8];
			ch2_pixels[3][1] =  sram_rdata_2[4*8 +: 8];
			ch2_pixels[3][2] =  sram_rdata_3[5*8 +: 8];
			ch2_pixels[3][3] =  sram_rdata_3[4*8 +: 8];
			ch3_pixels[0][0] =  sram_rdata_0[3*8 +: 8];
			ch3_pixels[0][1] =  sram_rdata_0[2*8 +: 8];
			ch3_pixels[0][2] =  sram_rdata_1[3*8 +: 8];
			ch3_pixels[0][3] =  sram_rdata_1[2*8 +: 8];
			ch3_pixels[1][0] =  sram_rdata_0[1*8 +: 8];
			ch3_pixels[1][1] =  sram_rdata_0[0*8 +: 8];
			ch3_pixels[1][2] =  sram_rdata_1[1*8 +: 8];
			ch3_pixels[1][3] =  sram_rdata_1[0*8 +: 8];
			ch3_pixels[2][0] =  sram_rdata_2[3*8 +: 8];
			ch3_pixels[2][1] =  sram_rdata_2[2*8 +: 8];
			ch3_pixels[2][2] =  sram_rdata_3[3*8 +: 8];
			ch3_pixels[2][3] =  sram_rdata_3[2*8 +: 8];
			ch3_pixels[3][0] =  sram_rdata_2[1*8 +: 8];
			ch3_pixels[3][1] =  sram_rdata_2[0*8 +: 8];
			ch3_pixels[3][2] =  sram_rdata_3[1*8 +: 8];
			ch3_pixels[3][3] =  sram_rdata_3[0*8 +: 8];
		end
		2'b01: begin
			ch0_pixels[0][0] =  sram_rdata_1[15*8 +: 8];
			ch0_pixels[0][1] =  sram_rdata_1[14*8 +: 8];
			ch0_pixels[0][2] =  sram_rdata_0[15*8 +: 8];
			ch0_pixels[0][3] =  sram_rdata_0[14*8 +: 8];
			ch0_pixels[1][0] =  sram_rdata_1[13*8 +: 8];
			ch0_pixels[1][1] =  sram_rdata_1[12*8 +: 8];
			ch0_pixels[1][2] =  sram_rdata_0[13*8 +: 8];
			ch0_pixels[1][3] =  sram_rdata_0[12*8 +: 8];
			ch0_pixels[2][0] =  sram_rdata_3[15*8 +: 8];
			ch0_pixels[2][1] =  sram_rdata_3[14*8 +: 8];
			ch0_pixels[2][2] =  sram_rdata_2[15*8 +: 8];
			ch0_pixels[2][3] =  sram_rdata_2[14*8 +: 8];
			ch0_pixels[3][0] =  sram_rdata_3[13*8 +: 8];
			ch0_pixels[3][1] =  sram_rdata_3[12*8 +: 8];
			ch0_pixels[3][2] =  sram_rdata_2[13*8 +: 8];
			ch0_pixels[3][3] =  sram_rdata_2[12*8 +: 8];
			ch1_pixels[0][0] =  sram_rdata_1[11*8 +: 8];
			ch1_pixels[0][1] =  sram_rdata_1[10*8 +: 8];
			ch1_pixels[0][2] =  sram_rdata_0[11*8 +: 8];
			ch1_pixels[0][3] =  sram_rdata_0[10*8 +: 8];
			ch1_pixels[1][0] =  sram_rdata_1[9*8 +: 8];
			ch1_pixels[1][1] =  sram_rdata_1[8*8 +: 8];
			ch1_pixels[1][2] =  sram_rdata_0[9*8 +: 8];
			ch1_pixels[1][3] =  sram_rdata_0[8*8 +: 8];
			ch1_pixels[2][0] =  sram_rdata_3[11*8 +: 8];
			ch1_pixels[2][1] =  sram_rdata_3[10*8 +: 8];
			ch1_pixels[2][2] =  sram_rdata_2[11*8 +: 8];
			ch1_pixels[2][3] =  sram_rdata_2[10*8 +: 8];
			ch1_pixels[3][0] =  sram_rdata_3[9*8 +: 8];
			ch1_pixels[3][1] =  sram_rdata_3[8*8 +: 8];
			ch1_pixels[3][2] =  sram_rdata_2[9*8 +: 8];
			ch1_pixels[3][3] =  sram_rdata_2[8*8 +: 8];
			ch2_pixels[0][0] =  sram_rdata_1[7*8 +: 8];
			ch2_pixels[0][1] =  sram_rdata_1[6*8 +: 8];
			ch2_pixels[0][2] =  sram_rdata_0[7*8 +: 8];
			ch2_pixels[0][3] =  sram_rdata_0[6*8 +: 8];
			ch2_pixels[1][0] =  sram_rdata_1[5*8 +: 8];
			ch2_pixels[1][1] =  sram_rdata_1[4*8 +: 8];
			ch2_pixels[1][2] =  sram_rdata_0[5*8 +: 8];
			ch2_pixels[1][3] =  sram_rdata_0[4*8 +: 8];
			ch2_pixels[2][0] =  sram_rdata_3[7*8 +: 8];
			ch2_pixels[2][1] =  sram_rdata_3[6*8 +: 8];
			ch2_pixels[2][2] =  sram_rdata_2[7*8 +: 8];
			ch2_pixels[2][3] =  sram_rdata_2[6*8 +: 8];
			ch2_pixels[3][0] =  sram_rdata_3[5*8 +: 8];
			ch2_pixels[3][1] =  sram_rdata_3[4*8 +: 8];
			ch2_pixels[3][2] =  sram_rdata_2[5*8 +: 8];
			ch2_pixels[3][3] =  sram_rdata_2[4*8 +: 8];
			ch3_pixels[0][0] =  sram_rdata_1[3*8 +: 8];
			ch3_pixels[0][1] =  sram_rdata_1[2*8 +: 8];
			ch3_pixels[0][2] =  sram_rdata_0[3*8 +: 8];
			ch3_pixels[0][3] =  sram_rdata_0[2*8 +: 8];
			ch3_pixels[1][0] =  sram_rdata_1[1*8 +: 8];
			ch3_pixels[1][1] =  sram_rdata_1[0*8 +: 8];
			ch3_pixels[1][2] =  sram_rdata_0[1*8 +: 8];
			ch3_pixels[1][3] =  sram_rdata_0[0*8 +: 8];
			ch3_pixels[2][0] =  sram_rdata_3[3*8 +: 8];
			ch3_pixels[2][1] =  sram_rdata_3[2*8 +: 8];
			ch3_pixels[2][2] =  sram_rdata_2[3*8 +: 8];
			ch3_pixels[2][3] =  sram_rdata_2[2*8 +: 8];
			ch3_pixels[3][0] =  sram_rdata_3[1*8 +: 8];
			ch3_pixels[3][1] =  sram_rdata_3[0*8 +: 8];
			ch3_pixels[3][2] =  sram_rdata_2[1*8 +: 8];
			ch3_pixels[3][3] =  sram_rdata_2[0*8 +: 8];
		end
		2'b10: begin
			ch0_pixels[0][0] =  sram_rdata_2[15*8 +: 8];
			ch0_pixels[0][1] =  sram_rdata_2[14*8 +: 8];
			ch0_pixels[0][2] =  sram_rdata_3[15*8 +: 8];
			ch0_pixels[0][3] =  sram_rdata_3[14*8 +: 8];
			ch0_pixels[1][0] =  sram_rdata_2[13*8 +: 8];
			ch0_pixels[1][1] =  sram_rdata_2[12*8 +: 8];
			ch0_pixels[1][2] =  sram_rdata_3[13*8 +: 8];
			ch0_pixels[1][3] =  sram_rdata_3[12*8 +: 8];
			ch0_pixels[2][0] =  sram_rdata_0[15*8 +: 8];
			ch0_pixels[2][1] =  sram_rdata_0[14*8 +: 8];
			ch0_pixels[2][2] =  sram_rdata_1[15*8 +: 8];
			ch0_pixels[2][3] =  sram_rdata_1[14*8 +: 8];
			ch0_pixels[3][0] =  sram_rdata_0[13*8 +: 8];
			ch0_pixels[3][1] =  sram_rdata_0[12*8 +: 8];
			ch0_pixels[3][2] =  sram_rdata_1[13*8 +: 8];
			ch0_pixels[3][3] =  sram_rdata_1[12*8 +: 8];
			ch1_pixels[0][0] =  sram_rdata_2[11*8 +: 8];
			ch1_pixels[0][1] =  sram_rdata_2[10*8 +: 8];
			ch1_pixels[0][2] =  sram_rdata_3[11*8 +: 8];
			ch1_pixels[0][3] =  sram_rdata_3[10*8 +: 8];
			ch1_pixels[1][0] =  sram_rdata_2[9*8 +: 8];
			ch1_pixels[1][1] =  sram_rdata_2[8*8 +: 8];
			ch1_pixels[1][2] =  sram_rdata_3[9*8 +: 8];
			ch1_pixels[1][3] =  sram_rdata_3[8*8 +: 8];
			ch1_pixels[2][0] =  sram_rdata_0[11*8 +: 8];
			ch1_pixels[2][1] =  sram_rdata_0[10*8 +: 8];
			ch1_pixels[2][2] =  sram_rdata_1[11*8 +: 8];
			ch1_pixels[2][3] =  sram_rdata_1[10*8 +: 8];
			ch1_pixels[3][0] =  sram_rdata_0[9*8 +: 8];
			ch1_pixels[3][1] =  sram_rdata_0[8*8 +: 8];
			ch1_pixels[3][2] =  sram_rdata_1[9*8 +: 8];
			ch1_pixels[3][3] =  sram_rdata_1[8*8 +: 8];
			ch2_pixels[0][0] =  sram_rdata_2[7*8 +: 8];
			ch2_pixels[0][1] =  sram_rdata_2[6*8 +: 8];
			ch2_pixels[0][2] =  sram_rdata_3[7*8 +: 8];
			ch2_pixels[0][3] =  sram_rdata_3[6*8 +: 8];
			ch2_pixels[1][0] =  sram_rdata_2[5*8 +: 8];
			ch2_pixels[1][1] =  sram_rdata_2[4*8 +: 8];
			ch2_pixels[1][2] =  sram_rdata_3[5*8 +: 8];
			ch2_pixels[1][3] =  sram_rdata_3[4*8 +: 8];
			ch2_pixels[2][0] =  sram_rdata_0[7*8 +: 8];
			ch2_pixels[2][1] =  sram_rdata_0[6*8 +: 8];
			ch2_pixels[2][2] =  sram_rdata_1[7*8 +: 8];
			ch2_pixels[2][3] =  sram_rdata_1[6*8 +: 8];
			ch2_pixels[3][0] =  sram_rdata_0[5*8 +: 8];
			ch2_pixels[3][1] =  sram_rdata_0[4*8 +: 8];
			ch2_pixels[3][2] =  sram_rdata_1[5*8 +: 8];
			ch2_pixels[3][3] =  sram_rdata_1[4*8 +: 8];
			ch3_pixels[0][0] =  sram_rdata_2[3*8 +: 8];
			ch3_pixels[0][1] =  sram_rdata_2[2*8 +: 8];
			ch3_pixels[0][2] =  sram_rdata_3[3*8 +: 8];
			ch3_pixels[0][3] =  sram_rdata_3[2*8 +: 8];
			ch3_pixels[1][0] =  sram_rdata_2[1*8 +: 8];
			ch3_pixels[1][1] =  sram_rdata_2[0*8 +: 8];
			ch3_pixels[1][2] =  sram_rdata_3[1*8 +: 8];
			ch3_pixels[1][3] =  sram_rdata_3[0*8 +: 8];
			ch3_pixels[2][0] =  sram_rdata_0[3*8 +: 8];
			ch3_pixels[2][1] =  sram_rdata_0[2*8 +: 8];
			ch3_pixels[2][2] =  sram_rdata_1[3*8 +: 8];
			ch3_pixels[2][3] =  sram_rdata_1[2*8 +: 8];
			ch3_pixels[3][0] =  sram_rdata_0[1*8 +: 8];
			ch3_pixels[3][1] =  sram_rdata_0[0*8 +: 8];
			ch3_pixels[3][2] =  sram_rdata_1[1*8 +: 8];
			ch3_pixels[3][3] =  sram_rdata_1[0*8 +: 8];
		end
		2'b11: begin
			ch0_pixels[0][0] =  sram_rdata_3[15*8 +: 8];
			ch0_pixels[0][1] =  sram_rdata_3[14*8 +: 8];
			ch0_pixels[0][2] =  sram_rdata_2[15*8 +: 8];
			ch0_pixels[0][3] =  sram_rdata_2[14*8 +: 8];
			ch0_pixels[1][0] =  sram_rdata_3[13*8 +: 8];
			ch0_pixels[1][1] =  sram_rdata_3[12*8 +: 8];
			ch0_pixels[1][2] =  sram_rdata_2[13*8 +: 8];
			ch0_pixels[1][3] =  sram_rdata_2[12*8 +: 8];
			ch0_pixels[2][0] =  sram_rdata_1[15*8 +: 8];
			ch0_pixels[2][1] =  sram_rdata_1[14*8 +: 8];
			ch0_pixels[2][2] =  sram_rdata_0[15*8 +: 8];
			ch0_pixels[2][3] =  sram_rdata_0[14*8 +: 8];
			ch0_pixels[3][0] =  sram_rdata_1[13*8 +: 8];
			ch0_pixels[3][1] =  sram_rdata_1[12*8 +: 8];
			ch0_pixels[3][2] =  sram_rdata_0[13*8 +: 8];
			ch0_pixels[3][3] =  sram_rdata_0[12*8 +: 8];
			ch1_pixels[0][0] =  sram_rdata_3[11*8 +: 8];
			ch1_pixels[0][1] =  sram_rdata_3[10*8 +: 8];
			ch1_pixels[0][2] =  sram_rdata_2[11*8 +: 8];
			ch1_pixels[0][3] =  sram_rdata_2[10*8 +: 8];
			ch1_pixels[1][0] =  sram_rdata_3[9*8 +: 8];
			ch1_pixels[1][1] =  sram_rdata_3[8*8 +: 8];
			ch1_pixels[1][2] =  sram_rdata_2[9*8 +: 8];
			ch1_pixels[1][3] =  sram_rdata_2[8*8 +: 8];
			ch1_pixels[2][0] =  sram_rdata_1[11*8 +: 8];
			ch1_pixels[2][1] =  sram_rdata_1[10*8 +: 8];
			ch1_pixels[2][2] =  sram_rdata_0[11*8 +: 8];
			ch1_pixels[2][3] =  sram_rdata_0[10*8 +: 8];
			ch1_pixels[3][0] =  sram_rdata_1[9*8 +: 8];
			ch1_pixels[3][1] =  sram_rdata_1[8*8 +: 8];
			ch1_pixels[3][2] =  sram_rdata_0[9*8 +: 8];
			ch1_pixels[3][3] =  sram_rdata_0[8*8 +: 8];
			ch2_pixels[0][0] =  sram_rdata_3[7*8 +: 8];
			ch2_pixels[0][1] =  sram_rdata_3[6*8 +: 8];
			ch2_pixels[0][2] =  sram_rdata_2[7*8 +: 8];
			ch2_pixels[0][3] =  sram_rdata_2[6*8 +: 8];
			ch2_pixels[1][0] =  sram_rdata_3[5*8 +: 8];
			ch2_pixels[1][1] =  sram_rdata_3[4*8 +: 8];
			ch2_pixels[1][2] =  sram_rdata_2[5*8 +: 8];
			ch2_pixels[1][3] =  sram_rdata_2[4*8 +: 8];
			ch2_pixels[2][0] =  sram_rdata_1[7*8 +: 8];
			ch2_pixels[2][1] =  sram_rdata_1[6*8 +: 8];
			ch2_pixels[2][2] =  sram_rdata_0[7*8 +: 8];
			ch2_pixels[2][3] =  sram_rdata_0[6*8 +: 8];
			ch2_pixels[3][0] =  sram_rdata_1[5*8 +: 8];
			ch2_pixels[3][1] =  sram_rdata_1[4*8 +: 8];
			ch2_pixels[3][2] =  sram_rdata_0[5*8 +: 8];
			ch2_pixels[3][3] =  sram_rdata_0[4*8 +: 8];
			ch3_pixels[0][0] =  sram_rdata_3[3*8 +: 8];
			ch3_pixels[0][1] =  sram_rdata_3[2*8 +: 8];
			ch3_pixels[0][2] =  sram_rdata_2[3*8 +: 8];
			ch3_pixels[0][3] =  sram_rdata_2[2*8 +: 8];
			ch3_pixels[1][0] =  sram_rdata_3[1*8 +: 8];
			ch3_pixels[1][1] =  sram_rdata_3[0*8 +: 8];
			ch3_pixels[1][2] =  sram_rdata_2[1*8 +: 8];
			ch3_pixels[1][3] =  sram_rdata_2[0*8 +: 8];
			ch3_pixels[2][0] =  sram_rdata_1[3*8 +: 8];
			ch3_pixels[2][1] =  sram_rdata_1[2*8 +: 8];
			ch3_pixels[2][2] =  sram_rdata_0[3*8 +: 8];
			ch3_pixels[2][3] =  sram_rdata_0[2*8 +: 8];
			ch3_pixels[3][0] =  sram_rdata_1[1*8 +: 8];
			ch3_pixels[3][1] =  sram_rdata_1[0*8 +: 8];
			ch3_pixels[3][2] =  sram_rdata_0[1*8 +: 8];
			ch3_pixels[3][3] =  sram_rdata_0[0*8 +: 8];
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

// /////////No 1

// CNN2D CNN2D_16(
// .X_00(X[0][0][0]),
// .W_00(W[4][0][0]),
// .X_01(X[0][0][1]),
// .W_01(W[4][0][1]),
// .X_02(X[0][0][2]),
// .W_02(W[4][0][2]),
// .X_10(X[0][1][0]),
// .W_10(W[4][1][0]),
// .X_11(X[0][1][1]),
// .W_11(W[4][1][1]),
// .X_12(X[0][1][2]),
// .W_12(W[4][1][2]),
// .X_20(X[0][2][0]),
// .W_20(W[4][2][0]),
// .X_21(X[0][2][1]),
// .W_21(W[4][2][1]),
// .X_22(X[0][2][2]),
// .W_22(W[4][2][2]),
// .Y(Y[16])
// );
// CNN2D CNN2D_17(
// .X_00(X[1][0][0]),
// .W_00(W[4][0][0]),
// .X_01(X[1][0][1]),
// .W_01(W[4][0][1]),
// .X_02(X[1][0][2]),
// .W_02(W[4][0][2]),
// .X_10(X[1][1][0]),
// .W_10(W[4][1][0]),
// .X_11(X[1][1][1]),
// .W_11(W[4][1][1]),
// .X_12(X[1][1][2]),
// .W_12(W[4][1][2]),
// .X_20(X[1][2][0]),
// .W_20(W[4][2][0]),
// .X_21(X[1][2][1]),
// .W_21(W[4][2][1]),
// .X_22(X[1][2][2]),
// .W_22(W[4][2][2])
// ,.Y(Y[17]));
// CNN2D CNN2D_18(
// .X_00(X[2][0][0]),
// .W_00(W[4][0][0]),
// .X_01(X[2][0][1]),
// .W_01(W[4][0][1]),
// .X_02(X[2][0][2]),
// .W_02(W[4][0][2]),
// .X_10(X[2][1][0]),
// .W_10(W[4][1][0]),
// .X_11(X[2][1][1]),
// .W_11(W[4][1][1]),
// .X_12(X[2][1][2]),
// .W_12(W[4][1][2]),
// .X_20(X[2][2][0]),
// .W_20(W[4][2][0]),
// .X_21(X[2][2][1]),
// .W_21(W[4][2][1]),
// .X_22(X[2][2][2]),
// .W_22(W[4][2][2]),
// .Y(Y[18]));
// CNN2D CNN2D_19(
// .X_00(X[3][0][0]),
// .W_00(W[4][0][0]),
// .X_01(X[3][0][1]),
// .W_01(W[4][0][1]),
// .X_02(X[3][0][2]),
// .W_02(W[4][0][2]),
// .X_10(X[3][1][0]),
// .W_10(W[4][1][0]),
// .X_11(X[3][1][1]),
// .W_11(W[4][1][1]),
// .X_12(X[3][1][2]),
// .W_12(W[4][1][2]),
// .X_20(X[3][2][0]),
// .W_20(W[4][2][0]),
// .X_21(X[3][2][1]),
// .W_21(W[4][2][1]),
// .X_22(X[3][2][2]),
// .W_22(W[4][2][2]),
// .Y(Y[19]));
// CNN2D CNN2D_20(
// .X_00(X[4][0][0]),
// .W_00(W[5][0][0]),
// .X_01(X[4][0][1]),
// .W_01(W[5][0][1]),
// .X_02(X[4][0][2]),
// .W_02(W[5][0][2]),
// .X_10(X[4][1][0]),
// .W_10(W[5][1][0]),
// .X_11(X[4][1][1]),
// .W_11(W[5][1][1]),
// .X_12(X[4][1][2]),
// .W_12(W[5][1][2]),
// .X_20(X[4][2][0]),
// .W_20(W[5][2][0]),
// .X_21(X[4][2][1]),
// .W_21(W[5][2][1]),
// .X_22(X[4][2][2]),
// .W_22(W[5][2][2])
// ,.Y(Y[20]));
// CNN2D CNN2D_21(
// .X_00(X[5][0][0]),
// .W_00(W[5][0][0]),
// .X_01(X[5][0][1]),
// .W_01(W[5][0][1]),
// .X_02(X[5][0][2]),
// .W_02(W[5][0][2]),
// .X_10(X[5][1][0]),
// .W_10(W[5][1][0]),
// .X_11(X[5][1][1]),
// .W_11(W[5][1][1]),
// .X_12(X[5][1][2]),
// .W_12(W[5][1][2]),
// .X_20(X[5][2][0]),
// .W_20(W[5][2][0]),
// .X_21(X[5][2][1]),
// .W_21(W[5][2][1]),
// .X_22(X[5][2][2]),
// .W_22(W[5][2][2]),
// .Y(Y[21])
// );
// CNN2D CNN2D_22(
// .X_00(X[6][0][0]),
// .W_00(W[5][0][0]),
// .X_01(X[6][0][1]),
// .W_01(W[5][0][1]),
// .X_02(X[6][0][2]),
// .W_02(W[5][0][2]),
// .X_10(X[6][1][0]),
// .W_10(W[5][1][0]),
// .X_11(X[6][1][1]),
// .W_11(W[5][1][1]),
// .X_12(X[6][1][2]),
// .W_12(W[5][1][2]),
// .X_20(X[6][2][0]),
// .W_20(W[5][2][0]),
// .X_21(X[6][2][1]),
// .W_21(W[5][2][1]),
// .X_22(X[6][2][2]),
// .W_22(W[5][2][2]),
// .Y(Y[22]));
// CNN2D CNN2D_23(
// .X_00(X[7][0][0]),
// .W_00(W[5][0][0]),
// .X_01(X[7][0][1]),
// .W_01(W[5][0][1]),
// .X_02(X[7][0][2]),
// .W_02(W[5][0][2]),
// .X_10(X[7][1][0]),
// .W_10(W[5][1][0]),
// .X_11(X[7][1][1]),
// .W_11(W[5][1][1]),
// .X_12(X[7][1][2]),
// .W_12(W[5][1][2]),
// .X_20(X[7][2][0]),
// .W_20(W[5][2][0]),
// .X_21(X[7][2][1]),
// .W_21(W[5][2][1]),
// .X_22(X[7][2][2]),
// .W_22(W[5][2][2]),
// .Y(Y[23]));
// CNN2D CNN2D_24(
// .X_00(X[8][0][0]),
// .W_00(W[6][0][0]),
// .X_01(X[8][0][1]),
// .W_01(W[6][0][1]),
// .X_02(X[8][0][2]),
// .W_02(W[6][0][2]),
// .X_10(X[8][1][0]),
// .W_10(W[6][1][0]),
// .X_11(X[8][1][1]),
// .W_11(W[6][1][1]),
// .X_12(X[8][1][2]),
// .W_12(W[6][1][2]),
// .X_20(X[8][2][0]),
// .W_20(W[6][2][0]),
// .X_21(X[8][2][1]),
// .W_21(W[6][2][1]),
// .X_22(X[8][2][2]),
// .W_22(W[6][2][2]),
// .Y(Y[24]));
// CNN2D CNN2D_25(
// .X_00(X[9][0][0]),
// .W_00(W[6][0][0]),
// .X_01(X[9][0][1]),
// .W_01(W[6][0][1]),
// .X_02(X[9][0][2]),
// .W_02(W[6][0][2]),
// .X_10(X[9][1][0]),
// .W_10(W[6][1][0]),
// .X_11(X[9][1][1]),
// .W_11(W[6][1][1]),
// .X_12(X[9][1][2]),
// .W_12(W[6][1][2]),
// .X_20(X[9][2][0]),
// .W_20(W[6][2][0]),
// .X_21(X[9][2][1]),
// .W_21(W[6][2][1]),
// .X_22(X[9][2][2]),
// .W_22(W[6][2][2]),
// .Y(Y[25]));
// CNN2D CNN2D_26(
// .X_00(X[10][0][0]),
// .W_00(W[6][0][0]),
// .X_01(X[10][0][1]),
// .W_01(W[6][0][1]),
// .X_02(X[10][0][2]),
// .W_02(W[6][0][2]),
// .X_10(X[10][1][0]),
// .W_10(W[6][1][0]),
// .X_11(X[10][1][1]),
// .W_11(W[6][1][1]),
// .X_12(X[10][1][2]),
// .W_12(W[6][1][2]),
// .X_20(X[10][2][0]),
// .W_20(W[6][2][0]),
// .X_21(X[10][2][1]),
// .W_21(W[6][2][1]),
// .X_22(X[10][2][2]),
// .W_22(W[6][2][2]),
// .Y(Y[26])
// );
// CNN2D CNN2D_27(
// .X_00(X[11][0][0]),
// .W_00(W[6][0][0]),
// .X_01(X[11][0][1]),
// .W_01(W[6][0][1]),
// .X_02(X[11][0][2]),
// .W_02(W[6][0][2]),
// .X_10(X[11][1][0]),
// .W_10(W[6][1][0]),
// .X_11(X[11][1][1]),
// .W_11(W[6][1][1]),
// .X_12(X[11][1][2]),
// .W_12(W[6][1][2]),
// .X_20(X[11][2][0]),
// .W_20(W[6][2][0]),
// .X_21(X[11][2][1]),
// .W_21(W[6][2][1]),
// .X_22(X[11][2][2]),
// .W_22(W[6][2][2]),
// .Y(Y[27])
// );
// CNN2D CNN2D_28(
// .X_00(X[12][0][0]),
// .W_00(W[7][0][0]),
// .X_01(X[12][0][1]),
// .W_01(W[7][0][1]),
// .X_02(X[12][0][2]),
// .W_02(W[7][0][2]),
// .X_10(X[12][1][0]),
// .W_10(W[7][1][0]),
// .X_11(X[12][1][1]),
// .W_11(W[7][1][1]),
// .X_12(X[12][1][2]),
// .W_12(W[7][1][2]),
// .X_20(X[12][2][0]),
// .W_20(W[7][2][0]),
// .X_21(X[12][2][1]),
// .W_21(W[7][2][1]),
// .X_22(X[12][2][2]),
// .W_22(W[7][2][2]),
// .Y(Y[28])
// );
// CNN2D CNN2D_29(
// .X_00(X[13][0][0]),
// .W_00(W[7][0][0]),
// .X_01(X[13][0][1]),
// .W_01(W[7][0][1]),
// .X_02(X[13][0][2]),
// .W_02(W[7][0][2]),
// .X_10(X[13][1][0]),
// .W_10(W[7][1][0]),
// .X_11(X[13][1][1]),
// .W_11(W[7][1][1]),
// .X_12(X[13][1][2]),
// .W_12(W[7][1][2]),
// .X_20(X[13][2][0]),
// .W_20(W[7][2][0]),
// .X_21(X[13][2][1]),
// .W_21(W[7][2][1]),
// .X_22(X[13][2][2]),
// .W_22(W[7][2][2]),
// .Y(Y[29])
// );

// CNN2D CNN2D_30(
// .X_00(X[14][0][0]),
// .W_00(W[7][0][0]),
// .X_01(X[14][0][1]),
// .W_01(W[7][0][1]),
// .X_02(X[14][0][2]),
// .W_02(W[7][0][2]),
// .X_10(X[14][1][0]),
// .W_10(W[7][1][0]),
// .X_11(X[14][1][1]),
// .W_11(W[7][1][1]),
// .X_12(X[14][1][2]),
// .W_12(W[7][1][2]),
// .X_20(X[14][2][0]),
// .W_20(W[7][2][0]),
// .X_21(X[14][2][1]),
// .W_21(W[7][2][1]),
// .X_22(X[14][2][2]),
// .W_22(W[7][2][2]),
// .Y(Y[30])
// );
// CNN2D CNN2D_31(
// .X_00(X[15][0][0]),
// .W_00(W[7][0][0]),
// .X_01(X[15][0][1]),
// .W_01(W[7][0][1]),
// .X_02(X[15][0][2]),
// .W_02(W[7][0][2]),
// .X_10(X[15][1][0]),
// .W_10(W[7][1][0]),
// .X_11(X[15][1][1]),
// .W_11(W[7][1][1]),
// .X_12(X[15][1][2]),
// .W_12(W[7][1][2]),
// .X_20(X[15][2][0]),
// .W_20(W[7][2][0]),
// .X_21(X[15][2][1]),
// .W_21(W[7][2][1]),
// .X_22(X[15][2][2]),
// .W_22(W[7][2][2]),
// .Y(Y[31])
// );

// // weight NO2

// CNN2D CNN2D_32(
// .X_00(X[0][0][0]),
// .W_00(W[8][0][0]),
// .X_01(X[0][0][1]),
// .W_01(W[8][0][1]),
// .X_02(X[0][0][2]),
// .W_02(W[8][0][2]),
// .X_10(X[0][1][0]),
// .W_10(W[8][1][0]),
// .X_11(X[0][1][1]),
// .W_11(W[8][1][1]),
// .X_12(X[0][1][2]),
// .W_12(W[8][1][2]),
// .X_20(X[0][2][0]),
// .W_20(W[8][2][0]),
// .X_21(X[0][2][1]),
// .W_21(W[8][2][1]),
// .X_22(X[0][2][2]),
// .W_22(W[8][2][2]),
// .Y(Y[32])
// );
// CNN2D CNN2D_33(
// .X_00(X[1][0][0]),
// .W_00(W[8][0][0]),
// .X_01(X[1][0][1]),
// .W_01(W[8][0][1]),
// .X_02(X[1][0][2]),
// .W_02(W[8][0][2]),
// .X_10(X[1][1][0]),
// .W_10(W[8][1][0]),
// .X_11(X[1][1][1]),
// .W_11(W[8][1][1]),
// .X_12(X[1][1][2]),
// .W_12(W[8][1][2]),
// .X_20(X[1][2][0]),
// .W_20(W[8][2][0]),
// .X_21(X[1][2][1]),
// .W_21(W[8][2][1]),
// .X_22(X[1][2][2]),
// .W_22(W[8][2][2])
// ,.Y(Y[33]));
// CNN2D CNN2D_34(
// .X_00(X[2][0][0]),
// .W_00(W[8][0][0]),
// .X_01(X[2][0][1]),
// .W_01(W[8][0][1]),
// .X_02(X[2][0][2]),
// .W_02(W[8][0][2]),
// .X_10(X[2][1][0]),
// .W_10(W[8][1][0]),
// .X_11(X[2][1][1]),
// .W_11(W[8][1][1]),
// .X_12(X[2][1][2]),
// .W_12(W[8][1][2]),
// .X_20(X[2][2][0]),
// .W_20(W[8][2][0]),
// .X_21(X[2][2][1]),
// .W_21(W[8][2][1]),
// .X_22(X[2][2][2]),
// .W_22(W[8][2][2]),
// .Y(Y[34])
// );
// CNN2D CNN2D_35(
// .X_00(X[3][0][0]),
// .W_00(W[8][0][0]),
// .X_01(X[3][0][1]),
// .W_01(W[8][0][1]),
// .X_02(X[3][0][2]),
// .W_02(W[8][0][2]),
// .X_10(X[3][1][0]),
// .W_10(W[8][1][0]),
// .X_11(X[3][1][1]),
// .W_11(W[8][1][1]),
// .X_12(X[3][1][2]),
// .W_12(W[8][1][2]),
// .X_20(X[3][2][0]),
// .W_20(W[8][2][0]),
// .X_21(X[3][2][1]),
// .W_21(W[8][2][1]),
// .X_22(X[3][2][2]),
// .W_22(W[8][2][2]),
// .Y(Y[35]));
// CNN2D CNN2D_36(
// .X_00(X[4][0][0]),
// .W_00(W[9][0][0]),
// .X_01(X[4][0][1]),
// .W_01(W[9][0][1]),
// .X_02(X[4][0][2]),
// .W_02(W[9][0][2]),
// .X_10(X[4][1][0]),
// .W_10(W[9][1][0]),
// .X_11(X[4][1][1]),
// .W_11(W[9][1][1]),
// .X_12(X[4][1][2]),
// .W_12(W[9][1][2]),
// .X_20(X[4][2][0]),
// .W_20(W[9][2][0]),
// .X_21(X[4][2][1]),
// .W_21(W[9][2][1]),
// .X_22(X[4][2][2]),
// .W_22(W[9][2][2]),
// .Y(Y[36]));
// CNN2D CNN2D_37(
// .X_00(X[5][0][0]),
// .W_00(W[9][0][0]),
// .X_01(X[5][0][1]),
// .W_01(W[9][0][1]),
// .X_02(X[5][0][2]),
// .W_02(W[9][0][2]),
// .X_10(X[5][1][0]),
// .W_10(W[9][1][0]),
// .X_11(X[5][1][1]),
// .W_11(W[9][1][1]),
// .X_12(X[5][1][2]),
// .W_12(W[9][1][2]),
// .X_20(X[5][2][0]),
// .W_20(W[9][2][0]),
// .X_21(X[5][2][1]),
// .W_21(W[9][2][1]),
// .X_22(X[5][2][2]),
// .W_22(W[9][2][2]),
// .Y(Y[37])
// );
// CNN2D CNN2D_38(
// .X_00(X[6][0][0]),
// .W_00(W[9][0][0]),
// .X_01(X[6][0][1]),
// .W_01(W[9][0][1]),
// .X_02(X[6][0][2]),
// .W_02(W[9][0][2]),
// .X_10(X[6][1][0]),
// .W_10(W[9][1][0]),
// .X_11(X[6][1][1]),
// .W_11(W[9][1][1]),
// .X_12(X[6][1][2]),
// .W_12(W[9][1][2]),
// .X_20(X[6][2][0]),
// .W_20(W[9][2][0]),
// .X_21(X[6][2][1]),
// .W_21(W[9][2][1]),
// .X_22(X[6][2][2]),
// .W_22(W[9][2][2]),
// .Y(Y[38]));
// CNN2D CNN2D_39(
// .X_00(X[7][0][0]),
// .W_00(W[9][0][0]),
// .X_01(X[7][0][1]),
// .W_01(W[9][0][1]),
// .X_02(X[7][0][2]),
// .W_02(W[9][0][2]),
// .X_10(X[7][1][0]),
// .W_10(W[9][1][0]),
// .X_11(X[7][1][1]),
// .W_11(W[9][1][1]),
// .X_12(X[7][1][2]),
// .W_12(W[9][1][2]),
// .X_20(X[7][2][0]),
// .W_20(W[9][2][0]),
// .X_21(X[7][2][1]),
// .W_21(W[9][2][1]),
// .X_22(X[7][2][2]),
// .W_22(W[9][2][2]),
// .Y(Y[39]));
// CNN2D CNN2D_40(
// .X_00(X[8][0][0]),
// .W_00(W[10][0][0]),
// .X_01(X[8][0][1]),
// .W_01(W[10][0][1]),
// .X_02(X[8][0][2]),
// .W_02(W[10][0][2]),
// .X_10(X[8][1][0]),
// .W_10(W[10][1][0]),
// .X_11(X[8][1][1]),
// .W_11(W[10][1][1]),
// .X_12(X[8][1][2]),
// .W_12(W[10][1][2]),
// .X_20(X[8][2][0]),
// .W_20(W[10][2][0]),
// .X_21(X[8][2][1]),
// .W_21(W[10][2][1]),
// .X_22(X[8][2][2]),
// .W_22(W[10][2][2]),
// .Y(Y[40]));
// CNN2D CNN2D_41(
// .X_00(X[9][0][0]),
// .W_00(W[10][0][0]),
// .X_01(X[9][0][1]),
// .W_01(W[10][0][1]),
// .X_02(X[9][0][2]),
// .W_02(W[10][0][2]),
// .X_10(X[9][1][0]),
// .W_10(W[10][1][0]),
// .X_11(X[9][1][1]),
// .W_11(W[10][1][1]),
// .X_12(X[9][1][2]),
// .W_12(W[10][1][2]),
// .X_20(X[9][2][0]),
// .W_20(W[10][2][0]),
// .X_21(X[9][2][1]),
// .W_21(W[10][2][1]),
// .X_22(X[9][2][2]),
// .W_22(W[10][2][2]),
// .Y(Y[41]));
// CNN2D CNN2D_42(
// .X_00(X[10][0][0]),
// .W_00(W[10][0][0]),
// .X_01(X[10][0][1]),
// .W_01(W[10][0][1]),
// .X_02(X[10][0][2]),
// .W_02(W[10][0][2]),
// .X_10(X[10][1][0]),
// .W_10(W[10][1][0]),
// .X_11(X[10][1][1]),
// .W_11(W[10][1][1]),
// .X_12(X[10][1][2]),
// .W_12(W[10][1][2]),
// .X_20(X[10][2][0]),
// .W_20(W[10][2][0]),
// .X_21(X[10][2][1]),
// .W_21(W[10][2][1]),
// .X_22(X[10][2][2]),
// .W_22(W[10][2][2]),
// .Y(Y[42])
// );
// CNN2D CNN2D_43(
// .X_00(X[11][0][0]),
// .W_00(W[10][0][0]),
// .X_01(X[11][0][1]),
// .W_01(W[10][0][1]),
// .X_02(X[11][0][2]),
// .W_02(W[10][0][2]),
// .X_10(X[11][1][0]),
// .W_10(W[10][1][0]),
// .X_11(X[11][1][1]),
// .W_11(W[10][1][1]),
// .X_12(X[11][1][2]),
// .W_12(W[10][1][2]),
// .X_20(X[11][2][0]),
// .W_20(W[10][2][0]),
// .X_21(X[11][2][1]),
// .W_21(W[10][2][1]),
// .X_22(X[11][2][2]),
// .W_22(W[10][2][2]),
// .Y(Y[43])
// );
// CNN2D CNN2D_44(
// .X_00(X[12][0][0]),
// .W_00(W[11][0][0]),
// .X_01(X[12][0][1]),
// .W_01(W[11][0][1]),
// .X_02(X[12][0][2]),
// .W_02(W[11][0][2]),
// .X_10(X[12][1][0]),
// .W_10(W[11][1][0]),
// .X_11(X[12][1][1]),
// .W_11(W[11][1][1]),
// .X_12(X[12][1][2]),
// .W_12(W[11][1][2]),
// .X_20(X[12][2][0]),
// .W_20(W[11][2][0]),
// .X_21(X[12][2][1]),
// .W_21(W[11][2][1]),
// .X_22(X[12][2][2]),
// .W_22(W[11][2][2]),
// .Y(Y[44])
// );
// CNN2D CNN2D_45(
// .X_00(X[13][0][0]),
// .W_00(W[11][0][0]),
// .X_01(X[13][0][1]),
// .W_01(W[11][0][1]),
// .X_02(X[13][0][2]),
// .W_02(W[11][0][2]),
// .X_10(X[13][1][0]),
// .W_10(W[11][1][0]),
// .X_11(X[13][1][1]),
// .W_11(W[11][1][1]),
// .X_12(X[13][1][2]),
// .W_12(W[11][1][2]),
// .X_20(X[13][2][0]),
// .W_20(W[11][2][0]),
// .X_21(X[13][2][1]),
// .W_21(W[11][2][1]),
// .X_22(X[13][2][2]),
// .W_22(W[11][2][2]),
// .Y(Y[45])
// );

// CNN2D CNN2D_46(
// .X_00(X[14][0][0]),
// .W_00(W[11][0][0]),
// .X_01(X[14][0][1]),
// .W_01(W[11][0][1]),
// .X_02(X[14][0][2]),
// .W_02(W[11][0][2]),
// .X_10(X[14][1][0]),
// .W_10(W[11][1][0]),
// .X_11(X[14][1][1]),
// .W_11(W[11][1][1]),
// .X_12(X[14][1][2]),
// .W_12(W[11][1][2]),
// .X_20(X[14][2][0]),
// .W_20(W[11][2][0]),
// .X_21(X[14][2][1]),
// .W_21(W[11][2][1]),
// .X_22(X[14][2][2]),
// .W_22(W[11][2][2]),
// .Y(Y[46])
// );
// CNN2D CNN2D_47(
// .X_00(X[15][0][0]),
// .W_00(W[11][0][0]),
// .X_01(X[15][0][1]),
// .W_01(W[11][0][1]),
// .X_02(X[15][0][2]),
// .W_02(W[11][0][2]),
// .X_10(X[15][1][0]),
// .W_10(W[11][1][0]),
// .X_11(X[15][1][1]),
// .W_11(W[11][1][1]),
// .X_12(X[15][1][2]),
// .W_12(W[11][1][2]),
// .X_20(X[15][2][0]),
// .W_20(W[11][2][0]),
// .X_21(X[15][2][1]),
// .W_21(W[11][2][1]),
// .X_22(X[15][2][2]),
// .W_22(W[11][2][2]),
// .Y(Y[47])
// );

// // NO 4

// CNN2D CNN2D_48(
// .X_00(X[0][0][0]),
// .W_00(W[12][0][0]),
// .X_01(X[0][0][1]),
// .W_01(W[12][0][1]),
// .X_02(X[0][0][2]),
// .W_02(W[12][0][2]),
// .X_10(X[0][1][0]),
// .W_10(W[12][1][0]),
// .X_11(X[0][1][1]),
// .W_11(W[12][1][1]),
// .X_12(X[0][1][2]),
// .W_12(W[12][1][2]),
// .X_20(X[0][2][0]),
// .W_20(W[12][2][0]),
// .X_21(X[0][2][1]),
// .W_21(W[12][2][1]),
// .X_22(X[0][2][2]),
// .W_22(W[12][2][2]),
// .Y(Y[48])
// );
// CNN2D CNN2D_49(
// .X_00(X[1][0][0]),
// .W_00(W[12][0][0]),
// .X_01(X[1][0][1]),
// .W_01(W[12][0][1]),
// .X_02(X[1][0][2]),
// .W_02(W[12][0][2]),
// .X_10(X[1][1][0]),
// .W_10(W[12][1][0]),
// .X_11(X[1][1][1]),
// .W_11(W[12][1][1]),
// .X_12(X[1][1][2]),
// .W_12(W[12][1][2]),
// .X_20(X[1][2][0]),
// .W_20(W[12][2][0]),
// .X_21(X[1][2][1]),
// .W_21(W[12][2][1]),
// .X_22(X[1][2][2]),
// .W_22(W[12][2][2]),
// .Y(Y[49]));

// CNN2D CNN2D_50(
// .X_00(X[2][0][0]),
// .W_00(W[12][0][0]),
// .X_01(X[2][0][1]),
// .W_01(W[12][0][1]),
// .X_02(X[2][0][2]),
// .W_02(W[12][0][2]),
// .X_10(X[2][1][0]),
// .W_10(W[12][1][0]),
// .X_11(X[2][1][1]),
// .W_11(W[12][1][1]),
// .X_12(X[2][1][2]),
// .W_12(W[12][1][2]),
// .X_20(X[2][2][0]),
// .W_20(W[12][2][0]),
// .X_21(X[2][2][1]),
// .W_21(W[12][2][1]),
// .X_22(X[2][2][2]),
// .W_22(W[12][2][2]),
// .Y(Y[50]));
// CNN2D CNN2D_51(
// .X_00(X[3][0][0]),
// .W_00(W[12][0][0]),
// .X_01(X[3][0][1]),
// .W_01(W[12][0][1]),
// .X_02(X[3][0][2]),
// .W_02(W[12][0][2]),
// .X_10(X[3][1][0]),
// .W_10(W[12][1][0]),
// .X_11(X[3][1][1]),
// .W_11(W[12][1][1]),
// .X_12(X[3][1][2]),
// .W_12(W[12][1][2]),
// .X_20(X[3][2][0]),
// .W_20(W[12][2][0]),
// .X_21(X[3][2][1]),
// .W_21(W[12][2][1]),
// .X_22(X[3][2][2]),
// .W_22(W[12][2][2]),
// .Y(Y[51]));
// CNN2D CNN2D_52(
// .X_00(X[4][0][0]),
// .W_00(W[13][0][0]),
// .X_01(X[4][0][1]),
// .W_01(W[13][0][1]),
// .X_02(X[4][0][2]),
// .W_02(W[13][0][2]),
// .X_10(X[4][1][0]),
// .W_10(W[13][1][0]),
// .X_11(X[4][1][1]),
// .W_11(W[13][1][1]),
// .X_12(X[4][1][2]),
// .W_12(W[13][1][2]),
// .X_20(X[4][2][0]),
// .W_20(W[13][2][0]),
// .X_21(X[4][2][1]),
// .W_21(W[13][2][1]),
// .X_22(X[4][2][2]),
// .W_22(W[13][2][2])
// ,.Y(Y[52]));
// CNN2D CNN2D_53(
// .X_00(X[5][0][0]),
// .W_00(W[13][0][0]),
// .X_01(X[5][0][1]),
// .W_01(W[13][0][1]),
// .X_02(X[5][0][2]),
// .W_02(W[13][0][2]),
// .X_10(X[5][1][0]),
// .W_10(W[13][1][0]),
// .X_11(X[5][1][1]),
// .W_11(W[13][1][1]),
// .X_12(X[5][1][2]),
// .W_12(W[13][1][2]),
// .X_20(X[5][2][0]),
// .W_20(W[13][2][0]),
// .X_21(X[5][2][1]),
// .W_21(W[13][2][1]),
// .X_22(X[5][2][2]),
// .W_22(W[13][2][2]),
// .Y(Y[53])
// );
// CNN2D CNN2D_54(
// .X_00(X[6][0][0]),
// .W_00(W[13][0][0]),
// .X_01(X[6][0][1]),
// .W_01(W[13][0][1]),
// .X_02(X[6][0][2]),
// .W_02(W[13][0][2]),
// .X_10(X[6][1][0]),
// .W_10(W[13][1][0]),
// .X_11(X[6][1][1]),
// .W_11(W[13][1][1]),
// .X_12(X[6][1][2]),
// .W_12(W[13][1][2]),
// .X_20(X[6][2][0]),
// .W_20(W[13][2][0]),
// .X_21(X[6][2][1]),
// .W_21(W[13][2][1]),
// .X_22(X[6][2][2]),
// .W_22(W[13][2][2]),
// .Y(Y[54]));
// CNN2D CNN2D_55(
// .X_00(X[7][0][0]),
// .W_00(W[13][0][0]),
// .X_01(X[7][0][1]),
// .W_01(W[13][0][1]),
// .X_02(X[7][0][2]),
// .W_02(W[13][0][2]),
// .X_10(X[7][1][0]),
// .W_10(W[13][1][0]),
// .X_11(X[7][1][1]),
// .W_11(W[13][1][1]),
// .X_12(X[7][1][2]),
// .W_12(W[13][1][2]),
// .X_20(X[7][2][0]),
// .W_20(W[13][2][0]),
// .X_21(X[7][2][1]),
// .W_21(W[13][2][1]),
// .X_22(X[7][2][2]),
// .W_22(W[13][2][2]),
// .Y(Y[55]));
// CNN2D CNN2D_56(
// .X_00(X[8][0][0]),
// .W_00(W[14][0][0]),
// .X_01(X[8][0][1]),
// .W_01(W[14][0][1]),
// .X_02(X[8][0][2]),
// .W_02(W[14][0][2]),
// .X_10(X[8][1][0]),
// .W_10(W[14][1][0]),
// .X_11(X[8][1][1]),
// .W_11(W[14][1][1]),
// .X_12(X[8][1][2]),
// .W_12(W[14][1][2]),
// .X_20(X[8][2][0]),
// .W_20(W[14][2][0]),
// .X_21(X[8][2][1]),
// .W_21(W[14][2][1]),
// .X_22(X[8][2][2]),
// .W_22(W[14][2][2]),
// .Y(Y[56]));
// CNN2D CNN2D_57(
// .X_00(X[9][0][0]),
// .W_00(W[14][0][0]),
// .X_01(X[9][0][1]),
// .W_01(W[14][0][1]),
// .X_02(X[9][0][2]),
// .W_02(W[14][0][2]),
// .X_10(X[9][1][0]),
// .W_10(W[14][1][0]),
// .X_11(X[9][1][1]),
// .W_11(W[14][1][1]),
// .X_12(X[9][1][2]),
// .W_12(W[14][1][2]),
// .X_20(X[9][2][0]),
// .W_20(W[14][2][0]),
// .X_21(X[9][2][1]),
// .W_21(W[14][2][1]),
// .X_22(X[9][2][2]),
// .W_22(W[14][2][2]),
// .Y(Y[57]));
// CNN2D CNN2D_58(
// .X_00(X[10][0][0]),
// .W_00(W[14][0][0]),
// .X_01(X[10][0][1]),
// .W_01(W[14][0][1]),
// .X_02(X[10][0][2]),
// .W_02(W[14][0][2]),
// .X_10(X[10][1][0]),
// .W_10(W[14][1][0]),
// .X_11(X[10][1][1]),
// .W_11(W[14][1][1]),
// .X_12(X[10][1][2]),
// .W_12(W[14][1][2]),
// .X_20(X[10][2][0]),
// .W_20(W[14][2][0]),
// .X_21(X[10][2][1]),
// .W_21(W[14][2][1]),
// .X_22(X[10][2][2]),
// .W_22(W[14][2][2]),
// .Y(Y[58])
// );
// CNN2D CNN2D_59(
// .X_00(X[11][0][0]),
// .W_00(W[14][0][0]),
// .X_01(X[11][0][1]),
// .W_01(W[14][0][1]),
// .X_02(X[11][0][2]),
// .W_02(W[14][0][2]),
// .X_10(X[11][1][0]),
// .W_10(W[14][1][0]),
// .X_11(X[11][1][1]),
// .W_11(W[14][1][1]),
// .X_12(X[11][1][2]),
// .W_12(W[14][1][2]),
// .X_20(X[11][2][0]),
// .W_20(W[14][2][0]),
// .X_21(X[11][2][1]),
// .W_21(W[14][2][1]),
// .X_22(X[11][2][2]),
// .W_22(W[14][2][2]),
// .Y(Y[59])
// );
// CNN2D CNN2D_60(
// .X_00(X[12][0][0]),
// .W_00(W[15][0][0]),
// .X_01(X[12][0][1]),
// .W_01(W[15][0][1]),
// .X_02(X[12][0][2]),
// .W_02(W[15][0][2]),
// .X_10(X[12][1][0]),
// .W_10(W[15][1][0]),
// .X_11(X[12][1][1]),
// .W_11(W[15][1][1]),
// .X_12(X[12][1][2]),
// .W_12(W[15][1][2]),
// .X_20(X[12][2][0]),
// .W_20(W[15][2][0]),
// .X_21(X[12][2][1]),
// .W_21(W[15][2][1]),
// .X_22(X[12][2][2]),
// .W_22(W[15][2][2]),
// .Y(Y[60])
// );
// CNN2D CNN2D_61(
// .X_00(X[13][0][0]),
// .W_00(W[15][0][0]),
// .X_01(X[13][0][1]),
// .W_01(W[15][0][1]),
// .X_02(X[13][0][2]),
// .W_02(W[15][0][2]),
// .X_10(X[13][1][0]),
// .W_10(W[15][1][0]),
// .X_11(X[13][1][1]),
// .W_11(W[15][1][1]),
// .X_12(X[13][1][2]),
// .W_12(W[15][1][2]),
// .X_20(X[13][2][0]),
// .W_20(W[15][2][0]),
// .X_21(X[13][2][1]),
// .W_21(W[15][2][1]),
// .X_22(X[13][2][2]),
// .W_22(W[15][2][2]),
// .Y(Y[61])
// );

// CNN2D CNN2D_62(
// .X_00(X[14][0][0]),
// .W_00(W[15][0][0]),
// .X_01(X[14][0][1]),
// .W_01(W[15][0][1]),
// .X_02(X[14][0][2]),
// .W_02(W[15][0][2]),
// .X_10(X[14][1][0]),
// .W_10(W[15][1][0]),
// .X_11(X[14][1][1]),
// .W_11(W[15][1][1]),
// .X_12(X[14][1][2]),
// .W_12(W[15][1][2]),
// .X_20(X[14][2][0]),
// .W_20(W[15][2][0]),
// .X_21(X[14][2][1]),
// .W_21(W[15][2][1]),
// .X_22(X[14][2][2]),
// .W_22(W[15][2][2]),
// .Y(Y[62])
// );
// CNN2D CNN2D_63(
// .X_00(X[15][0][0]),
// .W_00(W[15][0][0]),
// .X_01(X[15][0][1]),
// .W_01(W[15][0][1]),
// .X_02(X[15][0][2]),
// .W_02(W[15][0][2]),
// .X_10(X[15][1][0]),
// .W_10(W[15][1][0]),
// .X_11(X[15][1][1]),
// .W_11(W[15][1][1]),
// .X_12(X[15][1][2]),
// .W_12(W[15][1][2]),
// .X_20(X[15][2][0]),
// .W_20(W[15][2][0]),
// .X_21(X[15][2][1]),
// .W_21(W[15][2][1]),
// .X_22(X[15][2][2]),
// .W_22(W[15][2][2]),
// .Y(Y[63])
// );





endmodule