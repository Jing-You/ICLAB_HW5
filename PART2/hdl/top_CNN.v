module top_CNN(
	input clk,
	input rst_n,
	input cnn_state ,
	input [5:0] state,
	input [5:0] state_p,
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
	input [4:0] x_cnt_ppp,
	input [4:0] y_cnt_ppp,
	input [1:0] read_input_cnt,
	input [1:0] read_input_cnt_p,
	input [1:0] read_input_cnt_pp,
	input read_weight_finish,
	input read_bias_finish,
	input [10:0] read_cnt,
	input cnn_state_p,
	input cnn_state_pppp,
	output reg signed [15:0] feature_maps_o0,
	output reg signed [15:0] feature_maps_o1,
	output reg signed [15:0] feature_maps_o2,
	output reg signed [15:0] feature_maps_o3,
	output reg [7:0] max
);

parameter LAYER1_WIDTH = 14, LAYER1_HEIGHT = 14;
parameter IDLE = 0, UNSHUFFLE = 1, CONV1 = 2, C1_2_C2=3, CONV2 = 4, C2_2_C3 = 5,
	CONV3=6, C3_2_P=7, POOL=8, FINISH = 9;
parameter READ_WEIGHT = 0, DOCNN = 1;

reg  [7:0]  X[0:15][0:2][0:2];
reg  [3:0]  W[0:15][0:2][0:2];
wire signed [15:0] Y[0:15];	
reg x_r2, y_r2;
reg [7:0] ch0_pixels[0:3][0:3];
reg [7:0] ch1_pixels[0:3][0:3];
reg [7:0] ch2_pixels[0:3][0:3];
reg [7:0] ch3_pixels[0:3][0:3];
reg signed [15:0] conv_out[0:3];
reg signed [15:0] conv_out_FF[0:3];
reg signed [15:0] feature_maps_temp_o[0:3];
reg signed [15:0] temp_conv_out[0:3];
reg load_weight_finish;
reg load_bias_finish;
reg signed [3:0] bias;
integer i, j, k, l;
reg [7:0] max0;
reg [7:0] max1;
// reg [7:0] max;

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
	if (max1 > max0)
		max <= max1;
	else
		max <= max0;
end

always @(posedge clk) begin
	bias <= sram_rdata_bias;
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
		if (cnn_state_p == READ_WEIGHT) begin
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
		else if (cnn_state_pppp == DOCNN)begin
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
end

always @(posedge clk) begin
	for(i=0; i<3; i=i+1) begin
		for (j=0;j<3;j=j+1) begin
			X[0][i][j] <= ch0_pixels[i][j];
			X[1][i][j] <= ch0_pixels[i][j+1];
			X[2][i][j] <= ch0_pixels[i+1][j];
			X[3][i][j] <= ch0_pixels[i+1][j+1];
		end
	end
	for(i=0; i<3; i=i+1) begin
		for (j=0;j<3;j=j+1) begin
			X[4][i][j] <= ch1_pixels[i][j];
			X[5][i][j] <= ch1_pixels[i][j+1];
			X[6][i][j] <= ch1_pixels[i+1][j];
			X[7][i][j] <= ch1_pixels[i+1][j+1];
		end
	end
	for(i=0; i<3; i=i+1) begin
		for (j=0;j<3;j=j+1) begin
			X[8][i][j] <= ch2_pixels[i][j];
			X[9][i][j] <= ch2_pixels[i][j+1];
			X[10][i][j] <= ch2_pixels[i+1][j];
			X[11][i][j] <= ch2_pixels[i+1][j+1];
		end
	end
	for(i=0; i<3; i=i+1) begin
		for (j=0;j<3;j=j+1) begin
			X[12][i][j] <= ch3_pixels[i][j];
			X[13][i][j] <= ch3_pixels[i][j+1];
			X[14][i][j] <= ch3_pixels[i+1][j];
			X[15][i][j] <= ch3_pixels[i+1][j+1];
		end
	end
end


