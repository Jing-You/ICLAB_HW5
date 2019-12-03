module sram_36x128b #(     //for activation
parameter CH_NUM = 4,
parameter ACT_PER_ADDR = 4,
parameter BW_PER_ACT = 8
)
(
input clk,
input [CH_NUM*ACT_PER_ADDR-1:0] bytemask,  //16 bits
input csb,  //chip enable
input wsb,  //write enable
input [CH_NUM*ACT_PER_ADDR*BW_PER_ACT-1:0] wdata, //write data 128 bits
input [5:0] waddr, //write address
input [5:0] raddr, //read address

output reg [CH_NUM*ACT_PER_ADDR*BW_PER_ACT-1:0] rdata //read data 128 bits
);

reg [CH_NUM*ACT_PER_ADDR*BW_PER_ACT-1:0] _rdata;
reg [CH_NUM*ACT_PER_ADDR*BW_PER_ACT-1:0] mem [0:36];
wire [CH_NUM*ACT_PER_ADDR*BW_PER_ACT-1:0] bit_mask;

assign bit_mask = {{8{bytemask[15]}}, {8{bytemask[14]}}, {8{bytemask[13]}}, {8{bytemask[12]}}, {8{bytemask[11]}}, {8{bytemask[10]}}, {8{bytemask[9]}}, {8{bytemask[8]}}, {8{bytemask[7]}}, {8{bytemask[6]}}, {8{bytemask[5]}}, {8{bytemask[4]}}, {8{bytemask[3]}}, {8{bytemask[2]}}, {8{bytemask[1]}}, {8{bytemask[0]}}};

always @(posedge clk) begin
    if(~csb && ~wsb) begin
        mem[waddr] <= (wdata & ~(bit_mask)) | (mem[waddr] & bit_mask);
    end
end

always @(posedge clk) begin
    if(~csb) begin
        _rdata <= mem[raddr];
    end
end

always @* begin
    rdata = #(1) _rdata;
end

endmodule