wvSetPosition -win $_nWave1 {("G1" 0)}
wvOpenFile -win $_nWave1 \
           {/home/u105/u105061255/ICLAB/HW5/PART2/sim/eCNN_micro.fsdb}
wvSetActiveFile -win $_nWave1 -applyAnnotation off \
           {/home/u105/u105061255/ICLAB/HW5/PART2/sim/eCNN_micro.fsdb}
wvOpenFile -win $_nWave1 \
           {/home/u105/u105061255/ICLAB/EE4292_HW2/EE4292_HW2/part2/sim/test_enigma.fsdb}
wvGetSignalOpen -win $_nWave1
wvGetSignalSetScope -win $_nWave1 "/enigma_part2_test"
wvGetSignalClose -win $_nWave1
wvCloseFile -win $_nWave1 \
           {/home/u105/u105061255/ICLAB/EE4292_HW2/EE4292_HW2/part2/sim/test_enigma.fsdb}
wvGetSignalOpen -win $_nWave1
wvGetSignalSetScope -win $_nWave1 "/test_top"
wvGetSignalSetScope -win $_nWave1 "/test_top/Conv_top/top_CNN"
wvGetSignalSetScope -win $_nWave1 "/test_top/Conv_top"
wvGetSignalSetScope -win $_nWave1 "/test_top/Conv_top/top_CNN"
wvSetPosition -win $_nWave1 {("G1" 65)}
wvSetPosition -win $_nWave1 {("G1" 65)}
wvAddSignal -win $_nWave1 -clear
wvAddSignal -win $_nWave1 -group {"G1" \
{/test_top/Conv_top/top_CNN/W\[0:15\]} \
{/test_top/Conv_top/top_CNN/X\[0:15\]} \
{/test_top/Conv_top/top_CNN/Y\[0:15\]} \
{/test_top/Conv_top/top_CNN/bias\[3:0\]} \
{/test_top/Conv_top/top_CNN/ch0_pixels\[0:3\]} \
{/test_top/Conv_top/top_CNN/ch1_pixels\[0:3\]} \
{/test_top/Conv_top/top_CNN/ch2_pixels\[0:3\]} \
{/test_top/Conv_top/top_CNN/ch3_pixels\[0:3\]} \
{/test_top/Conv_top/top_CNN/clk} \
{/test_top/Conv_top/top_CNN/cnn_state\[4:0\]} \
{/test_top/Conv_top/top_CNN/cnn_state_p} \
{/test_top/Conv_top/top_CNN/cnn_state_pppp} \
{/test_top/Conv_top/top_CNN/conv_out\[0:3\]} \
{/test_top/Conv_top/top_CNN/conv_out_FF\[0:3\]} \
{/test_top/Conv_top/top_CNN/feature_maps_o0\[15:0\]} \
{/test_top/Conv_top/top_CNN/feature_maps_o1\[15:0\]} \
{/test_top/Conv_top/top_CNN/feature_maps_o2\[15:0\]} \
{/test_top/Conv_top/top_CNN/feature_maps_o3\[15:0\]} \
{/test_top/Conv_top/top_CNN/feature_maps_temp_o\[0:3\]} \
{/test_top/Conv_top/top_CNN/i\[31:0\]} \
{/test_top/Conv_top/top_CNN/j\[31:0\]} \
{/test_top/Conv_top/top_CNN/k\[31:0\]} \
{/test_top/Conv_top/top_CNN/l\[31:0\]} \
{/test_top/Conv_top/top_CNN/load_bias_finish} \
{/test_top/Conv_top/top_CNN/load_weight_finish} \
{/test_top/Conv_top/top_CNN/max0\[7:0\]} \
{/test_top/Conv_top/top_CNN/max1\[7:0\]} \
{/test_top/Conv_top/top_CNN/max\[7:0\]} \
{/test_top/Conv_top/top_CNN/read_bias_finish} \
{/test_top/Conv_top/top_CNN/read_cnt\[10:0\]} \
{/test_top/Conv_top/top_CNN/read_input_cnt\[1:0\]} \
{/test_top/Conv_top/top_CNN/read_input_cnt_p\[1:0\]} \
{/test_top/Conv_top/top_CNN/read_input_cnt_pp\[1:0\]} \
{/test_top/Conv_top/top_CNN/read_weight_finish} \
{/test_top/Conv_top/top_CNN/rst_n} \
{/test_top/Conv_top/top_CNN/sram_rdata_0\[127:0\]} \
{/test_top/Conv_top/top_CNN/sram_rdata_1\[127:0\]} \
{/test_top/Conv_top/top_CNN/sram_rdata_2\[127:0\]} \
{/test_top/Conv_top/top_CNN/sram_rdata_3\[127:0\]} \
{/test_top/Conv_top/top_CNN/sram_rdata_a0\[127:0\]} \
{/test_top/Conv_top/top_CNN/sram_rdata_a1\[127:0\]} \
{/test_top/Conv_top/top_CNN/sram_rdata_a2\[127:0\]} \
{/test_top/Conv_top/top_CNN/sram_rdata_a3\[127:0\]} \
{/test_top/Conv_top/top_CNN/sram_rdata_b0\[127:0\]} \
{/test_top/Conv_top/top_CNN/sram_rdata_b1\[127:0\]} \
{/test_top/Conv_top/top_CNN/sram_rdata_b2\[127:0\]} \
{/test_top/Conv_top/top_CNN/sram_rdata_b3\[127:0\]} \
{/test_top/Conv_top/top_CNN/sram_rdata_bias\[3:0\]} \
{/test_top/Conv_top/top_CNN/sram_rdata_weight\[35:0\]} \
{/test_top/Conv_top/top_CNN/state\[5:0\]} \
{/test_top/Conv_top/top_CNN/state_p\[5:0\]} \
{/test_top/Conv_top/top_CNN/temp_conv_out\[0:3\]} \
{/test_top/Conv_top/top_CNN/x_cnt\[4:0\]} \
{/test_top/Conv_top/top_CNN/x_cnt_p\[4:0\]} \
{/test_top/Conv_top/top_CNN/x_cnt_pp\[4:0\]} \
{/test_top/Conv_top/top_CNN/x_cnt_ppp\[4:0\]} \
{/test_top/Conv_top/top_CNN/x_r2} \
{/test_top/Conv_top/top_CNN/y_cnt\[4:0\]} \
{/test_top/Conv_top/top_CNN/y_cnt_p\[4:0\]} \
{/test_top/Conv_top/top_CNN/y_cnt_pp\[4:0\]} \
{/test_top/Conv_top/top_CNN/y_cnt_ppp\[4:0\]} \
{/test_top/Conv_top/top_CNN/y_r2} \
{/LOGIC_LOW} \
{/LOGIC_HIGH} \
{/BLANK} \
}
wvAddSignal -win $_nWave1 -group {"G2" \
}
wvSelectSignal -win $_nWave1 {( "G1" 1 2 3 4 5 6 7 8 9 10 11 12 13 14 15 16 17 \
           18 19 20 21 22 23 24 25 26 27 28 29 30 31 32 33 34 35 36 37 38 39 \
           40 41 42 43 44 45 46 47 48 49 50 51 52 53 54 55 56 57 58 59 60 61 \
           62 63 64 65 )} 
wvSetPosition -win $_nWave1 {("G1" 65)}
wvSetPosition -win $_nWave1 {("G1" 65)}
wvSetPosition -win $_nWave1 {("G1" 65)}
wvAddSignal -win $_nWave1 -clear
wvAddSignal -win $_nWave1 -group {"G1" \
{/test_top/Conv_top/top_CNN/W\[0:15\]} \
{/test_top/Conv_top/top_CNN/X\[0:15\]} \
{/test_top/Conv_top/top_CNN/Y\[0:15\]} \
{/test_top/Conv_top/top_CNN/bias\[3:0\]} \
{/test_top/Conv_top/top_CNN/ch0_pixels\[0:3\]} \
{/test_top/Conv_top/top_CNN/ch1_pixels\[0:3\]} \
{/test_top/Conv_top/top_CNN/ch2_pixels\[0:3\]} \
{/test_top/Conv_top/top_CNN/ch3_pixels\[0:3\]} \
{/test_top/Conv_top/top_CNN/clk} \
{/test_top/Conv_top/top_CNN/cnn_state\[4:0\]} \
{/test_top/Conv_top/top_CNN/cnn_state_p} \
{/test_top/Conv_top/top_CNN/cnn_state_pppp} \
{/test_top/Conv_top/top_CNN/conv_out\[0:3\]} \
{/test_top/Conv_top/top_CNN/conv_out_FF\[0:3\]} \
{/test_top/Conv_top/top_CNN/feature_maps_o0\[15:0\]} \
{/test_top/Conv_top/top_CNN/feature_maps_o1\[15:0\]} \
{/test_top/Conv_top/top_CNN/feature_maps_o2\[15:0\]} \
{/test_top/Conv_top/top_CNN/feature_maps_o3\[15:0\]} \
{/test_top/Conv_top/top_CNN/feature_maps_temp_o\[0:3\]} \
{/test_top/Conv_top/top_CNN/i\[31:0\]} \
{/test_top/Conv_top/top_CNN/j\[31:0\]} \
{/test_top/Conv_top/top_CNN/k\[31:0\]} \
{/test_top/Conv_top/top_CNN/l\[31:0\]} \
{/test_top/Conv_top/top_CNN/load_bias_finish} \
{/test_top/Conv_top/top_CNN/load_weight_finish} \
{/test_top/Conv_top/top_CNN/max0\[7:0\]} \
{/test_top/Conv_top/top_CNN/max1\[7:0\]} \
{/test_top/Conv_top/top_CNN/max\[7:0\]} \
{/test_top/Conv_top/top_CNN/read_bias_finish} \
{/test_top/Conv_top/top_CNN/read_cnt\[10:0\]} \
{/test_top/Conv_top/top_CNN/read_input_cnt\[1:0\]} \
{/test_top/Conv_top/top_CNN/read_input_cnt_p\[1:0\]} \
{/test_top/Conv_top/top_CNN/read_input_cnt_pp\[1:0\]} \
{/test_top/Conv_top/top_CNN/read_weight_finish} \
{/test_top/Conv_top/top_CNN/rst_n} \
{/test_top/Conv_top/top_CNN/sram_rdata_0\[127:0\]} \
{/test_top/Conv_top/top_CNN/sram_rdata_1\[127:0\]} \
{/test_top/Conv_top/top_CNN/sram_rdata_2\[127:0\]} \
{/test_top/Conv_top/top_CNN/sram_rdata_3\[127:0\]} \
{/test_top/Conv_top/top_CNN/sram_rdata_a0\[127:0\]} \
{/test_top/Conv_top/top_CNN/sram_rdata_a1\[127:0\]} \
{/test_top/Conv_top/top_CNN/sram_rdata_a2\[127:0\]} \
{/test_top/Conv_top/top_CNN/sram_rdata_a3\[127:0\]} \
{/test_top/Conv_top/top_CNN/sram_rdata_b0\[127:0\]} \
{/test_top/Conv_top/top_CNN/sram_rdata_b1\[127:0\]} \
{/test_top/Conv_top/top_CNN/sram_rdata_b2\[127:0\]} \
{/test_top/Conv_top/top_CNN/sram_rdata_b3\[127:0\]} \
{/test_top/Conv_top/top_CNN/sram_rdata_bias\[3:0\]} \
{/test_top/Conv_top/top_CNN/sram_rdata_weight\[35:0\]} \
{/test_top/Conv_top/top_CNN/state\[5:0\]} \
{/test_top/Conv_top/top_CNN/state_p\[5:0\]} \
{/test_top/Conv_top/top_CNN/temp_conv_out\[0:3\]} \
{/test_top/Conv_top/top_CNN/x_cnt\[4:0\]} \
{/test_top/Conv_top/top_CNN/x_cnt_p\[4:0\]} \
{/test_top/Conv_top/top_CNN/x_cnt_pp\[4:0\]} \
{/test_top/Conv_top/top_CNN/x_cnt_ppp\[4:0\]} \
{/test_top/Conv_top/top_CNN/x_r2} \
{/test_top/Conv_top/top_CNN/y_cnt\[4:0\]} \
{/test_top/Conv_top/top_CNN/y_cnt_p\[4:0\]} \
{/test_top/Conv_top/top_CNN/y_cnt_pp\[4:0\]} \
{/test_top/Conv_top/top_CNN/y_cnt_ppp\[4:0\]} \
{/test_top/Conv_top/top_CNN/y_r2} \
{/LOGIC_LOW} \
{/LOGIC_HIGH} \
{/BLANK} \
}
wvAddSignal -win $_nWave1 -group {"G2" \
}
wvSelectSignal -win $_nWave1 {( "G1" 1 2 3 4 5 6 7 8 9 10 11 12 13 14 15 16 17 \
           18 19 20 21 22 23 24 25 26 27 28 29 30 31 32 33 34 35 36 37 38 39 \
           40 41 42 43 44 45 46 47 48 49 50 51 52 53 54 55 56 57 58 59 60 61 \
           62 63 64 65 )} 
wvSetPosition -win $_nWave1 {("G1" 65)}
wvGetSignalClose -win $_nWave1
wvScrollUp -win $_nWave1 6
wvResizeWindow -win $_nWave1 8 31 1474 841
wvScrollUp -win $_nWave1 1
wvScrollUp -win $_nWave1 1
wvScrollUp -win $_nWave1 1
wvSelectSignal -win $_nWave1 {( "G1" 37 )} 
wvSelectSignal -win $_nWave1 {( "G1" 36 37 38 39 40 41 42 43 44 45 46 47 48 49 \
           )} 
