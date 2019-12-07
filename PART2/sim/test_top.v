`timescale 1ns/100ps
`define PAT_START_NO 0
`define PAT_END_NO 0

module test_top;

localparam CH_NUM = 4;
localparam ACT_PER_ADDR = 4;
localparam BW_PER_ACT = 8;
localparam BW_PER_SRAM_GROUP_ADDR = CH_NUM*ACT_PER_ADDR*BW_PER_ACT;
localparam WEIGHT_PER_ADDR = 9, BIAS_PER_ADDR = 1;
localparam BW_PER_PARAM = 4;
localparam Pattern_N = 28*28;
real CYCLE = 10;

//====== module I/O =====
reg clk;
reg rst_n;

reg enable;
reg [BW_PER_ACT-1:0] input_data;   //8 bits
wire busy;
wire test_layer_finish;
wire valid;

//for SRAM weight
wire [WEIGHT_PER_ADDR*BW_PER_PARAM-1:0] sram_rdata_weight;
wire [10:0] sram_raddr_weight;

//for SRAM bias
wire [BIAS_PER_ADDR*BW_PER_PARAM-1:0] sram_rdata_bias;
wire [6:0] sram_raddr_bias;

//for SRAM group A & B
wire sram_wen_a0;
wire sram_wen_a1;
wire sram_wen_a2;
wire sram_wen_a3;

wire sram_wen_b0;
wire sram_wen_b1;
wire sram_wen_b2;
wire sram_wen_b3;
//128 bits
wire [BW_PER_SRAM_GROUP_ADDR-1:0] sram_rdata_a0;
wire [BW_PER_SRAM_GROUP_ADDR-1:0] sram_rdata_a1;
wire [BW_PER_SRAM_GROUP_ADDR-1:0] sram_rdata_a2;
wire [BW_PER_SRAM_GROUP_ADDR-1:0] sram_rdata_a3;

wire [BW_PER_SRAM_GROUP_ADDR-1:0] sram_rdata_b0;
wire [BW_PER_SRAM_GROUP_ADDR-1:0] sram_rdata_b1;
wire [BW_PER_SRAM_GROUP_ADDR-1:0] sram_rdata_b2;
wire [BW_PER_SRAM_GROUP_ADDR-1:0] sram_rdata_b3;

wire [5:0] sram_raddr_a0;
wire [5:0] sram_raddr_a1;
wire [5:0] sram_raddr_a2;
wire [5:0] sram_raddr_a3;

wire [5:0] sram_raddr_b0;
wire [5:0] sram_raddr_b1;
wire [5:0] sram_raddr_b2;
wire [5:0] sram_raddr_b3;
//16 bits
wire [CH_NUM*ACT_PER_ADDR-1:0] sram_bytemask_a;  
wire [CH_NUM*ACT_PER_ADDR-1:0] sram_bytemask_b;

wire [5:0] sram_waddr_a;
wire [5:0] sram_waddr_b;
//128 bits
wire [BW_PER_SRAM_GROUP_ADDR-1:0] sram_wdata_a;  
wire [BW_PER_SRAM_GROUP_ADDR-1:0] sram_wdata_b;

//====== top connection =====
Convnet_top #(
.CH_NUM(CH_NUM),
.ACT_PER_ADDR(ACT_PER_ADDR),
.BW_PER_ACT(BW_PER_ACT),
.WEIGHT_PER_ADDR(WEIGHT_PER_ADDR), 
.BIAS_PER_ADDR(BIAS_PER_ADDR),
.BW_PER_PARAM(BW_PER_PARAM)
)
Conv_top (
.clk(clk),
.rst_n(rst_n),
.enable(enable),
.busy(busy),
.input_data(input_data),
.test_layer_finish(test_layer_finish),
.valid(valid),

.sram_rdata_a0(sram_rdata_a0),
.sram_rdata_a1(sram_rdata_a1),
.sram_rdata_a2(sram_rdata_a2),
.sram_rdata_a3(sram_rdata_a3),
.sram_rdata_b0(sram_rdata_b0),
.sram_rdata_b1(sram_rdata_b1),
.sram_rdata_b2(sram_rdata_b2),
.sram_rdata_b3(sram_rdata_b3),
.sram_rdata_weight(sram_rdata_weight),
.sram_rdata_bias(sram_rdata_bias),

.sram_raddr_a0(sram_raddr_a0),
.sram_raddr_a1(sram_raddr_a1),
.sram_raddr_a2(sram_raddr_a2),
.sram_raddr_a3(sram_raddr_a3),
.sram_raddr_b0(sram_raddr_b0),
.sram_raddr_b1(sram_raddr_b1),
.sram_raddr_b2(sram_raddr_b2),
.sram_raddr_b3(sram_raddr_b3),
.sram_raddr_weight(sram_raddr_weight),
.sram_raddr_bias(sram_raddr_bias),

.sram_wen_a0(sram_wen_a0),
.sram_wen_a1(sram_wen_a1),
.sram_wen_a2(sram_wen_a2),
.sram_wen_a3(sram_wen_a3),
.sram_wen_b0(sram_wen_b0),
.sram_wen_b1(sram_wen_b1),
.sram_wen_b2(sram_wen_b2),
.sram_wen_b3(sram_wen_b3),

.sram_bytemask_a(sram_bytemask_a),
.sram_bytemask_b(sram_bytemask_b),

.sram_waddr_a(sram_waddr_a),
.sram_wdata_a(sram_wdata_a),
.sram_waddr_b(sram_waddr_b),
.sram_wdata_b(sram_wdata_b)
);
//====== sram connection =====
//weight sram
sram_1104x36b sram_1104x36b_weight(
.clk(clk),
.csb(1'b0),
.wsb(1'b1),
.wdata(36'd0), 
.waddr(11'd0), 
.raddr(sram_raddr_weight), 
.rdata(sram_rdata_weight)
);
//bias sram
sram_84x4b sram_84x4b_bias(
.clk(clk),
.csb(1'b0),
.wsb(1'b1),
.wdata(4'd0), 
.waddr(7'd0), 
.raddr(sram_raddr_bias), 
.rdata(sram_rdata_bias)
);
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
//activation sram group B
sram_36x128b sram_36x128b_b0(
.clk(clk),
.bytemask(sram_bytemask_b),
.csb(1'b0),
.wsb(sram_wen_b0),
.wdata(sram_wdata_b), 
.waddr(sram_waddr_b), 
.raddr(sram_raddr_b0), 
.rdata(sram_rdata_b0)
);

sram_36x128b sram_36x128b_b1(
.clk(clk),
.bytemask(sram_bytemask_b),
.csb(1'b0),
.wsb(sram_wen_b1),
.wdata(sram_wdata_b), 
.waddr(sram_waddr_b), 
.raddr(sram_raddr_b1), 
.rdata(sram_rdata_b1)
);

sram_36x128b sram_36x128b_b2(
.clk(clk),
.bytemask(sram_bytemask_b),
.csb(1'b0),
.wsb(sram_wen_b2),
.wdata(sram_wdata_b), 
.waddr(sram_waddr_b), 
.raddr(sram_raddr_b2), 
.rdata(sram_rdata_b2)
);

sram_36x128b sram_36x128b_b3(
.clk(clk),
.bytemask(sram_bytemask_b),
.csb(1'b0),
.wsb(sram_wen_b3),
.wdata(sram_wdata_b), 
.waddr(sram_waddr_b), 
.raddr(sram_raddr_b3), 
.rdata(sram_rdata_b3)
);

//========== Dump waveform ==========//
initial begin
    $fsdbDumpfile("eCNN_micro.fsdb");
    $fsdbDumpvars("+mda");
end

//========== Store parameters to SRAM ==========//
reg [WEIGHT_PER_ADDR*BW_PER_PARAM-1:0] conv1_w [0:15];
reg [WEIGHT_PER_ADDR*BW_PER_PARAM-1:0] conv2_w [0:63];
reg [WEIGHT_PER_ADDR*BW_PER_PARAM-1:0] conv3_w [0:1023];

reg [BW_PER_PARAM-1:0] conv1_b [0:3];
reg [BW_PER_PARAM-1:0] conv2_b [0:15];
reg [BW_PER_PARAM-1:0] conv3_b [0:63];

reg [1024*BW_PER_PARAM-1:0] fc1_w [0:500-1];
reg [500*BW_PER_PARAM-1:0] fc2_w [0:10-1];

reg [BW_PER_PARAM-1:0] fc1_b [0:499];
reg [BW_PER_PARAM-1:0] fc2_b [0:9];

reg [BW_PER_SRAM_GROUP_ADDR-1:0] unshuffle_ans_a0 [0:15];  //totally 16 addresses
reg [BW_PER_SRAM_GROUP_ADDR-1:0] unshuffle_ans_a1 [0:11];  //totally 12 addresses
reg [BW_PER_SRAM_GROUP_ADDR-1:0] unshuffle_ans_a2 [0:11];  //totally 12 addresses
reg [BW_PER_SRAM_GROUP_ADDR-1:0] unshuffle_ans_a3 [0:8];   //totally 9 addresses

reg [BW_PER_SRAM_GROUP_ADDR-1:0] conv1_ans_b0 [0:8];       //totally 9 addresses
reg [BW_PER_SRAM_GROUP_ADDR-1:0] conv1_ans_b1 [0:8];       //totally 9 addresses
reg [BW_PER_SRAM_GROUP_ADDR-1:0] conv1_ans_b2 [0:8];       //totally 9 addresses
reg [BW_PER_SRAM_GROUP_ADDR-1:0] conv1_ans_b3 [0:8];       //totally 9 addresses

reg [BW_PER_SRAM_GROUP_ADDR-1:0] conv2_ans_a0 [0:35];      //totally 36 addresses
reg [BW_PER_SRAM_GROUP_ADDR-1:0] conv2_ans_a1 [0:23];      //totally 24 addresses
reg [BW_PER_SRAM_GROUP_ADDR-1:0] conv2_ans_a2 [0:23];      //totally 24 addresses
reg [BW_PER_SRAM_GROUP_ADDR-1:0] conv2_ans_a3 [0:15];      //totally 16 addresses

reg [BW_PER_SRAM_GROUP_ADDR-1:0] pool_ans [0:63];          //totally 64 addresses 

integer i;

initial begin
    //load parameters data
    $readmemb("parameter/conv1_weight.dat", conv1_w);
    $readmemb("parameter/conv1_bias.dat", conv1_b);
    $readmemb("parameter/conv2_weight.dat", conv2_w);
    $readmemb("parameter/conv2_bias.dat", conv2_b);
    $readmemb("parameter/conv3_weight.dat", conv3_w);
    $readmemb("parameter/conv3_bias.dat", conv3_b);
    $readmemb("parameter/fc1_weight.dat", fc1_w);
    $readmemb("parameter/fc1_bias.dat", fc1_b);
    $readmemb("parameter/fc2_weight.dat", fc2_w);
    $readmemb("parameter/fc2_bias.dat", fc2_b);

    //load golden data
    $readmemb("golden/unshuffle_a0_gold.dat", unshuffle_ans_a0);
    $readmemb("golden/unshuffle_a1_gold.dat", unshuffle_ans_a1);
    $readmemb("golden/unshuffle_a2_gold.dat", unshuffle_ans_a2);
    $readmemb("golden/unshuffle_a3_gold.dat", unshuffle_ans_a3);
    $readmemb("golden/conv1_b0_gold.dat", conv1_ans_b0);
    $readmemb("golden/conv1_b1_gold.dat", conv1_ans_b1);
    $readmemb("golden/conv1_b2_gold.dat", conv1_ans_b2);
    $readmemb("golden/conv1_b3_gold.dat", conv1_ans_b3);
    $readmemb("golden/conv2_a0_gold.dat", conv2_ans_a0);
    $readmemb("golden/conv2_a1_gold.dat", conv2_ans_a1);
    $readmemb("golden/conv2_a2_gold.dat", conv2_ans_a2);
    $readmemb("golden/conv2_a3_gold.dat", conv2_ans_a3);
    $readmemb("golden/pool_gold.dat", pool_ans);

    //store weights into sram
    for(i=0; i<16; i=i+1) begin
        sram_1104x36b_weight.load_param(i, conv1_w[i]);
    end
    for(i=16; i<80; i=i+1) begin
        sram_1104x36b_weight.load_param(i, conv2_w[i-16]);
    end
    for(i=80; i<1104; i=i+1) begin
        sram_1104x36b_weight.load_param(i, conv3_w[i-80]);  
    end

    //store biases into sram
    for(i=0; i<4; i=i+1) begin
        sram_84x4b_bias.load_param(i, conv1_b[i]);
    end
    for(i=4; i<20; i=i+1) begin
        sram_84x4b_bias.load_param(i, conv2_b[i-4]);
    end
    for(i=20; i<84; i=i+1) begin
        sram_84x4b_bias.load_param(i, conv3_b[i-20]);
    end
end

//========== system reset ==========//
initial begin
    clk = 0;
    rst_n = 1;
end

initial begin
    #(CYCLE*100000);
    $finish;
end

always #(CYCLE/2) clk = ~clk;

//========== Pattern feeder ==========//
reg [BW_PER_ACT-1:0] mem_img [0:Pattern_N-1];
integer pat_no, index;
integer m;
integer cycle_cnt;
reg [1:0] test_layer;

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
        cycle_cnt = 0;
        rst_n = 1'b1;
        enable = 1'b1;

        while(!valid) begin
            @(negedge clk);
            cycle_cnt = cycle_cnt+1;
            if(!busy && index<Pattern_N) begin
                input_data = mem_img[index];
                index = index+1;
            end
            //========== Check pattern answer ==========//
            //set test_layer to UNSHUFFLE, CONV1, CONV2 or POOL to choose which layer outputs you want to check
            //be aware of test_layer_finish is needed for UNSHUFFLE, CONV1 and CONV2
            //valid is needed for POOL 
            test_layer = CONV2;
            if(test_layer == UNSHUFFLE) begin
                if(test_layer_finish) begin
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
                    $display("Congratulations! Your unshuffle is correct ^___^");
                    $finish;
                end
            end
            else if(test_layer == CONV1) begin
                if(test_layer_finish) begin
                    $display("Start to check conv1 outputs in sram #B0...");
                    for(m=0; m<3; m=m+1) begin
                        if(conv1_ans_b0[m] == sram_36x128b_b0.mem[m])
                            $write("sram #B0 address: %d PASS!!\n", m);
                        else begin
                            $write("You have wrong answer in the sram #B0 !!!\n\n");
                            display_error(4, 1, m, 0);
                            $finish;
                        end
                    end
                    for(m=6; m<9; m=m+1) begin
                        if(conv1_ans_b0[m-3] == sram_36x128b_b0.mem[m])
                            $write("sram #B0 address: %d PASS!!\n", m);
                        else begin
                            $write("You have wrong answer in the sram #B0 !!!\n\n");
                            display_error(4, 1, m, 3);
                            $finish;
                        end
                    end
                    for(m=12; m<15; m=m+1) begin
                        if(conv1_ans_b0[m-6] == sram_36x128b_b0.mem[m])
                            $write("sram #B0 address: %d PASS!!\n", m);
                        else begin
                            $write("You have wrong answer in the sram #B0 !!!\n\n");
                            display_error(4, 1, m, 6);
                            $finish;
                        end
                    end
                    $display("\nConv1 outputs in sram #B0 are successfully passed!");
                    $display("===============================================================================");
                    $display("Start to check conv1 outputs in sram #B1...");
                    for(m=0; m<3; m=m+1) begin
                        if(conv1_ans_b1[m] == sram_36x128b_b1.mem[m])
                            $write("sram #B1 address: %d PASS!!\n", m);
                        else begin
                            $write("You have wrong answer in the sram #B1 !!!\n\n");
                            display_error(5, 1, m, 0);
                            $finish;
                        end
                    end
                    for(m=6; m<9; m=m+1) begin
                        if(conv1_ans_b1[m-3] == sram_36x128b_b1.mem[m])
                            $write("sram #B1 address: %d PASS!!\n", m);
                        else begin
                            $write("You have wrong answer in the sram #B1 !!!\n\n");
                            display_error(5, 1, m, 3);
                            $finish;
                        end
                    end
                    for(m=12; m<15; m=m+1) begin
                        if(conv1_ans_b1[m-6] == sram_36x128b_b1.mem[m])
                            $write("sram #B1 address: %d PASS!!\n", m);
                        else begin
                            $write("You have wrong answer in the sram #B1 !!!\n\n");
                            display_error(5, 1, m, 6);
                            $finish;
                        end
                    end
                    $display("\nConv1 outputs in sram #B1 are successfully passed!");
                    $display("===============================================================================");
                    $display("Start to check conv1 outputs in sram #B2...");
                    for(m=0; m<3; m=m+1) begin
                        if(conv1_ans_b2[m] == sram_36x128b_b2.mem[m])
                            $write("sram #B2 address: %d PASS!!\n", m);
                        else begin
                            $write("You have wrong answer in the sram #B2 !!!\n\n");
                            display_error(6, 1, m, 0);
                            $finish;
                        end
                    end
                    for(m=6; m<9; m=m+1) begin
                        if(conv1_ans_b2[m-3] == sram_36x128b_b2.mem[m])
                            $write("sram #B2 address: %d PASS!!\n", m);
                        else begin
                            $write("You have wrong answer in the sram #B2 !!!\n\n");
                            display_error(6, 1, m, 3);
                            $finish;
                        end
                    end
                    for(m=12; m<15; m=m+1) begin
                        if(conv1_ans_b2[m-6] == sram_36x128b_b2.mem[m])
                            $write("sram #B2 address: %d PASS!!\n", m);
                        else begin
                            $write("You have wrong answer in the sram #B2 !!!\n\n");
                            display_error(6, 1, m, 6);
                            $finish;
                        end
                    end
                    $display("\nConv1 outputs in sram #B2 are successfully passed!");
                    $display("===============================================================================");
                    $display("Start to check conv1 outputs in sram #B3...");
                    for(m=0; m<3; m=m+1) begin
                        if(conv1_ans_b3[m] == sram_36x128b_b3.mem[m])
                            $write("sram #B3 address: %d PASS!!\n", m);
                        else begin
                            $write("You have wrong answer in the sram #B3 !!!\n\n");
                            display_error(7, 1, m, 0);
                            $finish;
                        end
                    end
                    for(m=6; m<9; m=m+1) begin
                        if(conv1_ans_b3[m-3] == sram_36x128b_b3.mem[m])
                            $write("sram #B3 address: %d PASS!!\n", m);
                        else begin
                            $write("You have wrong answer in the sram #B3 !!!\n\n");
                            display_error(7, 1, m, 3);
                            $finish;
                        end
                    end
                    for(m=12; m<15; m=m+1) begin
                        if(conv1_ans_b3[m-6] == sram_36x128b_b3.mem[m])
                            $write("sram #B3 address: %d PASS!!\n", m);
                        else begin
                            $write("You have wrong answer in the sram #B3 !!!\n\n");
                            display_error(7, 1, m, 6);
                            $finish;
                        end
                    end
                    $display("\nConv1 outputs in sram #B3 are successfully passed!");
                    $display("===================================================>");
                    $display("Congratulations! Your conv1 is correct ^___^");
                    $finish;
                end
            end
            else if(test_layer == CONV2) begin
                if(test_layer_finish) begin
                    $display("Start to check conv2 outputs in sram #A0...");
                    for(m=0; m<36; m=m+1) begin
                        if(conv2_ans_a0[m] == sram_36x128b_a0.mem[m])
                            $write("sram #A0 address: %d PASS!!\n", m); 
                        else begin
                            $write("You have wrong answer in the sram #A0 !!!\n\n");
                            display_error(0, 2, m, 0);
                            // $finish;
                        end
                    end
                    $display("\nConv2 outputs in sram #A0 are successfully passed!");
                    $display("===============================================================================");
                    $display("Start to check conv2 outputs in sram #A1...");
                    for(m=0; m<2; m=m+1) begin
                        if(conv2_ans_a1[m] == sram_36x128b_a1.mem[m])
                            $write("sram #A1 address: %d PASS!!\n", m); 
                        else begin
                            $write("You have wrong answer in the sram #A1 !!!\n\n");
                            display_error(1, 2, m, 0);
                            // $finish;
                        end
                    end
                    for(m=3; m<5; m=m+1) begin
                        if(conv2_ans_a1[m-1] == sram_36x128b_a1.mem[m])
                            $write("sram #A1 address: %d PASS!!\n", m); 
                        else begin
                            $write("You have wrong answer in the sram #A1 !!!\n\n");
                            display_error(1, 2, m, 1);
                            // $finish;
                        end
                    end
                    for(m=6; m<8; m=m+1) begin
                        if(conv2_ans_a1[m-2] == sram_36x128b_a1.mem[m])
                            $write("sram #A1 address: %d PASS!!\n", m); 
                        else begin
                            $write("You have wrong answer in the sram #A1 !!!\n\n");
                            display_error(1, 2, m, 2);
                            // $finish;
                        end
                    end
                    for(m=9; m<11; m=m+1) begin
                        if(conv2_ans_a1[m-3] == sram_36x128b_a1.mem[m])
                            $write("sram #A1 address: %d PASS!!\n", m); 
                        else begin
                            $write("You have wrong answer in the sram #A1 !!!\n\n");
                            display_error(1, 2, m, 3);
                            // $finish;
                        end
                    end
                    for(m=12; m<14; m=m+1) begin
                        if(conv2_ans_a1[m-4] == sram_36x128b_a1.mem[m])
                            $write("sram #A1 address: %d PASS!!\n", m); 
                        else begin
                            $write("You have wrong answer in the sram #A1 !!!\n\n");
                            display_error(1, 2, m, 4);
                            // $finish;
                        end
                    end
                    for(m=15; m<17; m=m+1) begin
                        if(conv2_ans_a1[m-5] == sram_36x128b_a1.mem[m])
                            $write("sram #A1 address: %d PASS!!\n", m); 
                        else begin
                            $write("You have wrong answer in the sram #A1 !!!\n\n");
                            display_error(1, 2, m, 5);
                            // $finish;
                        end
                    end
                    for(m=18; m<20; m=m+1) begin
                        if(conv2_ans_a1[m-6] == sram_36x128b_a1.mem[m])
                            $write("sram #A1 address: %d PASS!!\n", m); 
                        else begin
                            $write("You have wrong answer in the sram #A1 !!!\n\n");
                            display_error(1, 2, m, 6);
                            // $finish;
                        end
                    end
                    for(m=21; m<23; m=m+1) begin
                        if(conv2_ans_a1[m-7] == sram_36x128b_a1.mem[m])
                            $write("sram #A1 address: %d PASS!!\n", m); 
                        else begin
                            $write("You have wrong answer in the sram #A1 !!!\n\n");
                            display_error(1, 2, m, 7);
                            // $finish;
                        end
                    end
                    for(m=24; m<26; m=m+1) begin
                        if(conv2_ans_a1[m-8] == sram_36x128b_a1.mem[m])
                            $write("sram #A1 address: %d PASS!!\n", m); 
                        else begin
                            $write("You have wrong answer in the sram #A1 !!!\n\n");
                            display_error(1, 2, m, 8);
                            // $finish;
                        end
                    end
                    for(m=27; m<29; m=m+1) begin
                        if(conv2_ans_a1[m-9] == sram_36x128b_a1.mem[m])
                            $write("sram #A1 address: %d PASS!!\n", m); 
                        else begin
                            $write("You have wrong answer in the sram #A1 !!!\n\n");
                            display_error(1, 2, m, 9);
                            // $finish;
                        end
                    end
                    for(m=30; m<32; m=m+1) begin
                        if(conv2_ans_a1[m-10] == sram_36x128b_a1.mem[m])
                            $write("sram #A1 address: %d PASS!!\n", m); 
                        else begin
                            $write("You have wrong answer in the sram #A1 !!!\n\n");
                            display_error(1, 2, m, 10);
                            // $finish;
                        end
                    end
                    for(m=33; m<35; m=m+1) begin
                        if(conv2_ans_a1[m-11] == sram_36x128b_a1.mem[m])
                            $write("sram #A1 address: %d PASS!!\n", m); 
                        else begin
                            $write("You have wrong answer in the sram #A1 !!!\n\n");
                            display_error(1, 2, m, 11);
                            // $finish;
                        end
                    end
                    $display("\nConv2 outputs in sram #A1 are successfully passed!");
                    $display("===============================================================================");
                    $display("Start to check conv2 outputs in sram #A2...");
                    for(m=0; m<12; m=m+1) begin
                        if(conv2_ans_a2[m] == sram_36x128b_a2.mem[m])  
                            $write("sram #A2 address: %d PASS!!\n", m); 
                        else begin
                            $write("You have wrong answer in the sram #A2 !!!\n\n");
                            display_error(2, 2, m, 0);
                            // $finish;
                        end
                    end
                    for(m=18; m<30; m=m+1) begin
                        if(conv2_ans_a2[m-6] == sram_36x128b_a2.mem[m])  
                            $write("sram #A2 address: %d PASS!!\n", m); 
                        else begin
                            $write("You have wrong answer in the sram #A2 !!!\n\n");
                            display_error(2, 2, m, 6);
                            // $finish;
                        end
                    end
                    $display("\nConv2 outputs in sram #A2 are successfully passed!");
                    $display("===============================================================================");
                    $display("Start to check conv2 outputs in sram #A3...");
                    for(m=0; m<2; m=m+1) begin
                        if(conv2_ans_a3[m] == sram_36x128b_a3.mem[m])
                            $write("sram #A3 address: %d PASS!!\n", m);
                        else begin
                            $write("You have wrong answer in the sram #A3 !!!\n\n");
                            display_error(3, 2, m, 0);
                            // $finish;
                        end
                    end
                    for(m=3; m<5; m=m+1) begin
                        if(conv2_ans_a3[m-1] == sram_36x128b_a3.mem[m])
                            $write("sram #A3 address: %d PASS!!\n", m);
                        else begin
                            $write("You have wrong answer in the sram #A3 !!!\n\n");
                            display_error(3, 2, m, 1);
                            // $finish;
                        end
                    end
                    for(m=6; m<8; m=m+1) begin
                        if(conv2_ans_a3[m-2] == sram_36x128b_a3.mem[m])
                            $write("sram #A3 address: %d PASS!!\n", m);
                        else begin
                            $write("You have wrong answer in the sram #A3 !!!\n\n");
                            display_error(3, 2, m, 2);
                            // $finish;
                        end
                    end
                    for(m=9; m<11; m=m+1) begin
                        if(conv2_ans_a3[m-3] == sram_36x128b_a3.mem[m])
                            $write("sram #A3 address: %d PASS!!\n", m);
                        else begin
                            $write("You have wrong answer in the sram #A3 !!!\n\n");
                            display_error(3, 2, m, 3);
                            // $finish;
                        end
                    end
                    for(m=18; m<20; m=m+1) begin
                        if(conv2_ans_a3[m-10] == sram_36x128b_a3.mem[m])
                            $write("sram #A3 address: %d PASS!!\n", m);
                        else begin
                            $write("You have wrong answer in the sram #A3 !!!\n\n");
                            display_error(3, 2, m, 10);
                            // $finish;
                        end
                    end
                    for(m=21; m<23; m=m+1) begin
                        if(conv2_ans_a3[m-11] == sram_36x128b_a3.mem[m])
                            $write("sram #A3 address: %d PASS!!\n", m);
                        else begin
                            $write("You have wrong answer in the sram #A3 !!!\n\n");
                            display_error(3, 2, m, 11);
                            // $finish;
                        end
                    end
                    for(m=24; m<26; m=m+1) begin
                        if(conv2_ans_a3[m-12] == sram_36x128b_a3.mem[m])
                            $write("sram #A3 address: %d PASS!!\n", m);
                        else begin
                            $write("You have wrong answer in the sram #A3 !!!\n\n");
                            display_error(3, 2, m, 12);
                            // $finish;
                        end
                    end
                    for(m=27; m<29; m=m+1) begin
                        if(conv2_ans_a3[m-13] == sram_36x128b_a3.mem[m])
                            $write("sram #A3 address: %d PASS!!\n", m);
                        else begin
                            $write("You have wrong answer in the sram #A3 !!!\n\n");
                            display_error(3, 2, m, 13);
                            // $finish;
                        end
                    end
                    $display("\nConv2 outputs in sram #A3 are successfully passed!");
                    $display("===================================================>");
                    $display("Congratulations! Your conv2 is correct ^___^");
                    $finish;
                end
            end
            else begin
                if(valid) begin
                    for(m=0; m<36; m=m+1) begin
                        if(pool_ans[m] == sram_36x128b_b0.mem[m])
                            $write("sram #B0 address: %d PASS!!\n", m); 
                        else begin
                            $write("You have wrong answer in the sram #B0 !!!\n\n");
                            $write("Your answer at address %d is \n%d %d %d %d (ch0)\n%d %d %d %d (ch1)\n%d %d %d %d (ch2)\n%d %d %d %d (ch3)\n", m, 
                                $signed(sram_36x128b_b0.mem[m][127:120]), $signed(sram_36x128b_b0.mem[m][119:112]),
                                $signed(sram_36x128b_b0.mem[m][111:104]), $signed(sram_36x128b_b0.mem[m][103:96]), 
                                $signed(sram_36x128b_b0.mem[m][95:88]),   $signed(sram_36x128b_b0.mem[m][87:80]),
                                $signed(sram_36x128b_b0.mem[m][79:72]),   $signed(sram_36x128b_b0.mem[m][71:64]),
                                $signed(sram_36x128b_b0.mem[m][63:56]),   $signed(sram_36x128b_b0.mem[m][55:48]),
                                $signed(sram_36x128b_b0.mem[m][47:40]),   $signed(sram_36x128b_b0.mem[m][39:32]),
                                $signed(sram_36x128b_b0.mem[m][31:24]),   $signed(sram_36x128b_b0.mem[m][23:16]),
                                $signed(sram_36x128b_b0.mem[m][15:8]),    $signed(sram_36x128b_b0.mem[m][7:0]));
                            $write("But the golden answer is \n%d %d %d %d (ch0)\n%d %d %d %d (ch1)\n%d %d %d %d (ch2)\n%d %d %d %d (ch3)\n", 
                                $signed(pool_ans[m][127:120]), $signed(pool_ans[m][119:112]),
                                $signed(pool_ans[m][111:104]), $signed(pool_ans[m][103:96]), 
                                $signed(pool_ans[m][95:88]),   $signed(pool_ans[m][87:80]),
                                $signed(pool_ans[m][79:72]),   $signed(pool_ans[m][71:64]),
                                $signed(pool_ans[m][63:56]),   $signed(pool_ans[m][55:48]),
                                $signed(pool_ans[m][47:40]),   $signed(pool_ans[m][39:32]),
                                $signed(pool_ans[m][31:24]),   $signed(pool_ans[m][23:16]),
                                $signed(pool_ans[m][15:8]),    $signed(pool_ans[m][7:0]));
                            $finish;
                        end
                    end
                    $display("\nAnswers in sram #B0 correct.");
                    $display("===============================================================================");
                    for(m=36; m<64; m=m+1) begin
                        if(pool_ans[m] == sram_36x128b_b1.mem[m-36])
                            $write("sram #B1 address: %d PASS!!\n", m-36); 
                        else begin
                            $write("You have wrong answer in the sram #B1 !!!\n\n");
                            $write("Your answer at address %d is \n%d %d %d %d (ch0)\n%d %d %d %d (ch1)\n%d %d %d %d (ch2)\n%d %d %d %d (ch3)\n", m-36, 
                                $signed(sram_36x128b_b1.mem[m-36][127:120]), $signed(sram_36x128b_b1.mem[m-36][119:112]),
                                $signed(sram_36x128b_b1.mem[m-36][111:104]), $signed(sram_36x128b_b1.mem[m-36][103:96]), 
                                $signed(sram_36x128b_b1.mem[m-36][95:88]),   $signed(sram_36x128b_b1.mem[m-36][87:80]),
                                $signed(sram_36x128b_b1.mem[m-36][79:72]),   $signed(sram_36x128b_b1.mem[m-36][71:64]),
                                $signed(sram_36x128b_b1.mem[m-36][63:56]),   $signed(sram_36x128b_b1.mem[m-36][55:48]),
                                $signed(sram_36x128b_b1.mem[m-36][47:40]),   $signed(sram_36x128b_b1.mem[m-36][39:32]),
                                $signed(sram_36x128b_b1.mem[m-36][31:24]),   $signed(sram_36x128b_b1.mem[m-36][23:16]),
                                $signed(sram_36x128b_b1.mem[m-36][15:8]),    $signed(sram_36x128b_b1.mem[m-36][7:0]));
                            $write("But the golden answer is \n%d %d %d %d (ch0)\n%d %d %d %d (ch1)\n%d %d %d %d (ch2)\n%d %d %d %d (ch3)\n", 
                                $signed(pool_ans[m][127:120]), $signed(pool_ans[m][119:112]),
                                $signed(pool_ans[m][111:104]), $signed(pool_ans[m][103:96]), 
                                $signed(pool_ans[m][95:88]),   $signed(pool_ans[m][87:80]),
                                $signed(pool_ans[m][79:72]),   $signed(pool_ans[m][71:64]),
                                $signed(pool_ans[m][63:56]),   $signed(pool_ans[m][55:48]),
                                $signed(pool_ans[m][47:40]),   $signed(pool_ans[m][39:32]),
                                $signed(pool_ans[m][31:24]),   $signed(pool_ans[m][23:16]),
                                $signed(pool_ans[m][15:8]),    $signed(pool_ans[m][7:0]));
                            $finish;
                        end
                    end
                    $display("\nAnswers in sram #B1 correct.");
                    $display("\n===================================================>");
                    $display("Congratulations! Simulation is successfully passed!");
                end
            end
        end
    end
    FC1_layer;
    FC2_layer;
    $display("Total cycle count = %d", cycle_cnt);
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
               $write("%d", mem_img[this_i*28 + this_j]);
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
                else begin
                    //CONV2
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
                        $signed(conv2_ans_a0[addr-ans_offset][127:120]), $signed(conv2_ans_a0[addr-ans_offset][119:112]),
                        $signed(conv2_ans_a0[addr-ans_offset][111:104]), $signed(conv2_ans_a0[addr-ans_offset][103:96]), 
                        $signed(conv2_ans_a0[addr-ans_offset][95:88]),   $signed(conv2_ans_a0[addr-ans_offset][87:80]),
                        $signed(conv2_ans_a0[addr-ans_offset][79:72]),   $signed(conv2_ans_a0[addr-ans_offset][71:64]),
                        $signed(conv2_ans_a0[addr-ans_offset][63:56]),   $signed(conv2_ans_a0[addr-ans_offset][55:48]),
                        $signed(conv2_ans_a0[addr-ans_offset][47:40]),   $signed(conv2_ans_a0[addr-ans_offset][39:32]),
                        $signed(conv2_ans_a0[addr-ans_offset][31:24]),   $signed(conv2_ans_a0[addr-ans_offset][23:16]),
                        $signed(conv2_ans_a0[addr-ans_offset][15:8]),    $signed(conv2_ans_a0[addr-ans_offset][7:0]));
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
                else begin
                    //CONV2
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
                        $signed(conv2_ans_a1[addr-ans_offset][127:120]), $signed(conv2_ans_a1[addr-ans_offset][119:112]),
                        $signed(conv2_ans_a1[addr-ans_offset][111:104]), $signed(conv2_ans_a1[addr-ans_offset][103:96]), 
                        $signed(conv2_ans_a1[addr-ans_offset][95:88]),   $signed(conv2_ans_a1[addr-ans_offset][87:80]),
                        $signed(conv2_ans_a1[addr-ans_offset][79:72]),   $signed(conv2_ans_a1[addr-ans_offset][71:64]),
                        $signed(conv2_ans_a1[addr-ans_offset][63:56]),   $signed(conv2_ans_a1[addr-ans_offset][55:48]),
                        $signed(conv2_ans_a1[addr-ans_offset][47:40]),   $signed(conv2_ans_a1[addr-ans_offset][39:32]),
                        $signed(conv2_ans_a1[addr-ans_offset][31:24]),   $signed(conv2_ans_a1[addr-ans_offset][23:16]),
                        $signed(conv2_ans_a1[addr-ans_offset][15:8]),    $signed(conv2_ans_a1[addr-ans_offset][7:0]));
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
                else begin
                    //CONV2
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
                        $signed(conv2_ans_a2[addr-ans_offset][127:120]), $signed(conv2_ans_a2[addr-ans_offset][119:112]),
                        $signed(conv2_ans_a2[addr-ans_offset][111:104]), $signed(conv2_ans_a2[addr-ans_offset][103:96]), 
                        $signed(conv2_ans_a2[addr-ans_offset][95:88]),   $signed(conv2_ans_a2[addr-ans_offset][87:80]),
                        $signed(conv2_ans_a2[addr-ans_offset][79:72]),   $signed(conv2_ans_a2[addr-ans_offset][71:64]),
                        $signed(conv2_ans_a2[addr-ans_offset][63:56]),   $signed(conv2_ans_a2[addr-ans_offset][55:48]),
                        $signed(conv2_ans_a2[addr-ans_offset][47:40]),   $signed(conv2_ans_a2[addr-ans_offset][39:32]),
                        $signed(conv2_ans_a2[addr-ans_offset][31:24]),   $signed(conv2_ans_a2[addr-ans_offset][23:16]),
                        $signed(conv2_ans_a2[addr-ans_offset][15:8]),    $signed(conv2_ans_a2[addr-ans_offset][7:0]));
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
                else begin
                    //CONV2
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
                        $signed(conv2_ans_a3[addr-ans_offset][127:120]), $signed(conv2_ans_a3[addr-ans_offset][119:112]),
                        $signed(conv2_ans_a3[addr-ans_offset][111:104]), $signed(conv2_ans_a3[addr-ans_offset][103:96]), 
                        $signed(conv2_ans_a3[addr-ans_offset][95:88]),   $signed(conv2_ans_a3[addr-ans_offset][87:80]),
                        $signed(conv2_ans_a3[addr-ans_offset][79:72]),   $signed(conv2_ans_a3[addr-ans_offset][71:64]),
                        $signed(conv2_ans_a3[addr-ans_offset][63:56]),   $signed(conv2_ans_a3[addr-ans_offset][55:48]),
                        $signed(conv2_ans_a3[addr-ans_offset][47:40]),   $signed(conv2_ans_a3[addr-ans_offset][39:32]),
                        $signed(conv2_ans_a3[addr-ans_offset][31:24]),   $signed(conv2_ans_a3[addr-ans_offset][23:16]),
                        $signed(conv2_ans_a3[addr-ans_offset][15:8]),    $signed(conv2_ans_a3[addr-ans_offset][7:0]));
                end
            end
            B0: begin
                $write("Your answer at address %d is \n%d %d %d %d (ch0)\n%d %d %d %d (ch1)\n%d %d %d %d (ch2)\n%d %d %d %d (ch3)\n", m, 
                    $signed(sram_36x128b_b0.mem[addr][127:120]), $signed(sram_36x128b_b0.mem[addr][119:112]),
                    $signed(sram_36x128b_b0.mem[addr][111:104]), $signed(sram_36x128b_b0.mem[addr][103:96]), 
                    $signed(sram_36x128b_b0.mem[addr][95:88]),   $signed(sram_36x128b_b0.mem[addr][87:80]),
                    $signed(sram_36x128b_b0.mem[addr][79:72]),   $signed(sram_36x128b_b0.mem[addr][71:64]),
                    $signed(sram_36x128b_b0.mem[addr][63:56]),   $signed(sram_36x128b_b0.mem[addr][55:48]),
                    $signed(sram_36x128b_b0.mem[addr][47:40]),   $signed(sram_36x128b_b0.mem[addr][39:32]),
                    $signed(sram_36x128b_b0.mem[addr][31:24]),   $signed(sram_36x128b_b0.mem[addr][23:16]),
                    $signed(sram_36x128b_b0.mem[addr][15:8]),    $signed(sram_36x128b_b0.mem[addr][7:0]));
                $write("But the golden answer is \n%d %d %d %d (ch0)\n%d %d %d %d (ch1)\n%d %d %d %d (ch2)\n%d %d %d %d (ch3)\n", 
                    $signed(conv1_ans_b0[addr-ans_offset][127:120]), $signed(conv1_ans_b0[addr-ans_offset][119:112]),
                    $signed(conv1_ans_b0[addr-ans_offset][111:104]), $signed(conv1_ans_b0[addr-ans_offset][103:96]), 
                    $signed(conv1_ans_b0[addr-ans_offset][95:88]),   $signed(conv1_ans_b0[addr-ans_offset][87:80]),
                    $signed(conv1_ans_b0[addr-ans_offset][79:72]),   $signed(conv1_ans_b0[addr-ans_offset][71:64]),
                    $signed(conv1_ans_b0[addr-ans_offset][63:56]),   $signed(conv1_ans_b0[addr-ans_offset][55:48]),
                    $signed(conv1_ans_b0[addr-ans_offset][47:40]),   $signed(conv1_ans_b0[addr-ans_offset][39:32]),
                    $signed(conv1_ans_b0[addr-ans_offset][31:24]),   $signed(conv1_ans_b0[addr-ans_offset][23:16]),
                    $signed(conv1_ans_b0[addr-ans_offset][15:8]),    $signed(conv1_ans_b0[addr-ans_offset][7:0]));
            end
            B1: begin
                $write("Your answer at address %d is \n%d %d %d %d (ch0)\n%d %d %d %d (ch1)\n%d %d %d %d (ch2)\n%d %d %d %d (ch3)\n", m, 
                    $signed(sram_36x128b_b1.mem[addr][127:120]), $signed(sram_36x128b_b1.mem[addr][119:112]),
                    $signed(sram_36x128b_b1.mem[addr][111:104]), $signed(sram_36x128b_b1.mem[addr][103:96]), 
                    $signed(sram_36x128b_b1.mem[addr][95:88]),   $signed(sram_36x128b_b1.mem[addr][87:80]),
                    $signed(sram_36x128b_b1.mem[addr][79:72]),   $signed(sram_36x128b_b1.mem[addr][71:64]),
                    $signed(sram_36x128b_b1.mem[addr][63:56]),   $signed(sram_36x128b_b1.mem[addr][55:48]),
                    $signed(sram_36x128b_b1.mem[addr][47:40]),   $signed(sram_36x128b_b1.mem[addr][39:32]),
                    $signed(sram_36x128b_b1.mem[addr][31:24]),   $signed(sram_36x128b_b1.mem[addr][23:16]),
                    $signed(sram_36x128b_b1.mem[addr][15:8]),    $signed(sram_36x128b_b1.mem[addr][7:0]));
                $write("But the golden answer is \n%d %d %d %d (ch0)\n%d %d %d %d (ch1)\n%d %d %d %d (ch2)\n%d %d %d %d (ch3)\n", 
                    $signed(conv1_ans_b1[addr-ans_offset][127:120]), $signed(conv1_ans_b1[addr-ans_offset][119:112]),
                    $signed(conv1_ans_b1[addr-ans_offset][111:104]), $signed(conv1_ans_b1[addr-ans_offset][103:96]), 
                    $signed(conv1_ans_b1[addr-ans_offset][95:88]),   $signed(conv1_ans_b1[addr-ans_offset][87:80]),
                    $signed(conv1_ans_b1[addr-ans_offset][79:72]),   $signed(conv1_ans_b1[addr-ans_offset][71:64]),
                    $signed(conv1_ans_b1[addr-ans_offset][63:56]),   $signed(conv1_ans_b1[addr-ans_offset][55:48]),
                    $signed(conv1_ans_b1[addr-ans_offset][47:40]),   $signed(conv1_ans_b1[addr-ans_offset][39:32]),
                    $signed(conv1_ans_b1[addr-ans_offset][31:24]),   $signed(conv1_ans_b1[addr-ans_offset][23:16]),
                    $signed(conv1_ans_b1[addr-ans_offset][15:8]),    $signed(conv1_ans_b1[addr-ans_offset][7:0]));
            end
            B2: begin
                $write("Your answer at address %d is \n%d %d %d %d (ch0)\n%d %d %d %d (ch1)\n%d %d %d %d (ch2)\n%d %d %d %d (ch3)\n", m, 
                    $signed(sram_36x128b_b2.mem[addr][127:120]), $signed(sram_36x128b_b2.mem[addr][119:112]),
                    $signed(sram_36x128b_b2.mem[addr][111:104]), $signed(sram_36x128b_b2.mem[addr][103:96]), 
                    $signed(sram_36x128b_b2.mem[addr][95:88]),   $signed(sram_36x128b_b2.mem[addr][87:80]),
                    $signed(sram_36x128b_b2.mem[addr][79:72]),   $signed(sram_36x128b_b2.mem[addr][71:64]),
                    $signed(sram_36x128b_b2.mem[addr][63:56]),   $signed(sram_36x128b_b2.mem[addr][55:48]),
                    $signed(sram_36x128b_b2.mem[addr][47:40]),   $signed(sram_36x128b_b2.mem[addr][39:32]),
                    $signed(sram_36x128b_b2.mem[addr][31:24]),   $signed(sram_36x128b_b2.mem[addr][23:16]),
                    $signed(sram_36x128b_b2.mem[addr][15:8]),    $signed(sram_36x128b_b2.mem[addr][7:0]));
                $write("But the golden answer is \n%d %d %d %d (ch0)\n%d %d %d %d (ch1)\n%d %d %d %d (ch2)\n%d %d %d %d (ch3)\n", 
                    $signed(conv1_ans_b2[addr-ans_offset][127:120]), $signed(conv1_ans_b2[addr-ans_offset][119:112]),
                    $signed(conv1_ans_b2[addr-ans_offset][111:104]), $signed(conv1_ans_b2[addr-ans_offset][103:96]), 
                    $signed(conv1_ans_b2[addr-ans_offset][95:88]),   $signed(conv1_ans_b2[addr-ans_offset][87:80]),
                    $signed(conv1_ans_b2[addr-ans_offset][79:72]),   $signed(conv1_ans_b2[addr-ans_offset][71:64]),
                    $signed(conv1_ans_b2[addr-ans_offset][63:56]),   $signed(conv1_ans_b2[addr-ans_offset][55:48]),
                    $signed(conv1_ans_b2[addr-ans_offset][47:40]),   $signed(conv1_ans_b2[addr-ans_offset][39:32]),
                    $signed(conv1_ans_b2[addr-ans_offset][31:24]),   $signed(conv1_ans_b2[addr-ans_offset][23:16]),
                    $signed(conv1_ans_b2[addr-ans_offset][15:8]),    $signed(conv1_ans_b2[addr-ans_offset][7:0]));
            end
            B3: begin
                $write("Your answer at address %d is \n%d %d %d %d (ch0)\n%d %d %d %d (ch1)\n%d %d %d %d (ch2)\n%d %d %d %d (ch3)\n", m, 
                    $signed(sram_36x128b_b3.mem[addr][127:120]), $signed(sram_36x128b_b3.mem[addr][119:112]),
                    $signed(sram_36x128b_b3.mem[addr][111:104]), $signed(sram_36x128b_b3.mem[addr][103:96]), 
                    $signed(sram_36x128b_b3.mem[addr][95:88]),   $signed(sram_36x128b_b3.mem[addr][87:80]),
                    $signed(sram_36x128b_b3.mem[addr][79:72]),   $signed(sram_36x128b_b3.mem[addr][71:64]),
                    $signed(sram_36x128b_b3.mem[addr][63:56]),   $signed(sram_36x128b_b3.mem[addr][55:48]),
                    $signed(sram_36x128b_b3.mem[addr][47:40]),   $signed(sram_36x128b_b3.mem[addr][39:32]),
                    $signed(sram_36x128b_b3.mem[addr][31:24]),   $signed(sram_36x128b_b3.mem[addr][23:16]),
                    $signed(sram_36x128b_b3.mem[addr][15:8]),    $signed(sram_36x128b_b3.mem[addr][7:0]));
                $write("But the golden answer is \n%d %d %d %d (ch0)\n%d %d %d %d (ch1)\n%d %d %d %d (ch2)\n%d %d %d %d (ch3)\n", 
                    $signed(conv1_ans_b3[addr-ans_offset][127:120]), $signed(conv1_ans_b3[addr-ans_offset][119:112]),
                    $signed(conv1_ans_b3[addr-ans_offset][111:104]), $signed(conv1_ans_b3[addr-ans_offset][103:96]), 
                    $signed(conv1_ans_b3[addr-ans_offset][95:88]),   $signed(conv1_ans_b3[addr-ans_offset][87:80]),
                    $signed(conv1_ans_b3[addr-ans_offset][79:72]),   $signed(conv1_ans_b3[addr-ans_offset][71:64]),
                    $signed(conv1_ans_b3[addr-ans_offset][63:56]),   $signed(conv1_ans_b3[addr-ans_offset][55:48]),
                    $signed(conv1_ans_b3[addr-ans_offset][47:40]),   $signed(conv1_ans_b3[addr-ans_offset][39:32]),
                    $signed(conv1_ans_b3[addr-ans_offset][31:24]),   $signed(conv1_ans_b3[addr-ans_offset][23:16]),
                    $signed(conv1_ans_b3[addr-ans_offset][15:8]),    $signed(conv1_ans_b3[addr-ans_offset][7:0]));
            end 
        endcase
    end

endtask

integer j;

reg [BW_PER_SRAM_GROUP_ADDR-1:0] pool_out [0:63];
reg [BW_PER_ACT-1:0] pool_out_1d [0:1023];
reg signed [BW_PER_ACT-1:0] fc1_out [0:1023];
reg signed [BW_PER_ACT-1:0] fc2_out [0:9];
reg signed [BW_PER_ACT-1:0] tmp_big;
reg [BW_PER_ACT-1:0] ans;
reg signed [31:0] tmp_sum;

task FC1_layer;
    begin
        //flatten
        for(i=0; i<36; i=i+1) begin
            for(j=0; j<16; j=j+1) begin
                pool_out_1d[16*i+j] = sram_36x128b_b0.mem[i][(15-j)*8 +: 8];
            end
        end
        for(i=36; i<64; i=i+1) begin
            for(j=0; j<16; j=j+1) begin
                pool_out_1d[16*i+j] = sram_36x128b_b1.mem[i-36][(15-j)*8 +: 8];
            end
        end
        
        // calculate for fc1_out
        for(i=0; i<500; i=i+1) begin
            tmp_sum = 0;
            for(j=0; j<1024; j=j+1) begin
                tmp_sum = tmp_sum + $signed(pool_out_1d[j]) * $signed(fc1_w[i][(1023-j)*4 +: 4]);
            end
            tmp_sum = tmp_sum + $signed(fc1_b[i]) * (1 << 2);
            tmp_sum = tmp_sum + (1 << 5);
            tmp_sum = tmp_sum >>> 6;
            if(tmp_sum >= 127) 
                fc1_out[i] = 127;
            else if(tmp_sum < 0) 
                fc1_out[i] = 0;
            else 
                fc1_out[i] = tmp_sum[7:0];
        end
    end
endtask

task FC2_layer;
    begin
        //calculate for fc2_out
        for(i=0; i<10; i=i+1) begin
            tmp_sum = 0;
            for(j=0; j<500; j=j+1) begin
                tmp_sum = tmp_sum + $signed(fc1_out[j]) * $signed(fc2_w[i][(499-j)*4 +: 4]);
            end
            tmp_sum = tmp_sum + $signed(fc2_b[i]) * (1 << 8);
            tmp_sum = tmp_sum + (1 << 10);
            tmp_sum = tmp_sum >>> 11;
            if(tmp_sum >= 127) 
                fc2_out[i] = 127;
            else if(tmp_sum < -128) 
                fc2_out[i] = -128;
            else 
                fc2_out[i] = tmp_sum[7:0];
        end
        $write("------Show the output of FC2------\n");
        tmp_big = 0;
        ans = 0;
        for(i=0; i<10; i=i+1) begin
            $write("%d ", fc2_out[i]);
            ans = (tmp_big >= fc2_out[i]) ? ans : i[7:0];
            tmp_big = (tmp_big >= fc2_out[i]) ? tmp_big : fc2_out[i];
        end
        $write("\nAnd the recognition result is : %d\n", ans);
    end
endtask

endmodule