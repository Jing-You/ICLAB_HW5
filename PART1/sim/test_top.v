`timescale 1ns/100ps
`define PAT_START_NO 0
`define PAT_END_NO 0

module test_top;

localparam CH_NUM = 4;
localparam ACT_PER_ADDR = 4;
localparam BW_PER_ACT = 8;
localparam BW_PER_SRAM_GROUP_ADDR = CH_NUM*ACT_PER_ADDR*BW_PER_ACT;
localparam Pattern_N = 28*28;
real CYCLE = 10;

//====== module I/O =====
reg clk;
reg rst_n;

reg enable;
reg [BW_PER_ACT-1:0] input_data;   //8 bits
wire busy;
wire valid;

//for SRAM group A
wire sram_wen_a0;
wire sram_wen_a1;
wire sram_wen_a2;
wire sram_wen_a3;

wire [5:0] sram_raddr_a0;
wire [5:0] sram_raddr_a1;
wire [5:0] sram_raddr_a2;
wire [5:0] sram_raddr_a3;
//128 bits
wire [BW_PER_SRAM_GROUP_ADDR-1:0] sram_rdata_a0;
wire [BW_PER_SRAM_GROUP_ADDR-1:0] sram_rdata_a1;
wire [BW_PER_SRAM_GROUP_ADDR-1:0] sram_rdata_a2;
wire [BW_PER_SRAM_GROUP_ADDR-1:0] sram_rdata_a3;

//16 bits
wire [CH_NUM*ACT_PER_ADDR-1:0] sram_bytemask_a;  
wire [5:0] sram_waddr_a;
//128 bits
wire [BW_PER_SRAM_GROUP_ADDR-1:0] sram_wdata_a;  

//====== top connection =====
Convnet_top #(
.CH_NUM(CH_NUM),
.ACT_PER_ADDR(ACT_PER_ADDR),
.BW_PER_ACT(BW_PER_ACT)
)
Conv_top (
.clk(clk),
.rst_n(rst_n),
.enable(enable),
.busy(busy),
.input_data(input_data),
.valid(valid),

.sram_rdata_a0(sram_rdata_a0),
.sram_rdata_a1(sram_rdata_a1),
.sram_rdata_a2(sram_rdata_a2),
.sram_rdata_a3(sram_rdata_a3),

.sram_raddr_a0(sram_raddr_a0),
.sram_raddr_a1(sram_raddr_a1),
.sram_raddr_a2(sram_raddr_a2),
.sram_raddr_a3(sram_raddr_a3),

.sram_wen_a0(sram_wen_a0),
.sram_wen_a1(sram_wen_a1),
.sram_wen_a2(sram_wen_a2),
.sram_wen_a3(sram_wen_a3),

.sram_bytemask_a(sram_bytemask_a),

.sram_waddr_a(sram_waddr_a),
.sram_wdata_a(sram_wdata_a)
);
//====== sram connection =====
//activation sram group A
sram_36x128b sram_36x128b_a0(
.clk(clk),
.bytemask(sram_bytemask_a),
.csb(1'b0),
.wsb(sram_wen_a0),
.wdata(sram_wdata_a), 
.waddr(sram_waddr_a), 
.raddr(sram_raddr_a0), 
.rdata(sram_rdata_a0)
);

sram_36x128b sram_36x128b_a1(
.clk(clk),
.bytemask(sram_bytemask_a),
.csb(1'b0),
.wsb(sram_wen_a1),
.wdata(sram_wdata_a), 
.waddr(sram_waddr_a), 
.raddr(sram_raddr_a1), 
.rdata(sram_rdata_a1)
);

sram_36x128b sram_36x128b_a2(
.clk(clk),
.bytemask(sram_bytemask_a),
.csb(1'b0),
.wsb(sram_wen_a2),
.wdata(sram_wdata_a), 
.waddr(sram_waddr_a), 
.raddr(sram_raddr_a2), 
.rdata(sram_rdata_a2)
);

sram_36x128b sram_36x128b_a3(
.clk(clk),
.bytemask(sram_bytemask_a),
.csb(1'b0),
.wsb(sram_wen_a3),
.wdata(sram_wdata_a), 
.waddr(sram_waddr_a), 
.raddr(sram_raddr_a3), 
.rdata(sram_rdata_a3)
);

//========== Dump waveform ==========//
initial begin
    $fsdbDumpfile("eCNN_micro_part1.fsdb");
    $fsdbDumpvars("+mda");
end

//========== Store parameters to SRAM ==========//
reg [BW_PER_SRAM_GROUP_ADDR-1:0] unshuffle_ans_a0 [0:15];  //totally 16 addresses
reg [BW_PER_SRAM_GROUP_ADDR-1:0] unshuffle_ans_a1 [0:11];  //totally 12 addresses
reg [BW_PER_SRAM_GROUP_ADDR-1:0] unshuffle_ans_a2 [0:11];  //totally 12 addresses
reg [BW_PER_SRAM_GROUP_ADDR-1:0] unshuffle_ans_a3 [0:8];   //totally 9 addresses

integer i;

initial begin
    //load golden data
    $readmemb("golden/unshuffle_a0_gold.dat", unshuffle_ans_a0);
    $readmemb("golden/unshuffle_a1_gold.dat", unshuffle_ans_a1);
    $readmemb("golden/unshuffle_a2_gold.dat", unshuffle_ans_a2);
    $readmemb("golden/unshuffle_a3_gold.dat", unshuffle_ans_a3);
end

//========== system reset ==========//
initial begin
    clk = 0;
    rst_n = 1;
end

initial begin
    #(CYCLE*10000);
    $finish;
end

always #(CYCLE/2) clk = ~clk;

//========== Pattern feeder ==========//
reg [BW_PER_ACT-1:0] mem_img [0:Pattern_N-1];
integer pat_no, index;
integer m;

localparam UNSHUFFLE = 0, CONV1 = 1, CONV2 = 2, POOL = 3;

initial begin
    for(pat_no=`PAT_START_NO; pat_no<=`PAT_END_NO; pat_no=pat_no+1) begin
        bmp2reg(pat_no);    //load bmp into mem
        $display("The following is input image !!");
        display_reg;

        enable = 1'b0;
        index = 0;

        @(negedge clk);
        rst_n = 1'b0;
        @(negedge clk);
        rst_n = 1'b1;
        enable = 1'b1;

        while(!valid) begin
            @(negedge clk);
            if(!busy && index<Pattern_N) begin
                input_data = mem_img[index];
                index = index+1;
            end
            //========== Check pattern answer ==========//   
            if(valid) begin
                $display("Start to check unshuffle outputs in sram #A0...");
                for(m=0; m<4; m=m+1) begin
                    if(unshuffle_ans_a0[m] == sram_36x128b_a0.mem[m])
                        $write("sram #A0 address: %d PASS!!\n", m);
                    else begin
                        $write("You have wrong answer in the sram #A0 !!!\n\n");
                        display_error(0, 0, m, 0);
                        // $finish;
                    end
                end
                for(m=6; m<10; m=m+1) begin
                    if(unshuffle_ans_a0[m-2] == sram_36x128b_a0.mem[m])
                        $write("sram #A0 address: %d PASS!!\n", m);
                    else begin
                        $write("You have wrong answer in the sram #A0 !!!\n\n");
                        display_error(0, 0, m, 2);
                        // $finish;
                    end
                end
                for(m=12; m<16; m=m+1) begin
                    if(unshuffle_ans_a0[m-4] == sram_36x128b_a0.mem[m])
                        $write("sram #A0 address: %d PASS!!\n", m);
                    else begin
                        $write("You have wrong answer in the sram #A0 !!!\n\n");
                        display_error(0, 0, m, 4);
                        // $finish;
                    end
                end
                for(m=18; m<22; m=m+1) begin
                    if(unshuffle_ans_a0[m-6] == sram_36x128b_a0.mem[m])
                        $write("sram #A0 address: %d PASS!!\n", m);
                    else begin
                        $write("You have wrong answer in the sram #A0 !!!\n\n");
                        display_error(0, 0, m, 6);
                        // $finish;
                    end
                end
                $display("\nUnshuffle outputs in sram #A0 are successfully passed!");
                $display("===============================================================================");
                $display("Start to check unshuffle outputs in sram #A1...");
                for(m=0; m<3; m=m+1) begin
                    if(unshuffle_ans_a1[m] == sram_36x128b_a1.mem[m])
                        $write("sram #A1 address: %d PASS!!\n", m);
                    else begin
                        $write("You have wrong answer in the sram #A1 !!!\n\n");
                        display_error(1, 0, m, 0);
                        // $finish;
                    end
                end
                for(m=6; m<9; m=m+1) begin
                    if(unshuffle_ans_a1[m-3] == sram_36x128b_a1.mem[m])
                        $write("sram #A1 address: %d PASS!!\n", m);
                    else begin
                        $write("You have wrong answer in the sram #A1 !!!\n\n");
                        display_error(1, 0, m, 3);
                        // $finish;
                    end
                end
                for(m=12; m<15; m=m+1) begin
                    if(unshuffle_ans_a1[m-6] == sram_36x128b_a1.mem[m])
                        $write("sram #A1 address: %d PASS!!\n", m);
                    else begin
                        $write("You have wrong answer in the sram #A1 !!!\n\n");
                        display_error(1, 0, m, 6);
                        // $finish;
                    end
                end
                for(m=18; m<21; m=m+1) begin
                    if(unshuffle_ans_a1[m-9] == sram_36x128b_a1.mem[m])
                        $write("sram #A1 address: %d PASS!!\n", m);
                    else begin
                        $write("You have wrong answer in the sram #A1 !!!\n\n");
                        display_error(1, 0, m, 9);
                        // $finish;
                    end
                end
                $display("\nUnshuffle outputs in sram #A1 are successfully passed!");
                $display("===============================================================================");
                $display("Start to check unshuffle outputs in sram #A2...");
                for(m=0; m<4; m=m+1) begin
                    if(unshuffle_ans_a2[m] == sram_36x128b_a2.mem[m])
                        $write("sram #A2 address: %d PASS!!\n", m);
                    else begin
                        $write("You have wrong answer in the sram #A2 !!!\n\n");
                        display_error(2, 0, m, 0);
                        // $finish;
                    end
                end
                for(m=6; m<10; m=m+1) begin
                    if(unshuffle_ans_a2[m-2] == sram_36x128b_a2.mem[m])
                        $write("sram #A2 address: %d PASS!!\n", m);
                    else begin
                        $write("You have wrong answer in the sram #A2 !!!\n\n");
                        display_error(2, 0, m, 2);
                        // $finish;
                    end
                end
                for(m=12; m<16; m=m+1) begin
                    if(unshuffle_ans_a2[m-4] == sram_36x128b_a2.mem[m])
                        $write("sram #A2 address: %d PASS!!\n", m);
                    else begin
                        $write("You have wrong answer in the sram #A2 !!!\n\n");
                        display_error(2, 0, m, 4);
                        // $finish;
                    end
                end
                $display("\nUnshuffle outputs in sram #A2 are successfully passed!");
                $display("===============================================================================");
                $display("Start to check unshuffle outputs in sram #A3...");
                for(m=0; m<3; m=m+1) begin
                    if(unshuffle_ans_a3[m] == sram_36x128b_a3.mem[m])
                        $write("sram #A3 address: %d PASS!!\n", m);
                    else begin
                        $write("You have wrong answer in the sram #A3 !!!\n\n");
                        display_error(3, 0, m, 0);
                        // $finish;
                    end
                end
                for(m=6; m<9; m=m+1) begin
                    if(unshuffle_ans_a3[m-3] == sram_36x128b_a3.mem[m])
                        $write("sram #A3 address: %d PASS!!\n", m);
                    else begin
                        $write("You have wrong answer in the sram #A3 !!!\n\n");
                        display_error(3, 0, m, 3);
                        // $finish;
                    end
                end
                for(m=12; m<15; m=m+1) begin
                    if(unshuffle_ans_a3[m-6] == sram_36x128b_a3.mem[m])
                        $write("sram #A3 address: %d PASS!!\n", m);
                    else begin
                        $write("You have wrong answer in the sram #A3 !!!\n\n");
                        display_error(3, 0, m, 6);
                        // $finish;
                    end
                end
                $display("\nUnshuffle outputs in sram #A3 are successfully passed!");
                $display("===================================================>");
                $display("Congratulations! You pass part1 simulation~");
                $finish;
            end
        end
    end
    $finish;
end

task bmp2reg(
input [31:0] pat_no
);

    reg [23*8-1:0] bmp_filename;
    integer this_i, this_j, i, j;
    integer file_in;
    reg [7:0] char_in;

    begin
        bmp_filename = "../../bmp/test_0000.bmp";
        bmp_filename[8*8-1:7*8] = (pat_no/1000)+48;
        bmp_filename[7*8-1:6*8] = (pat_no%1000)/100+48;
        bmp_filename[6*8-1:5*8] = (pat_no%100)/10+48;
        bmp_filename[5*8-1:4*8] = pat_no%10+48;

        file_in = $fopen(bmp_filename, "rb");

        // skip the header
        for(this_i=0; this_i<1078; this_i=this_i+1)
           char_in = $fgetc(file_in);

        for(this_i=27; this_i>=0; this_i=this_i-1) begin
            for(this_j=0; this_j<28; this_j=this_j+1) begin //four-byte alignment
                char_in = $fgetc(file_in);
                if(char_in <= 127)  
                    mem_img[this_i*28 + this_j] = char_in;
                else 
                    mem_img[this_i*28 + this_j] = 127;
            end
        end
    end

endtask

//display the image in 28x28 reg
task display_reg;
    
    integer this_i, this_j;

    begin
        for(this_i=0; this_i<28; this_i=this_i+1) begin
            for(this_j=0; this_j<28; this_j=this_j+1) begin
               $write("%4d", mem_img[this_i*28 + this_j]);
            end
            $write("\n");
        end
    end

endtask

//display error messages
task display_error(
input [2:0] which_sram,
input [1:0] layer,
input integer addr,
input integer ans_offset
);
    localparam A0 = 0, A1 = 1, A2 = 2, A3 = 3, B0 = 4, B1 = 5, B2 = 6, B3 = 7;
    localparam UNSHUFFLE = 0, CONV1 = 1, CONV2 = 2;

    begin
        case(which_sram)
            A0: begin
                if(layer == UNSHUFFLE) begin
                    $write("Your answer at address %d is \n%d %d %d %d (ch0)\n%d %d %d %d (ch1)\n%d %d %d %d (ch2)\n%d %d %d %d (ch3)\n", m, 
                        $signed(sram_36x128b_a0.mem[addr][127:120]), $signed(sram_36x128b_a0.mem[addr][119:112]),
                        $signed(sram_36x128b_a0.mem[addr][111:104]), $signed(sram_36x128b_a0.mem[addr][103:96]), 
                        $signed(sram_36x128b_a0.mem[addr][95:88]),   $signed(sram_36x128b_a0.mem[addr][87:80]),
                        $signed(sram_36x128b_a0.mem[addr][79:72]),   $signed(sram_36x128b_a0.mem[addr][71:64]),
                        $signed(sram_36x128b_a0.mem[addr][63:56]),   $signed(sram_36x128b_a0.mem[addr][55:48]),
                        $signed(sram_36x128b_a0.mem[addr][47:40]),   $signed(sram_36x128b_a0.mem[addr][39:32]),
                        $signed(sram_36x128b_a0.mem[addr][31:24]),   $signed(sram_36x128b_a0.mem[addr][23:16]),
                        $signed(sram_36x128b_a0.mem[addr][15:8]),    $signed(sram_36x128b_a0.mem[addr][7:0]));
                    $write("But the golden answer is \n%d %d %d %d (ch0)\n%d %d %d %d (ch1)\n%d %d %d %d (ch2)\n%d %d %d %d (ch3)\n", 
                        $signed(unshuffle_ans_a0[addr-ans_offset][127:120]), $signed(unshuffle_ans_a0[addr-ans_offset][119:112]),
                        $signed(unshuffle_ans_a0[addr-ans_offset][111:104]), $signed(unshuffle_ans_a0[addr-ans_offset][103:96]), 
                        $signed(unshuffle_ans_a0[addr-ans_offset][95:88]),   $signed(unshuffle_ans_a0[addr-ans_offset][87:80]),
                        $signed(unshuffle_ans_a0[addr-ans_offset][79:72]),   $signed(unshuffle_ans_a0[addr-ans_offset][71:64]),
                        $signed(unshuffle_ans_a0[addr-ans_offset][63:56]),   $signed(unshuffle_ans_a0[addr-ans_offset][55:48]),
                        $signed(unshuffle_ans_a0[addr-ans_offset][47:40]),   $signed(unshuffle_ans_a0[addr-ans_offset][39:32]),
                        $signed(unshuffle_ans_a0[addr-ans_offset][31:24]),   $signed(unshuffle_ans_a0[addr-ans_offset][23:16]),
                        $signed(unshuffle_ans_a0[addr-ans_offset][15:8]),    $signed(unshuffle_ans_a0[addr-ans_offset][7:0]));
                end
            end
            A1: begin
                if(layer == UNSHUFFLE) begin
                    $write("Your answer at address %d is \n%d %d %d %d (ch0)\n%d %d %d %d (ch1)\n%d %d %d %d (ch2)\n%d %d %d %d (ch3)\n", m, 
                        $signed(sram_36x128b_a1.mem[addr][127:120]), $signed(sram_36x128b_a1.mem[addr][119:112]),
                        $signed(sram_36x128b_a1.mem[addr][111:104]), $signed(sram_36x128b_a1.mem[addr][103:96]), 
                        $signed(sram_36x128b_a1.mem[addr][95:88]),   $signed(sram_36x128b_a1.mem[addr][87:80]),
                        $signed(sram_36x128b_a1.mem[addr][79:72]),   $signed(sram_36x128b_a1.mem[addr][71:64]),
                        $signed(sram_36x128b_a1.mem[addr][63:56]),   $signed(sram_36x128b_a1.mem[addr][55:48]),
                        $signed(sram_36x128b_a1.mem[addr][47:40]),   $signed(sram_36x128b_a1.mem[addr][39:32]),
                        $signed(sram_36x128b_a1.mem[addr][31:24]),   $signed(sram_36x128b_a1.mem[addr][23:16]),
                        $signed(sram_36x128b_a1.mem[addr][15:8]),    $signed(sram_36x128b_a1.mem[addr][7:0]));
                    $write("But the golden answer is \n%d %d %d %d (ch0)\n%d %d %d %d (ch1)\n%d %d %d %d (ch2)\n%d %d %d %d (ch3)\n", 
                        $signed(unshuffle_ans_a1[addr-ans_offset][127:120]), $signed(unshuffle_ans_a1[addr-ans_offset][119:112]),
                        $signed(unshuffle_ans_a1[addr-ans_offset][111:104]), $signed(unshuffle_ans_a1[addr-ans_offset][103:96]), 
                        $signed(unshuffle_ans_a1[addr-ans_offset][95:88]),   $signed(unshuffle_ans_a1[addr-ans_offset][87:80]),
                        $signed(unshuffle_ans_a1[addr-ans_offset][79:72]),   $signed(unshuffle_ans_a1[addr-ans_offset][71:64]),
                        $signed(unshuffle_ans_a1[addr-ans_offset][63:56]),   $signed(unshuffle_ans_a1[addr-ans_offset][55:48]),
                        $signed(unshuffle_ans_a1[addr-ans_offset][47:40]),   $signed(unshuffle_ans_a1[addr-ans_offset][39:32]),
                        $signed(unshuffle_ans_a1[addr-ans_offset][31:24]),   $signed(unshuffle_ans_a1[addr-ans_offset][23:16]),
                        $signed(unshuffle_ans_a1[addr-ans_offset][15:8]),    $signed(unshuffle_ans_a1[addr-ans_offset][7:0]));
                end
            end
            A2: begin
                if(layer == UNSHUFFLE) begin
                    $write("Your answer at address %d is \n%d %d %d %d (ch0)\n%d %d %d %d (ch1)\n%d %d %d %d (ch2)\n%d %d %d %d (ch3)\n", m, 
                        $signed(sram_36x128b_a2.mem[addr][127:120]), $signed(sram_36x128b_a2.mem[addr][119:112]),
                        $signed(sram_36x128b_a2.mem[addr][111:104]), $signed(sram_36x128b_a2.mem[addr][103:96]), 
                        $signed(sram_36x128b_a2.mem[addr][95:88]),   $signed(sram_36x128b_a2.mem[addr][87:80]),
                        $signed(sram_36x128b_a2.mem[addr][79:72]),   $signed(sram_36x128b_a2.mem[addr][71:64]),
                        $signed(sram_36x128b_a2.mem[addr][63:56]),   $signed(sram_36x128b_a2.mem[addr][55:48]),
                        $signed(sram_36x128b_a2.mem[addr][47:40]),   $signed(sram_36x128b_a2.mem[addr][39:32]),
                        $signed(sram_36x128b_a2.mem[addr][31:24]),   $signed(sram_36x128b_a2.mem[addr][23:16]),
                        $signed(sram_36x128b_a2.mem[addr][15:8]),    $signed(sram_36x128b_a2.mem[addr][7:0]));
                    $write("But the golden answer is \n%d %d %d %d (ch0)\n%d %d %d %d (ch1)\n%d %d %d %d (ch2)\n%d %d %d %d (ch3)\n", 
                        $signed(unshuffle_ans_a2[addr-ans_offset][127:120]), $signed(unshuffle_ans_a2[addr-ans_offset][119:112]),
                        $signed(unshuffle_ans_a2[addr-ans_offset][111:104]), $signed(unshuffle_ans_a2[addr-ans_offset][103:96]), 
                        $signed(unshuffle_ans_a2[addr-ans_offset][95:88]),   $signed(unshuffle_ans_a2[addr-ans_offset][87:80]),
                        $signed(unshuffle_ans_a2[addr-ans_offset][79:72]),   $signed(unshuffle_ans_a2[addr-ans_offset][71:64]),
                        $signed(unshuffle_ans_a2[addr-ans_offset][63:56]),   $signed(unshuffle_ans_a2[addr-ans_offset][55:48]),
                        $signed(unshuffle_ans_a2[addr-ans_offset][47:40]),   $signed(unshuffle_ans_a2[addr-ans_offset][39:32]),
                        $signed(unshuffle_ans_a2[addr-ans_offset][31:24]),   $signed(unshuffle_ans_a2[addr-ans_offset][23:16]),
                        $signed(unshuffle_ans_a2[addr-ans_offset][15:8]),    $signed(unshuffle_ans_a2[addr-ans_offset][7:0]));
                end
            end
            A3: begin
                if(layer == UNSHUFFLE) begin
                    $write("Your answer at address %d is \n%d %d %d %d (ch0)\n%d %d %d %d (ch1)\n%d %d %d %d (ch2)\n%d %d %d %d (ch3)\n", m, 
                        $signed(sram_36x128b_a3.mem[addr][127:120]), $signed(sram_36x128b_a3.mem[addr][119:112]),
                        $signed(sram_36x128b_a3.mem[addr][111:104]), $signed(sram_36x128b_a3.mem[addr][103:96]), 
                        $signed(sram_36x128b_a3.mem[addr][95:88]),   $signed(sram_36x128b_a3.mem[addr][87:80]),
                        $signed(sram_36x128b_a3.mem[addr][79:72]),   $signed(sram_36x128b_a3.mem[addr][71:64]),
                        $signed(sram_36x128b_a3.mem[addr][63:56]),   $signed(sram_36x128b_a3.mem[addr][55:48]),
                        $signed(sram_36x128b_a3.mem[addr][47:40]),   $signed(sram_36x128b_a3.mem[addr][39:32]),
                        $signed(sram_36x128b_a3.mem[addr][31:24]),   $signed(sram_36x128b_a3.mem[addr][23:16]),
                        $signed(sram_36x128b_a3.mem[addr][15:8]),    $signed(sram_36x128b_a3.mem[addr][7:0]));
                    $write("But the golden answer is \n%d %d %d %d (ch0)\n%d %d %d %d (ch1)\n%d %d %d %d (ch2)\n%d %d %d %d (ch3)\n", 
                        $signed(unshuffle_ans_a3[addr-ans_offset][127:120]), $signed(unshuffle_ans_a3[addr-ans_offset][119:112]),
                        $signed(unshuffle_ans_a3[addr-ans_offset][111:104]), $signed(unshuffle_ans_a3[addr-ans_offset][103:96]), 
                        $signed(unshuffle_ans_a3[addr-ans_offset][95:88]),   $signed(unshuffle_ans_a3[addr-ans_offset][87:80]),
                        $signed(unshuffle_ans_a3[addr-ans_offset][79:72]),   $signed(unshuffle_ans_a3[addr-ans_offset][71:64]),
                        $signed(unshuffle_ans_a3[addr-ans_offset][63:56]),   $signed(unshuffle_ans_a3[addr-ans_offset][55:48]),
                        $signed(unshuffle_ans_a3[addr-ans_offset][47:40]),   $signed(unshuffle_ans_a3[addr-ans_offset][39:32]),
                        $signed(unshuffle_ans_a3[addr-ans_offset][31:24]),   $signed(unshuffle_ans_a3[addr-ans_offset][23:16]),
                        $signed(unshuffle_ans_a3[addr-ans_offset][15:8]),    $signed(unshuffle_ans_a3[addr-ans_offset][7:0]));
                end
            end
        endcase
    end

endtask

endmodule