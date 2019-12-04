module CNN2D(
	input signed [7:0] X_00,
	input signed [7:0] X_01,
	input signed [7:0] X_02,
	input signed [7:0] X_10,
	input signed [7:0] X_11,
	input signed [7:0] X_12,
	input signed [7:0] X_20,
	input signed [7:0] X_21,
	input signed [7:0] X_22,
	input signed [3:0] W_00,
	input signed [3:0] W_01,
	input signed [3:0] W_02,
	input signed [3:0] W_10,
	input signed [3:0] W_11,
	input signed [3:0] W_12,
	input signed [3:0] W_20,
	input signed [3:0] W_21,
	input signed [3:0] W_22,
	output signed [11:0] Y_00,	
	output signed [11:0] Y_01,	
	output signed [11:0] Y_02,	
	output signed [11:0] Y_10,	
	output signed [11:0] Y_11,	
	output signed [11:0] Y_12,	
	output signed [11:0] Y_20,	
	output signed [11:0] Y_21,	
	output signed [11:0] Y_22
);

assign Y_00 = X_00 * W_00;
assign Y_01 = X_01 * W_01;
assign Y_02 = X_02 * W_02;
assign Y_10 = X_10 * W_10;
assign Y_11 = X_11 * W_11;
assign Y_12 = X_12 * W_12;
assign Y_20 = X_20 * W_20;
assign Y_21 = X_21 * W_21;
assign Y_22 = X_22 * W_22;

endmodule