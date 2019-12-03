module sram_1104x36b #(       //for weight
parameter WEIGHT_PER_ADDR = 9,
parameter BW_PER_PARAM = 4
)
(
input clk,
input csb,  //chip enable
input wsb,  //write enable
input [WEIGHT_PER_ADDR*BW_PER_PARAM-1:0] wdata, //write data
input [10:0] waddr, //write address
input [10:0] raddr, //read address

output reg [WEIGHT_PER_ADDR*BW_PER_PARAM-1:0] rdata //read data 36 bits
);
/*
Data location
/////////////////////
addr 0~15: conv1_w(16)
addr 16~79: conv2_w(64)
addr 80~1103: conv3_w(1024)
/////////////////////
*/
reg [WEIGHT_PER_ADDR*BW_PER_PARAM-1:0] mem [0:1103];
reg [WEIGHT_PER_ADDR*BW_PER_PARAM-1:0] _rdata;

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
    input [WEIGHT_PER_ADDR*BW_PER_PARAM-1:0] param_input
);
    mem[index] = param_input;
endtask

endmodule