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
	output signed [15:0] Y
);

assign Y = 
X_00 * W_00 +
X_01 * W_01 +
X_02 * W_02 +
X_10 * W_10 +
X_11 * W_11 +
X_12 * W_12 +
X_20 * W_20 +
X_21 * W_21 +
X_22 * W_22;

endmodule