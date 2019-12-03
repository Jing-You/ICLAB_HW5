module sram_84x4b #(       //for bias
parameter BIAS_PER_ADDR = 1,
parameter BW_PER_PARAM = 4
)
(
input clk,
input csb,  //chip enable
input wsb,  //write enable
input [BIAS_PER_ADDR*BW_PER_PARAM-1:0] wdata, //write data
input [6:0] waddr, //write address
input [6:0] raddr, //read address

output reg [BIAS_PER_ADDR*BW_PER_PARAM-1:0] rdata //read data 4 bits
);
/*
Data location
/////////////////////
addr 0~3: conv1_b(4)
addr 4~19: conv2_b(16)
addr 20~83: conv3_b(64)
/////////////////////
*/
reg [BIAS_PER_ADDR*BW_PER_PARAM-1:0] mem [0:83];
reg [BIAS_PER_ADDR*BW_PER_PARAM-1:0] _rdata;

always @(posedge clk) begin
    if(~csb && ~wsb)
        mem[waddr] <= wdata;
end

always @(posedge clk) begin
    if(~csb)
        _rdata <= mem[raddr];
end

always @* begin
    rdata = #(1) _rdata;
end

task load_param(
    input integer index,
    input [BIAS_PER_ADDR*BW_PER_PARAM-1:0] param_input
);
    mem[index] = param_input;
endtask

endmodule