wvCut -win $_nWave1
wvSetPosition -win $_nWave1 {("G1" 51)}
wvScrollUp -win $_nWave1 18
wvScrollDown -win $_nWave1 0
wvScrollDown -win $_nWave1 0
wvResizeWindow -win $_nWave1 8 31 1474 841
wvResizeWindow -win $_nWave1 8 31 1474 841
wvResizeWindow -win $_nWave1 0 23 1217 697
wvScrollDown -win $_nWave1 0
wvSelectSignal -win $_nWave1 {( "G1" 5 6 7 8 )} 
wvCut -win $_nWave1
wvSetPosition -win $_nWave1 {("G1" 47)}
wvSelectSignal -win $_nWave1 {( "G1" 4 )} 
wvZoomOut -win $_nWave1
wvZoomOut -win $_nWave1
wvZoomOut -win $_nWave1
wvZoomOut -win $_nWave1
wvScrollDown -win $_nWave1 21
wvScrollDown -win $_nWave1 0
wvScrollDown -win $_nWave1 0
wvScrollDown -win $_nWave1 0
wvScrollDown -win $_nWave1 0
wvScrollDown -win $_nWave1 0
wvScrollUp -win $_nWave1 1
wvSelectSignal -win $_nWave1 {( "G1" 20 )} 
wvScrollUp -win $_nWave1 3
wvCut -win $_nWave1
wvSetPosition -win $_nWave1 {("G2" 0)}
wvSetPosition -win $_nWave1 {("G1" 46)}
wvSetCursor -win $_nWave1 145486.706894 -snap {("G1" 32)}
wvZoomIn -win $_nWave1
wvZoomIn -win $_nWave1
wvZoomIn -win $_nWave1
wvZoomIn -win $_nWave1
wvZoomIn -win $_nWave1
wvZoomIn -win $_nWave1
wvScrollDown -win $_nWave1 1
wvScrollDown -win $_nWave1 1
wvScrollDown -win $_nWave1 1
wvScrollDown -win $_nWave1 0
wvScrollUp -win $_nWave1 5
wvScrollDown -win $_nWave1 3
wvScrollDown -win $_nWave1 1
wvSelectSignal -win $_nWave1 {( "G1" 39 40 41 )} 
wvCut -win $_nWave1
wvSetPosition -win $_nWave1 {("G1" 43)}
wvSelectSignal -win $_nWave1 {( "G1" 35 36 )} 
wvCut -win $_nWave1
wvSetPosition -win $_nWave1 {("G1" 41)}
wvSelectSignal -win $_nWave1 {( "G1" 36 )} 
wvCut -win $_nWave1
wvSetPosition -win $_nWave1 {("G2" 0)}
wvSetPosition -win $_nWave1 {("G1" 40)}
wvSelectSignal -win $_nWave1 {( "G1" 37 )} 
wvCut -win $_nWave1
wvSetPosition -win $_nWave1 {("G2" 0)}
wvSetPosition -win $_nWave1 {("G1" 39)}
wvSelectSignal -win $_nWave1 {( "G1" 37 38 39 )} 
wvCut -win $_nWave1
wvSetPosition -win $_nWave1 {("G1" 36)}
wvScrollDown -win $_nWave1 0
wvSelectSignal -win $_nWave1 {( "G1" 33 )} 
wvSelectSignal -win $_nWave1 {( "G1" 16 17 18 19 )} 
wvCut -win $_nWave1
wvSetPosition -win $_nWave1 {("G1" 32)}
wvSelectSignal -win $_nWave1 {( "G1" 19 )} 
wvZoomOut -win $_nWave1
wvZoomOut -win $_nWave1
wvZoomOut -win $_nWave1
wvSetCursor -win $_nWave1 148736.971632 -snap {("G1" 19)}
wvSetCursor -win $_nWave1 153744.666253 -snap {("G1" 19)}
wvSetCursor -win $_nWave1 155062.480627 -snap {("G1" 19)}
wvSetCursor -win $_nWave1 155457.824939 -snap {("G1" 19)}
wvSetCursor -win $_nWave1 155984.950689 -snap {("G1" 19)}
wvSetCursor -win $_nWave1 155984.950689 -snap {("G1" 20)}
wvSetCursor -win $_nWave1 156643.857876 -snap {("G1" 20)}
wvSetCursor -win $_nWave1 156907.420751 -snap {("G1" 20)}
wvSetCursor -win $_nWave1 156116.732126 -snap {("G1" 21)}
wvZoomIn -win $_nWave1
wvZoomIn -win $_nWave1
wvZoomIn -win $_nWave1
wvZoomIn -win $_nWave1
wvZoomIn -win $_nWave1
wvScrollUp -win $_nWave1 1
wvScrollUp -win $_nWave1 1
wvScrollUp -win $_nWave1 1
wvSetCursor -win $_nWave1 156652.917850 -snap {("G1" 17)}
wvSetCursor -win $_nWave1 156965.898764 -snap {("G1" 19)}
wvSelectSignal -win $_nWave1 {( "G1" 22 )} 
wvSelectSignal -win $_nWave1 {( "G1" 22 23 )} 
wvGetSignalOpen -win $_nWave1
wvGetSignalSetScope -win $_nWave1 "/test_top"
wvGetSignalSetScope -win $_nWave1 "/test_top/Conv_top"
wvGetSignalSetScope -win $_nWave1 "/test_top/Conv_top/top_CNN"
wvGetSignalSetScope -win $_nWave1 "/test_top/Conv_top"
wvGetSignalSetScope -win $_nWave1 "/test_top/Conv_top/addr"
wvGetSignalSetScope -win $_nWave1 "/test_top/Conv_top"
wvGetSignalSetScope -win $_nWave1 "/test_top/Conv_top/addr"
wvSetPosition -win $_nWave1 {("G1" 32)}
wvSetPosition -win $_nWave1 {("G1" 32)}
wvAddSignal -win $_nWave1 -clear
wvAddSignal -win $_nWave1 -group {"G1" \
{/test_top/Conv_top/top_CNN/W\[0:15\]} \
{/test_top/Conv_top/top_CNN/X\[0:15\]} \
{/test_top/Conv_top/top_CNN/Y\[0:15\]} \
{/test_top/Conv_top/top_CNN/bias\[3:0\]} \
{/test_top/Conv_top/top_CNN/clk} \
{/test_top/Conv_top/top_CNN/cnn_state\[4:0\]} \
{/test_top/Conv_top/top_CNN/cnn_state_p} \
{/test_top/Conv_top/top_CNN/cnn_state_pppp} \
{/test_top/Conv_top/top_CNN/conv_out\[0:3\]} \
{/test_top/Conv_top/top_CNN/conv_out_FF\[0:3\]} \
{/test_top/Conv_top/top_CNN/feature_maps_o0\[15:0\]} \
{/test_top/Conv_top/top_CNN/feature_maps_o1\[15:0\]} \
{/test_top/Conv_top/top_CNN/feature_maps_o2\[15:0\]} \
{/test_top/Conv_top/top_CNN/feature_maps_o3\[15:0\]} \
{/test_top/Conv_top/top_CNN/feature_maps_temp_o\[0:3\]} \
{/test_top/Conv_top/top_CNN/load_weight_finish} \
{/test_top/Conv_top/top_CNN/max0\[7:0\]} \
{/test_top/Conv_top/top_CNN/max1\[7:0\]} \
{/test_top/Conv_top/top_CNN/max\[7:0\]} \
{/test_top/Conv_top/top_CNN/read_bias_finish} \
{/test_top/Conv_top/top_CNN/read_cnt\[10:0\]} \
{/test_top/Conv_top/top_CNN/read_input_cnt\[1:0\]} \
{/test_top/Conv_top/top_CNN/read_input_cnt_p\[1:0\]} \
{/test_top/Conv_top/top_CNN/read_input_cnt_pp\[1:0\]} \
{/test_top/Conv_top/top_CNN/read_weight_finish} \
{/test_top/Conv_top/top_CNN/rst_n} \
{/test_top/Conv_top/top_CNN/state\[5:0\]} \
{/test_top/Conv_top/top_CNN/state_p\[5:0\]} \
{/test_top/Conv_top/top_CNN/temp_conv_out\[0:3\]} \
{/test_top/Conv_top/top_CNN/x_cnt\[4:0\]} \
{/test_top/Conv_top/top_CNN/x_cnt_ppp\[4:0\]} \
{/test_top/Conv_top/top_CNN/y_cnt_ppp\[4:0\]} \
}
wvAddSignal -win $_nWave1 -group {"G2" \
}
wvSetPosition -win $_nWave1 {("G1" 32)}
wvGetSignalClose -win $_nWave1
wvScrollDown -win $_nWave1 1
wvScrollDown -win $_nWave1 1
wvScrollDown -win $_nWave1 1
wvScrollDown -win $_nWave1 0
wvScrollUp -win $_nWave1 1
wvScrollUp -win $_nWave1 1
wvScrollUp -win $_nWave1 1
wvScrollUp -win $_nWave1 1
wvDisplayGridCount -win $_nWave1 -off
wvGetSignalClose -win $_nWave1
wvReloadFile -win $_nWave1
wvScrollUp -win $_nWave1 2
wvGetSignalOpen -win $_nWave1
wvGetSignalSetScope -win $_nWave1 "/test_top/Conv_top/bytemask"
wvGetSignalClose -win $_nWave1
wvGetSignalOpen -win $_nWave1
wvGetSignalSetScope -win $_nWave1 "/test_top"
wvGetSignalSetScope -win $_nWave1 "/test_top/Conv_top"
wvGetSignalSetScope -win $_nWave1 "/test_top/Conv_top/top_CNN"
wvGetSignalSetScope -win $_nWave1 "/test_top/Conv_top/bytemask"
wvGetSignalClose -win $_nWave1
wvDisplayGridCount -win $_nWave1 -off
wvGetSignalClose -win $_nWave1
wvReloadFile -win $_nWave1
wvScrollDown -win $_nWave1 1
wvScrollDown -win $_nWave1 1
wvScrollDown -win $_nWave1 1
wvScrollDown -win $_nWave1 1
wvScrollDown -win $_nWave1 1
wvScrollDown -win $_nWave1 1
wvScrollDown -win $_nWave1 0
wvScrollDown -win $_nWave1 0
wvGetSignalOpen -win $_nWave1
wvSetPosition -win $_nWave1 {("G1" 33)}
wvSetPosition -win $_nWave1 {("G1" 33)}
wvAddSignal -win $_nWave1 -clear
wvAddSignal -win $_nWave1 -group {"G1" \
{/test_top/Conv_top/top_CNN/W\[0:15\]} \
{/test_top/Conv_top/top_CNN/X\[0:15\]} \
{/test_top/Conv_top/top_CNN/Y\[0:15\]} \
{/test_top/Conv_top/top_CNN/bias\[3:0\]} \
{/test_top/Conv_top/top_CNN/clk} \
{/test_top/Conv_top/top_CNN/cnn_state\[4:0\]} \
{/test_top/Conv_top/top_CNN/cnn_state_p} \
{/test_top/Conv_top/top_CNN/cnn_state_pppp} \
{/test_top/Conv_top/top_CNN/conv_out\[0:3\]} \
{/test_top/Conv_top/top_CNN/conv_out_FF\[0:3\]} \
{/test_top/Conv_top/top_CNN/feature_maps_o0\[15:0\]} \
{/test_top/Conv_top/top_CNN/feature_maps_o1\[15:0\]} \
{/test_top/Conv_top/top_CNN/feature_maps_o2\[15:0\]} \
{/test_top/Conv_top/top_CNN/feature_maps_o3\[15:0\]} \
{/test_top/Conv_top/top_CNN/feature_maps_temp_o\[0:3\]} \
{/test_top/Conv_top/top_CNN/load_weight_finish} \
{/test_top/Conv_top/top_CNN/max0\[7:0\]} \
{/test_top/Conv_top/top_CNN/max1\[7:0\]} \
{/test_top/Conv_top/top_CNN/max\[7:0\]} \
{/test_top/Conv_top/top_CNN/read_bias_finish} \
{/test_top/Conv_top/top_CNN/read_cnt\[10:0\]} \
{/test_top/Conv_top/top_CNN/read_input_cnt\[1:0\]} \
{/test_top/Conv_top/top_CNN/read_input_cnt_p\[1:0\]} \
{/test_top/Conv_top/top_CNN/read_input_cnt_pp\[1:0\]} \
{/test_top/Conv_top/top_CNN/read_weight_finish} \
{/test_top/Conv_top/top_CNN/rst_n} \
{/test_top/Conv_top/top_CNN/state\[5:0\]} \
{/test_top/Conv_top/top_CNN/state_p\[5:0\]} \
{/test_top/Conv_top/top_CNN/temp_conv_out\[0:3\]} \
{/test_top/Conv_top/top_CNN/x_cnt\[4:0\]} \
{/test_top/Conv_top/top_CNN/x_cnt_ppp\[4:0\]} \
{/test_top/Conv_top/top_CNN/y_cnt_ppp\[4:0\]} \
{/test_top/Conv_top/bytemask/final_cnt\[10:0\]} \
}
wvAddSignal -win $_nWave1 -group {"G2" \
}
wvSelectSignal -win $_nWave1 {( "G1" 33 )} 
wvSetPosition -win $_nWave1 {("G1" 33)}
wvSetPosition -win $_nWave1 {("G1" 33)}
wvSetPosition -win $_nWave1 {("G1" 33)}
wvAddSignal -win $_nWave1 -clear
wvAddSignal -win $_nWave1 -group {"G1" \
{/test_top/Conv_top/top_CNN/W\[0:15\]} \
{/test_top/Conv_top/top_CNN/X\[0:15\]} \
{/test_top/Conv_top/top_CNN/Y\[0:15\]} \
{/test_top/Conv_top/top_CNN/bias\[3:0\]} \
{/test_top/Conv_top/top_CNN/clk} \
{/test_top/Conv_top/top_CNN/cnn_state\[4:0\]} \
{/test_top/Conv_top/top_CNN/cnn_state_p} \
{/test_top/Conv_top/top_CNN/cnn_state_pppp} \
{/test_top/Conv_top/top_CNN/conv_out\[0:3\]} \
{/test_top/Conv_top/top_CNN/conv_out_FF\[0:3\]} \
{/test_top/Conv_top/top_CNN/feature_maps_o0\[15:0\]} \
{/test_top/Conv_top/top_CNN/feature_maps_o1\[15:0\]} \
{/test_top/Conv_top/top_CNN/feature_maps_o2\[15:0\]} \
{/test_top/Conv_top/top_CNN/feature_maps_o3\[15:0\]} \
{/test_top/Conv_top/top_CNN/feature_maps_temp_o\[0:3\]} \
{/test_top/Conv_top/top_CNN/load_weight_finish} \
{/test_top/Conv_top/top_CNN/max0\[7:0\]} \
{/test_top/Conv_top/top_CNN/max1\[7:0\]} \
{/test_top/Conv_top/top_CNN/max\[7:0\]} \
{/test_top/Conv_top/top_CNN/read_bias_finish} \
{/test_top/Conv_top/top_CNN/read_cnt\[10:0\]} \
{/test_top/Conv_top/top_CNN/read_input_cnt\[1:0\]} \
{/test_top/Conv_top/top_CNN/read_input_cnt_p\[1:0\]} \
{/test_top/Conv_top/top_CNN/read_input_cnt_pp\[1:0\]} \
{/test_top/Conv_top/top_CNN/read_weight_finish} \
{/test_top/Conv_top/top_CNN/rst_n} \
{/test_top/Conv_top/top_CNN/state\[5:0\]} \
{/test_top/Conv_top/top_CNN/state_p\[5:0\]} \
{/test_top/Conv_top/top_CNN/temp_conv_out\[0:3\]} \
{/test_top/Conv_top/top_CNN/x_cnt\[4:0\]} \
{/test_top/Conv_top/top_CNN/x_cnt_ppp\[4:0\]} \
{/test_top/Conv_top/top_CNN/y_cnt_ppp\[4:0\]} \
{/test_top/Conv_top/bytemask/final_cnt\[10:0\]} \
}
wvAddSignal -win $_nWave1 -group {"G2" \
}
wvSelectSignal -win $_nWave1 {( "G1" 33 )} 
wvSetPosition -win $_nWave1 {("G1" 33)}
wvGetSignalClose -win $_nWave1
wvScrollDown -win $_nWave1 0
wvScrollDown -win $_nWave1 0
wvScrollDown -win $_nWave1 0
wvScrollDown -win $_nWave1 0
wvScrollDown -win $_nWave1 0
wvScrollDown -win $_nWave1 0
wvScrollDown -win $_nWave1 0
wvScrollDown -win $_nWave1 0
wvZoomOut -win $_nWave1
wvZoomOut -win $_nWave1
wvZoomOut -win $_nWave1
wvSetCursor -win $_nWave1 287331.048155 -snap {("G1" 33)}
wvScrollUp -win $_nWave1 1
wvScrollUp -win $_nWave1 1
wvScrollUp -win $_nWave1 1
wvScrollUp -win $_nWave1 1
wvScrollUp -win $_nWave1 1
wvScrollUp -win $_nWave1 1
wvScrollUp -win $_nWave1 1
wvScrollDown -win $_nWave1 0
wvScrollDown -win $_nWave1 0
wvScrollDown -win $_nWave1 0
wvScrollDown -win $_nWave1 0
wvScrollDown -win $_nWave1 0
wvScrollDown -win $_nWave1 1
wvScrollDown -win $_nWave1 1
wvScrollDown -win $_nWave1 1
wvScrollDown -win $_nWave1 1
wvScrollDown -win $_nWave1 1
wvScrollDown -win $_nWave1 1
wvScrollDown -win $_nWave1 1
wvScrollDown -win $_nWave1 0
wvScrollDown -win $_nWave1 0
wvScrollDown -win $_nWave1 0
wvScrollDown -win $_nWave1 0
wvScrollDown -win $_nWave1 0
wvScrollDown -win $_nWave1 0
wvScrollDown -win $_nWave1 0
wvSetCursor -win $_nWave1 96890.702285 -snap {("G1" 33)}
wvSetCursor -win $_nWave1 125289.701230 -snap {("G1" 33)}
wvZoomIn -win $_nWave1
wvZoomIn -win $_nWave1
wvZoomIn -win $_nWave1
wvZoomIn -win $_nWave1
wvZoomIn -win $_nWave1
wvSetCursor -win $_nWave1 124477.928374 -snap {("G1" 27)}
wvSetCursor -win $_nWave1 148450.254082 -snap {("G1" 33)}
wvSetCursor -win $_nWave1 148815.682377 -snap {("G1" 33)}
wvSetCursor -win $_nWave1 149181.110672 -snap {("G1" 33)}
wvSetCursor -win $_nWave1 145918.358036 -snap {("G1" 28)}
wvSetCursor -win $_nWave1 145735.643888 -snap {("G1" 33)}
wvSelectSignal -win $_nWave1 {( "G1" 33 )} 
wvSetRadix -win $_nWave1 -format UDec
wvScrollUp -win $_nWave1 1
wvScrollUp -win $_nWave1 1
wvScrollUp -win $_nWave1 1
wvScrollDown -win $_nWave1 1
wvScrollDown -win $_nWave1 1
wvScrollDown -win $_nWave1 1
wvScrollDown -win $_nWave1 0
wvScrollDown -win $_nWave1 0
wvScrollDown -win $_nWave1 0
wvScrollDown -win $_nWave1 0
wvSetCursor -win $_nWave1 80148.009556 -snap {("G1" 33)}
wvZoomIn -win $_nWave1
wvScrollDown -win $_nWave1 0
wvScrollDown -win $_nWave1 0
wvSetCursor -win $_nWave1 79452.390694 -snap {("G1" 19)}
wvSetCursor -win $_nWave1 79595.951810 -snap {("G1" 19)}
wvSetCursor -win $_nWave1 79870.023032 -snap {("G1" 19)}
wvSetCursor -win $_nWave1 80078.839201 -snap {("G1" 19)}
wvSetCursor -win $_nWave1 80339.859411 -snap {("G1" 19)}
wvScrollUp -win $_nWave1 1
wvScrollUp -win $_nWave1 1
wvScrollDown -win $_nWave1 1
wvScrollDown -win $_nWave1 1
wvScrollDown -win $_nWave1 0
wvScrollDown -win $_nWave1 0
wvZoomOut -win $_nWave1
wvScrollDown -win $_nWave1 0
wvScrollDown -win $_nWave1 0
wvScrollDown -win $_nWave1 0
wvScrollDown -win $_nWave1 0
wvSetCursor -win $_nWave1 80098.415716 -snap {("G1" 33)}
wvScrollUp -win $_nWave1 1
wvScrollUp -win $_nWave1 1
wvScrollUp -win $_nWave1 1
wvScrollUp -win $_nWave1 1
wvZoomOut -win $_nWave1
wvScrollDown -win $_nWave1 1
wvScrollDown -win $_nWave1 1
wvScrollDown -win $_nWave1 1
wvZoomIn -win $_nWave1
wvZoomIn -win $_nWave1
wvZoomIn -win $_nWave1
wvScrollUp -win $_nWave1 1
wvScrollUp -win $_nWave1 1
wvScrollUp -win $_nWave1 1
wvScrollUp -win $_nWave1 1
wvScrollUp -win $_nWave1 1
wvScrollUp -win $_nWave1 1
wvScrollDown -win $_nWave1 0
wvScrollDown -win $_nWave1 0
wvScrollDown -win $_nWave1 1
wvScrollDown -win $_nWave1 1
wvScrollDown -win $_nWave1 1
wvScrollDown -win $_nWave1 1
wvScrollDown -win $_nWave1 1
wvScrollDown -win $_nWave1 1
wvScrollUp -win $_nWave1 1
wvScrollUp -win $_nWave1 1
wvZoomOut -win $_nWave1
wvZoomOut -win $_nWave1
wvZoomIn -win $_nWave1
wvZoomIn -win $_nWave1
wvZoomOut -win $_nWave1
wvZoomOut -win $_nWave1
wvZoomOut -win $_nWave1
wvZoomOut -win $_nWave1
wvScrollDown -win $_nWave1 1
wvScrollDown -win $_nWave1 1
wvScrollDown -win $_nWave1 1
wvScrollDown -win $_nWave1 0
wvScrollDown -win $_nWave1 0
wvScrollDown -win $_nWave1 0
wvZoomIn -win $_nWave1
wvZoomIn -win $_nWave1
wvZoomIn -win $_nWave1
wvZoomIn -win $_nWave1
wvZoomIn -win $_nWave1
wvSetCursor -win $_nWave1 79646.850752 -snap {("G1" 24)}
wvSetCursor -win $_nWave1 79924.184726 -snap {("G1" 24)}
wvScrollDown -win $_nWave1 0
wvScrollDown -win $_nWave1 0
wvScrollDown -win $_nWave1 0
wvScrollDown -win $_nWave1 0
wvScrollDown -win $_nWave1 0
wvScrollUp -win $_nWave1 1
wvScrollUp -win $_nWave1 1
wvScrollUp -win $_nWave1 1
wvScrollUp -win $_nWave1 1
wvScrollUp -win $_nWave1 1
wvScrollUp -win $_nWave1 1
wvScrollUp -win $_nWave1 1
wvScrollDown -win $_nWave1 0
wvScrollDown -win $_nWave1 0
wvScrollDown -win $_nWave1 0
wvScrollDown -win $_nWave1 0
wvScrollDown -win $_nWave1 0
wvScrollDown -win $_nWave1 0
wvSetCursor -win $_nWave1 79464.136604 -snap {("G1" 14)}
wvScrollDown -win $_nWave1 1
wvScrollDown -win $_nWave1 1
wvScrollDown -win $_nWave1 1
wvScrollDown -win $_nWave1 1
wvScrollDown -win $_nWave1 1
wvScrollDown -win $_nWave1 1
wvScrollDown -win $_nWave1 1
wvScrollDown -win $_nWave1 0
wvScrollDown -win $_nWave1 0
wvScrollUp -win $_nWave1 1
wvScrollUp -win $_nWave1 1
wvSetCursor -win $_nWave1 79721.894062 -snap {("G1" 27)}
wvZoomOut -win $_nWave1
wvZoomOut -win $_nWave1
wvZoomOut -win $_nWave1
wvScrollDown -win $_nWave1 1
wvScrollDown -win $_nWave1 1
wvScrollUp -win $_nWave1 1
wvSetCursor -win $_nWave1 148342.614498 -snap {("G1" 33)}
wvScrollDown -win $_nWave1 1
wvScrollDown -win $_nWave1 0
wvScrollDown -win $_nWave1 0
wvSetCursor -win $_nWave1 145836.820474 -snap {("G1" 33)}
wvSetCursor -win $_nWave1 148368.716520 -snap {("G1" 33)}
wvSetCursor -win $_nWave1 148760.246836 -snap {("G1" 33)}
wvSetCursor -win $_nWave1 149047.369068 -snap {("G1" 33)}
wvSetCursor -win $_nWave1 149386.695342 -snap {("G1" 33)}
wvSetCursor -win $_nWave1 148264.308435 -snap {("G1" 33)}
wvScrollDown -win $_nWave1 0
wvDisplayGridCount -win $_nWave1 -off
wvGetSignalClose -win $_nWave1
wvReloadFile -win $_nWave1
wvZoomIn -win $_nWave1
wvZoomIn -win $_nWave1
wvSetCursor -win $_nWave1 148572.964834 -snap {("G1" 24)}
wvScrollDown -win $_nWave1 0
wvScrollDown -win $_nWave1 0
wvScrollDown -win $_nWave1 0
wvScrollDown -win $_nWave1 0
wvScrollDown -win $_nWave1 0
wvScrollDown -win $_nWave1 0
wvScrollDown -win $_nWave1 0
wvGetSignalOpen -win $_nWave1
wvGetSignalSetScope -win $_nWave1 "/test_top/Conv_top"
wvSetPosition -win $_nWave1 {("G1" 34)}
wvSetPosition -win $_nWave1 {("G1" 34)}
wvAddSignal -win $_nWave1 -clear
wvAddSignal -win $_nWave1 -group {"G1" \
{/test_top/Conv_top/top_CNN/W\[0:15\]} \
{/test_top/Conv_top/top_CNN/X\[0:15\]} \
{/test_top/Conv_top/top_CNN/Y\[0:15\]} \
{/test_top/Conv_top/top_CNN/bias\[3:0\]} \
{/test_top/Conv_top/top_CNN/clk} \
{/test_top/Conv_top/top_CNN/cnn_state\[4:0\]} \
{/test_top/Conv_top/top_CNN/cnn_state_p} \
{/test_top/Conv_top/top_CNN/cnn_state_pppp} \
{/test_top/Conv_top/top_CNN/conv_out\[0:3\]} \
{/test_top/Conv_top/top_CNN/conv_out_FF\[0:3\]} \
{/test_top/Conv_top/top_CNN/feature_maps_o0\[15:0\]} \
{/test_top/Conv_top/top_CNN/feature_maps_o1\[15:0\]} \
{/test_top/Conv_top/top_CNN/feature_maps_o2\[15:0\]} \
{/test_top/Conv_top/top_CNN/feature_maps_o3\[15:0\]} \
{/test_top/Conv_top/top_CNN/feature_maps_temp_o\[0:3\]} \
{/test_top/Conv_top/top_CNN/load_weight_finish} \
{/test_top/Conv_top/top_CNN/max0\[7:0\]} \
{/test_top/Conv_top/top_CNN/max1\[7:0\]} \
{/test_top/Conv_top/top_CNN/max\[7:0\]} \
{/test_top/Conv_top/top_CNN/read_bias_finish} \
{/test_top/Conv_top/top_CNN/read_cnt\[10:0\]} \
{/test_top/Conv_top/top_CNN/read_input_cnt\[1:0\]} \
{/test_top/Conv_top/top_CNN/read_input_cnt_p\[1:0\]} \
{/test_top/Conv_top/top_CNN/read_input_cnt_pp\[1:0\]} \
{/test_top/Conv_top/top_CNN/read_weight_finish} \
{/test_top/Conv_top/top_CNN/rst_n} \
{/test_top/Conv_top/top_CNN/state\[5:0\]} \
{/test_top/Conv_top/top_CNN/state_p\[5:0\]} \
{/test_top/Conv_top/top_CNN/temp_conv_out\[0:3\]} \
{/test_top/Conv_top/top_CNN/x_cnt\[4:0\]} \
{/test_top/Conv_top/top_CNN/x_cnt_ppp\[4:0\]} \
{/test_top/Conv_top/top_CNN/y_cnt_ppp\[4:0\]} \
{/test_top/Conv_top/bytemask/final_cnt\[10:0\]} \
{/test_top/Conv_top/read_input_cnt_ppp\[1:0\]} \
}
wvAddSignal -win $_nWave1 -group {"G2" \
}
wvSelectSignal -win $_nWave1 {( "G1" 34 )} 
wvSetPosition -win $_nWave1 {("G1" 34)}
wvSetCursor -win $_nWave1 148292.368108 -snap {("G1" 34)}
wvSetCursor -win $_nWave1 148670.847413 -snap {("G1" 34)}
wvSetCursor -win $_nWave1 148279.317097 -snap {("G1" 34)}
wvScrollUp -win $_nWave1 1
wvScrollUp -win $_nWave1 1
wvScrollUp -win $_nWave1 1
wvGetSignalOpen -win $_nWave1
wvSetPosition -win $_nWave1 {("G1" 35)}
wvSetPosition -win $_nWave1 {("G1" 35)}
wvAddSignal -win $_nWave1 -clear
wvAddSignal -win $_nWave1 -group {"G1" \
{/test_top/Conv_top/top_CNN/W\[0:15\]} \
{/test_top/Conv_top/top_CNN/X\[0:15\]} \
{/test_top/Conv_top/top_CNN/Y\[0:15\]} \
{/test_top/Conv_top/top_CNN/bias\[3:0\]} \
{/test_top/Conv_top/top_CNN/clk} \
{/test_top/Conv_top/top_CNN/cnn_state\[4:0\]} \
{/test_top/Conv_top/top_CNN/cnn_state_p} \
{/test_top/Conv_top/top_CNN/cnn_state_pppp} \
{/test_top/Conv_top/top_CNN/conv_out\[0:3\]} \
{/test_top/Conv_top/top_CNN/conv_out_FF\[0:3\]} \
{/test_top/Conv_top/top_CNN/feature_maps_o0\[15:0\]} \
{/test_top/Conv_top/top_CNN/feature_maps_o1\[15:0\]} \
{/test_top/Conv_top/top_CNN/feature_maps_o2\[15:0\]} \
{/test_top/Conv_top/top_CNN/feature_maps_o3\[15:0\]} \
{/test_top/Conv_top/top_CNN/feature_maps_temp_o\[0:3\]} \
{/test_top/Conv_top/top_CNN/load_weight_finish} \
{/test_top/Conv_top/top_CNN/max0\[7:0\]} \
{/test_top/Conv_top/top_CNN/max1\[7:0\]} \
{/test_top/Conv_top/top_CNN/max\[7:0\]} \
{/test_top/Conv_top/top_CNN/read_bias_finish} \
{/test_top/Conv_top/top_CNN/read_cnt\[10:0\]} \
{/test_top/Conv_top/top_CNN/read_input_cnt\[1:0\]} \
{/test_top/Conv_top/top_CNN/read_input_cnt_p\[1:0\]} \
{/test_top/Conv_top/top_CNN/read_input_cnt_pp\[1:0\]} \
{/test_top/Conv_top/top_CNN/read_weight_finish} \
{/test_top/Conv_top/top_CNN/rst_n} \
{/test_top/Conv_top/top_CNN/state\[5:0\]} \
{/test_top/Conv_top/top_CNN/state_p\[5:0\]} \
{/test_top/Conv_top/top_CNN/temp_conv_out\[0:3\]} \
{/test_top/Conv_top/top_CNN/x_cnt\[4:0\]} \
{/test_top/Conv_top/top_CNN/x_cnt_ppp\[4:0\]} \
{/test_top/Conv_top/top_CNN/y_cnt_ppp\[4:0\]} \
{/test_top/Conv_top/bytemask/final_cnt\[10:0\]} \
{/test_top/Conv_top/read_input_cnt_ppp\[1:0\]} \
{/test_top/Conv_top/cnn_state_ppppppp} \
}
wvAddSignal -win $_nWave1 -group {"G2" \
}
wvSelectSignal -win $_nWave1 {( "G1" 35 )} 
wvSetPosition -win $_nWave1 {("G1" 35)}
wvSetPosition -win $_nWave1 {("G1" 35)}
wvSetPosition -win $_nWave1 {("G1" 35)}
wvAddSignal -win $_nWave1 -clear
wvAddSignal -win $_nWave1 -group {"G1" \
{/test_top/Conv_top/top_CNN/W\[0:15\]} \
{/test_top/Conv_top/top_CNN/X\[0:15\]} \
{/test_top/Conv_top/top_CNN/Y\[0:15\]} \
{/test_top/Conv_top/top_CNN/bias\[3:0\]} \
{/test_top/Conv_top/top_CNN/clk} \
{/test_top/Conv_top/top_CNN/cnn_state\[4:0\]} \
{/test_top/Conv_top/top_CNN/cnn_state_p} \
{/test_top/Conv_top/top_CNN/cnn_state_pppp} \
{/test_top/Conv_top/top_CNN/conv_out\[0:3\]} \
{/test_top/Conv_top/top_CNN/conv_out_FF\[0:3\]} \
{/test_top/Conv_top/top_CNN/feature_maps_o0\[15:0\]} \
{/test_top/Conv_top/top_CNN/feature_maps_o1\[15:0\]} \
{/test_top/Conv_top/top_CNN/feature_maps_o2\[15:0\]} \
{/test_top/Conv_top/top_CNN/feature_maps_o3\[15:0\]} \
{/test_top/Conv_top/top_CNN/feature_maps_temp_o\[0:3\]} \
{/test_top/Conv_top/top_CNN/load_weight_finish} \
{/test_top/Conv_top/top_CNN/max0\[7:0\]} \
{/test_top/Conv_top/top_CNN/max1\[7:0\]} \
{/test_top/Conv_top/top_CNN/max\[7:0\]} \
{/test_top/Conv_top/top_CNN/read_bias_finish} \
{/test_top/Conv_top/top_CNN/read_cnt\[10:0\]} \
{/test_top/Conv_top/top_CNN/read_input_cnt\[1:0\]} \
{/test_top/Conv_top/top_CNN/read_input_cnt_p\[1:0\]} \
{/test_top/Conv_top/top_CNN/read_input_cnt_pp\[1:0\]} \
{/test_top/Conv_top/top_CNN/read_weight_finish} \
{/test_top/Conv_top/top_CNN/rst_n} \
{/test_top/Conv_top/top_CNN/state\[5:0\]} \
{/test_top/Conv_top/top_CNN/state_p\[5:0\]} \
{/test_top/Conv_top/top_CNN/temp_conv_out\[0:3\]} \
{/test_top/Conv_top/top_CNN/x_cnt\[4:0\]} \
{/test_top/Conv_top/top_CNN/x_cnt_ppp\[4:0\]} \
{/test_top/Conv_top/top_CNN/y_cnt_ppp\[4:0\]} \
{/test_top/Conv_top/bytemask/final_cnt\[10:0\]} \
{/test_top/Conv_top/read_input_cnt_ppp\[1:0\]} \
{/test_top/Conv_top/cnn_state_ppppppp} \
}
wvAddSignal -win $_nWave1 -group {"G2" \
}
wvSelectSignal -win $_nWave1 {( "G1" 35 )} 
wvSetPosition -win $_nWave1 {("G1" 35)}
wvGetSignalClose -win $_nWave1
wvScrollDown -win $_nWave1 0
wvScrollDown -win $_nWave1 0
wvSetCursor -win $_nWave1 148331.521139 -snap {("G1" 34)}
wvSetCursor -win $_nWave1 148285.842602 -snap {("G1" 34)}
wvScrollUp -win $_nWave1 1
wvScrollUp -win $_nWave1 1
wvScrollUp -win $_nWave1 1
wvScrollUp -win $_nWave1 1
wvScrollDown -win $_nWave1 1
wvScrollDown -win $_nWave1 1
wvScrollDown -win $_nWave1 1
wvSetCursor -win $_nWave1 148344.572150 -snap {("G1" 31)}
wvSetCursor -win $_nWave1 148272.791592 -snap {("G1" 34)}
wvSetCursor -win $_nWave1 148644.745392 -snap {("G1" 34)}
wvScrollDown -win $_nWave1 1
wvScrollUp -win $_nWave1 1
wvScrollDown -win $_nWave1 1
wvScrollDown -win $_nWave1 0
wvScrollUp -win $_nWave1 1
wvScrollDown -win $_nWave1 1
wvScrollDown -win $_nWave1 0
wvScrollUp -win $_nWave1 1
wvScrollUp -win $_nWave1 1
wvScrollUp -win $_nWave1 1
wvSetCursor -win $_nWave1 147992.194865 -snap {("G1" 8)}
wvScrollUp -win $_nWave1 1
wvScrollUp -win $_nWave1 1
wvScrollUp -win $_nWave1 1
wvScrollUp -win $_nWave1 1
wvScrollUp -win $_nWave1 1
wvSetCursor -win $_nWave1 148057.449918 -snap {("G1" 5)}
wvSetCursor -win $_nWave1 148155.332497 -snap {("G1" 5)}
wvSetCursor -win $_nWave1 148227.113055 -snap {("G1" 5)}
wvSetCursor -win $_nWave1 148351.097655 -snap {("G1" 5)}
wvScrollDown -win $_nWave1 1
wvScrollDown -win $_nWave1 1
wvScrollDown -win $_nWave1 1
wvScrollDown -win $_nWave1 1
wvScrollDown -win $_nWave1 1
wvScrollDown -win $_nWave1 1
wvScrollDown -win $_nWave1 1
wvScrollDown -win $_nWave1 1
wvScrollUp -win $_nWave1 1
wvScrollUp -win $_nWave1 1
wvScrollDown -win $_nWave1 1
wvScrollDown -win $_nWave1 1
wvScrollDown -win $_nWave1 0
wvScrollUp -win $_nWave1 1
wvScrollUp -win $_nWave1 1
wvScrollUp -win $_nWave1 1
wvScrollDown -win $_nWave1 1
wvScrollDown -win $_nWave1 1
wvScrollDown -win $_nWave1 1
wvScrollDown -win $_nWave1 0
wvDisplayGridCount -win $_nWave1 -off
wvGetSignalClose -win $_nWave1
wvReloadFile -win $_nWave1
wvSetCursor -win $_nWave1 148758.418806 -snap {("G1" 33)}
wvSetCursor -win $_nWave1 148680.112743 -snap {("G1" 24)}
wvSetCursor -win $_nWave1 149156.474628 -snap {("G1" 33)}
wvSetCursor -win $_nWave1 149600.208987 -snap {("G1" 33)}
wvSetCursor -win $_nWave1 149972.162787 -snap {("G1" 33)}
wvSetCursor -win $_nWave1 150344.116588 -snap {("G1" 33)}
wvSetCursor -win $_nWave1 150742.498685 -snap {("G1" 33)}
wvSelectSignal -win $_nWave1 {( "G1" 22 23 24 )} 
wvCut -win $_nWave1
wvSetPosition -win $_nWave1 {("G1" 32)}
wvSetCursor -win $_nWave1 148746.672897 -snap {("G1" 30)}
wvSetCursor -win $_nWave1 149112.101192 -snap {("G1" 31)}
wvSetCursor -win $_nWave1 149627.616109 -snap {("G1" 31)}
wvSetCursor -win $_nWave1 149516.682519 -snap {("G1" 31)}
wvSetCursor -win $_nWave1 149908.212835 -snap {("G1" 31)}
wvSetCursor -win $_nWave1 150299.743152 -snap {("G1" 31)}
wvSetCursor -win $_nWave1 150722.922169 -snap {("G1" 31)}
wvSetCursor -win $_nWave1 151127.503496 -snap {("G1" 31)}
wvSetCursor -win $_nWave1 153511.270572 -snap {("G1" 31)}
wvSetCursor -win $_nWave1 153902.800888 -snap {("G1" 31)}
wvSetCursor -win $_nWave1 154333.484236 -snap {("G1" 31)}
wvSetCursor -win $_nWave1 154725.014552 -snap {("G1" 31)}
wvSetCursor -win $_nWave1 157144.345632 -snap {("G1" 30)}
wvZoomIn -win $_nWave1
wvSetCursor -win $_nWave1 157501.617046 -snap {("G1" 31)}
wvSetCursor -win $_nWave1 156725.081918 -snap {("G1" 31)}
wvSelectSignal -win $_nWave1 {( "G1" 17 18 19 )} 
wvSelectSignal -win $_nWave1 {( "G1" 17 18 19 )} 
wvSetRadix -win $_nWave1 -format UDec
wvSetCursor -win $_nWave1 156744.658434 -snap {("G1" 31)}
wvSetCursor -win $_nWave1 156738.132929 -snap {("G1" 31)}
wvSetCursor -win $_nWave1 156457.536202 -snap {("G1" 31)}
wvSetCursor -win $_nWave1 156738.132929 -snap {("G1" 31)}
wvSetCursor -win $_nWave1 157123.137740 -snap {("G1" 31)}
wvSetCursor -win $_nWave1 157539.138701 -snap {("G1" 30)}
wvSetCursor -win $_nWave1 157946.982781 -snap {("G1" 30)}
wvSetCursor -win $_nWave1 158348.301355 -snap {("G1" 30)}
wvSetCursor -win $_nWave1 158744.725800 -snap {("G1" 30)}
wvSetCursor -win $_nWave1 159129.730611 -snap {("G1" 30)}
wvSetCursor -win $_nWave1 159535.943315 -snap {("G1" 30)}
wvSetCursor -win $_nWave1 159947.050147 -snap {("G1" 30)}
wvSetCursor -win $_nWave1 160350.000097 -snap {("G1" 30)}
wvSetCursor -win $_nWave1 160735.004908 -snap {("G1" 30)}
wvSetCursor -win $_nWave1 160346.737345 -snap {("G1" 30)}
wvSetCursor -win $_nWave1 160731.742156 -snap {("G1" 30)}
wvSetCursor -win $_nWave1 161142.848988 -snap {("G1" 30)}
wvScrollDown -win $_nWave1 0
wvScrollDown -win $_nWave1 0
wvGetSignalOpen -win $_nWave1
wvGetSignalSetScope -win $_nWave1 "/test_top/Conv_top"
wvSetPosition -win $_nWave1 {("G1" 39)}
wvSetPosition -win $_nWave1 {("G1" 39)}
wvAddSignal -win $_nWave1 -clear
wvAddSignal -win $_nWave1 -group {"G1" \
{/test_top/Conv_top/top_CNN/W\[0:15\]} \
{/test_top/Conv_top/top_CNN/X\[0:15\]} \
{/test_top/Conv_top/top_CNN/Y\[0:15\]} \
{/test_top/Conv_top/top_CNN/bias\[3:0\]} \
{/test_top/Conv_top/top_CNN/clk} \
{/test_top/Conv_top/top_CNN/cnn_state\[4:0\]} \
{/test_top/Conv_top/top_CNN/cnn_state_p} \
{/test_top/Conv_top/top_CNN/cnn_state_pppp} \
{/test_top/Conv_top/top_CNN/conv_out\[0:3\]} \
{/test_top/Conv_top/top_CNN/conv_out_FF\[0:3\]} \
{/test_top/Conv_top/top_CNN/feature_maps_o0\[15:0\]} \
{/test_top/Conv_top/top_CNN/feature_maps_o1\[15:0\]} \
{/test_top/Conv_top/top_CNN/feature_maps_o2\[15:0\]} \
{/test_top/Conv_top/top_CNN/feature_maps_o3\[15:0\]} \
{/test_top/Conv_top/top_CNN/feature_maps_temp_o\[0:3\]} \
{/test_top/Conv_top/top_CNN/load_weight_finish} \
{/test_top/Conv_top/top_CNN/max0\[7:0\]} \
{/test_top/Conv_top/top_CNN/max1\[7:0\]} \
{/test_top/Conv_top/top_CNN/max\[7:0\]} \
{/test_top/Conv_top/top_CNN/read_bias_finish} \
{/test_top/Conv_top/top_CNN/read_cnt\[10:0\]} \
{/test_top/Conv_top/top_CNN/read_weight_finish} \
{/test_top/Conv_top/top_CNN/rst_n} \
{/test_top/Conv_top/top_CNN/state\[5:0\]} \
{/test_top/Conv_top/top_CNN/state_p\[5:0\]} \
{/test_top/Conv_top/top_CNN/temp_conv_out\[0:3\]} \
{/test_top/Conv_top/top_CNN/x_cnt\[4:0\]} \
{/test_top/Conv_top/top_CNN/x_cnt_ppp\[4:0\]} \
{/test_top/Conv_top/top_CNN/y_cnt_ppp\[4:0\]} \
{/test_top/Conv_top/bytemask/final_cnt\[10:0\]} \
{/test_top/Conv_top/read_input_cnt_ppp\[1:0\]} \
{/test_top/Conv_top/cnn_state_ppppppp} \
{/test_top/Conv_top/sram_bytemask_b\[15:0\]} \
{/test_top/Conv_top/sram_waddr_b\[5:0\]} \
{/test_top/Conv_top/sram_wdata_b\[127:0\]} \
{/test_top/Conv_top/sram_wen_b0} \
{/test_top/Conv_top/sram_wen_b1} \
{/test_top/Conv_top/sram_wen_b2} \
{/test_top/Conv_top/sram_wen_b3} \
}
wvAddSignal -win $_nWave1 -group {"G2" \
}
wvSelectSignal -win $_nWave1 {( "G1" 33 34 35 36 37 38 39 )} 
wvSetPosition -win $_nWave1 {("G1" 39)}
wvSetPosition -win $_nWave1 {("G1" 39)}
wvSetPosition -win $_nWave1 {("G1" 39)}
wvAddSignal -win $_nWave1 -clear
wvAddSignal -win $_nWave1 -group {"G1" \
{/test_top/Conv_top/top_CNN/W\[0:15\]} \
{/test_top/Conv_top/top_CNN/X\[0:15\]} \
{/test_top/Conv_top/top_CNN/Y\[0:15\]} \
{/test_top/Conv_top/top_CNN/bias\[3:0\]} \
{/test_top/Conv_top/top_CNN/clk} \
{/test_top/Conv_top/top_CNN/cnn_state\[4:0\]} \
{/test_top/Conv_top/top_CNN/cnn_state_p} \
{/test_top/Conv_top/top_CNN/cnn_state_pppp} \
{/test_top/Conv_top/top_CNN/conv_out\[0:3\]} \
{/test_top/Conv_top/top_CNN/conv_out_FF\[0:3\]} \
{/test_top/Conv_top/top_CNN/feature_maps_o0\[15:0\]} \
{/test_top/Conv_top/top_CNN/feature_maps_o1\[15:0\]} \
{/test_top/Conv_top/top_CNN/feature_maps_o2\[15:0\]} \
{/test_top/Conv_top/top_CNN/feature_maps_o3\[15:0\]} \
{/test_top/Conv_top/top_CNN/feature_maps_temp_o\[0:3\]} \
{/test_top/Conv_top/top_CNN/load_weight_finish} \
{/test_top/Conv_top/top_CNN/max0\[7:0\]} \
{/test_top/Conv_top/top_CNN/max1\[7:0\]} \
{/test_top/Conv_top/top_CNN/max\[7:0\]} \
{/test_top/Conv_top/top_CNN/read_bias_finish} \
{/test_top/Conv_top/top_CNN/read_cnt\[10:0\]} \
{/test_top/Conv_top/top_CNN/read_weight_finish} \
{/test_top/Conv_top/top_CNN/rst_n} \
{/test_top/Conv_top/top_CNN/state\[5:0\]} \
{/test_top/Conv_top/top_CNN/state_p\[5:0\]} \
{/test_top/Conv_top/top_CNN/temp_conv_out\[0:3\]} \
{/test_top/Conv_top/top_CNN/x_cnt\[4:0\]} \
{/test_top/Conv_top/top_CNN/x_cnt_ppp\[4:0\]} \
{/test_top/Conv_top/top_CNN/y_cnt_ppp\[4:0\]} \
{/test_top/Conv_top/bytemask/final_cnt\[10:0\]} \
{/test_top/Conv_top/read_input_cnt_ppp\[1:0\]} \
{/test_top/Conv_top/cnn_state_ppppppp} \
{/test_top/Conv_top/sram_bytemask_b\[15:0\]} \
{/test_top/Conv_top/sram_waddr_b\[5:0\]} \
{/test_top/Conv_top/sram_wdata_b\[127:0\]} \
{/test_top/Conv_top/sram_wen_b0} \
{/test_top/Conv_top/sram_wen_b1} \
{/test_top/Conv_top/sram_wen_b2} \
{/test_top/Conv_top/sram_wen_b3} \
}
wvAddSignal -win $_nWave1 -group {"G2" \
}
wvSelectSignal -win $_nWave1 {( "G1" 33 34 35 36 37 38 39 )} 
wvSetPosition -win $_nWave1 {("G1" 39)}
wvGetSignalClose -win $_nWave1
wvSelectSignal -win $_nWave1 {( "G1" 34 )} 
wvSelectSignal -win $_nWave1 {( "G1" 33 34 35 36 37 38 39 )} 
wvSelectSignal -win $_nWave1 {( "G1" 33 34 35 36 37 38 39 )} 
wvSetRadix -win $_nWave1 -format UDec
wvSelectSignal -win $_nWave1 {( "G1" 33 34 35 36 37 38 39 )} 
wvSetRadix -win $_nWave1 -format UDec
wvSelectSignal -win $_nWave1 {( "G1" 33 )} 
wvSelectSignal -win $_nWave1 {( "G1" 33 )} 
wvSetRadix -win $_nWave1 -format Bin
wvScrollDown -win $_nWave1 0
wvScrollDown -win $_nWave1 0
wvScrollDown -win $_nWave1 0
wvScrollDown -win $_nWave1 0
wvScrollUp -win $_nWave1 1
wvScrollUp -win $_nWave1 1
wvScrollDown -win $_nWave1 1
wvScrollDown -win $_nWave1 1
wvScrollDown -win $_nWave1 0
wvScrollDown -win $_nWave1 0
wvZoomOut -win $_nWave1
wvSetCursor -win $_nWave1 159591.410109 -snap {("G1" 31)}
wvScrollDown -win $_nWave1 0
wvScrollDown -win $_nWave1 0
wvScrollDown -win $_nWave1 0
wvScrollDown -win $_nWave1 0
wvScrollDown -win $_nWave1 0
wvScrollDown -win $_nWave1 0
wvScrollDown -win $_nWave1 0
wvScrollDown -win $_nWave1 0
wvSetCursor -win $_nWave1 158431.175272 -snap {("G1" 31)}
wvSetCursor -win $_nWave1 158548.634367 -snap {("G1" 30)}
wvSetCursor -win $_nWave1 148744.388970 -snap {("G1" 30)}
wvSetCursor -win $_nWave1 148444.215728 -snap {("G1" 31)}
wvScrollDown -win $_nWave1 0
wvScrollDown -win $_nWave1 0
wvSetCursor -win $_nWave1 148385.486180 -snap {("G1" 35)}
wvSetCursor -win $_nWave1 148489.894265 -snap {("G1" 35)}
wvDisplayGridCount -win $_nWave1 -off
wvGetSignalClose -win $_nWave1
wvReloadFile -win $_nWave1
wvSetCursor -win $_nWave1 148848.797055 -snap {("G1" 36)}
wvSetCursor -win $_nWave1 154773.629567 -snap {("G1" 37)}
wvZoomOut -win $_nWave1
wvZoomOut -win $_nWave1
wvZoomOut -win $_nWave1
wvZoomOut -win $_nWave1
wvZoomOut -win $_nWave1
wvZoomOut -win $_nWave1
wvZoomOut -win $_nWave1
wvSetCursor -win $_nWave1 147159.406960 -snap {("G1" 34)}
wvZoomIn -win $_nWave1
wvZoomIn -win $_nWave1
wvZoomIn -win $_nWave1
wvZoomIn -win $_nWave1
wvZoomIn -win $_nWave1
wvZoomIn -win $_nWave1
wvZoomIn -win $_nWave1
wvZoomIn -win $_nWave1
wvSetCursor -win $_nWave1 272351.773858 -snap {("G1" 36)}
wvSetCursor -win $_nWave1 272244.103021 -snap {("G1" 19)}
wvDisplayGridCount -win $_nWave1 -off
wvGetSignalClose -win $_nWave1
wvReloadFile -win $_nWave1
wvSelectSignal -win $_nWave1 {( "G1" 34 )} 
wvScrollUp -win $_nWave1 1
wvScrollUp -win $_nWave1 1
wvScrollDown -win $_nWave1 1
wvScrollDown -win $_nWave1 1
wvScrollDown -win $_nWave1 0
wvScrollDown -win $_nWave1 0
wvZoomOut -win $_nWave1
wvZoomOut -win $_nWave1
wvZoomOut -win $_nWave1
wvScrollUp -win $_nWave1 1
wvScrollUp -win $_nWave1 1
wvScrollUp -win $_nWave1 1
wvScrollUp -win $_nWave1 1
wvScrollUp -win $_nWave1 1
wvScrollUp -win $_nWave1 1
wvScrollUp -win $_nWave1 1
wvScrollUp -win $_nWave1 1
wvScrollUp -win $_nWave1 1
wvScrollUp -win $_nWave1 1
wvScrollUp -win $_nWave1 1
wvScrollUp -win $_nWave1 1
wvScrollUp -win $_nWave1 1
wvScrollDown -win $_nWave1 1
wvScrollDown -win $_nWave1 1
wvScrollDown -win $_nWave1 1
wvZoomIn -win $_nWave1
wvSetCursor -win $_nWave1 154484.773926 -snap {("G1" 30)}
wvScrollDown -win $_nWave1 1
wvScrollDown -win $_nWave1 1
wvScrollDown -win $_nWave1 1
wvScrollDown -win $_nWave1 1
wvScrollDown -win $_nWave1 1
wvScrollDown -win $_nWave1 1
wvSetCursor -win $_nWave1 154654.437063 -snap {("G1" 30)}
wvScrollDown -win $_nWave1 1
wvScrollDown -win $_nWave1 1
wvZoomIn -win $_nWave1
wvZoomOut -win $_nWave1
wvZoomIn -win $_nWave1
wvSetCursor -win $_nWave1 157154.358133 -snap {("G1" 35)}
wvScrollDown -win $_nWave1 1
wvSetCursor -win $_nWave1 157539.362944 -snap {("G1" 35)}
wvZoomIn -win $_nWave1
wvZoomOut -win $_nWave1
wvZoomOut -win $_nWave1
wvSetCursor -win $_nWave1 683947.121532 -snap {("G1" 37)}
wvScrollDown -win $_nWave1 1
wvScrollDown -win $_nWave1 0
wvScrollDown -win $_nWave1 0
wvScrollDown -win $_nWave1 0
wvZoomIn -win $_nWave1
wvZoomOut -win $_nWave1
wvSetCursor -win $_nWave1 683527.359368 -snap {("G1" 37)}
wvScrollDown -win $_nWave1 0
wvScrollDown -win $_nWave1 0
wvScrollDown -win $_nWave1 0
wvGetSignalOpen -win $_nWave1
wvGetSignalClose -win $_nWave1
wvDisplayGridCount -win $_nWave1 -off
wvGetSignalClose -win $_nWave1
wvReloadFile -win $_nWave1
wvGetSignalOpen -win $_nWave1
wvGetSignalSetScope -win $_nWave1 "/test_top/sram_36x128b_a0"
wvSetPosition -win $_nWave1 {("G1" 40)}
wvSetPosition -win $_nWave1 {("G1" 40)}
wvAddSignal -win $_nWave1 -clear
wvAddSignal -win $_nWave1 -group {"G1" \
{/test_top/Conv_top/top_CNN/W\[0:15\]} \
{/test_top/Conv_top/top_CNN/X\[0:15\]} \
{/test_top/Conv_top/top_CNN/Y\[0:15\]} \
{/test_top/Conv_top/top_CNN/bias\[3:0\]} \
{/test_top/Conv_top/top_CNN/clk} \
{/test_top/Conv_top/top_CNN/cnn_state\[4:0\]} \
{/test_top/Conv_top/top_CNN/cnn_state_p} \
{/test_top/Conv_top/top_CNN/cnn_state_pppp} \
{/test_top/Conv_top/top_CNN/conv_out\[0:3\]} \
{/test_top/Conv_top/top_CNN/conv_out_FF\[0:3\]} \
{/test_top/Conv_top/top_CNN/feature_maps_o0\[15:0\]} \
{/test_top/Conv_top/top_CNN/feature_maps_o1\[15:0\]} \
{/test_top/Conv_top/top_CNN/feature_maps_o2\[15:0\]} \
{/test_top/Conv_top/top_CNN/feature_maps_o3\[15:0\]} \
{/test_top/Conv_top/top_CNN/feature_maps_temp_o\[0:3\]} \
{/test_top/Conv_top/top_CNN/load_weight_finish} \
{/test_top/Conv_top/top_CNN/max0\[7:0\]} \
{/test_top/Conv_top/top_CNN/max1\[7:0\]} \
{/test_top/Conv_top/top_CNN/max\[7:0\]} \
{/test_top/Conv_top/top_CNN/read_bias_finish} \
{/test_top/Conv_top/top_CNN/read_cnt\[10:0\]} \
{/test_top/Conv_top/top_CNN/read_weight_finish} \
{/test_top/Conv_top/top_CNN/rst_n} \
{/test_top/Conv_top/top_CNN/state\[5:0\]} \
{/test_top/Conv_top/top_CNN/state_p\[5:0\]} \
{/test_top/Conv_top/top_CNN/temp_conv_out\[0:3\]} \
{/test_top/Conv_top/top_CNN/x_cnt\[4:0\]} \
{/test_top/Conv_top/top_CNN/x_cnt_ppp\[4:0\]} \
{/test_top/Conv_top/top_CNN/y_cnt_ppp\[4:0\]} \
{/test_top/Conv_top/bytemask/final_cnt\[10:0\]} \
{/test_top/Conv_top/read_input_cnt_ppp\[1:0\]} \
{/test_top/Conv_top/cnn_state_ppppppp} \
{/test_top/Conv_top/sram_bytemask_b\[15:0\]} \
{/test_top/Conv_top/sram_waddr_b\[5:0\]} \
{/test_top/Conv_top/sram_wdata_b\[127:0\]} \
{/test_top/Conv_top/sram_wen_b0} \
{/test_top/Conv_top/sram_wen_b1} \
{/test_top/Conv_top/sram_wen_b2} \
{/test_top/Conv_top/sram_wen_b3} \
{/test_top/sram_36x128b_a0/mem\[0:36\]} \
}
wvAddSignal -win $_nWave1 -group {"G2" \
}
wvSelectSignal -win $_nWave1 {( "G1" 40 )} 
wvSetPosition -win $_nWave1 {("G1" 40)}
wvSetPosition -win $_nWave1 {("G1" 40)}
wvSetPosition -win $_nWave1 {("G1" 40)}
wvAddSignal -win $_nWave1 -clear
wvAddSignal -win $_nWave1 -group {"G1" \
{/test_top/Conv_top/top_CNN/W\[0:15\]} \
{/test_top/Conv_top/top_CNN/X\[0:15\]} \
{/test_top/Conv_top/top_CNN/Y\[0:15\]} \
{/test_top/Conv_top/top_CNN/bias\[3:0\]} \
{/test_top/Conv_top/top_CNN/clk} \
{/test_top/Conv_top/top_CNN/cnn_state\[4:0\]} \
{/test_top/Conv_top/top_CNN/cnn_state_p} \
{/test_top/Conv_top/top_CNN/cnn_state_pppp} \
{/test_top/Conv_top/top_CNN/conv_out\[0:3\]} \
{/test_top/Conv_top/top_CNN/conv_out_FF\[0:3\]} \
{/test_top/Conv_top/top_CNN/feature_maps_o0\[15:0\]} \
{/test_top/Conv_top/top_CNN/feature_maps_o1\[15:0\]} \
{/test_top/Conv_top/top_CNN/feature_maps_o2\[15:0\]} \
{/test_top/Conv_top/top_CNN/feature_maps_o3\[15:0\]} \
{/test_top/Conv_top/top_CNN/feature_maps_temp_o\[0:3\]} \
{/test_top/Conv_top/top_CNN/load_weight_finish} \
{/test_top/Conv_top/top_CNN/max0\[7:0\]} \
{/test_top/Conv_top/top_CNN/max1\[7:0\]} \
{/test_top/Conv_top/top_CNN/max\[7:0\]} \
{/test_top/Conv_top/top_CNN/read_bias_finish} \
{/test_top/Conv_top/top_CNN/read_cnt\[10:0\]} \
{/test_top/Conv_top/top_CNN/read_weight_finish} \
{/test_top/Conv_top/top_CNN/rst_n} \
{/test_top/Conv_top/top_CNN/state\[5:0\]} \
{/test_top/Conv_top/top_CNN/state_p\[5:0\]} \
{/test_top/Conv_top/top_CNN/temp_conv_out\[0:3\]} \
{/test_top/Conv_top/top_CNN/x_cnt\[4:0\]} \
{/test_top/Conv_top/top_CNN/x_cnt_ppp\[4:0\]} \
{/test_top/Conv_top/top_CNN/y_cnt_ppp\[4:0\]} \
{/test_top/Conv_top/bytemask/final_cnt\[10:0\]} \
{/test_top/Conv_top/read_input_cnt_ppp\[1:0\]} \
{/test_top/Conv_top/cnn_state_ppppppp} \
{/test_top/Conv_top/sram_bytemask_b\[15:0\]} \
{/test_top/Conv_top/sram_waddr_b\[5:0\]} \
{/test_top/Conv_top/sram_wdata_b\[127:0\]} \
{/test_top/Conv_top/sram_wen_b0} \
{/test_top/Conv_top/sram_wen_b1} \
{/test_top/Conv_top/sram_wen_b2} \
{/test_top/Conv_top/sram_wen_b3} \
{/test_top/sram_36x128b_a0/mem\[0:36\]} \
}
wvAddSignal -win $_nWave1 -group {"G2" \
}
wvSelectSignal -win $_nWave1 {( "G1" 40 )} 
wvSetPosition -win $_nWave1 {("G1" 40)}
wvGetSignalClose -win $_nWave1
wvZoomOut -win $_nWave1
wvZoomOut -win $_nWave1
wvZoomOut -win $_nWave1
wvZoomOut -win $_nWave1
wvZoomOut -win $_nWave1
wvZoomOut -win $_nWave1
wvSetCursor -win $_nWave1 147822.920927 -snap {("G1" 36)}
wvZoomIn -win $_nWave1
wvZoomIn -win $_nWave1
wvZoomIn -win $_nWave1
wvZoomIn -win $_nWave1
wvZoomIn -win $_nWave1
wvZoomIn -win $_nWave1
wvSelectSignal -win $_nWave1 {( "G1" 40 )} 
wvSelectSignal -win $_nWave1 {( "G1" 40 )} 
wvExpandBus -win $_nWave1 {("G1" 40)}
wvScrollUp -win $_nWave1 1
wvScrollUp -win $_nWave1 1
wvScrollUp -win $_nWave1 1
wvScrollUp -win $_nWave1 1
wvScrollUp -win $_nWave1 1
wvScrollUp -win $_nWave1 1
wvScrollUp -win $_nWave1 1
wvScrollUp -win $_nWave1 1
wvScrollUp -win $_nWave1 1
wvScrollUp -win $_nWave1 1
wvScrollUp -win $_nWave1 1
wvScrollUp -win $_nWave1 1
wvScrollUp -win $_nWave1 1
wvScrollUp -win $_nWave1 1
wvScrollUp -win $_nWave1 1
wvScrollUp -win $_nWave1 1
wvScrollUp -win $_nWave1 1
wvScrollUp -win $_nWave1 1
wvScrollUp -win $_nWave1 1
wvScrollUp -win $_nWave1 1
wvScrollUp -win $_nWave1 1
wvScrollUp -win $_nWave1 1
wvScrollUp -win $_nWave1 1
wvScrollUp -win $_nWave1 1
wvScrollUp -win $_nWave1 1
wvSetCursor -win $_nWave1 148077.151064 -snap {("G1" 31)}
wvSetCursor -win $_nWave1 148749.791696 -snap {("G1" 30)}
wvScrollDown -win $_nWave1 1
wvScrollDown -win $_nWave1 1
wvScrollDown -win $_nWave1 1
wvScrollUp -win $_nWave1 1
wvScrollUp -win $_nWave1 1
wvScrollUp -win $_nWave1 1
wvSetCursor -win $_nWave1 148650.549636 -snap {("G1" 35)}
wvSetCursor -win $_nWave1 148661.576531 -snap {("G1" 36)}
wvSetCursor -win $_nWave1 148749.791696 -snap {("G1" 36)}
wvSelectSignal -win $_nWave1 {( "G1" 35 )} 
wvSelectSignal -win $_nWave1 {( "G1" 35 )} 
wvSetRadix -win $_nWave1 -format Hex
wvScrollUp -win $_nWave1 1
wvScrollUp -win $_nWave1 1
wvScrollUp -win $_nWave1 1
wvScrollUp -win $_nWave1 1
wvSetCursor -win $_nWave1 148661.576531 -snap {("G1" 36)}
wvSetCursor -win $_nWave1 148744.278248 -snap {("G1" 36)}
wvSetCursor -win $_nWave1 148661.576531 -snap {("G1" 36)}
wvScrollUp -win $_nWave1 1
wvScrollUp -win $_nWave1 1
wvScrollUp -win $_nWave1 1
wvScrollUp -win $_nWave1 1
wvScrollUp -win $_nWave1 1
wvScrollUp -win $_nWave1 1
wvScrollUp -win $_nWave1 1
wvScrollUp -win $_nWave1 1
wvScrollUp -win $_nWave1 1
wvScrollUp -win $_nWave1 1
wvScrollUp -win $_nWave1 1
wvScrollDown -win $_nWave1 1
wvScrollDown -win $_nWave1 1
wvScrollDown -win $_nWave1 1
wvScrollDown -win $_nWave1 1
wvScrollDown -win $_nWave1 1
wvScrollDown -win $_nWave1 1
wvScrollDown -win $_nWave1 1
wvZoomOut -win $_nWave1
wvZoomIn -win $_nWave1
wvSetCursor -win $_nWave1 148733.251353 -snap {("G1" 35)}
wvSetCursor -win $_nWave1 148634.009292 -snap {("G1" 35)}
wvSetCursor -win $_nWave1 149157.786833 -snap {("G1" 35)}
wvSetCursor -win $_nWave1 148650.549636 -snap {("G1" 35)}
wvSetCursor -win $_nWave1 148237.041051 -snap {("G1" 41)}
wvZoomOut -win $_nWave1
wvZoomOut -win $_nWave1
wvZoomOut -win $_nWave1
wvZoomOut -win $_nWave1
wvZoomOut -win $_nWave1
wvZoomOut -win $_nWave1
wvZoomOut -win $_nWave1
wvSetCursor -win $_nWave1 149612.919491 -snap {("G1" 24)}
wvZoomIn -win $_nWave1
wvZoomIn -win $_nWave1
wvZoomOut -win $_nWave1
wvScrollDown -win $_nWave1 1
wvScrollDown -win $_nWave1 1
wvScrollDown -win $_nWave1 1
wvScrollDown -win $_nWave1 1
wvScrollDown -win $_nWave1 1
wvScrollDown -win $_nWave1 1
wvScrollDown -win $_nWave1 1
wvScrollDown -win $_nWave1 1
wvScrollDown -win $_nWave1 1
wvScrollDown -win $_nWave1 1
wvScrollDown -win $_nWave1 1
wvScrollDown -win $_nWave1 1
wvScrollDown -win $_nWave1 1
wvScrollDown -win $_nWave1 1
wvScrollDown -win $_nWave1 1
wvScrollDown -win $_nWave1 1
wvScrollDown -win $_nWave1 1
wvScrollDown -win $_nWave1 1
wvScrollDown -win $_nWave1 1
wvScrollDown -win $_nWave1 1
wvScrollDown -win $_nWave1 1
wvScrollDown -win $_nWave1 1
wvScrollDown -win $_nWave1 1
wvScrollDown -win $_nWave1 1
wvScrollDown -win $_nWave1 1
wvScrollDown -win $_nWave1 1
wvScrollDown -win $_nWave1 1
wvScrollDown -win $_nWave1 1
wvScrollDown -win $_nWave1 1
wvScrollDown -win $_nWave1 1
wvScrollDown -win $_nWave1 1
wvScrollDown -win $_nWave1 1
wvScrollDown -win $_nWave1 1
wvScrollDown -win $_nWave1 1
wvScrollDown -win $_nWave1 0
wvScrollDown -win $_nWave1 0
wvScrollDown -win $_nWave1 0
wvScrollDown -win $_nWave1 0
wvScrollDown -win $_nWave1 0
wvScrollDown -win $_nWave1 0
wvScrollUp -win $_nWave1 1
wvScrollUp -win $_nWave1 1
wvScrollUp -win $_nWave1 1
wvScrollUp -win $_nWave1 1
wvScrollUp -win $_nWave1 1
wvScrollUp -win $_nWave1 1
wvScrollUp -win $_nWave1 1
wvScrollUp -win $_nWave1 1
wvScrollUp -win $_nWave1 1
wvScrollUp -win $_nWave1 1
wvScrollUp -win $_nWave1 1
wvScrollUp -win $_nWave1 1
wvScrollUp -win $_nWave1 1
wvScrollUp -win $_nWave1 1
wvScrollUp -win $_nWave1 1
wvScrollUp -win $_nWave1 1
wvScrollUp -win $_nWave1 1
wvScrollUp -win $_nWave1 1
wvScrollUp -win $_nWave1 1
wvScrollUp -win $_nWave1 1
wvScrollUp -win $_nWave1 1
wvScrollUp -win $_nWave1 1
wvScrollUp -win $_nWave1 1
wvScrollUp -win $_nWave1 1
wvScrollUp -win $_nWave1 1
wvZoomIn -win $_nWave1
wvZoomIn -win $_nWave1
wvZoomIn -win $_nWave1
wvZoomIn -win $_nWave1
wvZoomIn -win $_nWave1
wvZoomIn -win $_nWave1
wvZoomOut -win $_nWave1
wvScrollUp -win $_nWave1 1
wvScrollUp -win $_nWave1 1
wvScrollUp -win $_nWave1 1
wvSetCursor -win $_nWave1 199043.417626 -snap {("G1" 36)}
wvScrollUp -win $_nWave1 1
wvZoomIn -win $_nWave1
wvSelectSignal -win $_nWave1 {( "G1" 40 )} 
wvSelectSignal -win $_nWave1 {( "G1" 40 )} 
wvSetPosition -win $_nWave1 {("G1" 40)}
wvCollapseBus -win $_nWave1 {("G1" 40)}
wvSetPosition -win $_nWave1 {("G1" 40)}
wvSelectSignal -win $_nWave1 {( "G1" 40 )} 
wvExpandBus -win $_nWave1 {("G1" 40)}
wvScrollUp -win $_nWave1 13
wvSelectSignal -win $_nWave1 {( "G1" 40 )} 
wvSetPosition -win $_nWave1 {("G1" 40)}
wvCollapseBus -win $_nWave1 {("G1" 40)}
wvSetPosition -win $_nWave1 {("G1" 40)}
wvScrollDown -win $_nWave1 0
wvScrollDown -win $_nWave1 0
wvSetCursor -win $_nWave1 551861.257590 -snap {("G1" 37)}
wvScrollDown -win $_nWave1 0
wvScrollDown -win $_nWave1 0
wvZoomOut -win $_nWave1
wvSelectSignal -win $_nWave1 {( "G1" 34 )} 
wvZoomOut -win $_nWave1
wvZoomOut -win $_nWave1
wvZoomOut -win $_nWave1
wvZoomOut -win $_nWave1
wvZoomOut -win $_nWave1
wvZoomOut -win $_nWave1
wvZoomOut -win $_nWave1
wvSetCursor -win $_nWave1 450639.811951 -snap {("G1" 34)}
wvSetCursor -win $_nWave1 403267.971880 -snap {("G1" 34)}
wvSetCursor -win $_nWave1 448210.486819 -snap {("G1" 34)}
wvSetCursor -win $_nWave1 454283.799649 -snap {("G1" 34)}
wvSetCursor -win $_nWave1 440922.511424 -snap {("G1" 34)}
wvSetCursor -win $_nWave1 451854.474517 -snap {("G1" 34)}
wvDisplayGridCount -win $_nWave1 -off
wvGetSignalClose -win $_nWave1
wvReloadFile -win $_nWave1
wvScrollDown -win $_nWave1 0
wvScrollDown -win $_nWave1 0
wvScrollDown -win $_nWave1 0
wvScrollDown -win $_nWave1 0
wvScrollDown -win $_nWave1 0
wvScrollDown -win $_nWave1 0
wvScrollDown -win $_nWave1 0
wvScrollDown -win $_nWave1 0
wvScrollUp -win $_nWave1 1
wvScrollUp -win $_nWave1 1
wvScrollDown -win $_nWave1 1
wvScrollDown -win $_nWave1 1
wvScrollDown -win $_nWave1 0
wvScrollDown -win $_nWave1 0
wvScrollDown -win $_nWave1 0
wvScrollDown -win $_nWave1 0
wvScrollDown -win $_nWave1 0
wvScrollDown -win $_nWave1 0
wvSelectSignal -win $_nWave1 {( "G1" 40 )} 
wvSelectSignal -win $_nWave1 {( "G1" 40 )} 
wvCut -win $_nWave1
wvSetPosition -win $_nWave1 {("G2" 0)}
wvSetPosition -win $_nWave1 {("G1" 39)}
wvScrollDown -win $_nWave1 0
wvScrollDown -win $_nWave1 0
wvScrollDown -win $_nWave1 0
wvScrollDown -win $_nWave1 0
wvSetCursor -win $_nWave1 137256.869947 -snap {("G1" 36)}
wvZoomIn -win $_nWave1
wvGetSignalOpen -win $_nWave1
wvGetSignalSetScope -win $_nWave1 "/test_top/Conv_top"
wvSetPosition -win $_nWave1 {("G1" 40)}
wvSetPosition -win $_nWave1 {("G1" 40)}
wvAddSignal -win $_nWave1 -clear
wvAddSignal -win $_nWave1 -group {"G1" \
{/test_top/Conv_top/top_CNN/W\[0:15\]} \
{/test_top/Conv_top/top_CNN/X\[0:15\]} \
{/test_top/Conv_top/top_CNN/Y\[0:15\]} \
{/test_top/Conv_top/top_CNN/bias\[3:0\]} \
{/test_top/Conv_top/top_CNN/clk} \
{/test_top/Conv_top/top_CNN/cnn_state\[4:0\]} \
{/test_top/Conv_top/top_CNN/cnn_state_p} \
{/test_top/Conv_top/top_CNN/cnn_state_pppp} \
{/test_top/Conv_top/top_CNN/conv_out\[0:3\]} \
{/test_top/Conv_top/top_CNN/conv_out_FF\[0:3\]} \
{/test_top/Conv_top/top_CNN/feature_maps_o0\[15:0\]} \
{/test_top/Conv_top/top_CNN/feature_maps_o1\[15:0\]} \
{/test_top/Conv_top/top_CNN/feature_maps_o2\[15:0\]} \
{/test_top/Conv_top/top_CNN/feature_maps_o3\[15:0\]} \
{/test_top/Conv_top/top_CNN/feature_maps_temp_o\[0:3\]} \
{/test_top/Conv_top/top_CNN/load_weight_finish} \
{/test_top/Conv_top/top_CNN/max0\[7:0\]} \
{/test_top/Conv_top/top_CNN/max1\[7:0\]} \
{/test_top/Conv_top/top_CNN/max\[7:0\]} \
{/test_top/Conv_top/top_CNN/read_bias_finish} \
{/test_top/Conv_top/top_CNN/read_cnt\[10:0\]} \
{/test_top/Conv_top/top_CNN/read_weight_finish} \
{/test_top/Conv_top/top_CNN/rst_n} \
{/test_top/Conv_top/top_CNN/state\[5:0\]} \
{/test_top/Conv_top/top_CNN/state_p\[5:0\]} \
{/test_top/Conv_top/top_CNN/temp_conv_out\[0:3\]} \
{/test_top/Conv_top/top_CNN/x_cnt\[4:0\]} \
{/test_top/Conv_top/top_CNN/x_cnt_ppp\[4:0\]} \
{/test_top/Conv_top/top_CNN/y_cnt_ppp\[4:0\]} \
{/test_top/Conv_top/bytemask/final_cnt\[10:0\]} \
{/test_top/Conv_top/read_input_cnt_ppp\[1:0\]} \
{/test_top/Conv_top/cnn_state_ppppppp} \
{/test_top/Conv_top/sram_bytemask_b\[15:0\]} \
{/test_top/Conv_top/sram_waddr_b\[5:0\]} \
{/test_top/Conv_top/sram_wdata_b\[127:0\]} \
{/test_top/Conv_top/sram_wen_b0} \
{/test_top/Conv_top/sram_wen_b1} \
{/test_top/Conv_top/sram_wen_b2} \
{/test_top/Conv_top/sram_wen_b3} \
{/test_top/Conv_top/valid} \
}
wvAddSignal -win $_nWave1 -group {"G2" \
}
wvSelectSignal -win $_nWave1 {( "G1" 40 )} 
wvSetPosition -win $_nWave1 {("G1" 40)}
wvSetPosition -win $_nWave1 {("G1" 40)}
wvSetPosition -win $_nWave1 {("G1" 40)}
wvAddSignal -win $_nWave1 -clear
wvAddSignal -win $_nWave1 -group {"G1" \
{/test_top/Conv_top/top_CNN/W\[0:15\]} \
{/test_top/Conv_top/top_CNN/X\[0:15\]} \
{/test_top/Conv_top/top_CNN/Y\[0:15\]} \
{/test_top/Conv_top/top_CNN/bias\[3:0\]} \
{/test_top/Conv_top/top_CNN/clk} \
{/test_top/Conv_top/top_CNN/cnn_state\[4:0\]} \
{/test_top/Conv_top/top_CNN/cnn_state_p} \
{/test_top/Conv_top/top_CNN/cnn_state_pppp} \
{/test_top/Conv_top/top_CNN/conv_out\[0:3\]} \
{/test_top/Conv_top/top_CNN/conv_out_FF\[0:3\]} \
{/test_top/Conv_top/top_CNN/feature_maps_o0\[15:0\]} \
{/test_top/Conv_top/top_CNN/feature_maps_o1\[15:0\]} \
{/test_top/Conv_top/top_CNN/feature_maps_o2\[15:0\]} \
{/test_top/Conv_top/top_CNN/feature_maps_o3\[15:0\]} \
{/test_top/Conv_top/top_CNN/feature_maps_temp_o\[0:3\]} \
{/test_top/Conv_top/top_CNN/load_weight_finish} \
{/test_top/Conv_top/top_CNN/max0\[7:0\]} \
{/test_top/Conv_top/top_CNN/max1\[7:0\]} \
{/test_top/Conv_top/top_CNN/max\[7:0\]} \
{/test_top/Conv_top/top_CNN/read_bias_finish} \
{/test_top/Conv_top/top_CNN/read_cnt\[10:0\]} \
{/test_top/Conv_top/top_CNN/read_weight_finish} \
{/test_top/Conv_top/top_CNN/rst_n} \
{/test_top/Conv_top/top_CNN/state\[5:0\]} \
{/test_top/Conv_top/top_CNN/state_p\[5:0\]} \
{/test_top/Conv_top/top_CNN/temp_conv_out\[0:3\]} \
{/test_top/Conv_top/top_CNN/x_cnt\[4:0\]} \
{/test_top/Conv_top/top_CNN/x_cnt_ppp\[4:0\]} \
{/test_top/Conv_top/top_CNN/y_cnt_ppp\[4:0\]} \
{/test_top/Conv_top/bytemask/final_cnt\[10:0\]} \
{/test_top/Conv_top/read_input_cnt_ppp\[1:0\]} \
{/test_top/Conv_top/cnn_state_ppppppp} \
{/test_top/Conv_top/sram_bytemask_b\[15:0\]} \
{/test_top/Conv_top/sram_waddr_b\[5:0\]} \
{/test_top/Conv_top/sram_wdata_b\[127:0\]} \
{/test_top/Conv_top/sram_wen_b0} \
{/test_top/Conv_top/sram_wen_b1} \
{/test_top/Conv_top/sram_wen_b2} \
{/test_top/Conv_top/sram_wen_b3} \
{/test_top/Conv_top/valid} \
}
wvAddSignal -win $_nWave1 -group {"G2" \
}
wvSelectSignal -win $_nWave1 {( "G1" 40 )} 
wvSetPosition -win $_nWave1 {("G1" 40)}
wvGetSignalClose -win $_nWave1
wvSetCursor -win $_nWave1 683927.182777 -snap {("G1" 40)}
wvScrollDown -win $_nWave1 0
wvScrollDown -win $_nWave1 0
wvScrollDown -win $_nWave1 0
wvScrollDown -win $_nWave1 0
wvResizeWindow -win $_nWave1 0 23 1217 697
wvZoomOut -win $_nWave1
wvSetCursor -win $_nWave1 453688.741325 -snap {("G1" 38)}
wvSetCursor -win $_nWave1 447212.716088 -snap {("G1" 37)}
wvZoomIn -win $_nWave1
wvZoomIn -win $_nWave1
wvZoomIn -win $_nWave1
wvZoomIn -win $_nWave1
wvZoomIn -win $_nWave1
wvZoomIn -win $_nWave1
wvScrollDown -win $_nWave1 0
wvScrollDown -win $_nWave1 0
wvScrollDown -win $_nWave1 0
wvScrollDown -win $_nWave1 0
wvSetCursor -win $_nWave1 341864.987431 -snap {("G1" 36)}
wvZoomIn -win $_nWave1
wvZoomOut -win $_nWave1
wvZoomOut -win $_nWave1
wvZoomOut -win $_nWave1
wvZoomOut -win $_nWave1
wvSetCursor -win $_nWave1 148082.908516 -snap {("G1" 36)}
wvZoomIn -win $_nWave1
wvZoomIn -win $_nWave1
wvZoomIn -win $_nWave1
wvZoomIn -win $_nWave1
wvSetCursor -win $_nWave1 173848.119157 -snap {("G1" 36)}
wvZoomIn -win $_nWave1
wvZoomIn -win $_nWave1
wvScrollUp -win $_nWave1 1
wvScrollUp -win $_nWave1 1
wvZoomOut -win $_nWave1
wvZoomOut -win $_nWave1
wvZoomOut -win $_nWave1
wvZoomOut -win $_nWave1
wvZoomOut -win $_nWave1
wvZoomOut -win $_nWave1
wvSetCursor -win $_nWave1 148850.446719 -snap {("G1" 36)}
wvZoomIn -win $_nWave1
wvZoomIn -win $_nWave1
wvZoomIn -win $_nWave1
wvZoomIn -win $_nWave1
wvZoomIn -win $_nWave1
wvZoomIn -win $_nWave1
wvZoomIn -win $_nWave1
wvZoomIn -win $_nWave1
wvSetCursor -win $_nWave1 148650.693980 -snap {("G1" 36)}
wvScrollDown -win $_nWave1 1
wvScrollDown -win $_nWave1 1
wvScrollDown -win $_nWave1 0
wvScrollUp -win $_nWave1 1
wvScrollUp -win $_nWave1 1
wvScrollDown -win $_nWave1 1
wvScrollDown -win $_nWave1 1
wvScrollDown -win $_nWave1 0
wvScrollDown -win $_nWave1 0
wvScrollDown -win $_nWave1 0
wvZoomOut -win $_nWave1
wvZoomOut -win $_nWave1
wvGetSignalOpen -win $_nWave1
wvGetSignalSetScope -win $_nWave1 "/test_top"
wvGetSignalSetScope -win $_nWave1 "/test_top/Conv_top"
wvGetSignalSetScope -win $_nWave1 "/test_top/Conv_top/bytemask"
wvGetSignalSetScope -win $_nWave1 "/test_top/Conv_top"
wvGetSignalSetScope -win $_nWave1 "/test_top"
wvGetSignalSetScope -win $_nWave1 "/test_top/sram_36x128b_b0"
wvGetSignalClose -win $_nWave1
wvDisplayGridCount -win $_nWave1 -off
wvGetSignalClose -win $_nWave1
wvReloadFile -win $_nWave1
wvGetSignalOpen -win $_nWave1
wvGetSignalSetScope -win $_nWave1 "/test_top/sram_36x128b_a0"
wvGetSignalSetScope -win $_nWave1 "/test_top/sram_36x128b_b0"
wvGetSignalSetScope -win $_nWave1 "/test_top/sram_36x128b_b1"
wvGetSignalSetScope -win $_nWave1 "/test_top/sram_36x128b_b0"
wvSetPosition -win $_nWave1 {("G1" 41)}
wvSetPosition -win $_nWave1 {("G1" 41)}
wvAddSignal -win $_nWave1 -clear
wvAddSignal -win $_nWave1 -group {"G1" \
{/test_top/Conv_top/top_CNN/W\[0:15\]} \
{/test_top/Conv_top/top_CNN/X\[0:15\]} \
{/test_top/Conv_top/top_CNN/Y\[0:15\]} \
{/test_top/Conv_top/top_CNN/bias\[3:0\]} \
{/test_top/Conv_top/top_CNN/clk} \
{/test_top/Conv_top/top_CNN/cnn_state\[4:0\]} \
{/test_top/Conv_top/top_CNN/cnn_state_p} \
{/test_top/Conv_top/top_CNN/cnn_state_pppp} \
{/test_top/Conv_top/top_CNN/conv_out\[0:3\]} \
{/test_top/Conv_top/top_CNN/conv_out_FF\[0:3\]} \
{/test_top/Conv_top/top_CNN/feature_maps_o0\[15:0\]} \
{/test_top/Conv_top/top_CNN/feature_maps_o1\[15:0\]} \
{/test_top/Conv_top/top_CNN/feature_maps_o2\[15:0\]} \
{/test_top/Conv_top/top_CNN/feature_maps_o3\[15:0\]} \
{/test_top/Conv_top/top_CNN/feature_maps_temp_o\[0:3\]} \
{/test_top/Conv_top/top_CNN/load_weight_finish} \
{/test_top/Conv_top/top_CNN/max0\[7:0\]} \
{/test_top/Conv_top/top_CNN/max1\[7:0\]} \
{/test_top/Conv_top/top_CNN/max\[7:0\]} \
{/test_top/Conv_top/top_CNN/read_bias_finish} \
{/test_top/Conv_top/top_CNN/read_cnt\[10:0\]} \
{/test_top/Conv_top/top_CNN/read_weight_finish} \
{/test_top/Conv_top/top_CNN/rst_n} \
{/test_top/Conv_top/top_CNN/state\[5:0\]} \
{/test_top/Conv_top/top_CNN/state_p\[5:0\]} \
{/test_top/Conv_top/top_CNN/temp_conv_out\[0:3\]} \
{/test_top/Conv_top/top_CNN/x_cnt\[4:0\]} \
{/test_top/Conv_top/top_CNN/x_cnt_ppp\[4:0\]} \
{/test_top/Conv_top/top_CNN/y_cnt_ppp\[4:0\]} \
{/test_top/Conv_top/bytemask/final_cnt\[10:0\]} \
{/test_top/Conv_top/read_input_cnt_ppp\[1:0\]} \
{/test_top/Conv_top/cnn_state_ppppppp} \
{/test_top/Conv_top/sram_bytemask_b\[15:0\]} \
{/test_top/Conv_top/sram_waddr_b\[5:0\]} \
{/test_top/Conv_top/sram_wdata_b\[127:0\]} \
{/test_top/Conv_top/sram_wen_b0} \
{/test_top/Conv_top/sram_wen_b1} \
{/test_top/Conv_top/sram_wen_b2} \
{/test_top/Conv_top/sram_wen_b3} \
{/test_top/Conv_top/valid} \
{/test_top/sram_36x128b_b0/mem\[0:36\]} \
}
wvAddSignal -win $_nWave1 -group {"G2" \
}
wvSelectSignal -win $_nWave1 {( "G1" 41 )} 
wvSetPosition -win $_nWave1 {("G1" 41)}
wvGetSignalSetScope -win $_nWave1 "/test_top/sram_36x128b_b1"
wvSetPosition -win $_nWave1 {("G1" 42)}
wvSetPosition -win $_nWave1 {("G1" 42)}
wvAddSignal -win $_nWave1 -clear
wvAddSignal -win $_nWave1 -group {"G1" \
{/test_top/Conv_top/top_CNN/W\[0:15\]} \
{/test_top/Conv_top/top_CNN/X\[0:15\]} \
{/test_top/Conv_top/top_CNN/Y\[0:15\]} \
{/test_top/Conv_top/top_CNN/bias\[3:0\]} \
{/test_top/Conv_top/top_CNN/clk} \
{/test_top/Conv_top/top_CNN/cnn_state\[4:0\]} \
{/test_top/Conv_top/top_CNN/cnn_state_p} \
{/test_top/Conv_top/top_CNN/cnn_state_pppp} \
{/test_top/Conv_top/top_CNN/conv_out\[0:3\]} \
{/test_top/Conv_top/top_CNN/conv_out_FF\[0:3\]} \
{/test_top/Conv_top/top_CNN/feature_maps_o0\[15:0\]} \
{/test_top/Conv_top/top_CNN/feature_maps_o1\[15:0\]} \
{/test_top/Conv_top/top_CNN/feature_maps_o2\[15:0\]} \
{/test_top/Conv_top/top_CNN/feature_maps_o3\[15:0\]} \
{/test_top/Conv_top/top_CNN/feature_maps_temp_o\[0:3\]} \
{/test_top/Conv_top/top_CNN/load_weight_finish} \
{/test_top/Conv_top/top_CNN/max0\[7:0\]} \
{/test_top/Conv_top/top_CNN/max1\[7:0\]} \
{/test_top/Conv_top/top_CNN/max\[7:0\]} \
{/test_top/Conv_top/top_CNN/read_bias_finish} \
{/test_top/Conv_top/top_CNN/read_cnt\[10:0\]} \
{/test_top/Conv_top/top_CNN/read_weight_finish} \
{/test_top/Conv_top/top_CNN/rst_n} \
{/test_top/Conv_top/top_CNN/state\[5:0\]} \
{/test_top/Conv_top/top_CNN/state_p\[5:0\]} \
{/test_top/Conv_top/top_CNN/temp_conv_out\[0:3\]} \
{/test_top/Conv_top/top_CNN/x_cnt\[4:0\]} \
{/test_top/Conv_top/top_CNN/x_cnt_ppp\[4:0\]} \
{/test_top/Conv_top/top_CNN/y_cnt_ppp\[4:0\]} \
{/test_top/Conv_top/bytemask/final_cnt\[10:0\]} \
{/test_top/Conv_top/read_input_cnt_ppp\[1:0\]} \
{/test_top/Conv_top/cnn_state_ppppppp} \
{/test_top/Conv_top/sram_bytemask_b\[15:0\]} \
{/test_top/Conv_top/sram_waddr_b\[5:0\]} \
{/test_top/Conv_top/sram_wdata_b\[127:0\]} \
{/test_top/Conv_top/sram_wen_b0} \
{/test_top/Conv_top/sram_wen_b1} \
{/test_top/Conv_top/sram_wen_b2} \
{/test_top/Conv_top/sram_wen_b3} \
{/test_top/Conv_top/valid} \
{/test_top/sram_36x128b_b0/mem\[0:36\]} \
{/test_top/sram_36x128b_b1/mem\[0:36\]} \
}
wvAddSignal -win $_nWave1 -group {"G2" \
}
wvSelectSignal -win $_nWave1 {( "G1" 42 )} 
wvSetPosition -win $_nWave1 {("G1" 42)}
wvSetPosition -win $_nWave1 {("G1" 42)}
wvSetPosition -win $_nWave1 {("G1" 42)}
wvAddSignal -win $_nWave1 -clear
wvAddSignal -win $_nWave1 -group {"G1" \
{/test_top/Conv_top/top_CNN/W\[0:15\]} \
{/test_top/Conv_top/top_CNN/X\[0:15\]} \
{/test_top/Conv_top/top_CNN/Y\[0:15\]} \
{/test_top/Conv_top/top_CNN/bias\[3:0\]} \
{/test_top/Conv_top/top_CNN/clk} \
{/test_top/Conv_top/top_CNN/cnn_state\[4:0\]} \
{/test_top/Conv_top/top_CNN/cnn_state_p} \
{/test_top/Conv_top/top_CNN/cnn_state_pppp} \
{/test_top/Conv_top/top_CNN/conv_out\[0:3\]} \
{/test_top/Conv_top/top_CNN/conv_out_FF\[0:3\]} \
{/test_top/Conv_top/top_CNN/feature_maps_o0\[15:0\]} \
{/test_top/Conv_top/top_CNN/feature_maps_o1\[15:0\]} \
{/test_top/Conv_top/top_CNN/feature_maps_o2\[15:0\]} \
{/test_top/Conv_top/top_CNN/feature_maps_o3\[15:0\]} \
{/test_top/Conv_top/top_CNN/feature_maps_temp_o\[0:3\]} \
{/test_top/Conv_top/top_CNN/load_weight_finish} \
{/test_top/Conv_top/top_CNN/max0\[7:0\]} \
{/test_top/Conv_top/top_CNN/max1\[7:0\]} \
{/test_top/Conv_top/top_CNN/max\[7:0\]} \
{/test_top/Conv_top/top_CNN/read_bias_finish} \
{/test_top/Conv_top/top_CNN/read_cnt\[10:0\]} \
{/test_top/Conv_top/top_CNN/read_weight_finish} \
{/test_top/Conv_top/top_CNN/rst_n} \
{/test_top/Conv_top/top_CNN/state\[5:0\]} \
{/test_top/Conv_top/top_CNN/state_p\[5:0\]} \
{/test_top/Conv_top/top_CNN/temp_conv_out\[0:3\]} \
{/test_top/Conv_top/top_CNN/x_cnt\[4:0\]} \
{/test_top/Conv_top/top_CNN/x_cnt_ppp\[4:0\]} \
{/test_top/Conv_top/top_CNN/y_cnt_ppp\[4:0\]} \
{/test_top/Conv_top/bytemask/final_cnt\[10:0\]} \
{/test_top/Conv_top/read_input_cnt_ppp\[1:0\]} \
{/test_top/Conv_top/cnn_state_ppppppp} \
{/test_top/Conv_top/sram_bytemask_b\[15:0\]} \
{/test_top/Conv_top/sram_waddr_b\[5:0\]} \
{/test_top/Conv_top/sram_wdata_b\[127:0\]} \
{/test_top/Conv_top/sram_wen_b0} \
{/test_top/Conv_top/sram_wen_b1} \
{/test_top/Conv_top/sram_wen_b2} \
{/test_top/Conv_top/sram_wen_b3} \
{/test_top/Conv_top/valid} \
{/test_top/sram_36x128b_b0/mem\[0:36\]} \
{/test_top/sram_36x128b_b1/mem\[0:36\]} \
}
wvAddSignal -win $_nWave1 -group {"G2" \
}
wvSelectSignal -win $_nWave1 {( "G1" 42 )} 
wvSetPosition -win $_nWave1 {("G1" 42)}
wvGetSignalClose -win $_nWave1
wvSelectSignal -win $_nWave1 {( "G1" 41 )} 
wvSetPosition -win $_nWave1 {("G1" 41)}
wvExpandBus -win $_nWave1 {("G1" 41)}
wvSetPosition -win $_nWave1 {("G1" 79)}
wvScrollUp -win $_nWave1 1
wvScrollUp -win $_nWave1 1
wvScrollUp -win $_nWave1 1
wvScrollUp -win $_nWave1 1
wvScrollUp -win $_nWave1 1
wvScrollUp -win $_nWave1 1
wvScrollUp -win $_nWave1 1
wvScrollUp -win $_nWave1 1
wvScrollUp -win $_nWave1 1
wvScrollUp -win $_nWave1 1
wvScrollUp -win $_nWave1 1
wvScrollUp -win $_nWave1 1
wvScrollUp -win $_nWave1 1
wvScrollUp -win $_nWave1 1
wvScrollUp -win $_nWave1 1
wvScrollUp -win $_nWave1 1
wvSelectSignal -win $_nWave1 {( "G1" 42 )} 
wvSetPosition -win $_nWave1 {("G1" 42)}
wvExpandBus -win $_nWave1 {("G1" 42)}
wvSetPosition -win $_nWave1 {("G1" 207)}
wvScrollUp -win $_nWave1 18
wvScrollUp -win $_nWave1 93
wvScrollDown -win $_nWave1 1
wvScrollDown -win $_nWave1 1
wvScrollUp -win $_nWave1 1
wvScrollUp -win $_nWave1 1
wvScrollUp -win $_nWave1 1
wvScrollUp -win $_nWave1 1
wvScrollUp -win $_nWave1 1
wvScrollUp -win $_nWave1 1
wvScrollDown -win $_nWave1 1
wvScrollDown -win $_nWave1 1
wvScrollDown -win $_nWave1 1
wvScrollDown -win $_nWave1 1
wvScrollDown -win $_nWave1 1
wvScrollDown -win $_nWave1 1
wvScrollDown -win $_nWave1 1
wvScrollDown -win $_nWave1 1
wvSetCursor -win $_nWave1 283144.713129 -snap {("G1" 45)}
wvZoomOut -win $_nWave1
wvScrollUp -win $_nWave1 1
wvScrollUp -win $_nWave1 1
wvScrollUp -win $_nWave1 1
wvScrollUp -win $_nWave1 1
wvScrollUp -win $_nWave1 1
wvScrollUp -win $_nWave1 1
wvScrollUp -win $_nWave1 1
wvScrollUp -win $_nWave1 1
wvScrollUp -win $_nWave1 1
wvScrollUp -win $_nWave1 1
wvScrollUp -win $_nWave1 1
wvScrollUp -win $_nWave1 1
wvScrollUp -win $_nWave1 1
wvScrollUp -win $_nWave1 1
wvScrollUp -win $_nWave1 1
wvScrollDown -win $_nWave1 1
wvScrollDown -win $_nWave1 1
wvScrollDown -win $_nWave1 1
wvScrollUp -win $_nWave1 1
wvScrollUp -win $_nWave1 1
wvZoomOut -win $_nWave1
wvZoomOut -win $_nWave1
wvSetCursor -win $_nWave1 283119.669125 -snap {("G1" 36)}
wvSetCursor -win $_nWave1 283052.885115 -snap {("G1" 36)}
wvSetCursor -win $_nWave1 283186.453135 -snap {("G1" 36)}
wvSetCursor -win $_nWave1 282952.709099 -snap {("G1" 36)}
wvSelectSignal -win $_nWave1 {( "G1" 34 )} 
wvSelectSignal -win $_nWave1 {( "G1" 34 )} 
wvSetRadix -win $_nWave1 -format UDec
wvSetCursor -win $_nWave1 280732.140759 -snap {("G1" 34)}
wvZoomOut -win $_nWave1
wvZoomOut -win $_nWave1
wvZoomOut -win $_nWave1
wvZoomOut -win $_nWave1
wvSetCursor -win $_nWave1 155749.684359 -snap {("G1" 34)}
wvZoomIn -win $_nWave1
wvZoomIn -win $_nWave1
wvZoomIn -win $_nWave1
wvZoomIn -win $_nWave1
wvZoomIn -win $_nWave1
wvSetCursor -win $_nWave1 154489.712648 -snap {("G1" 34)}
wvSetCursor -win $_nWave1 154648.324672 -snap {("G1" 31)}
wvSetCursor -win $_nWave1 154731.804685 -snap {("G1" 31)}
wvSetCursor -win $_nWave1 154681.716677 -snap {("G1" 31)}
wvSetCursor -win $_nWave1 154756.848689 -snap {("G1" 34)}
wvSetCursor -win $_nWave1 154681.716677 -snap {("G1" 31)}
wvSelectSignal -win $_nWave1 {( "G1" 31 )} 
wvZoomOut -win $_nWave1
wvZoomOut -win $_nWave1
wvZoomOut -win $_nWave1
wvSetCursor -win $_nWave1 221833.349353 -snap {("G1" 34)}
wvZoomIn -win $_nWave1
wvZoomIn -win $_nWave1
wvSetCursor -win $_nWave1 225890.477975 -snap {("G1" 34)}
wvZoomIn -win $_nWave1
wvZoomIn -win $_nWave1
wvSetCursor -win $_nWave1 221862.345987 -snap {("G1" 34)}
wvSetCursor -win $_nWave1 221929.129997 -snap {("G1" 34)}
wvSetCursor -win $_nWave1 221858.171986 -snap {("G1" 34)}
wvZoomOut -win $_nWave1
wvZoomOut -win $_nWave1
wvZoomOut -win $_nWave1
wvSetCursor -win $_nWave1 215513.691013 -snap {("G1" 34)}
wvDisplayGridCount -win $_nWave1 -off
wvGetSignalClose -win $_nWave1
wvReloadFile -win $_nWave1
wvSetCursor -win $_nWave1 448446.301149 -snap {("G1" 34)}
wvZoomIn -win $_nWave1
wvSetCursor -win $_nWave1 448629.957177 -snap {("G1" 35)}
wvSetCursor -win $_nWave1 448613.261175 -snap {("G1" 36)}
wvZoomIn -win $_nWave1
wvScrollUp -win $_nWave1 1
wvScrollUp -win $_nWave1 1
wvScrollUp -win $_nWave1 1
wvScrollUp -win $_nWave1 1
wvScrollDown -win $_nWave1 1
wvScrollDown -win $_nWave1 1
wvScrollDown -win $_nWave1 1
wvScrollDown -win $_nWave1 1
wvScrollUp -win $_nWave1 1
wvScrollUp -win $_nWave1 1
wvScrollUp -win $_nWave1 1
wvScrollUp -win $_nWave1 1
wvScrollUp -win $_nWave1 1
wvScrollUp -win $_nWave1 1
wvScrollUp -win $_nWave1 1
wvScrollUp -win $_nWave1 1
wvScrollUp -win $_nWave1 1
wvScrollUp -win $_nWave1 1
wvScrollUp -win $_nWave1 1
wvScrollUp -win $_nWave1 1
wvScrollUp -win $_nWave1 1
wvScrollDown -win $_nWave1 1
wvScrollDown -win $_nWave1 1
wvScrollDown -win $_nWave1 1
wvScrollDown -win $_nWave1 1
wvScrollDown -win $_nWave1 1
wvScrollDown -win $_nWave1 1
wvSetCursor -win $_nWave1 448725.124392 -snap {("G1" 36)}
wvSetCursor -win $_nWave1 448641.644379 -snap {("G1" 36)}
wvSetCursor -win $_nWave1 448758.516397 -snap {("G1" 36)}
wvSetCursor -win $_nWave1 448675.036384 -snap {("G1" 36)}
wvZoomOut -win $_nWave1
wvExit