always @* begin
	if (state_p == CONV1) begin
		i = 0;
		temp_conv_out[i/4] =   Y[0+i] + Y[4+i] + Y[8+i]  + Y[12+i] + (bias << (11-4)) + 2 ** 6;
		temp_conv_out[i/4+1] = Y[1+i] + Y[5+i] + Y[9+i]  + Y[13+i] + (bias << (11-4)) + 2 ** 6;
		temp_conv_out[i/4+2] = Y[2+i] + Y[6+i] + Y[10+i] + Y[14+i] + (bias << (11-4)) + 2 ** 6;
		temp_conv_out[i/4+3] = Y[3+i] + Y[7+i] + Y[11+i] + Y[15+i] + (bias << (11-4)) + 2 ** 6;
		for (i=0; i<4 ;i=i+1) begin
			conv_out[i] = temp_conv_out[i] >>> 7;
		end
	end
	else if (state_p == CONV2) begin
		i = 0;
		temp_conv_out[i/4] =   Y[0+i] + Y[4+i] + Y[8+i]  + Y[12+i] + (bias << (3)) + 2 ** 4;
		temp_conv_out[i/4+1] = Y[1+i] + Y[5+i] + Y[9+i]  + Y[13+i] + (bias << (3)) + 2 ** 4;
		temp_conv_out[i/4+2] = Y[2+i] + Y[6+i] + Y[10+i] + Y[14+i] + (bias << (3)) + 2 ** 4;
		temp_conv_out[i/4+3] = Y[3+i] + Y[7+i] + Y[11+i] + Y[15+i] + (bias << (3)) + 2 ** 4;
		for (i=0; i<4 ;i=i+1) begin
			conv_out[i] = temp_conv_out[i] >>> 5;
		end
	end
	else begin
		i = 0;
		temp_conv_out[i/4] =   Y[0+i] + Y[4+i] + Y[8+i]  + Y[12+i];
		temp_conv_out[i/4+1] = Y[1+i] + Y[5+i] + Y[9+i]  + Y[13+i];
		temp_conv_out[i/4+2] = Y[2+i] + Y[6+i] + Y[10+i] + Y[14+i];
		temp_conv_out[i/4+3] = Y[3+i] + Y[7+i] + Y[11+i] + Y[15+i];

		conv_out[0] = (feature_maps_o0 + (bias << 3) + 2 ** 5) >>> 6;
		conv_out[1] = (feature_maps_o1 + (bias << 3) + 2 ** 5) >>> 6;
		conv_out[2] = (feature_maps_o2 + (bias << 3) + 2 ** 5) >>> 6;
		conv_out[3] = (feature_maps_o3 + (bias << 3) + 2 ** 5) >>> 6;

	end

	for (i=0; i<4; i=i+1) begin
		if (conv_out_FF[i] >= $signed(127))
			feature_maps_temp_o[i] = 127;
		else if (conv_out_FF[i] < $signed(0))
				feature_maps_temp_o[i] = 0;
		else
			feature_maps_temp_o[i] = conv_out_FF[i][7:0];
	end

	if(feature_maps_temp_o[0] > feature_maps_temp_o[1]) begin
		max0 = feature_maps_temp_o[0];
	end
	else begin
		max0 = feature_maps_temp_o[1];
	end
	if(feature_maps_temp_o[2] > feature_maps_temp_o[3]) begin
		max1 = feature_maps_temp_o[2];
	end
	else begin
		max1 = feature_maps_temp_o[3];
	end
end

always@(posedge clk) begin
	if (CONV1 <= state_p && state_p <= C2_2_C3) begin
		feature_maps_o0 <= feature_maps_temp_o[0];
		feature_maps_o1 <= feature_maps_temp_o[1];
		feature_maps_o2 <= feature_maps_temp_o[2];
		feature_maps_o3 <= feature_maps_temp_o[3];
	end
	else begin
		case (read_input_cnt_pp)
			2: begin
				feature_maps_o0 <= temp_conv_out[0];
				feature_maps_o1 <= temp_conv_out[1];
				feature_maps_o2 <= temp_conv_out[2];
				feature_maps_o3 <= temp_conv_out[3];
			end
			3: begin
				feature_maps_o0 <= feature_maps_o0 + temp_conv_out[0];
				feature_maps_o1 <= feature_maps_o1 + temp_conv_out[1];
				feature_maps_o2 <= feature_maps_o2 + temp_conv_out[2];
				feature_maps_o3 <= feature_maps_o3 + temp_conv_out[3];
			end
			0: begin
				feature_maps_o0 <= feature_maps_o0 + temp_conv_out[0];
				feature_maps_o1 <= feature_maps_o1 + temp_conv_out[1];
				feature_maps_o2 <= feature_maps_o2 + temp_conv_out[2];
				feature_maps_o3 <= feature_maps_o3 + temp_conv_out[3];
			end
			1: begin
				feature_maps_o0 <= feature_maps_o0 + temp_conv_out[0];
				feature_maps_o1 <= feature_maps_o1 + temp_conv_out[1];
				feature_maps_o2 <= feature_maps_o2 + temp_conv_out[2];
				feature_maps_o3 <= feature_maps_o3 + temp_conv_out[3];
			end
		endcase
	end	
end

always @(posedge clk) begin
	conv_out_FF[0] <= conv_out[0];
	conv_out_FF[1] <= conv_out[1];
	conv_out_FF[2] <= conv_out[2];
	conv_out_FF[3] <= conv_out[3];
end

// always @(posedge clk) begin
// 	if (state == CONV3 && cnn_state == DOCNN && read_input_cnt_pp == 1) begin
// 		$display("(%d, %d)", y_cnt_ppp, x_cnt_ppp);
// 		$display("feature_maps");
// 		$display("%d %d %d %d", feature_maps_temp_o[0], feature_maps_temp_o[1], feature_maps_temp_o[2], feature_maps_temp_o[3]);
// 	end
// end

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
.clk(clk),
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
.clk(clk),
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
.clk(clk),
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
.clk(clk),
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
.clk(clk),
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
.clk(clk),
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
.clk(clk),
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
.clk(clk),
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
.clk(clk),
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
.clk(clk),
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
.clk(clk),
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
.clk(clk),
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
.clk(clk),
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
.clk(clk),
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
.clk(clk),
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
.clk(clk),
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