wvOpenFile -win $_nWave1 -mul \
           {/home/u105/u105061255/ICLAB/EE4292_HW2/EE4292_HW2/part2/sim/test_enigma.fsdb} {/home/u105/u105061255/ICLAB/HW5/PART2/sim/eCNN_micro.fsdb} 
wvCopyFilePathToClipboard -win $_nWave1 -fileId 0
wvCopyFilePathToClipboard -win $_nWave1 -fileId 0
wvSetActiveFile -win $_nWave1 -applyAnnotation off \
           {/home/u105/u105061255/ICLAB/HW5/PART2/sim/eCNN_micro.fsdb}
wvGetSignalOpen -win $_nWave1
wvGetSignalSetScope -win $_nWave1 "/test_top"
wvGetSignalSetScope -win $_nWave1 "/test_top/Conv_top"
wvSetPosition -win $_nWave1 {("G1" 26)}
wvSetPosition -win $_nWave1 {("G1" 26)}
wvAddSignal -win $_nWave1 -clear
wvAddSignal -win $_nWave1 -group {"G1" \
{/test_top/Conv_top/clk} \
{/test_top/Conv_top/cnn_state\[4:0\]} \
{/test_top/Conv_top/feature_maps_o0\[7:0\]} \
{/test_top/Conv_top/feature_maps_o1\[7:0\]} \
{/test_top/Conv_top/feature_maps_o2\[7:0\]} \
{/test_top/Conv_top/feature_maps_o3\[7:0\]} \
{/test_top/Conv_top/feature_maps_o4\[7:0\]} \
{/test_top/Conv_top/feature_maps_o5\[7:0\]} \
{/test_top/Conv_top/feature_maps_o6\[7:0\]} \
{/test_top/Conv_top/feature_maps_o7\[7:0\]} \
{/test_top/Conv_top/feature_maps_o8\[7:0\]} \
{/test_top/Conv_top/feature_maps_o9\[7:0\]} \
{/test_top/Conv_top/feature_maps_o10\[7:0\]} \
{/test_top/Conv_top/feature_maps_o11\[7:0\]} \
{/test_top/Conv_top/feature_maps_o12\[7:0\]} \
{/test_top/Conv_top/feature_maps_o13\[7:0\]} \
{/test_top/Conv_top/feature_maps_o14\[7:0\]} \
{/test_top/Conv_top/feature_maps_o15\[7:0\]} \
{/test_top/Conv_top/read_weight_finish} \
{/test_top/Conv_top/rst_n} \
{/test_top/Conv_top/sram_raddr_weight\[10:0\]} \
{/test_top/Conv_top/state\[5:0\]} \
{/test_top/Conv_top/x_cnt\[4:0\]} \
{/test_top/Conv_top/x_cnt_pp\[4:0\]} \
{/test_top/Conv_top/y_cnt\[4:0\]} \
{/test_top/Conv_top/y_cnt_pp\[4:0\]} \
}
wvAddSignal -win $_nWave1 -group {"G2" \
}
wvSelectSignal -win $_nWave1 {( "G1" 1 2 3 4 5 6 7 8 9 10 11 12 13 14 15 16 17 \
           18 19 20 21 22 23 24 25 26 )} 
wvSetPosition -win $_nWave1 {("G1" 26)}
wvSetPosition -win $_nWave1 {("G1" 26)}
wvSetPosition -win $_nWave1 {("G1" 26)}
wvAddSignal -win $_nWave1 -clear
wvAddSignal -win $_nWave1 -group {"G1" \
{/test_top/Conv_top/clk} \
{/test_top/Conv_top/cnn_state\[4:0\]} \
{/test_top/Conv_top/feature_maps_o0\[7:0\]} \
{/test_top/Conv_top/feature_maps_o1\[7:0\]} \
{/test_top/Conv_top/feature_maps_o2\[7:0\]} \
{/test_top/Conv_top/feature_maps_o3\[7:0\]} \
{/test_top/Conv_top/feature_maps_o4\[7:0\]} \
{/test_top/Conv_top/feature_maps_o5\[7:0\]} \
{/test_top/Conv_top/feature_maps_o6\[7:0\]} \
{/test_top/Conv_top/feature_maps_o7\[7:0\]} \
{/test_top/Conv_top/feature_maps_o8\[7:0\]} \
{/test_top/Conv_top/feature_maps_o9\[7:0\]} \
{/test_top/Conv_top/feature_maps_o10\[7:0\]} \
{/test_top/Conv_top/feature_maps_o11\[7:0\]} \
{/test_top/Conv_top/feature_maps_o12\[7:0\]} \
{/test_top/Conv_top/feature_maps_o13\[7:0\]} \
{/test_top/Conv_top/feature_maps_o14\[7:0\]} \
{/test_top/Conv_top/feature_maps_o15\[7:0\]} \
{/test_top/Conv_top/read_weight_finish} \
{/test_top/Conv_top/rst_n} \
{/test_top/Conv_top/sram_raddr_weight\[10:0\]} \
{/test_top/Conv_top/state\[5:0\]} \
{/test_top/Conv_top/x_cnt\[4:0\]} \
{/test_top/Conv_top/x_cnt_pp\[4:0\]} \
{/test_top/Conv_top/y_cnt\[4:0\]} \
{/test_top/Conv_top/y_cnt_pp\[4:0\]} \
}
wvAddSignal -win $_nWave1 -group {"G2" \
}
wvSelectSignal -win $_nWave1 {( "G1" 1 2 3 4 5 6 7 8 9 10 11 12 13 14 15 16 17 \
           18 19 20 21 22 23 24 25 26 )} 
wvSetPosition -win $_nWave1 {("G1" 26)}
wvGetSignalClose -win $_nWave1
wvZoomOut -win $_nWave1
wvZoomOut -win $_nWave1
wvZoomOut -win $_nWave1
wvZoomOut -win $_nWave1
wvZoomOut -win $_nWave1
wvSetCursor -win $_nWave1 79573.911404 -snap {("G1" 22)}
wvResizeWindow -win $_nWave1 0 23 1217 697
wvZoomIn -win $_nWave1
wvZoomIn -win $_nWave1
wvZoomIn -win $_nWave1
wvZoomIn -win $_nWave1
wvGetSignalOpen -win $_nWave1
wvGetSignalSetScope -win $_nWave1 "/test_top"
wvGetSignalSetScope -win $_nWave1 "/test_top/Conv_top"
wvGetSignalSetScope -win $_nWave1 "/test_top/Conv_top/top_CNN"
wvSetPosition -win $_nWave1 {("G1" 27)}
wvSetPosition -win $_nWave1 {("G1" 27)}
wvAddSignal -win $_nWave1 -clear
wvAddSignal -win $_nWave1 -group {"G1" \
{/test_top/Conv_top/clk} \
{/test_top/Conv_top/cnn_state\[4:0\]} \
{/test_top/Conv_top/feature_maps_o0\[7:0\]} \
{/test_top/Conv_top/feature_maps_o1\[7:0\]} \
{/test_top/Conv_top/feature_maps_o2\[7:0\]} \
{/test_top/Conv_top/feature_maps_o3\[7:0\]} \
{/test_top/Conv_top/feature_maps_o4\[7:0\]} \
{/test_top/Conv_top/feature_maps_o5\[7:0\]} \
{/test_top/Conv_top/feature_maps_o6\[7:0\]} \
{/test_top/Conv_top/feature_maps_o7\[7:0\]} \
{/test_top/Conv_top/feature_maps_o8\[7:0\]} \
{/test_top/Conv_top/feature_maps_o9\[7:0\]} \
{/test_top/Conv_top/feature_maps_o10\[7:0\]} \
{/test_top/Conv_top/feature_maps_o11\[7:0\]} \
{/test_top/Conv_top/feature_maps_o12\[7:0\]} \
{/test_top/Conv_top/feature_maps_o13\[7:0\]} \
{/test_top/Conv_top/feature_maps_o14\[7:0\]} \
{/test_top/Conv_top/feature_maps_o15\[7:0\]} \
{/test_top/Conv_top/read_weight_finish} \
{/test_top/Conv_top/rst_n} \
{/test_top/Conv_top/sram_raddr_weight\[10:0\]} \
{/test_top/Conv_top/state\[5:0\]} \
{/test_top/Conv_top/x_cnt\[4:0\]} \
{/test_top/Conv_top/x_cnt_pp\[4:0\]} \
{/test_top/Conv_top/y_cnt\[4:0\]} \
{/test_top/Conv_top/y_cnt_pp\[4:0\]} \
{/test_top/Conv_top/top_CNN/W\[0:15\]} \
}
wvAddSignal -win $_nWave1 -group {"G2" \
}
wvSelectSignal -win $_nWave1 {( "G1" 27 )} 
wvSetPosition -win $_nWave1 {("G1" 27)}
wvSetPosition -win $_nWave1 {("G1" 27)}
wvSetPosition -win $_nWave1 {("G1" 27)}
wvAddSignal -win $_nWave1 -clear
wvAddSignal -win $_nWave1 -group {"G1" \
{/test_top/Conv_top/clk} \
{/test_top/Conv_top/cnn_state\[4:0\]} \
{/test_top/Conv_top/feature_maps_o0\[7:0\]} \
{/test_top/Conv_top/feature_maps_o1\[7:0\]} \
{/test_top/Conv_top/feature_maps_o2\[7:0\]} \
{/test_top/Conv_top/feature_maps_o3\[7:0\]} \
{/test_top/Conv_top/feature_maps_o4\[7:0\]} \
{/test_top/Conv_top/feature_maps_o5\[7:0\]} \
{/test_top/Conv_top/feature_maps_o6\[7:0\]} \
{/test_top/Conv_top/feature_maps_o7\[7:0\]} \
{/test_top/Conv_top/feature_maps_o8\[7:0\]} \
{/test_top/Conv_top/feature_maps_o9\[7:0\]} \
{/test_top/Conv_top/feature_maps_o10\[7:0\]} \
{/test_top/Conv_top/feature_maps_o11\[7:0\]} \
{/test_top/Conv_top/feature_maps_o12\[7:0\]} \
{/test_top/Conv_top/feature_maps_o13\[7:0\]} \
{/test_top/Conv_top/feature_maps_o14\[7:0\]} \
{/test_top/Conv_top/feature_maps_o15\[7:0\]} \
{/test_top/Conv_top/read_weight_finish} \
{/test_top/Conv_top/rst_n} \
{/test_top/Conv_top/sram_raddr_weight\[10:0\]} \
{/test_top/Conv_top/state\[5:0\]} \
{/test_top/Conv_top/x_cnt\[4:0\]} \
{/test_top/Conv_top/x_cnt_pp\[4:0\]} \
{/test_top/Conv_top/y_cnt\[4:0\]} \
{/test_top/Conv_top/y_cnt_pp\[4:0\]} \
{/test_top/Conv_top/top_CNN/W\[0:15\]} \
}
wvAddSignal -win $_nWave1 -group {"G2" \
}
wvSelectSignal -win $_nWave1 {( "G1" 27 )} 
wvSetPosition -win $_nWave1 {("G1" 27)}
wvGetSignalClose -win $_nWave1
wvScrollDown -win $_nWave1 0
wvScrollDown -win $_nWave1 0
wvScrollDown -win $_nWave1 0
wvScrollDown -win $_nWave1 0
wvScrollDown -win $_nWave1 0
wvZoomOut -win $_nWave1
wvZoomOut -win $_nWave1
wvZoomOut -win $_nWave1
wvZoomOut -win $_nWave1
wvZoomOut -win $_nWave1
wvZoomOut -win $_nWave1
wvSetCursor -win $_nWave1 78433.283582 -snap {("G1" 22)}
wvSetCursor -win $_nWave1 78865.422886 -snap {("G1" 22)}
wvSetCursor -win $_nWave1 78865.422886 -snap {("G1" 22)}
wvSetCursor -win $_nWave1 78865.422886 -snap {("G1" 22)}
wvSetCursor -win $_nWave1 78865.422886 -snap {("G1" 22)}
wvZoomIn -win $_nWave1
wvZoomIn -win $_nWave1
wvZoomIn -win $_nWave1
wvScrollUp -win $_nWave1 1
wvScrollDown -win $_nWave1 0
wvScrollDown -win $_nWave1 0
wvScrollDown -win $_nWave1 0
wvSetCursor -win $_nWave1 80362.011176 -snap {("G1" 2)}
wvDisplayGridCount -win $_nWave1 -off
wvGetSignalClose -win $_nWave1
wvReloadFile -win $_nWave1
wvZoomIn -win $_nWave1
wvZoomOut -win $_nWave1
wvZoomIn -win $_nWave1
wvZoomIn -win $_nWave1
wvScrollDown -win $_nWave1 1
wvScrollDown -win $_nWave1 0
wvScrollDown -win $_nWave1 0
wvSetCursor -win $_nWave1 78776.959698 -snap {("G1" 22)}
wvSetCursor -win $_nWave1 80521.829101 -snap {("G1" 27)}
wvSetCursor -win $_nWave1 81437.718405 -snap {("G1" 27)}
wvScrollDown -win $_nWave1 0
wvScrollDown -win $_nWave1 0
wvSelectSignal -win $_nWave1 {( "G1" 27 )} 
wvSelectSignal -win $_nWave1 {( "G1" 27 )} 
wvSelectSignal -win $_nWave1 {( "G1" 27 )} 
wvExpandBus -win $_nWave1 {("G1" 27)}
wvScrollDown -win $_nWave1 1
wvScrollDown -win $_nWave1 0
wvScrollDown -win $_nWave1 0
wvScrollDown -win $_nWave1 0
wvScrollDown -win $_nWave1 0
wvScrollDown -win $_nWave1 0
wvResizeWindow -win $_nWave1 0 23 1217 697
wvScrollDown -win $_nWave1 0
wvScrollDown -win $_nWave1 0
wvZoomOut -win $_nWave1
wvZoomOut -win $_nWave1
wvZoomOut -win $_nWave1
wvZoomOut -win $_nWave1
wvZoomIn -win $_nWave1
wvSetCursor -win $_nWave1 99935.154946 -snap {("G1" 26)}
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
wvScrollDown -win $_nWave1 0
wvDisplayGridCount -win $_nWave1 -off
wvGetSignalClose -win $_nWave1
wvReloadFile -win $_nWave1
wvSetCursor -win $_nWave1 80156.741392 -snap {("G1" 19)}
wvScrollDown -win $_nWave1 1
wvZoomIn -win $_nWave1
wvZoomIn -win $_nWave1
wvZoomOut -win $_nWave1
wvZoomIn -win $_nWave1
wvDisplayGridCount -win $_nWave1 -off
wvGetSignalClose -win $_nWave1
wvReloadFile -win $_nWave1
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
wvScrollUp -win $_nWave1 1
wvScrollUp -win $_nWave1 1
wvScrollUp -win $_nWave1 1
wvScrollUp -win $_nWave1 1
wvScrollUp -win $_nWave1 1
wvScrollUp -win $_nWave1 1
wvScrollUp -win $_nWave1 1
wvScrollUp -win $_nWave1 1
wvScrollUp -win $_nWave1 1
wvSetCursor -win $_nWave1 84292.019419 -snap {("G1" 22)}
wvScrollUp -win $_nWave1 1
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
wvZoomIn -win $_nWave1
wvSetCursor -win $_nWave1 78735.917608 -snap {("G1" 22)}
wvGetSignalOpen -win $_nWave1
wvSetPosition -win $_nWave1 {("G1" 44)}
wvSetPosition -win $_nWave1 {("G1" 44)}
wvAddSignal -win $_nWave1 -clear
wvAddSignal -win $_nWave1 -group {"G1" \
{/test_top/Conv_top/clk} \
{/test_top/Conv_top/cnn_state\[4:0\]} \
{/test_top/Conv_top/feature_maps_o0\[7:0\]} \
{/test_top/Conv_top/feature_maps_o1\[7:0\]} \
{/test_top/Conv_top/feature_maps_o2\[7:0\]} \
{/test_top/Conv_top/feature_maps_o3\[7:0\]} \
{/test_top/Conv_top/feature_maps_o4\[7:0\]} \
{/test_top/Conv_top/feature_maps_o5\[7:0\]} \
{/test_top/Conv_top/feature_maps_o6\[7:0\]} \
{/test_top/Conv_top/feature_maps_o7\[7:0\]} \
{/test_top/Conv_top/feature_maps_o8\[7:0\]} \
{/test_top/Conv_top/feature_maps_o9\[7:0\]} \
{/test_top/Conv_top/feature_maps_o10\[7:0\]} \
{/test_top/Conv_top/feature_maps_o11\[7:0\]} \
{/test_top/Conv_top/feature_maps_o12\[7:0\]} \
{/test_top/Conv_top/feature_maps_o13\[7:0\]} \
{/test_top/Conv_top/feature_maps_o14\[7:0\]} \
{/test_top/Conv_top/feature_maps_o15\[7:0\]} \
{/test_top/Conv_top/read_weight_finish} \
{/test_top/Conv_top/rst_n} \
{/test_top/Conv_top/sram_raddr_weight\[10:0\]} \
{/test_top/Conv_top/state\[5:0\]} \
{/test_top/Conv_top/x_cnt\[4:0\]} \
{/test_top/Conv_top/x_cnt_pp\[4:0\]} \
{/test_top/Conv_top/y_cnt\[4:0\]} \
{/test_top/Conv_top/y_cnt_pp\[4:0\]} \
{/test_top/Conv_top/top_CNN/W\[0:15\]} \
{/test_top/Conv_top/top_CNN/W\[0\]\[0:2\]} \
{/test_top/Conv_top/top_CNN/W\[1\]\[0:2\]} \
{/test_top/Conv_top/top_CNN/W\[2\]\[0:2\]} \
{/test_top/Conv_top/top_CNN/W\[3\]\[0:2\]} \
{/test_top/Conv_top/top_CNN/W\[4\]\[0:2\]} \
{/test_top/Conv_top/top_CNN/W\[5\]\[0:2\]} \
{/test_top/Conv_top/top_CNN/W\[6\]\[0:2\]} \
{/test_top/Conv_top/top_CNN/W\[7\]\[0:2\]} \
{/test_top/Conv_top/top_CNN/W\[8\]\[0:2\]} \
{/test_top/Conv_top/top_CNN/W\[9\]\[0:2\]} \
{/test_top/Conv_top/top_CNN/W\[10\]\[0:2\]} \
{/test_top/Conv_top/top_CNN/W\[11\]\[0:2\]} \
{/test_top/Conv_top/top_CNN/W\[12\]\[0:2\]} \
{/test_top/Conv_top/top_CNN/W\[13\]\[0:2\]} \
{/test_top/Conv_top/top_CNN/W\[14\]\[0:2\]} \
{/test_top/Conv_top/top_CNN/W\[15\]\[0:2\]} \
{/test_top/Conv_top/top_CNN/temp_conv_out\[0:15\]} \
}
wvAddSignal -win $_nWave1 -group {"G2" \
}
wvSelectSignal -win $_nWave1 {( "G1" 44 )} 
wvSetPosition -win $_nWave1 {("G1" 44)}
wvScrollDown -win $_nWave1 0
wvScrollDown -win $_nWave1 0
wvScrollDown -win $_nWave1 0
wvScrollDown -win $_nWave1 0
wvGetSignalOpen -win $_nWave1
wvSetPosition -win $_nWave1 {("G1" 45)}
wvSetPosition -win $_nWave1 {("G1" 45)}
wvAddSignal -win $_nWave1 -clear
wvAddSignal -win $_nWave1 -group {"G1" \
{/test_top/Conv_top/clk} \
{/test_top/Conv_top/cnn_state\[4:0\]} \
{/test_top/Conv_top/feature_maps_o0\[7:0\]} \
{/test_top/Conv_top/feature_maps_o1\[7:0\]} \
{/test_top/Conv_top/feature_maps_o2\[7:0\]} \
{/test_top/Conv_top/feature_maps_o3\[7:0\]} \
{/test_top/Conv_top/feature_maps_o4\[7:0\]} \
{/test_top/Conv_top/feature_maps_o5\[7:0\]} \
{/test_top/Conv_top/feature_maps_o6\[7:0\]} \
{/test_top/Conv_top/feature_maps_o7\[7:0\]} \
{/test_top/Conv_top/feature_maps_o8\[7:0\]} \
{/test_top/Conv_top/feature_maps_o9\[7:0\]} \
{/test_top/Conv_top/feature_maps_o10\[7:0\]} \
{/test_top/Conv_top/feature_maps_o11\[7:0\]} \
{/test_top/Conv_top/feature_maps_o12\[7:0\]} \
{/test_top/Conv_top/feature_maps_o13\[7:0\]} \
{/test_top/Conv_top/feature_maps_o14\[7:0\]} \
{/test_top/Conv_top/feature_maps_o15\[7:0\]} \
{/test_top/Conv_top/read_weight_finish} \
{/test_top/Conv_top/rst_n} \
{/test_top/Conv_top/sram_raddr_weight\[10:0\]} \
{/test_top/Conv_top/state\[5:0\]} \
{/test_top/Conv_top/x_cnt\[4:0\]} \
{/test_top/Conv_top/x_cnt_pp\[4:0\]} \
{/test_top/Conv_top/y_cnt\[4:0\]} \
{/test_top/Conv_top/y_cnt_pp\[4:0\]} \
{/test_top/Conv_top/top_CNN/W\[0:15\]} \
{/test_top/Conv_top/top_CNN/W\[0\]\[0:2\]} \
{/test_top/Conv_top/top_CNN/W\[1\]\[0:2\]} \
{/test_top/Conv_top/top_CNN/W\[2\]\[0:2\]} \
{/test_top/Conv_top/top_CNN/W\[3\]\[0:2\]} \
{/test_top/Conv_top/top_CNN/W\[4\]\[0:2\]} \
{/test_top/Conv_top/top_CNN/W\[5\]\[0:2\]} \
{/test_top/Conv_top/top_CNN/W\[6\]\[0:2\]} \
{/test_top/Conv_top/top_CNN/W\[7\]\[0:2\]} \
{/test_top/Conv_top/top_CNN/W\[8\]\[0:2\]} \
{/test_top/Conv_top/top_CNN/W\[9\]\[0:2\]} \
{/test_top/Conv_top/top_CNN/W\[10\]\[0:2\]} \
{/test_top/Conv_top/top_CNN/W\[11\]\[0:2\]} \
{/test_top/Conv_top/top_CNN/W\[12\]\[0:2\]} \
{/test_top/Conv_top/top_CNN/W\[13\]\[0:2\]} \
{/test_top/Conv_top/top_CNN/W\[14\]\[0:2\]} \
{/test_top/Conv_top/top_CNN/W\[15\]\[0:2\]} \
{/test_top/Conv_top/top_CNN/temp_conv_out\[0:15\]} \
{/test_top/Conv_top/top_CNN/Y\[0:63\]} \
}
wvAddSignal -win $_nWave1 -group {"G2" \
}
wvSelectSignal -win $_nWave1 {( "G1" 45 )} 
wvSetPosition -win $_nWave1 {("G1" 45)}
wvSetPosition -win $_nWave1 {("G1" 46)}
wvSetPosition -win $_nWave1 {("G1" 46)}
wvAddSignal -win $_nWave1 -clear
wvAddSignal -win $_nWave1 -group {"G1" \
{/test_top/Conv_top/clk} \
{/test_top/Conv_top/cnn_state\[4:0\]} \
{/test_top/Conv_top/feature_maps_o0\[7:0\]} \
{/test_top/Conv_top/feature_maps_o1\[7:0\]} \
{/test_top/Conv_top/feature_maps_o2\[7:0\]} \
{/test_top/Conv_top/feature_maps_o3\[7:0\]} \
{/test_top/Conv_top/feature_maps_o4\[7:0\]} \
{/test_top/Conv_top/feature_maps_o5\[7:0\]} \
{/test_top/Conv_top/feature_maps_o6\[7:0\]} \
{/test_top/Conv_top/feature_maps_o7\[7:0\]} \
{/test_top/Conv_top/feature_maps_o8\[7:0\]} \
{/test_top/Conv_top/feature_maps_o9\[7:0\]} \
{/test_top/Conv_top/feature_maps_o10\[7:0\]} \
{/test_top/Conv_top/feature_maps_o11\[7:0\]} \
{/test_top/Conv_top/feature_maps_o12\[7:0\]} \
{/test_top/Conv_top/feature_maps_o13\[7:0\]} \
{/test_top/Conv_top/feature_maps_o14\[7:0\]} \
{/test_top/Conv_top/feature_maps_o15\[7:0\]} \
{/test_top/Conv_top/read_weight_finish} \
{/test_top/Conv_top/rst_n} \
{/test_top/Conv_top/sram_raddr_weight\[10:0\]} \
{/test_top/Conv_top/state\[5:0\]} \
{/test_top/Conv_top/x_cnt\[4:0\]} \
{/test_top/Conv_top/x_cnt_pp\[4:0\]} \
{/test_top/Conv_top/y_cnt\[4:0\]} \
{/test_top/Conv_top/y_cnt_pp\[4:0\]} \
{/test_top/Conv_top/top_CNN/W\[0:15\]} \
{/test_top/Conv_top/top_CNN/W\[0\]\[0:2\]} \
{/test_top/Conv_top/top_CNN/W\[1\]\[0:2\]} \
{/test_top/Conv_top/top_CNN/W\[2\]\[0:2\]} \
{/test_top/Conv_top/top_CNN/W\[3\]\[0:2\]} \
{/test_top/Conv_top/top_CNN/W\[4\]\[0:2\]} \
{/test_top/Conv_top/top_CNN/W\[5\]\[0:2\]} \
{/test_top/Conv_top/top_CNN/W\[6\]\[0:2\]} \
{/test_top/Conv_top/top_CNN/W\[7\]\[0:2\]} \
{/test_top/Conv_top/top_CNN/W\[8\]\[0:2\]} \
{/test_top/Conv_top/top_CNN/W\[9\]\[0:2\]} \
{/test_top/Conv_top/top_CNN/W\[10\]\[0:2\]} \
{/test_top/Conv_top/top_CNN/W\[11\]\[0:2\]} \
{/test_top/Conv_top/top_CNN/W\[12\]\[0:2\]} \
{/test_top/Conv_top/top_CNN/W\[13\]\[0:2\]} \
{/test_top/Conv_top/top_CNN/W\[14\]\[0:2\]} \
{/test_top/Conv_top/top_CNN/W\[15\]\[0:2\]} \
{/test_top/Conv_top/top_CNN/temp_conv_out\[0:15\]} \
{/test_top/Conv_top/top_CNN/Y\[0:63\]} \
{/test_top/Conv_top/top_CNN/bias\[0:3\]} \
}
wvAddSignal -win $_nWave1 -group {"G2" \
}
wvSelectSignal -win $_nWave1 {( "G1" 46 )} 
wvSetPosition -win $_nWave1 {("G1" 46)}
wvSetPosition -win $_nWave1 {("G1" 46)}
wvSetPosition -win $_nWave1 {("G1" 46)}
wvAddSignal -win $_nWave1 -clear
wvAddSignal -win $_nWave1 -group {"G1" \
{/test_top/Conv_top/clk} \
{/test_top/Conv_top/cnn_state\[4:0\]} \
{/test_top/Conv_top/feature_maps_o0\[7:0\]} \
{/test_top/Conv_top/feature_maps_o1\[7:0\]} \
{/test_top/Conv_top/feature_maps_o2\[7:0\]} \
{/test_top/Conv_top/feature_maps_o3\[7:0\]} \
{/test_top/Conv_top/feature_maps_o4\[7:0\]} \
{/test_top/Conv_top/feature_maps_o5\[7:0\]} \
{/test_top/Conv_top/feature_maps_o6\[7:0\]} \
{/test_top/Conv_top/feature_maps_o7\[7:0\]} \
{/test_top/Conv_top/feature_maps_o8\[7:0\]} \
{/test_top/Conv_top/feature_maps_o9\[7:0\]} \
{/test_top/Conv_top/feature_maps_o10\[7:0\]} \
{/test_top/Conv_top/feature_maps_o11\[7:0\]} \
{/test_top/Conv_top/feature_maps_o12\[7:0\]} \
{/test_top/Conv_top/feature_maps_o13\[7:0\]} \
{/test_top/Conv_top/feature_maps_o14\[7:0\]} \
{/test_top/Conv_top/feature_maps_o15\[7:0\]} \
{/test_top/Conv_top/read_weight_finish} \
{/test_top/Conv_top/rst_n} \
{/test_top/Conv_top/sram_raddr_weight\[10:0\]} \
{/test_top/Conv_top/state\[5:0\]} \
{/test_top/Conv_top/x_cnt\[4:0\]} \
{/test_top/Conv_top/x_cnt_pp\[4:0\]} \
{/test_top/Conv_top/y_cnt\[4:0\]} \
{/test_top/Conv_top/y_cnt_pp\[4:0\]} \
{/test_top/Conv_top/top_CNN/W\[0:15\]} \
{/test_top/Conv_top/top_CNN/W\[0\]\[0:2\]} \
{/test_top/Conv_top/top_CNN/W\[1\]\[0:2\]} \
{/test_top/Conv_top/top_CNN/W\[2\]\[0:2\]} \
{/test_top/Conv_top/top_CNN/W\[3\]\[0:2\]} \
{/test_top/Conv_top/top_CNN/W\[4\]\[0:2\]} \
{/test_top/Conv_top/top_CNN/W\[5\]\[0:2\]} \
{/test_top/Conv_top/top_CNN/W\[6\]\[0:2\]} \
{/test_top/Conv_top/top_CNN/W\[7\]\[0:2\]} \
{/test_top/Conv_top/top_CNN/W\[8\]\[0:2\]} \
{/test_top/Conv_top/top_CNN/W\[9\]\[0:2\]} \
{/test_top/Conv_top/top_CNN/W\[10\]\[0:2\]} \
{/test_top/Conv_top/top_CNN/W\[11\]\[0:2\]} \
{/test_top/Conv_top/top_CNN/W\[12\]\[0:2\]} \
{/test_top/Conv_top/top_CNN/W\[13\]\[0:2\]} \
{/test_top/Conv_top/top_CNN/W\[14\]\[0:2\]} \
{/test_top/Conv_top/top_CNN/W\[15\]\[0:2\]} \
{/test_top/Conv_top/top_CNN/temp_conv_out\[0:15\]} \
{/test_top/Conv_top/top_CNN/Y\[0:63\]} \
{/test_top/Conv_top/top_CNN/bias\[0:3\]} \
}
wvAddSignal -win $_nWave1 -group {"G2" \
}
wvSelectSignal -win $_nWave1 {( "G1" 46 )} 
wvSetPosition -win $_nWave1 {("G1" 46)}
wvGetSignalClose -win $_nWave1
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
wvScrollDown -win $_nWave1 0
wvScrollDown -win $_nWave1 0
wvScrollDown -win $_nWave1 0
wvScrollDown -win $_nWave1 0
wvScrollDown -win $_nWave1 0
wvScrollDown -win $_nWave1 0
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
wvZoomOut -win $_nWave1
wvZoomOut -win $_nWave1
wvScrollUp -win $_nWave1 1
wvScrollDown -win $_nWave1 1
wvScrollDown -win $_nWave1 0
wvZoomIn -win $_nWave1
wvZoomIn -win $_nWave1
wvZoomIn -win $_nWave1
wvZoomIn -win $_nWave1
wvZoomIn -win $_nWave1
wvZoomIn -win $_nWave1
wvZoomIn -win $_nWave1
wvScrollUp -win $_nWave1 1
wvScrollUp -win $_nWave1 1
wvZoomOut -win $_nWave1
wvScrollDown -win $_nWave1 1
wvScrollDown -win $_nWave1 1
wvScrollDown -win $_nWave1 0
wvSetCursor -win $_nWave1 80488.007622 -snap {("G1" 46)}
wvZoom -win $_nWave1 79308.676573 79513.049283
wvZoomOut -win $_nWave1
wvZoomOut -win $_nWave1
wvZoomOut -win $_nWave1
wvZoomOut -win $_nWave1
wvZoomOut -win $_nWave1
wvZoomOut -win $_nWave1
wvZoomIn -win $_nWave1
wvSetCursor -win $_nWave1 78770.872207 -snap {("G1" 22)}
wvScrollDown -win $_nWave1 0
wvSetCursor -win $_nWave1 80471.798908 -snap {("G1" 46)}
wvZoom -win $_nWave1 77433.780094 77833.998142
wvGetSignalOpen -win $_nWave1
wvGetSignalSetScope -win $_nWave1 "/test_top"
wvGetSignalSetScope -win $_nWave1 "/test_top/Conv_top"
wvGetSignalSetScope -win $_nWave1 "/test_top/Conv_top/top_CNN"
wvGetSignalSetScope -win $_nWave1 "/test_top/Conv_top/addr"
wvSetPosition -win $_nWave1 {("G1" 47)}
wvSetPosition -win $_nWave1 {("G1" 47)}
wvAddSignal -win $_nWave1 -clear
wvAddSignal -win $_nWave1 -group {"G1" \
{/test_top/Conv_top/clk} \
{/test_top/Conv_top/cnn_state\[4:0\]} \
{/test_top/Conv_top/feature_maps_o0\[7:0\]} \
{/test_top/Conv_top/feature_maps_o1\[7:0\]} \
{/test_top/Conv_top/feature_maps_o2\[7:0\]} \
{/test_top/Conv_top/feature_maps_o3\[7:0\]} \
{/test_top/Conv_top/feature_maps_o4\[7:0\]} \
{/test_top/Conv_top/feature_maps_o5\[7:0\]} \
{/test_top/Conv_top/feature_maps_o6\[7:0\]} \
{/test_top/Conv_top/feature_maps_o7\[7:0\]} \
{/test_top/Conv_top/feature_maps_o8\[7:0\]} \
{/test_top/Conv_top/feature_maps_o9\[7:0\]} \
{/test_top/Conv_top/feature_maps_o10\[7:0\]} \
{/test_top/Conv_top/feature_maps_o11\[7:0\]} \
{/test_top/Conv_top/feature_maps_o12\[7:0\]} \
{/test_top/Conv_top/feature_maps_o13\[7:0\]} \
{/test_top/Conv_top/feature_maps_o14\[7:0\]} \
{/test_top/Conv_top/feature_maps_o15\[7:0\]} \
{/test_top/Conv_top/read_weight_finish} \
{/test_top/Conv_top/rst_n} \
{/test_top/Conv_top/sram_raddr_weight\[10:0\]} \
{/test_top/Conv_top/state\[5:0\]} \
{/test_top/Conv_top/x_cnt\[4:0\]} \
{/test_top/Conv_top/x_cnt_pp\[4:0\]} \
{/test_top/Conv_top/y_cnt\[4:0\]} \
{/test_top/Conv_top/y_cnt_pp\[4:0\]} \
{/test_top/Conv_top/top_CNN/W\[0:15\]} \
{/test_top/Conv_top/top_CNN/W\[0\]\[0:2\]} \
{/test_top/Conv_top/top_CNN/W\[1\]\[0:2\]} \
{/test_top/Conv_top/top_CNN/W\[2\]\[0:2\]} \
{/test_top/Conv_top/top_CNN/W\[3\]\[0:2\]} \
{/test_top/Conv_top/top_CNN/W\[4\]\[0:2\]} \
{/test_top/Conv_top/top_CNN/W\[5\]\[0:2\]} \
{/test_top/Conv_top/top_CNN/W\[6\]\[0:2\]} \
{/test_top/Conv_top/top_CNN/W\[7\]\[0:2\]} \
{/test_top/Conv_top/top_CNN/W\[8\]\[0:2\]} \
{/test_top/Conv_top/top_CNN/W\[9\]\[0:2\]} \
{/test_top/Conv_top/top_CNN/W\[10\]\[0:2\]} \
{/test_top/Conv_top/top_CNN/W\[11\]\[0:2\]} \
{/test_top/Conv_top/top_CNN/W\[12\]\[0:2\]} \
{/test_top/Conv_top/top_CNN/W\[13\]\[0:2\]} \
{/test_top/Conv_top/top_CNN/W\[14\]\[0:2\]} \
{/test_top/Conv_top/top_CNN/W\[15\]\[0:2\]} \
{/test_top/Conv_top/top_CNN/temp_conv_out\[0:15\]} \
{/test_top/Conv_top/top_CNN/Y\[0:63\]} \
{/test_top/Conv_top/top_CNN/bias\[0:3\]} \
{/test_top/Conv_top/addr/sram_raddr_bias\[6:0\]} \
}
wvAddSignal -win $_nWave1 -group {"G2" \
}
wvSelectSignal -win $_nWave1 {( "G1" 47 )} 
wvSetPosition -win $_nWave1 {("G1" 47)}
wvSetPosition -win $_nWave1 {("G1" 47)}
wvSetPosition -win $_nWave1 {("G1" 47)}
wvAddSignal -win $_nWave1 -clear
wvAddSignal -win $_nWave1 -group {"G1" \
{/test_top/Conv_top/clk} \
{/test_top/Conv_top/cnn_state\[4:0\]} \
{/test_top/Conv_top/feature_maps_o0\[7:0\]} \
{/test_top/Conv_top/feature_maps_o1\[7:0\]} \
{/test_top/Conv_top/feature_maps_o2\[7:0\]} \
{/test_top/Conv_top/feature_maps_o3\[7:0\]} \
{/test_top/Conv_top/feature_maps_o4\[7:0\]} \
{/test_top/Conv_top/feature_maps_o5\[7:0\]} \
{/test_top/Conv_top/feature_maps_o6\[7:0\]} \
{/test_top/Conv_top/feature_maps_o7\[7:0\]} \
{/test_top/Conv_top/feature_maps_o8\[7:0\]} \
{/test_top/Conv_top/feature_maps_o9\[7:0\]} \
{/test_top/Conv_top/feature_maps_o10\[7:0\]} \
{/test_top/Conv_top/feature_maps_o11\[7:0\]} \
{/test_top/Conv_top/feature_maps_o12\[7:0\]} \
{/test_top/Conv_top/feature_maps_o13\[7:0\]} \
{/test_top/Conv_top/feature_maps_o14\[7:0\]} \
{/test_top/Conv_top/feature_maps_o15\[7:0\]} \
{/test_top/Conv_top/read_weight_finish} \
{/test_top/Conv_top/rst_n} \
{/test_top/Conv_top/sram_raddr_weight\[10:0\]} \
{/test_top/Conv_top/state\[5:0\]} \
{/test_top/Conv_top/x_cnt\[4:0\]} \
{/test_top/Conv_top/x_cnt_pp\[4:0\]} \
{/test_top/Conv_top/y_cnt\[4:0\]} \
{/test_top/Conv_top/y_cnt_pp\[4:0\]} \
{/test_top/Conv_top/top_CNN/W\[0:15\]} \
{/test_top/Conv_top/top_CNN/W\[0\]\[0:2\]} \
{/test_top/Conv_top/top_CNN/W\[1\]\[0:2\]} \
{/test_top/Conv_top/top_CNN/W\[2\]\[0:2\]} \
{/test_top/Conv_top/top_CNN/W\[3\]\[0:2\]} \
{/test_top/Conv_top/top_CNN/W\[4\]\[0:2\]} \
{/test_top/Conv_top/top_CNN/W\[5\]\[0:2\]} \
{/test_top/Conv_top/top_CNN/W\[6\]\[0:2\]} \
{/test_top/Conv_top/top_CNN/W\[7\]\[0:2\]} \
{/test_top/Conv_top/top_CNN/W\[8\]\[0:2\]} \
{/test_top/Conv_top/top_CNN/W\[9\]\[0:2\]} \
{/test_top/Conv_top/top_CNN/W\[10\]\[0:2\]} \
{/test_top/Conv_top/top_CNN/W\[11\]\[0:2\]} \
{/test_top/Conv_top/top_CNN/W\[12\]\[0:2\]} \
{/test_top/Conv_top/top_CNN/W\[13\]\[0:2\]} \
{/test_top/Conv_top/top_CNN/W\[14\]\[0:2\]} \
{/test_top/Conv_top/top_CNN/W\[15\]\[0:2\]} \
{/test_top/Conv_top/top_CNN/temp_conv_out\[0:15\]} \
{/test_top/Conv_top/top_CNN/Y\[0:63\]} \
{/test_top/Conv_top/top_CNN/bias\[0:3\]} \
{/test_top/Conv_top/addr/sram_raddr_bias\[6:0\]} \
}
wvAddSignal -win $_nWave1 -group {"G2" \
}
wvSelectSignal -win $_nWave1 {( "G1" 47 )} 
wvSetPosition -win $_nWave1 {("G1" 47)}
wvGetSignalClose -win $_nWave1
wvScrollDown -win $_nWave1 0
wvScrollDown -win $_nWave1 0
wvScrollDown -win $_nWave1 0
wvZoomOut -win $_nWave1
wvZoomOut -win $_nWave1
wvZoomOut -win $_nWave1
wvZoomOut -win $_nWave1
wvZoomOut -win $_nWave1
wvZoomIn -win $_nWave1
wvSetCursor -win $_nWave1 78969.977157 -snap {("G1" 47)}
wvGetSignalOpen -win $_nWave1
wvGetSignalSetScope -win $_nWave1 "/test_top"
wvGetSignalSetScope -win $_nWave1 "/test_top/Conv_top"
wvGetSignalSetScope -win $_nWave1 "/test_top/Conv_top/top_CNN"
wvGetSignalSetScope -win $_nWave1 "/test_top/Conv_top/addr"
wvGetSignalClose -win $_nWave1
wvDisplayGridCount -win $_nWave1 -off
wvGetSignalClose -win $_nWave1
wvReloadFile -win $_nWave1
wvZoomOut -win $_nWave1
wvZoomOut -win $_nWave1
wvZoomOut -win $_nWave1
wvZoomIn -win $_nWave1
wvZoomIn -win $_nWave1
wvScrollUp -win $_nWave1 1
wvSetCursor -win $_nWave1 78725.059298 -snap {("G1" 22)}
wvScrollDown -win $_nWave1 1
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
wvScrollDown -win $_nWave1 0
wvScrollDown -win $_nWave1 0
wvScrollDown -win $_nWave1 0
wvScrollDown -win $_nWave1 0
wvScrollDown -win $_nWave1 0
wvScrollDown -win $_nWave1 0
wvScrollDown -win $_nWave1 0
wvScrollDown -win $_nWave1 0
wvScrollDown -win $_nWave1 0
wvScrollDown -win $_nWave1 0
wvScrollDown -win $_nWave1 1
wvScrollDown -win $_nWave1 1
wvScrollDown -win $_nWave1 1
wvScrollDown -win $_nWave1 1
wvScrollDown -win $_nWave1 17
wvGetSignalOpen -win $_nWave1
wvGetSignalSetScope -win $_nWave1 "/test_top/Conv_top"
wvSetPosition -win $_nWave1 {("G1" 48)}
wvSetPosition -win $_nWave1 {("G1" 48)}
wvAddSignal -win $_nWave1 -clear
wvAddSignal -win $_nWave1 -group {"G1" \
{/test_top/Conv_top/clk} \
{/test_top/Conv_top/cnn_state\[4:0\]} \
{/test_top/Conv_top/feature_maps_o0\[7:0\]} \
{/test_top/Conv_top/feature_maps_o1\[7:0\]} \
{/test_top/Conv_top/feature_maps_o2\[7:0\]} \
{/test_top/Conv_top/feature_maps_o3\[7:0\]} \
{/test_top/Conv_top/feature_maps_o4\[7:0\]} \
{/test_top/Conv_top/feature_maps_o5\[7:0\]} \
{/test_top/Conv_top/feature_maps_o6\[7:0\]} \
{/test_top/Conv_top/feature_maps_o7\[7:0\]} \
{/test_top/Conv_top/feature_maps_o8\[7:0\]} \
{/test_top/Conv_top/feature_maps_o9\[7:0\]} \
{/test_top/Conv_top/feature_maps_o10\[7:0\]} \
{/test_top/Conv_top/feature_maps_o11\[7:0\]} \
{/test_top/Conv_top/feature_maps_o12\[7:0\]} \
{/test_top/Conv_top/feature_maps_o13\[7:0\]} \
{/test_top/Conv_top/feature_maps_o14\[7:0\]} \
{/test_top/Conv_top/feature_maps_o15\[7:0\]} \
{/test_top/Conv_top/read_weight_finish} \
{/test_top/Conv_top/rst_n} \
{/test_top/Conv_top/sram_raddr_weight\[10:0\]} \
{/test_top/Conv_top/state\[5:0\]} \
{/test_top/Conv_top/x_cnt\[4:0\]} \
{/test_top/Conv_top/x_cnt_pp\[4:0\]} \
{/test_top/Conv_top/y_cnt\[4:0\]} \
{/test_top/Conv_top/y_cnt_pp\[4:0\]} \
{/test_top/Conv_top/top_CNN/W\[0:15\]} \
{/test_top/Conv_top/top_CNN/W\[0\]\[0:2\]} \
{/test_top/Conv_top/top_CNN/W\[1\]\[0:2\]} \
{/test_top/Conv_top/top_CNN/W\[2\]\[0:2\]} \
{/test_top/Conv_top/top_CNN/W\[3\]\[0:2\]} \
{/test_top/Conv_top/top_CNN/W\[4\]\[0:2\]} \
{/test_top/Conv_top/top_CNN/W\[5\]\[0:2\]} \
{/test_top/Conv_top/top_CNN/W\[6\]\[0:2\]} \
{/test_top/Conv_top/top_CNN/W\[7\]\[0:2\]} \
{/test_top/Conv_top/top_CNN/W\[8\]\[0:2\]} \
{/test_top/Conv_top/top_CNN/W\[9\]\[0:2\]} \
{/test_top/Conv_top/top_CNN/W\[10\]\[0:2\]} \
{/test_top/Conv_top/top_CNN/W\[11\]\[0:2\]} \
{/test_top/Conv_top/top_CNN/W\[12\]\[0:2\]} \
{/test_top/Conv_top/top_CNN/W\[13\]\[0:2\]} \
{/test_top/Conv_top/top_CNN/W\[14\]\[0:2\]} \
{/test_top/Conv_top/top_CNN/W\[15\]\[0:2\]} \
{/test_top/Conv_top/top_CNN/temp_conv_out\[0:15\]} \
{/test_top/Conv_top/top_CNN/Y\[0:63\]} \
{/test_top/Conv_top/top_CNN/bias\[0:3\]} \
{/test_top/Conv_top/addr/sram_raddr_bias\[6:0\]} \
{/test_top/Conv_top/read_cnt\[10:0\]} \
}
wvAddSignal -win $_nWave1 -group {"G2" \
}
wvSelectSignal -win $_nWave1 {( "G1" 48 )} 
wvSetPosition -win $_nWave1 {("G1" 48)}
wvSetPosition -win $_nWave1 {("G1" 48)}
wvSetPosition -win $_nWave1 {("G1" 48)}
wvAddSignal -win $_nWave1 -clear
wvAddSignal -win $_nWave1 -group {"G1" \
{/test_top/Conv_top/clk} \
{/test_top/Conv_top/cnn_state\[4:0\]} \
{/test_top/Conv_top/feature_maps_o0\[7:0\]} \
{/test_top/Conv_top/feature_maps_o1\[7:0\]} \
{/test_top/Conv_top/feature_maps_o2\[7:0\]} \
{/test_top/Conv_top/feature_maps_o3\[7:0\]} \
{/test_top/Conv_top/feature_maps_o4\[7:0\]} \
{/test_top/Conv_top/feature_maps_o5\[7:0\]} \
{/test_top/Conv_top/feature_maps_o6\[7:0\]} \
{/test_top/Conv_top/feature_maps_o7\[7:0\]} \
{/test_top/Conv_top/feature_maps_o8\[7:0\]} \
{/test_top/Conv_top/feature_maps_o9\[7:0\]} \
{/test_top/Conv_top/feature_maps_o10\[7:0\]} \
{/test_top/Conv_top/feature_maps_o11\[7:0\]} \
{/test_top/Conv_top/feature_maps_o12\[7:0\]} \
{/test_top/Conv_top/feature_maps_o13\[7:0\]} \
{/test_top/Conv_top/feature_maps_o14\[7:0\]} \
{/test_top/Conv_top/feature_maps_o15\[7:0\]} \
{/test_top/Conv_top/read_weight_finish} \
{/test_top/Conv_top/rst_n} \
{/test_top/Conv_top/sram_raddr_weight\[10:0\]} \
{/test_top/Conv_top/state\[5:0\]} \
{/test_top/Conv_top/x_cnt\[4:0\]} \
{/test_top/Conv_top/x_cnt_pp\[4:0\]} \
{/test_top/Conv_top/y_cnt\[4:0\]} \
{/test_top/Conv_top/y_cnt_pp\[4:0\]} \
{/test_top/Conv_top/top_CNN/W\[0:15\]} \
{/test_top/Conv_top/top_CNN/W\[0\]\[0:2\]} \
{/test_top/Conv_top/top_CNN/W\[1\]\[0:2\]} \
{/test_top/Conv_top/top_CNN/W\[2\]\[0:2\]} \
{/test_top/Conv_top/top_CNN/W\[3\]\[0:2\]} \
{/test_top/Conv_top/top_CNN/W\[4\]\[0:2\]} \
{/test_top/Conv_top/top_CNN/W\[5\]\[0:2\]} \
{/test_top/Conv_top/top_CNN/W\[6\]\[0:2\]} \
{/test_top/Conv_top/top_CNN/W\[7\]\[0:2\]} \
{/test_top/Conv_top/top_CNN/W\[8\]\[0:2\]} \
{/test_top/Conv_top/top_CNN/W\[9\]\[0:2\]} \
{/test_top/Conv_top/top_CNN/W\[10\]\[0:2\]} \
{/test_top/Conv_top/top_CNN/W\[11\]\[0:2\]} \
{/test_top/Conv_top/top_CNN/W\[12\]\[0:2\]} \
{/test_top/Conv_top/top_CNN/W\[13\]\[0:2\]} \
{/test_top/Conv_top/top_CNN/W\[14\]\[0:2\]} \
{/test_top/Conv_top/top_CNN/W\[15\]\[0:2\]} \
{/test_top/Conv_top/top_CNN/temp_conv_out\[0:15\]} \
{/test_top/Conv_top/top_CNN/Y\[0:63\]} \
{/test_top/Conv_top/top_CNN/bias\[0:3\]} \
{/test_top/Conv_top/addr/sram_raddr_bias\[6:0\]} \
{/test_top/Conv_top/read_cnt\[10:0\]} \
}
wvAddSignal -win $_nWave1 -group {"G2" \
}
wvSelectSignal -win $_nWave1 {( "G1" 48 )} 
wvSetPosition -win $_nWave1 {("G1" 48)}
wvGetSignalClose -win $_nWave1
wvSelectSignal -win $_nWave1 {( "G1" 22 )} 
wvCopyFilePathToClipboard -win $_nWave1 -fileId 1
wvSetActiveFile -win $_nWave1 -applyAnnotation off \
           {/home/u105/u105061255/ICLAB/HW5/PART2/sim/eCNN_micro.fsdb}
wvDisplayGridCount -win $_nWave1 -off
wvGetSignalClose -win $_nWave1
wvReloadFile -win $_nWave1
wvZoomOut -win $_nWave1
wvZoomOut -win $_nWave1
wvZoomOut -win $_nWave1
wvZoomOut -win $_nWave1
wvZoomOut -win $_nWave1
wvZoomIn -win $_nWave1
wvZoomIn -win $_nWave1
wvZoomIn -win $_nWave1
wvZoomIn -win $_nWave1
wvZoomIn -win $_nWave1
wvZoomIn -win $_nWave1
wvScrollUp -win $_nWave1 1
wvScrollUp -win $_nWave1 1
wvScrollUp -win $_nWave1 1
wvScrollDown -win $_nWave1 1
wvScrollDown -win $_nWave1 1
wvSetCursor -win $_nWave1 78746.024858 -snap {("G1" 46)}
wvSetCursor -win $_nWave1 78752.809455 -snap {("G1" 21)}
wvSetCursor -win $_nWave1 78725.671068 -snap {("G1" 22)}
wvScrollDown -win $_nWave1 1
wvScrollDown -win $_nWave1 0
wvScrollUp -win $_nWave1 1
wvScrollDown -win $_nWave1 1
wvScrollDown -win $_nWave1 0
wvScrollDown -win $_nWave1 0
wvScrollUp -win $_nWave1 1
wvScrollUp -win $_nWave1 1
wvScrollUp -win $_nWave1 1
wvScrollDown -win $_nWave1 1
wvScrollDown -win $_nWave1 1
wvScrollDown -win $_nWave1 1
wvScrollDown -win $_nWave1 0
wvSetCursor -win $_nWave1 78779.947842 -snap {("G1" 46)}
wvSetCursor -win $_nWave1 78762.986350 -snap {("G1" 48)}
wvDisplayGridCount -win $_nWave1 -off
wvGetSignalClose -win $_nWave1
wvReloadFile -win $_nWave1
wvSetCursor -win $_nWave1 78963.131952 -snap {("G1" 46)}
wvScrollDown -win $_nWave1 1
wvScrollDown -win $_nWave1 0
wvResizeWindow -win $_nWave1 0 23 1217 697
wvSetCursor -win $_nWave1 79248.518778 -snap {("G1" 46)}
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
wvScrollDown -win $_nWave1 0
wvScrollDown -win $_nWave1 0
wvGetSignalOpen -win $_nWave1
wvGetSignalSetScope -win $_nWave1 "/test_top"
wvGetSignalSetScope -win $_nWave1 "/test_top/FC1_layer"
wvGetSignalSetScope -win $_nWave1 "/test_top/FC2_layer"
wvGetSignalSetScope -win $_nWave1 "/test_top/FC1_layer"
wvGetSignalSetScope -win $_nWave1 "/test_top/Conv_top"
wvGetSignalSetScope -win $_nWave1 "/test_top/Conv_top/top_CNN"
wvSetPosition -win $_nWave1 {("G1" 49)}
wvSetPosition -win $_nWave1 {("G1" 49)}
wvAddSignal -win $_nWave1 -clear
wvAddSignal -win $_nWave1 -group {"G1" \
{/test_top/Conv_top/clk} \
{/test_top/Conv_top/cnn_state\[4:0\]} \
{/test_top/Conv_top/feature_maps_o0\[7:0\]} \
{/test_top/Conv_top/feature_maps_o1\[7:0\]} \
{/test_top/Conv_top/feature_maps_o2\[7:0\]} \
{/test_top/Conv_top/feature_maps_o3\[7:0\]} \
{/test_top/Conv_top/feature_maps_o4\[7:0\]} \
{/test_top/Conv_top/feature_maps_o5\[7:0\]} \
{/test_top/Conv_top/feature_maps_o6\[7:0\]} \
{/test_top/Conv_top/feature_maps_o7\[7:0\]} \
{/test_top/Conv_top/feature_maps_o8\[7:0\]} \
{/test_top/Conv_top/feature_maps_o9\[7:0\]} \
{/test_top/Conv_top/feature_maps_o10\[7:0\]} \
{/test_top/Conv_top/feature_maps_o11\[7:0\]} \
{/test_top/Conv_top/feature_maps_o12\[7:0\]} \
{/test_top/Conv_top/feature_maps_o13\[7:0\]} \
{/test_top/Conv_top/feature_maps_o14\[7:0\]} \
{/test_top/Conv_top/feature_maps_o15\[7:0\]} \
{/test_top/Conv_top/read_weight_finish} \
{/test_top/Conv_top/rst_n} \
{/test_top/Conv_top/sram_raddr_weight\[10:0\]} \
{/test_top/Conv_top/state\[5:0\]} \
{/test_top/Conv_top/x_cnt\[4:0\]} \
{/test_top/Conv_top/x_cnt_pp\[4:0\]} \
{/test_top/Conv_top/y_cnt\[4:0\]} \
{/test_top/Conv_top/y_cnt_pp\[4:0\]} \
{/test_top/Conv_top/top_CNN/W\[0:15\]} \
{/test_top/Conv_top/top_CNN/W\[0\]\[0:2\]} \
{/test_top/Conv_top/top_CNN/W\[1\]\[0:2\]} \
{/test_top/Conv_top/top_CNN/W\[2\]\[0:2\]} \
{/test_top/Conv_top/top_CNN/W\[3\]\[0:2\]} \
{/test_top/Conv_top/top_CNN/W\[4\]\[0:2\]} \
{/test_top/Conv_top/top_CNN/W\[5\]\[0:2\]} \
{/test_top/Conv_top/top_CNN/W\[6\]\[0:2\]} \
{/test_top/Conv_top/top_CNN/W\[7\]\[0:2\]} \
{/test_top/Conv_top/top_CNN/W\[8\]\[0:2\]} \
{/test_top/Conv_top/top_CNN/W\[9\]\[0:2\]} \
{/test_top/Conv_top/top_CNN/W\[10\]\[0:2\]} \
{/test_top/Conv_top/top_CNN/W\[11\]\[0:2\]} \
{/test_top/Conv_top/top_CNN/W\[12\]\[0:2\]} \
{/test_top/Conv_top/top_CNN/W\[13\]\[0:2\]} \
{/test_top/Conv_top/top_CNN/W\[14\]\[0:2\]} \
{/test_top/Conv_top/top_CNN/W\[15\]\[0:2\]} \
{/test_top/Conv_top/top_CNN/temp_conv_out\[0:15\]} \
{/test_top/Conv_top/top_CNN/Y\[0:63\]} \
{/test_top/Conv_top/top_CNN/bias\[0:3\]} \
{/test_top/Conv_top/addr/sram_raddr_bias\[6:0\]} \
{/test_top/Conv_top/read_cnt\[10:0\]} \
{/test_top/Conv_top/top_CNN/sram_rdata_bias\[3:0\]} \
}
wvAddSignal -win $_nWave1 -group {"G2" \
}
wvSelectSignal -win $_nWave1 {( "G1" 49 )} 
wvSetPosition -win $_nWave1 {("G1" 49)}
wvSetPosition -win $_nWave1 {("G1" 49)}
wvSetPosition -win $_nWave1 {("G1" 49)}
wvAddSignal -win $_nWave1 -clear
wvAddSignal -win $_nWave1 -group {"G1" \
{/test_top/Conv_top/clk} \
{/test_top/Conv_top/cnn_state\[4:0\]} \
{/test_top/Conv_top/feature_maps_o0\[7:0\]} \
{/test_top/Conv_top/feature_maps_o1\[7:0\]} \
{/test_top/Conv_top/feature_maps_o2\[7:0\]} \
{/test_top/Conv_top/feature_maps_o3\[7:0\]} \
{/test_top/Conv_top/feature_maps_o4\[7:0\]} \
{/test_top/Conv_top/feature_maps_o5\[7:0\]} \
{/test_top/Conv_top/feature_maps_o6\[7:0\]} \
{/test_top/Conv_top/feature_maps_o7\[7:0\]} \
{/test_top/Conv_top/feature_maps_o8\[7:0\]} \
{/test_top/Conv_top/feature_maps_o9\[7:0\]} \
{/test_top/Conv_top/feature_maps_o10\[7:0\]} \
{/test_top/Conv_top/feature_maps_o11\[7:0\]} \
{/test_top/Conv_top/feature_maps_o12\[7:0\]} \
{/test_top/Conv_top/feature_maps_o13\[7:0\]} \
{/test_top/Conv_top/feature_maps_o14\[7:0\]} \
{/test_top/Conv_top/feature_maps_o15\[7:0\]} \
{/test_top/Conv_top/read_weight_finish} \
{/test_top/Conv_top/rst_n} \
{/test_top/Conv_top/sram_raddr_weight\[10:0\]} \
{/test_top/Conv_top/state\[5:0\]} \
{/test_top/Conv_top/x_cnt\[4:0\]} \
{/test_top/Conv_top/x_cnt_pp\[4:0\]} \
{/test_top/Conv_top/y_cnt\[4:0\]} \
{/test_top/Conv_top/y_cnt_pp\[4:0\]} \
{/test_top/Conv_top/top_CNN/W\[0:15\]} \
{/test_top/Conv_top/top_CNN/W\[0\]\[0:2\]} \
{/test_top/Conv_top/top_CNN/W\[1\]\[0:2\]} \
{/test_top/Conv_top/top_CNN/W\[2\]\[0:2\]} \
{/test_top/Conv_top/top_CNN/W\[3\]\[0:2\]} \
{/test_top/Conv_top/top_CNN/W\[4\]\[0:2\]} \
{/test_top/Conv_top/top_CNN/W\[5\]\[0:2\]} \
{/test_top/Conv_top/top_CNN/W\[6\]\[0:2\]} \
{/test_top/Conv_top/top_CNN/W\[7\]\[0:2\]} \
{/test_top/Conv_top/top_CNN/W\[8\]\[0:2\]} \
{/test_top/Conv_top/top_CNN/W\[9\]\[0:2\]} \
{/test_top/Conv_top/top_CNN/W\[10\]\[0:2\]} \
{/test_top/Conv_top/top_CNN/W\[11\]\[0:2\]} \
{/test_top/Conv_top/top_CNN/W\[12\]\[0:2\]} \
{/test_top/Conv_top/top_CNN/W\[13\]\[0:2\]} \
{/test_top/Conv_top/top_CNN/W\[14\]\[0:2\]} \
{/test_top/Conv_top/top_CNN/W\[15\]\[0:2\]} \
{/test_top/Conv_top/top_CNN/temp_conv_out\[0:15\]} \
{/test_top/Conv_top/top_CNN/Y\[0:63\]} \
{/test_top/Conv_top/top_CNN/bias\[0:3\]} \
{/test_top/Conv_top/addr/sram_raddr_bias\[6:0\]} \
{/test_top/Conv_top/read_cnt\[10:0\]} \
{/test_top/Conv_top/top_CNN/sram_rdata_bias\[3:0\]} \
}
wvAddSignal -win $_nWave1 -group {"G2" \
}
wvSelectSignal -win $_nWave1 {( "G1" 49 )} 
wvSetPosition -win $_nWave1 {("G1" 49)}
wvGetSignalClose -win $_nWave1
wvScrollDown -win $_nWave1 0
wvScrollDown -win $_nWave1 0
wvZoomOut -win $_nWave1
wvScrollUp -win $_nWave1 1
wvScrollUp -win $_nWave1 1
wvScrollUp -win $_nWave1 1
wvScrollUp -win $_nWave1 1
wvScrollUp -win $_nWave1 1
wvSetCursor -win $_nWave1 78766.619328 -snap {("G1" 22)}
wvScrollDown -win $_nWave1 1
wvScrollDown -win $_nWave1 1
wvScrollDown -win $_nWave1 1
wvScrollDown -win $_nWave1 1
wvScrollDown -win $_nWave1 1
wvScrollDown -win $_nWave1 0
wvScrollDown -win $_nWave1 0
wvSetCursor -win $_nWave1 79343.541205 -snap {("G1" 48)}
wvDisplayGridCount -win $_nWave1 -off
wvGetSignalClose -win $_nWave1
wvReloadFile -win $_nWave1
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
wvScrollDown -win $_nWave1 1
wvScrollDown -win $_nWave1 1
wvScrollDown -win $_nWave1 1
wvScrollDown -win $_nWave1 1
wvScrollDown -win $_nWave1 1
wvScrollDown -win $_nWave1 1
wvScrollDown -win $_nWave1 1
wvSetCursor -win $_nWave1 80449.873746 -snap {("G1" 43)}
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
wvSetCursor -win $_nWave1 80584.941338 -snap {("G1" 19)}
wvScrollDown -win $_nWave1 1
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
wvSetCursor -win $_nWave1 80517.068176 -snap {("G1" 23)}
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
wvSetCursor -win $_nWave1 80449.195014 -snap {("G1" 2)}
wvScrollDown -win $_nWave1 1
wvScrollDown -win $_nWave1 1
wvScrollDown -win $_nWave1 1
wvScrollDown -win $_nWave1 1
wvScrollDown -win $_nWave1 1
wvScrollDown -win $_nWave1 1
wvScrollDown -win $_nWave1 1
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
wvScrollUp -win $_nWave1 1
wvScrollUp -win $_nWave1 1
wvScrollUp -win $_nWave1 1
wvScrollUp -win $_nWave1 1
wvScrollUp -win $_nWave1 8
wvGetSignalOpen -win $_nWave1
wvSetPosition -win $_nWave1 {("G1" 50)}
wvSetPosition -win $_nWave1 {("G1" 50)}
wvAddSignal -win $_nWave1 -clear
wvAddSignal -win $_nWave1 -group {"G1" \
{/test_top/Conv_top/clk} \
{/test_top/Conv_top/cnn_state\[4:0\]} \
{/test_top/Conv_top/feature_maps_o0\[7:0\]} \
{/test_top/Conv_top/feature_maps_o1\[7:0\]} \
{/test_top/Conv_top/feature_maps_o2\[7:0\]} \
{/test_top/Conv_top/feature_maps_o3\[7:0\]} \
{/test_top/Conv_top/feature_maps_o4\[7:0\]} \
{/test_top/Conv_top/feature_maps_o5\[7:0\]} \
{/test_top/Conv_top/feature_maps_o6\[7:0\]} \
{/test_top/Conv_top/feature_maps_o7\[7:0\]} \
{/test_top/Conv_top/feature_maps_o8\[7:0\]} \
{/test_top/Conv_top/feature_maps_o9\[7:0\]} \
{/test_top/Conv_top/feature_maps_o10\[7:0\]} \
{/test_top/Conv_top/feature_maps_o11\[7:0\]} \
{/test_top/Conv_top/feature_maps_o12\[7:0\]} \
{/test_top/Conv_top/feature_maps_o13\[7:0\]} \
{/test_top/Conv_top/feature_maps_o14\[7:0\]} \
{/test_top/Conv_top/feature_maps_o15\[7:0\]} \
{/test_top/Conv_top/read_weight_finish} \
{/test_top/Conv_top/rst_n} \
{/test_top/Conv_top/sram_raddr_weight\[10:0\]} \
{/test_top/Conv_top/state\[5:0\]} \
{/test_top/Conv_top/x_cnt\[4:0\]} \
{/test_top/Conv_top/x_cnt_pp\[4:0\]} \
{/test_top/Conv_top/y_cnt\[4:0\]} \
{/test_top/Conv_top/y_cnt_pp\[4:0\]} \
{/test_top/Conv_top/top_CNN/W\[0:15\]} \
{/test_top/Conv_top/top_CNN/W\[0\]\[0:2\]} \
{/test_top/Conv_top/top_CNN/W\[1\]\[0:2\]} \
{/test_top/Conv_top/top_CNN/W\[2\]\[0:2\]} \
{/test_top/Conv_top/top_CNN/W\[3\]\[0:2\]} \
{/test_top/Conv_top/top_CNN/W\[4\]\[0:2\]} \
{/test_top/Conv_top/top_CNN/W\[5\]\[0:2\]} \
{/test_top/Conv_top/top_CNN/W\[6\]\[0:2\]} \
{/test_top/Conv_top/top_CNN/W\[7\]\[0:2\]} \
{/test_top/Conv_top/top_CNN/W\[8\]\[0:2\]} \
{/test_top/Conv_top/top_CNN/W\[9\]\[0:2\]} \
{/test_top/Conv_top/top_CNN/W\[10\]\[0:2\]} \
{/test_top/Conv_top/top_CNN/W\[11\]\[0:2\]} \
{/test_top/Conv_top/top_CNN/W\[12\]\[0:2\]} \
{/test_top/Conv_top/top_CNN/W\[13\]\[0:2\]} \
{/test_top/Conv_top/top_CNN/W\[14\]\[0:2\]} \
{/test_top/Conv_top/top_CNN/W\[15\]\[0:2\]} \
{/test_top/Conv_top/top_CNN/temp_conv_out\[0:15\]} \
{/test_top/Conv_top/top_CNN/Y\[0:63\]} \
{/test_top/Conv_top/top_CNN/bias\[0:3\]} \
{/test_top/Conv_top/addr/sram_raddr_bias\[6:0\]} \
{/test_top/Conv_top/read_cnt\[10:0\]} \
{/test_top/Conv_top/top_CNN/sram_rdata_bias\[3:0\]} \
{/test_top/Conv_top/top_CNN/feature_maps_o\[0:15\]} \
}
wvAddSignal -win $_nWave1 -group {"G2" \
}
wvSelectSignal -win $_nWave1 {( "G1" 50 )} 
wvSetPosition -win $_nWave1 {("G1" 50)}
wvSetPosition -win $_nWave1 {("G1" 50)}
wvSetPosition -win $_nWave1 {("G1" 50)}
wvAddSignal -win $_nWave1 -clear
wvAddSignal -win $_nWave1 -group {"G1" \
{/test_top/Conv_top/clk} \
{/test_top/Conv_top/cnn_state\[4:0\]} \
{/test_top/Conv_top/feature_maps_o0\[7:0\]} \
{/test_top/Conv_top/feature_maps_o1\[7:0\]} \
{/test_top/Conv_top/feature_maps_o2\[7:0\]} \
{/test_top/Conv_top/feature_maps_o3\[7:0\]} \
{/test_top/Conv_top/feature_maps_o4\[7:0\]} \
{/test_top/Conv_top/feature_maps_o5\[7:0\]} \
{/test_top/Conv_top/feature_maps_o6\[7:0\]} \
{/test_top/Conv_top/feature_maps_o7\[7:0\]} \
{/test_top/Conv_top/feature_maps_o8\[7:0\]} \
{/test_top/Conv_top/feature_maps_o9\[7:0\]} \
{/test_top/Conv_top/feature_maps_o10\[7:0\]} \
{/test_top/Conv_top/feature_maps_o11\[7:0\]} \
{/test_top/Conv_top/feature_maps_o12\[7:0\]} \
{/test_top/Conv_top/feature_maps_o13\[7:0\]} \
{/test_top/Conv_top/feature_maps_o14\[7:0\]} \
{/test_top/Conv_top/feature_maps_o15\[7:0\]} \
{/test_top/Conv_top/read_weight_finish} \
{/test_top/Conv_top/rst_n} \
{/test_top/Conv_top/sram_raddr_weight\[10:0\]} \
{/test_top/Conv_top/state\[5:0\]} \
{/test_top/Conv_top/x_cnt\[4:0\]} \
{/test_top/Conv_top/x_cnt_pp\[4:0\]} \
{/test_top/Conv_top/y_cnt\[4:0\]} \
{/test_top/Conv_top/y_cnt_pp\[4:0\]} \
{/test_top/Conv_top/top_CNN/W\[0:15\]} \
{/test_top/Conv_top/top_CNN/W\[0\]\[0:2\]} \
{/test_top/Conv_top/top_CNN/W\[1\]\[0:2\]} \
{/test_top/Conv_top/top_CNN/W\[2\]\[0:2\]} \
{/test_top/Conv_top/top_CNN/W\[3\]\[0:2\]} \
{/test_top/Conv_top/top_CNN/W\[4\]\[0:2\]} \
{/test_top/Conv_top/top_CNN/W\[5\]\[0:2\]} \
{/test_top/Conv_top/top_CNN/W\[6\]\[0:2\]} \
{/test_top/Conv_top/top_CNN/W\[7\]\[0:2\]} \
{/test_top/Conv_top/top_CNN/W\[8\]\[0:2\]} \
{/test_top/Conv_top/top_CNN/W\[9\]\[0:2\]} \
{/test_top/Conv_top/top_CNN/W\[10\]\[0:2\]} \
{/test_top/Conv_top/top_CNN/W\[11\]\[0:2\]} \
{/test_top/Conv_top/top_CNN/W\[12\]\[0:2\]} \
{/test_top/Conv_top/top_CNN/W\[13\]\[0:2\]} \
{/test_top/Conv_top/top_CNN/W\[14\]\[0:2\]} \
{/test_top/Conv_top/top_CNN/W\[15\]\[0:2\]} \
{/test_top/Conv_top/top_CNN/temp_conv_out\[0:15\]} \
{/test_top/Conv_top/top_CNN/Y\[0:63\]} \
{/test_top/Conv_top/top_CNN/bias\[0:3\]} \
{/test_top/Conv_top/addr/sram_raddr_bias\[6:0\]} \
{/test_top/Conv_top/read_cnt\[10:0\]} \
{/test_top/Conv_top/top_CNN/sram_rdata_bias\[3:0\]} \
{/test_top/Conv_top/top_CNN/feature_maps_o\[0:15\]} \
}
wvAddSignal -win $_nWave1 -group {"G2" \
}
wvSelectSignal -win $_nWave1 {( "G1" 50 )} 
wvSetPosition -win $_nWave1 {("G1" 50)}
wvGetSignalClose -win $_nWave1
wvSetCursor -win $_nWave1 81399.419283 -snap {("G1" 50)}
wvCut -win $_nWave1
wvSetPosition -win $_nWave1 {("G2" 0)}
wvSetPosition -win $_nWave1 {("G1" 49)}
wvGetSignalOpen -win $_nWave1
wvGetSignalSetScope -win $_nWave1 "/test_top"
wvGetSignalSetScope -win $_nWave1 "/test_top/Conv_top"
wvGetSignalSetScope -win $_nWave1 "/test_top/Conv_top/top_CNN"
wvScrollUp -win $_nWave1 12
wvScrollUp -win $_nWave1 10
wvScrollDown -win $_nWave1 11
wvGetSignalOpen -win $_nWave1
wvGetSignalSetScope -win $_nWave1 "/test_top"
wvGetSignalSetScope -win $_nWave1 "/test_top/Conv_top"
wvGetSignalSetScope -win $_nWave1 "/test_top/Conv_top/top_CNN"
wvSetPosition -win $_nWave1 {("G1" 50)}
wvSetPosition -win $_nWave1 {("G1" 50)}
wvAddSignal -win $_nWave1 -clear
wvAddSignal -win $_nWave1 -group {"G1" \
{/test_top/Conv_top/clk} \
{/test_top/Conv_top/cnn_state\[4:0\]} \
{/test_top/Conv_top/feature_maps_o0\[7:0\]} \
{/test_top/Conv_top/feature_maps_o1\[7:0\]} \
{/test_top/Conv_top/feature_maps_o2\[7:0\]} \
{/test_top/Conv_top/feature_maps_o3\[7:0\]} \
{/test_top/Conv_top/feature_maps_o4\[7:0\]} \
{/test_top/Conv_top/feature_maps_o5\[7:0\]} \
{/test_top/Conv_top/feature_maps_o6\[7:0\]} \
{/test_top/Conv_top/feature_maps_o7\[7:0\]} \
{/test_top/Conv_top/feature_maps_o8\[7:0\]} \
{/test_top/Conv_top/feature_maps_o9\[7:0\]} \
{/test_top/Conv_top/feature_maps_o10\[7:0\]} \
{/test_top/Conv_top/feature_maps_o11\[7:0\]} \
{/test_top/Conv_top/feature_maps_o12\[7:0\]} \
{/test_top/Conv_top/feature_maps_o13\[7:0\]} \
{/test_top/Conv_top/feature_maps_o14\[7:0\]} \
{/test_top/Conv_top/feature_maps_o15\[7:0\]} \
{/test_top/Conv_top/read_weight_finish} \
{/test_top/Conv_top/rst_n} \
{/test_top/Conv_top/sram_raddr_weight\[10:0\]} \
{/test_top/Conv_top/state\[5:0\]} \
{/test_top/Conv_top/x_cnt\[4:0\]} \
{/test_top/Conv_top/x_cnt_pp\[4:0\]} \
{/test_top/Conv_top/y_cnt\[4:0\]} \
{/test_top/Conv_top/y_cnt_pp\[4:0\]} \
{/test_top/Conv_top/top_CNN/W\[0:15\]} \
{/test_top/Conv_top/top_CNN/W\[0\]\[0:2\]} \
{/test_top/Conv_top/top_CNN/W\[1\]\[0:2\]} \
{/test_top/Conv_top/top_CNN/W\[2\]\[0:2\]} \
{/test_top/Conv_top/top_CNN/W\[3\]\[0:2\]} \
{/test_top/Conv_top/top_CNN/W\[4\]\[0:2\]} \
{/test_top/Conv_top/top_CNN/W\[5\]\[0:2\]} \
{/test_top/Conv_top/top_CNN/W\[6\]\[0:2\]} \
{/test_top/Conv_top/top_CNN/W\[7\]\[0:2\]} \
{/test_top/Conv_top/top_CNN/W\[8\]\[0:2\]} \
{/test_top/Conv_top/top_CNN/W\[9\]\[0:2\]} \
{/test_top/Conv_top/top_CNN/W\[10\]\[0:2\]} \
{/test_top/Conv_top/top_CNN/W\[11\]\[0:2\]} \
{/test_top/Conv_top/top_CNN/W\[12\]\[0:2\]} \
{/test_top/Conv_top/top_CNN/W\[13\]\[0:2\]} \
{/test_top/Conv_top/top_CNN/W\[14\]\[0:2\]} \
{/test_top/Conv_top/top_CNN/W\[15\]\[0:2\]} \
{/test_top/Conv_top/top_CNN/temp_conv_out\[0:15\]} \
{/test_top/Conv_top/top_CNN/Y\[0:63\]} \
{/test_top/Conv_top/top_CNN/bias\[0:3\]} \
{/test_top/Conv_top/addr/sram_raddr_bias\[6:0\]} \
{/test_top/Conv_top/read_cnt\[10:0\]} \
{/test_top/Conv_top/top_CNN/sram_rdata_bias\[3:0\]} \
{/test_top/Conv_top/top_CNN/Y\[0:63\]} \
}
wvAddSignal -win $_nWave1 -group {"G2" \
}
wvSelectSignal -win $_nWave1 {( "G1" 50 )} 
wvSetPosition -win $_nWave1 {("G1" 50)}
wvSetPosition -win $_nWave1 {("G1" 50)}
wvSetPosition -win $_nWave1 {("G1" 50)}
wvAddSignal -win $_nWave1 -clear
wvAddSignal -win $_nWave1 -group {"G1" \
{/test_top/Conv_top/clk} \
{/test_top/Conv_top/cnn_state\[4:0\]} \
{/test_top/Conv_top/feature_maps_o0\[7:0\]} \
{/test_top/Conv_top/feature_maps_o1\[7:0\]} \
{/test_top/Conv_top/feature_maps_o2\[7:0\]} \
{/test_top/Conv_top/feature_maps_o3\[7:0\]} \
{/test_top/Conv_top/feature_maps_o4\[7:0\]} \
{/test_top/Conv_top/feature_maps_o5\[7:0\]} \
{/test_top/Conv_top/feature_maps_o6\[7:0\]} \
{/test_top/Conv_top/feature_maps_o7\[7:0\]} \
{/test_top/Conv_top/feature_maps_o8\[7:0\]} \
{/test_top/Conv_top/feature_maps_o9\[7:0\]} \
{/test_top/Conv_top/feature_maps_o10\[7:0\]} \
{/test_top/Conv_top/feature_maps_o11\[7:0\]} \
{/test_top/Conv_top/feature_maps_o12\[7:0\]} \
{/test_top/Conv_top/feature_maps_o13\[7:0\]} \
{/test_top/Conv_top/feature_maps_o14\[7:0\]} \
{/test_top/Conv_top/feature_maps_o15\[7:0\]} \
{/test_top/Conv_top/read_weight_finish} \
{/test_top/Conv_top/rst_n} \
{/test_top/Conv_top/sram_raddr_weight\[10:0\]} \
{/test_top/Conv_top/state\[5:0\]} \
{/test_top/Conv_top/x_cnt\[4:0\]} \
{/test_top/Conv_top/x_cnt_pp\[4:0\]} \
{/test_top/Conv_top/y_cnt\[4:0\]} \
{/test_top/Conv_top/y_cnt_pp\[4:0\]} \
{/test_top/Conv_top/top_CNN/W\[0:15\]} \
{/test_top/Conv_top/top_CNN/W\[0\]\[0:2\]} \
{/test_top/Conv_top/top_CNN/W\[1\]\[0:2\]} \
{/test_top/Conv_top/top_CNN/W\[2\]\[0:2\]} \
{/test_top/Conv_top/top_CNN/W\[3\]\[0:2\]} \
{/test_top/Conv_top/top_CNN/W\[4\]\[0:2\]} \
{/test_top/Conv_top/top_CNN/W\[5\]\[0:2\]} \
{/test_top/Conv_top/top_CNN/W\[6\]\[0:2\]} \
{/test_top/Conv_top/top_CNN/W\[7\]\[0:2\]} \
{/test_top/Conv_top/top_CNN/W\[8\]\[0:2\]} \
{/test_top/Conv_top/top_CNN/W\[9\]\[0:2\]} \
{/test_top/Conv_top/top_CNN/W\[10\]\[0:2\]} \
{/test_top/Conv_top/top_CNN/W\[11\]\[0:2\]} \
{/test_top/Conv_top/top_CNN/W\[12\]\[0:2\]} \
{/test_top/Conv_top/top_CNN/W\[13\]\[0:2\]} \
{/test_top/Conv_top/top_CNN/W\[14\]\[0:2\]} \
{/test_top/Conv_top/top_CNN/W\[15\]\[0:2\]} \
{/test_top/Conv_top/top_CNN/temp_conv_out\[0:15\]} \
{/test_top/Conv_top/top_CNN/Y\[0:63\]} \
{/test_top/Conv_top/top_CNN/bias\[0:3\]} \
{/test_top/Conv_top/addr/sram_raddr_bias\[6:0\]} \
{/test_top/Conv_top/read_cnt\[10:0\]} \
{/test_top/Conv_top/top_CNN/sram_rdata_bias\[3:0\]} \
{/test_top/Conv_top/top_CNN/Y\[0:63\]} \
}
wvAddSignal -win $_nWave1 -group {"G2" \
}
wvSelectSignal -win $_nWave1 {( "G1" 50 )} 
wvSetPosition -win $_nWave1 {("G1" 50)}
wvGetSignalClose -win $_nWave1
wvScrollDown -win $_nWave1 0
wvScrollDown -win $_nWave1 0
wvSetCursor -win $_nWave1 81623.400717 -snap {("G1" 50)}
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
wvSetCursor -win $_nWave1 81080.415421 -snap {("G1" 44)}
wvSetCursor -win $_nWave1 81589.464136 -snap {("G1" 44)}
wvSetCursor -win $_nWave1 80985.392994 -snap {("G1" 44)}
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
wvScrollDown -win $_nWave1 0
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
wvScrollDown -win $_nWave1 1
wvScrollDown -win $_nWave1 1
wvSelectSignal -win $_nWave1 {( "G1" 27 )} 
wvSelectSignal -win $_nWave1 {( "G1" 27 )} 
wvSelectSignal -win $_nWave1 {( "G1" 27 )} 
wvSelectSignal -win $_nWave1 {( "G1" 27 )} 
wvSetPosition -win $_nWave1 {("G1" 27)}
wvCollapseBus -win $_nWave1 {("G1" 27)}
wvSetPosition -win $_nWave1 {("G1" 27)}
wvSetPosition -win $_nWave1 {("G1" 34)}
wvScrollDown -win $_nWave1 0
wvSelectSignal -win $_nWave1 {( "G1" 34 )} 
wvExpandBus -win $_nWave1 {("G1" 34)}
wvScrollUp -win $_nWave1 14
wvDisplayGridCount -win $_nWave1 -off
wvGetSignalClose -win $_nWave1
wvReloadFile -win $_nWave1
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
wvSetCursor -win $_nWave1 82224.159375 -snap {("G1" 91)}
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
wvScrollUp -win $_nWave1 1
wvScrollUp -win $_nWave1 1
wvScrollUp -win $_nWave1 1
wvScrollUp -win $_nWave1 1
wvScrollUp -win $_nWave1 1
wvScrollUp -win $_nWave1 1
wvScrollUp -win $_nWave1 1
wvScrollUp -win $_nWave1 1
wvScrollUp -win $_nWave1 1
wvGetSignalOpen -win $_nWave1
wvSetCursor -win $_nWave1 81124.614150 -snap {("G1" 28)}
wvSetCursor -win $_nWave1 81036.379040 -snap {("G1" 28)}
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
wvScrollDown -win $_nWave1 0
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
wvZoomOut -win $_nWave1
wvZoomOut -win $_nWave1
wvZoomIn -win $_nWave1
wvZoomIn -win $_nWave1
wvDisplayGridCount -win $_nWave1 -off
wvGetSignalClose -win $_nWave1
wvReloadFile -win $_nWave1
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
wvScrollDown -win $_nWave1 0
wvScrollDown -win $_nWave1 0
wvScrollDown -win $_nWave1 0
wvScrollDown -win $_nWave1 0
wvScrollDown -win $_nWave1 0
wvZoomOut -win $_nWave1
wvZoomOut -win $_nWave1
wvZoomOut -win $_nWave1
wvZoomIn -win $_nWave1
wvZoomIn -win $_nWave1
wvZoomIn -win $_nWave1
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
wvScrollDown -win $_nWave1 0
wvScrollDown -win $_nWave1 0
wvScrollDown -win $_nWave1 0
wvZoomOut -win $_nWave1
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
wvSelectSignal -win $_nWave1 {( "G1" 34 )} 
wvSetPosition -win $_nWave1 {("G1" 34)}
wvCollapseBus -win $_nWave1 {("G1" 34)}
wvSetPosition -win $_nWave1 {("G1" 34)}
wvScrollUp -win $_nWave1 1
wvScrollUp -win $_nWave1 1
wvScrollUp -win $_nWave1 1
wvScrollUp -win $_nWave1 1
wvScrollUp -win $_nWave1 1
wvScrollUp -win $_nWave1 1
wvScrollUp -win $_nWave1 1
wvScrollUp -win $_nWave1 1
wvScrollDown -win $_nWave1 0
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
wvSelectSignal -win $_nWave1 {( "G1" 22 )} 
wvZoomIn -win $_nWave1
wvZoomIn -win $_nWave1
wvSetCursor -win $_nWave1 86137.864577 -snap {("G1" 27)}
wvSetCursor -win $_nWave1 85038.720082 -snap {("G1" 27)}
wvScrollUp -win $_nWave1 1
wvScrollUp -win $_nWave1 1
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
wvScrollDown -win $_nWave1 1
wvScrollDown -win $_nWave1 1
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
wvScrollDown -win $_nWave1 0
wvScrollDown -win $_nWave1 0
wvScrollDown -win $_nWave1 0
wvScrollDown -win $_nWave1 0
wvScrollDown -win $_nWave1 0
wvScrollDown -win $_nWave1 0
wvScrollDown -win $_nWave1 0
wvSelectSignal -win $_nWave1 {( "G1" 3 22 )} 
wvSelectSignal -win $_nWave1 {( "G1" 3 4 22 )} 
wvSelectSignal -win $_nWave1 {( "G1" 3 4 5 22 )} 
wvSelectSignal -win $_nWave1 {( "G1" 3 4 5 6 22 )} 
wvSelectSignal -win $_nWave1 {( "G1" 3 4 5 6 7 22 )} 
wvSelectSignal -win $_nWave1 {( "G1" 3 4 5 6 7 8 22 )} 
wvSelectSignal -win $_nWave1 {( "G1" 3 4 5 6 7 8 9 22 )} 
wvSelectSignal -win $_nWave1 {( "G1" 3 4 5 6 7 8 9 10 22 )} 
wvSelectSignal -win $_nWave1 {( "G1" 3 4 5 6 7 8 9 10 11 22 )} 
wvSelectSignal -win $_nWave1 {( "G1" 3 4 5 6 7 8 9 10 11 12 22 )} 
wvSelectSignal -win $_nWave1 {( "G1" 3 4 5 6 7 8 9 10 11 12 13 22 )} 
wvSelectSignal -win $_nWave1 {( "G1" 3 4 5 6 7 8 9 10 11 12 13 14 22 )} 
wvSelectSignal -win $_nWave1 {( "G1" 3 4 5 6 7 8 9 10 11 12 13 14 15 22 )} 
wvSelectSignal -win $_nWave1 {( "G1" 3 4 5 6 7 8 9 10 11 12 13 14 15 16 22 )} \
           
wvSelectSignal -win $_nWave1 {( "G1" 3 4 5 6 7 8 9 10 11 12 13 14 15 16 17 22 \
           )} 
wvSelectSignal -win $_nWave1 {( "G1" 3 4 5 6 7 8 9 10 11 12 13 14 15 16 17 18 \
           22 )} 
wvCut -win $_nWave1
wvSetPosition -win $_nWave1 {("G1" 17)}
wvGetSignalOpen -win $_nWave1
wvGetSignalSetScope -win $_nWave1 "/test_top/Conv_top"
wvSetPosition -win $_nWave1 {("G1" 18)}
wvSetPosition -win $_nWave1 {("G1" 18)}
wvAddSignal -win $_nWave1 -clear
wvAddSignal -win $_nWave1 -group {"G1" \
{/test_top/Conv_top/clk} \
{/test_top/Conv_top/cnn_state\[4:0\]} \
{/test_top/Conv_top/read_weight_finish} \
{/test_top/Conv_top/rst_n} \
{/test_top/Conv_top/sram_raddr_weight\[10:0\]} \
{/test_top/Conv_top/x_cnt\[4:0\]} \
{/test_top/Conv_top/x_cnt_pp\[4:0\]} \
{/test_top/Conv_top/y_cnt\[4:0\]} \
{/test_top/Conv_top/y_cnt_pp\[4:0\]} \
{/test_top/Conv_top/top_CNN/W\[0:15\]} \
{/test_top/Conv_top/top_CNN/temp_conv_out\[0:15\]} \
{/test_top/Conv_top/top_CNN/Y\[0:63\]} \
{/test_top/Conv_top/top_CNN/bias\[0:3\]} \
{/test_top/Conv_top/addr/sram_raddr_bias\[6:0\]} \
{/test_top/Conv_top/read_cnt\[10:0\]} \
{/test_top/Conv_top/top_CNN/sram_rdata_bias\[3:0\]} \
{/test_top/Conv_top/top_CNN/Y\[0:63\]} \
{/test_top/Conv_top/state\[5:0\]} \
}
wvAddSignal -win $_nWave1 -group {"G2" \
}
wvSelectSignal -win $_nWave1 {( "G1" 18 )} 
wvSetPosition -win $_nWave1 {("G1" 18)}
wvSetPosition -win $_nWave1 {("G1" 18)}
wvSetPosition -win $_nWave1 {("G1" 18)}
wvAddSignal -win $_nWave1 -clear
wvAddSignal -win $_nWave1 -group {"G1" \
{/test_top/Conv_top/clk} \
{/test_top/Conv_top/cnn_state\[4:0\]} \
{/test_top/Conv_top/read_weight_finish} \
{/test_top/Conv_top/rst_n} \
{/test_top/Conv_top/sram_raddr_weight\[10:0\]} \
{/test_top/Conv_top/x_cnt\[4:0\]} \
{/test_top/Conv_top/x_cnt_pp\[4:0\]} \
{/test_top/Conv_top/y_cnt\[4:0\]} \
{/test_top/Conv_top/y_cnt_pp\[4:0\]} \
{/test_top/Conv_top/top_CNN/W\[0:15\]} \
{/test_top/Conv_top/top_CNN/temp_conv_out\[0:15\]} \
{/test_top/Conv_top/top_CNN/Y\[0:63\]} \
{/test_top/Conv_top/top_CNN/bias\[0:3\]} \
{/test_top/Conv_top/addr/sram_raddr_bias\[6:0\]} \
{/test_top/Conv_top/read_cnt\[10:0\]} \
{/test_top/Conv_top/top_CNN/sram_rdata_bias\[3:0\]} \
{/test_top/Conv_top/top_CNN/Y\[0:63\]} \
{/test_top/Conv_top/state\[5:0\]} \
}
wvAddSignal -win $_nWave1 -group {"G2" \
}
wvSelectSignal -win $_nWave1 {( "G1" 18 )} 
wvSetPosition -win $_nWave1 {("G1" 18)}
wvGetSignalClose -win $_nWave1
wvSetCursor -win $_nWave1 80468.273774 -snap {("G2" 0)}
wvSetCursor -win $_nWave1 80508.882160 -snap {("G1" 18)}
wvSetCursor -win $_nWave1 84350.493061 -snap {("G1" 18)}
wvDisplayGridCount -win $_nWave1 -off
wvGetSignalClose -win $_nWave1
wvReloadFile -win $_nWave1
wvGetSignalOpen -win $_nWave1
wvSetPosition -win $_nWave1 {("G1" 19)}
wvSetPosition -win $_nWave1 {("G1" 19)}
wvAddSignal -win $_nWave1 -clear
wvAddSignal -win $_nWave1 -group {"G1" \
{/test_top/Conv_top/clk} \
{/test_top/Conv_top/cnn_state\[4:0\]} \
{/test_top/Conv_top/read_weight_finish} \
{/test_top/Conv_top/rst_n} \
{/test_top/Conv_top/sram_raddr_weight\[10:0\]} \
{/test_top/Conv_top/x_cnt\[4:0\]} \
{/test_top/Conv_top/x_cnt_pp\[4:0\]} \
{/test_top/Conv_top/y_cnt\[4:0\]} \
{/test_top/Conv_top/y_cnt_pp\[4:0\]} \
{/test_top/Conv_top/top_CNN/W\[0:15\]} \
{/test_top/Conv_top/top_CNN/temp_conv_out\[0:15\]} \
{/test_top/Conv_top/top_CNN/Y\[0:63\]} \
{/test_top/Conv_top/top_CNN/bias\[0:3\]} \
{/test_top/Conv_top/addr/sram_raddr_bias\[6:0\]} \
{/test_top/Conv_top/read_cnt\[10:0\]} \
{/test_top/Conv_top/top_CNN/sram_rdata_bias\[3:0\]} \
{/test_top/Conv_top/top_CNN/Y\[0:63\]} \
{/test_top/Conv_top/state\[5:0\]} \
{/test_top/Conv_top/top_CNN/W\[0:15\]} \
}
wvAddSignal -win $_nWave1 -group {"G2" \
}
wvSelectSignal -win $_nWave1 {( "G1" 19 )} 
wvSetPosition -win $_nWave1 {("G1" 19)}
wvSetPosition -win $_nWave1 {("G1" 19)}
wvSetPosition -win $_nWave1 {("G1" 19)}
wvAddSignal -win $_nWave1 -clear
wvAddSignal -win $_nWave1 -group {"G1" \
{/test_top/Conv_top/clk} \
{/test_top/Conv_top/cnn_state\[4:0\]} \
{/test_top/Conv_top/read_weight_finish} \
{/test_top/Conv_top/rst_n} \
{/test_top/Conv_top/sram_raddr_weight\[10:0\]} \
{/test_top/Conv_top/x_cnt\[4:0\]} \
{/test_top/Conv_top/x_cnt_pp\[4:0\]} \
{/test_top/Conv_top/y_cnt\[4:0\]} \
{/test_top/Conv_top/y_cnt_pp\[4:0\]} \
{/test_top/Conv_top/top_CNN/W\[0:15\]} \
{/test_top/Conv_top/top_CNN/temp_conv_out\[0:15\]} \
{/test_top/Conv_top/top_CNN/Y\[0:63\]} \
{/test_top/Conv_top/top_CNN/bias\[0:3\]} \
{/test_top/Conv_top/addr/sram_raddr_bias\[6:0\]} \
{/test_top/Conv_top/read_cnt\[10:0\]} \
{/test_top/Conv_top/top_CNN/sram_rdata_bias\[3:0\]} \
{/test_top/Conv_top/top_CNN/Y\[0:63\]} \
{/test_top/Conv_top/state\[5:0\]} \
{/test_top/Conv_top/top_CNN/W\[0:15\]} \
}
wvAddSignal -win $_nWave1 -group {"G2" \
}
wvSelectSignal -win $_nWave1 {( "G1" 19 )} 
wvSetPosition -win $_nWave1 {("G1" 19)}
wvGetSignalClose -win $_nWave1
wvGetSignalOpen -win $_nWave1
wvGetSignalSetScope -win $_nWave1 "/test_top"
wvGetSignalSetScope -win $_nWave1 "/test_top/Conv_top"
wvGetSignalSetScope -win $_nWave1 "/test_top/Conv_top/top_CNN"
wvGetSignalSetScope -win $_nWave1 "/test_top/Conv_top/top_CNN"
wvGetSignalSetScope -win $_nWave1 "/test_top/Conv_top"
wvGetSignalSetScope -win $_nWave1 "/test_top/Conv_top/addr"
wvSetPosition -win $_nWave1 {("G1" 20)}
wvSetPosition -win $_nWave1 {("G1" 20)}
wvAddSignal -win $_nWave1 -clear
wvAddSignal -win $_nWave1 -group {"G1" \
{/test_top/Conv_top/clk} \
{/test_top/Conv_top/cnn_state\[4:0\]} \
{/test_top/Conv_top/read_weight_finish} \
{/test_top/Conv_top/rst_n} \
{/test_top/Conv_top/sram_raddr_weight\[10:0\]} \
{/test_top/Conv_top/x_cnt\[4:0\]} \
{/test_top/Conv_top/x_cnt_pp\[4:0\]} \
{/test_top/Conv_top/y_cnt\[4:0\]} \
{/test_top/Conv_top/y_cnt_pp\[4:0\]} \
{/test_top/Conv_top/top_CNN/W\[0:15\]} \
{/test_top/Conv_top/top_CNN/temp_conv_out\[0:15\]} \
{/test_top/Conv_top/top_CNN/Y\[0:63\]} \
{/test_top/Conv_top/top_CNN/bias\[0:3\]} \
{/test_top/Conv_top/addr/sram_raddr_bias\[6:0\]} \
{/test_top/Conv_top/read_cnt\[10:0\]} \
{/test_top/Conv_top/top_CNN/sram_rdata_bias\[3:0\]} \
{/test_top/Conv_top/top_CNN/Y\[0:63\]} \
{/test_top/Conv_top/state\[5:0\]} \
{/test_top/Conv_top/top_CNN/W\[0:15\]} \
{/test_top/Conv_top/addr/sram_raddr_weight\[10:0\]} \
}
wvAddSignal -win $_nWave1 -group {"G2" \
}
wvSelectSignal -win $_nWave1 {( "G1" 20 )} 
wvSetPosition -win $_nWave1 {("G1" 20)}
wvSetPosition -win $_nWave1 {("G1" 20)}
wvSetPosition -win $_nWave1 {("G1" 20)}
wvAddSignal -win $_nWave1 -clear
wvAddSignal -win $_nWave1 -group {"G1" \
{/test_top/Conv_top/clk} \
{/test_top/Conv_top/cnn_state\[4:0\]} \
{/test_top/Conv_top/read_weight_finish} \
{/test_top/Conv_top/rst_n} \
{/test_top/Conv_top/sram_raddr_weight\[10:0\]} \
{/test_top/Conv_top/x_cnt\[4:0\]} \
{/test_top/Conv_top/x_cnt_pp\[4:0\]} \
{/test_top/Conv_top/y_cnt\[4:0\]} \
{/test_top/Conv_top/y_cnt_pp\[4:0\]} \
{/test_top/Conv_top/top_CNN/W\[0:15\]} \
{/test_top/Conv_top/top_CNN/temp_conv_out\[0:15\]} \
{/test_top/Conv_top/top_CNN/Y\[0:63\]} \
{/test_top/Conv_top/top_CNN/bias\[0:3\]} \
{/test_top/Conv_top/addr/sram_raddr_bias\[6:0\]} \
{/test_top/Conv_top/read_cnt\[10:0\]} \
{/test_top/Conv_top/top_CNN/sram_rdata_bias\[3:0\]} \
{/test_top/Conv_top/top_CNN/Y\[0:63\]} \
{/test_top/Conv_top/state\[5:0\]} \
{/test_top/Conv_top/top_CNN/W\[0:15\]} \
{/test_top/Conv_top/addr/sram_raddr_weight\[10:0\]} \
}
wvAddSignal -win $_nWave1 -group {"G2" \
}
wvSelectSignal -win $_nWave1 {( "G1" 20 )} 
wvSetPosition -win $_nWave1 {("G1" 20)}
wvGetSignalClose -win $_nWave1
wvSetCursor -win $_nWave1 84449.252773 -snap {("G1" 20)}
wvSetCursor -win $_nWave1 84347.731808 -snap {("G1" 20)}
wvSetCursor -win $_nWave1 84327.427614 -snap {("G1" 2)}
wvSetCursor -win $_nWave1 84488.388648 -snap {("G1" 20)}
wvSetCursor -win $_nWave1 84589.909613 -snap {("G1" 20)}
wvSetCursor -win $_nWave1 84698.198643 -snap {("G1" 20)}
wvSetCursor -win $_nWave1 84820.023801 -snap {("G1" 20)}
wvSetCursor -win $_nWave1 85828.465390 -snap {("G1" 20)}
wvSetCursor -win $_nWave1 85936.754420 -snap {("G1" 20)}
wvSetCursor -win $_nWave1 85862.305712 -snap {("G1" 20)}
wvSetCursor -win $_nWave1 78763.335604 -snap {("G1" 18)}
wvSetCursor -win $_nWave1 79081.434629 -snap {("G1" 17)}
wvSetCursor -win $_nWave1 79277.708495 -snap {("G1" 17)}
wvSetCursor -win $_nWave1 79318.316881 -snap {("G1" 17)}
wvSetCursor -win $_nWave1 78864.856569 -snap {("G1" 20)}
wvSetCursor -win $_nWave1 78715.959154 -snap {("G1" 18)}
wvSetCursor -win $_nWave1 84340.666498 -snap {("G1" 14)}
wvDisplayGridCount -win $_nWave1 -off
wvGetSignalClose -win $_nWave1
wvReloadFile -win $_nWave1
wvSetCursor -win $_nWave1 84470.732232 -snap {("G1" 20)}
wvZoomIn -win $_nWave1
wvSetCursor -win $_nWave1 84352.786578 -snap {("G1" 2)}
wvZoomOut -win $_nWave1
wvSetCursor -win $_nWave1 86193.361679 -snap {("G1" 17)}
wvZoomIn -win $_nWave1
wvZoomOut -win $_nWave1
wvZoomIn -win $_nWave1
wvZoomIn -win $_nWave1
wvZoomIn -win $_nWave1
wvZoomOut -win $_nWave1
wvZoomOut -win $_nWave1
wvZoomOut -win $_nWave1
wvSetCursor -win $_nWave1 86064.768456 -snap {("G1" 2)}
wvSetCursor -win $_nWave1 86145.985228 -snap {("G1" 19)}
wvSelectSignal -win $_nWave1 {( "G1" 14 )} 
wvSetCursor -win $_nWave1 86321.954901 -snap {("G1" 16)}
wvSetCursor -win $_nWave1 86179.825550 -snap {("G1" 10)}
wvSelectSignal -win $_nWave1 {( "G1" 19 )} 
wvSetPosition -win $_nWave1 {("G1" 19)}
wvExpandBus -win $_nWave1 {("G1" 19)}
wvSetPosition -win $_nWave1 {("G1" 36)}
wvScrollDown -win $_nWave1 1
wvScrollDown -win $_nWave1 1
wvScrollDown -win $_nWave1 0
wvScrollDown -win $_nWave1 0
wvScrollDown -win $_nWave1 0
wvScrollDown -win $_nWave1 0
wvScrollDown -win $_nWave1 0
wvSetCursor -win $_nWave1 85891.528658 -snap {("G1" 36)}
wvGetSignalOpen -win $_nWave1
wvGetSignalSetScope -win $_nWave1 "/test_top/Conv_top/top_CNN"
wvSetPosition -win $_nWave1 {("G1" 37)}
wvSetPosition -win $_nWave1 {("G1" 37)}
wvAddSignal -win $_nWave1 -clear
wvAddSignal -win $_nWave1 -group {"G1" \
{/test_top/Conv_top/clk} \
{/test_top/Conv_top/cnn_state\[4:0\]} \
{/test_top/Conv_top/read_weight_finish} \
{/test_top/Conv_top/rst_n} \
{/test_top/Conv_top/sram_raddr_weight\[10:0\]} \
{/test_top/Conv_top/x_cnt\[4:0\]} \
{/test_top/Conv_top/x_cnt_pp\[4:0\]} \
{/test_top/Conv_top/y_cnt\[4:0\]} \
{/test_top/Conv_top/y_cnt_pp\[4:0\]} \
{/test_top/Conv_top/top_CNN/W\[0:15\]} \
{/test_top/Conv_top/top_CNN/temp_conv_out\[0:15\]} \
{/test_top/Conv_top/top_CNN/Y\[0:63\]} \
{/test_top/Conv_top/top_CNN/bias\[0:3\]} \
{/test_top/Conv_top/addr/sram_raddr_bias\[6:0\]} \
{/test_top/Conv_top/read_cnt\[10:0\]} \
{/test_top/Conv_top/top_CNN/sram_rdata_bias\[3:0\]} \
{/test_top/Conv_top/top_CNN/Y\[0:63\]} \
{/test_top/Conv_top/state\[5:0\]} \
{/test_top/Conv_top/top_CNN/W\[0:15\]} \
{/test_top/Conv_top/top_CNN/W\[0\]\[0:2\]} \
{/test_top/Conv_top/top_CNN/W\[1\]\[0:2\]} \
{/test_top/Conv_top/top_CNN/W\[2\]\[0:2\]} \
{/test_top/Conv_top/top_CNN/W\[3\]\[0:2\]} \
{/test_top/Conv_top/top_CNN/W\[4\]\[0:2\]} \
{/test_top/Conv_top/top_CNN/W\[5\]\[0:2\]} \
{/test_top/Conv_top/top_CNN/W\[6\]\[0:2\]} \
{/test_top/Conv_top/top_CNN/W\[7\]\[0:2\]} \
{/test_top/Conv_top/top_CNN/W\[8\]\[0:2\]} \
{/test_top/Conv_top/top_CNN/W\[9\]\[0:2\]} \
{/test_top/Conv_top/top_CNN/W\[10\]\[0:2\]} \
{/test_top/Conv_top/top_CNN/W\[11\]\[0:2\]} \
{/test_top/Conv_top/top_CNN/W\[12\]\[0:2\]} \
{/test_top/Conv_top/top_CNN/W\[13\]\[0:2\]} \
{/test_top/Conv_top/top_CNN/W\[14\]\[0:2\]} \
{/test_top/Conv_top/top_CNN/W\[15\]\[0:2\]} \
{/test_top/Conv_top/addr/sram_raddr_weight\[10:0\]} \
{/test_top/Conv_top/top_CNN/sram_rdata_weight\[35:0\]} \
}
wvAddSignal -win $_nWave1 -group {"G2" \
}
wvSelectSignal -win $_nWave1 {( "G1" 37 )} 
wvSetPosition -win $_nWave1 {("G1" 37)}
wvSetPosition -win $_nWave1 {("G1" 37)}
wvSetPosition -win $_nWave1 {("G1" 37)}
wvAddSignal -win $_nWave1 -clear
wvAddSignal -win $_nWave1 -group {"G1" \
{/test_top/Conv_top/clk} \
{/test_top/Conv_top/cnn_state\[4:0\]} \
{/test_top/Conv_top/read_weight_finish} \
{/test_top/Conv_top/rst_n} \
{/test_top/Conv_top/sram_raddr_weight\[10:0\]} \
{/test_top/Conv_top/x_cnt\[4:0\]} \
{/test_top/Conv_top/x_cnt_pp\[4:0\]} \
{/test_top/Conv_top/y_cnt\[4:0\]} \
{/test_top/Conv_top/y_cnt_pp\[4:0\]} \
{/test_top/Conv_top/top_CNN/W\[0:15\]} \
{/test_top/Conv_top/top_CNN/temp_conv_out\[0:15\]} \
{/test_top/Conv_top/top_CNN/Y\[0:63\]} \
{/test_top/Conv_top/top_CNN/bias\[0:3\]} \
{/test_top/Conv_top/addr/sram_raddr_bias\[6:0\]} \
{/test_top/Conv_top/read_cnt\[10:0\]} \
{/test_top/Conv_top/top_CNN/sram_rdata_bias\[3:0\]} \
{/test_top/Conv_top/top_CNN/Y\[0:63\]} \
{/test_top/Conv_top/state\[5:0\]} \
{/test_top/Conv_top/top_CNN/W\[0:15\]} \
{/test_top/Conv_top/top_CNN/W\[0\]\[0:2\]} \
{/test_top/Conv_top/top_CNN/W\[1\]\[0:2\]} \
{/test_top/Conv_top/top_CNN/W\[2\]\[0:2\]} \
{/test_top/Conv_top/top_CNN/W\[3\]\[0:2\]} \
{/test_top/Conv_top/top_CNN/W\[4\]\[0:2\]} \
{/test_top/Conv_top/top_CNN/W\[5\]\[0:2\]} \
{/test_top/Conv_top/top_CNN/W\[6\]\[0:2\]} \
{/test_top/Conv_top/top_CNN/W\[7\]\[0:2\]} \
{/test_top/Conv_top/top_CNN/W\[8\]\[0:2\]} \
{/test_top/Conv_top/top_CNN/W\[9\]\[0:2\]} \
{/test_top/Conv_top/top_CNN/W\[10\]\[0:2\]} \
{/test_top/Conv_top/top_CNN/W\[11\]\[0:2\]} \
{/test_top/Conv_top/top_CNN/W\[12\]\[0:2\]} \
{/test_top/Conv_top/top_CNN/W\[13\]\[0:2\]} \
{/test_top/Conv_top/top_CNN/W\[14\]\[0:2\]} \
{/test_top/Conv_top/top_CNN/W\[15\]\[0:2\]} \
{/test_top/Conv_top/addr/sram_raddr_weight\[10:0\]} \
{/test_top/Conv_top/top_CNN/sram_rdata_weight\[35:0\]} \
}
wvAddSignal -win $_nWave1 -group {"G2" \
}
wvSelectSignal -win $_nWave1 {( "G1" 37 )} 
wvSetPosition -win $_nWave1 {("G1" 37)}
wvGetSignalClose -win $_nWave1
wvSetCursor -win $_nWave1 85959.209301 -snap {("G1" 37)}
wvSetCursor -win $_nWave1 86047.194138 -snap {("G1" 35)}
wvSetCursor -win $_nWave1 86053.962202 -snap {("G1" 35)}
wvResizeWindow -win $_nWave1 0 23 1217 697
wvGetSignalOpen -win $_nWave1
wvGetSignalSetScope -win $_nWave1 "/test_top"
wvGetSignalSetScope -win $_nWave1 "/test_top/Conv_top"
wvGetSignalSetScope -win $_nWave1 "/test_top/Conv_top/top_CNN"
wvSetPosition -win $_nWave1 {("G1" 38)}
wvSetPosition -win $_nWave1 {("G1" 38)}
wvAddSignal -win $_nWave1 -clear
wvAddSignal -win $_nWave1 -group {"G1" \
{/test_top/Conv_top/clk} \
{/test_top/Conv_top/cnn_state\[4:0\]} \
{/test_top/Conv_top/read_weight_finish} \
{/test_top/Conv_top/rst_n} \
{/test_top/Conv_top/sram_raddr_weight\[10:0\]} \
{/test_top/Conv_top/x_cnt\[4:0\]} \
{/test_top/Conv_top/x_cnt_pp\[4:0\]} \
{/test_top/Conv_top/y_cnt\[4:0\]} \
{/test_top/Conv_top/y_cnt_pp\[4:0\]} \
{/test_top/Conv_top/top_CNN/W\[0:15\]} \
{/test_top/Conv_top/top_CNN/temp_conv_out\[0:15\]} \
{/test_top/Conv_top/top_CNN/Y\[0:63\]} \
{/test_top/Conv_top/top_CNN/bias\[0:3\]} \
{/test_top/Conv_top/addr/sram_raddr_bias\[6:0\]} \
{/test_top/Conv_top/read_cnt\[10:0\]} \
{/test_top/Conv_top/top_CNN/sram_rdata_bias\[3:0\]} \
{/test_top/Conv_top/top_CNN/Y\[0:63\]} \
{/test_top/Conv_top/state\[5:0\]} \
{/test_top/Conv_top/top_CNN/W\[0:15\]} \
{/test_top/Conv_top/top_CNN/W\[0\]\[0:2\]} \
{/test_top/Conv_top/top_CNN/W\[1\]\[0:2\]} \
{/test_top/Conv_top/top_CNN/W\[2\]\[0:2\]} \
{/test_top/Conv_top/top_CNN/W\[3\]\[0:2\]} \
{/test_top/Conv_top/top_CNN/W\[4\]\[0:2\]} \
{/test_top/Conv_top/top_CNN/W\[5\]\[0:2\]} \
{/test_top/Conv_top/top_CNN/W\[6\]\[0:2\]} \
{/test_top/Conv_top/top_CNN/W\[7\]\[0:2\]} \
{/test_top/Conv_top/top_CNN/W\[8\]\[0:2\]} \
{/test_top/Conv_top/top_CNN/W\[9\]\[0:2\]} \
{/test_top/Conv_top/top_CNN/W\[10\]\[0:2\]} \
{/test_top/Conv_top/top_CNN/W\[11\]\[0:2\]} \
{/test_top/Conv_top/top_CNN/W\[12\]\[0:2\]} \
{/test_top/Conv_top/top_CNN/W\[13\]\[0:2\]} \
{/test_top/Conv_top/top_CNN/W\[14\]\[0:2\]} \
{/test_top/Conv_top/top_CNN/W\[15\]\[0:2\]} \
{/test_top/Conv_top/addr/sram_raddr_weight\[10:0\]} \
{/test_top/Conv_top/top_CNN/sram_rdata_weight\[35:0\]} \
{/test_top/Conv_top/top_CNN/read_weight_finish} \
}
wvAddSignal -win $_nWave1 -group {"G2" \
}
wvSelectSignal -win $_nWave1 {( "G1" 38 )} 
wvSetPosition -win $_nWave1 {("G1" 38)}
wvSetPosition -win $_nWave1 {("G1" 38)}
wvSetPosition -win $_nWave1 {("G1" 38)}
wvAddSignal -win $_nWave1 -clear
wvAddSignal -win $_nWave1 -group {"G1" \
{/test_top/Conv_top/clk} \
{/test_top/Conv_top/cnn_state\[4:0\]} \
{/test_top/Conv_top/read_weight_finish} \
{/test_top/Conv_top/rst_n} \
{/test_top/Conv_top/sram_raddr_weight\[10:0\]} \
{/test_top/Conv_top/x_cnt\[4:0\]} \
{/test_top/Conv_top/x_cnt_pp\[4:0\]} \
{/test_top/Conv_top/y_cnt\[4:0\]} \
{/test_top/Conv_top/y_cnt_pp\[4:0\]} \
{/test_top/Conv_top/top_CNN/W\[0:15\]} \
{/test_top/Conv_top/top_CNN/temp_conv_out\[0:15\]} \
{/test_top/Conv_top/top_CNN/Y\[0:63\]} \
{/test_top/Conv_top/top_CNN/bias\[0:3\]} \
{/test_top/Conv_top/addr/sram_raddr_bias\[6:0\]} \
{/test_top/Conv_top/read_cnt\[10:0\]} \
{/test_top/Conv_top/top_CNN/sram_rdata_bias\[3:0\]} \
{/test_top/Conv_top/top_CNN/Y\[0:63\]} \
{/test_top/Conv_top/state\[5:0\]} \
{/test_top/Conv_top/top_CNN/W\[0:15\]} \
{/test_top/Conv_top/top_CNN/W\[0\]\[0:2\]} \
{/test_top/Conv_top/top_CNN/W\[1\]\[0:2\]} \
{/test_top/Conv_top/top_CNN/W\[2\]\[0:2\]} \
{/test_top/Conv_top/top_CNN/W\[3\]\[0:2\]} \
{/test_top/Conv_top/top_CNN/W\[4\]\[0:2\]} \
{/test_top/Conv_top/top_CNN/W\[5\]\[0:2\]} \
{/test_top/Conv_top/top_CNN/W\[6\]\[0:2\]} \
{/test_top/Conv_top/top_CNN/W\[7\]\[0:2\]} \
{/test_top/Conv_top/top_CNN/W\[8\]\[0:2\]} \
{/test_top/Conv_top/top_CNN/W\[9\]\[0:2\]} \
{/test_top/Conv_top/top_CNN/W\[10\]\[0:2\]} \
{/test_top/Conv_top/top_CNN/W\[11\]\[0:2\]} \
{/test_top/Conv_top/top_CNN/W\[12\]\[0:2\]} \
{/test_top/Conv_top/top_CNN/W\[13\]\[0:2\]} \
{/test_top/Conv_top/top_CNN/W\[14\]\[0:2\]} \
{/test_top/Conv_top/top_CNN/W\[15\]\[0:2\]} \
{/test_top/Conv_top/addr/sram_raddr_weight\[10:0\]} \
{/test_top/Conv_top/top_CNN/sram_rdata_weight\[35:0\]} \
{/test_top/Conv_top/top_CNN/read_weight_finish} \
}
wvAddSignal -win $_nWave1 -group {"G2" \
}
wvSelectSignal -win $_nWave1 {( "G1" 38 )} 
wvSetPosition -win $_nWave1 {("G1" 38)}
wvGetSignalClose -win $_nWave1
wvSetCursor -win $_nWave1 85954.117383 -snap {("G1" 38)}
wvSetCursor -win $_nWave1 86139.075290 -snap {("G1" 38)}
wvSetCursor -win $_nWave1 85967.817969 -snap {("G1" 38)}
wvScrollUp -win $_nWave1 1
wvScrollUp -win $_nWave1 1
wvScrollDown -win $_nWave1 1
wvScrollDown -win $_nWave1 1
wvScrollDown -win $_nWave1 0
wvSetCursor -win $_nWave1 86070.572362 -snap {("G1" 35)}
wvGetSignalOpen -win $_nWave1
wvGetSignalSetScope -win $_nWave1 "/test_top"
wvGetSignalSetScope -win $_nWave1 "/test_top/Conv_top"
wvGetSignalSetScope -win $_nWave1 "/test_top/Conv_top/top_CNN"
wvGetSignalSetScope -win $_nWave1 "/test_top/Conv_top/top_CNN"
wvSetPosition -win $_nWave1 {("G1" 39)}
wvSetPosition -win $_nWave1 {("G1" 39)}
wvAddSignal -win $_nWave1 -clear
wvAddSignal -win $_nWave1 -group {"G1" \
{/test_top/Conv_top/clk} \
{/test_top/Conv_top/cnn_state\[4:0\]} \
{/test_top/Conv_top/read_weight_finish} \
{/test_top/Conv_top/rst_n} \
{/test_top/Conv_top/sram_raddr_weight\[10:0\]} \
{/test_top/Conv_top/x_cnt\[4:0\]} \
{/test_top/Conv_top/x_cnt_pp\[4:0\]} \
{/test_top/Conv_top/y_cnt\[4:0\]} \
{/test_top/Conv_top/y_cnt_pp\[4:0\]} \
{/test_top/Conv_top/top_CNN/W\[0:15\]} \
{/test_top/Conv_top/top_CNN/temp_conv_out\[0:15\]} \
{/test_top/Conv_top/top_CNN/Y\[0:63\]} \
{/test_top/Conv_top/top_CNN/bias\[0:3\]} \
{/test_top/Conv_top/addr/sram_raddr_bias\[6:0\]} \
{/test_top/Conv_top/read_cnt\[10:0\]} \
{/test_top/Conv_top/top_CNN/sram_rdata_bias\[3:0\]} \
{/test_top/Conv_top/top_CNN/Y\[0:63\]} \
{/test_top/Conv_top/state\[5:0\]} \
{/test_top/Conv_top/top_CNN/W\[0:15\]} \
{/test_top/Conv_top/top_CNN/W\[0\]\[0:2\]} \
{/test_top/Conv_top/top_CNN/W\[1\]\[0:2\]} \
{/test_top/Conv_top/top_CNN/W\[2\]\[0:2\]} \
{/test_top/Conv_top/top_CNN/W\[3\]\[0:2\]} \
{/test_top/Conv_top/top_CNN/W\[4\]\[0:2\]} \
{/test_top/Conv_top/top_CNN/W\[5\]\[0:2\]} \
{/test_top/Conv_top/top_CNN/W\[6\]\[0:2\]} \
{/test_top/Conv_top/top_CNN/W\[7\]\[0:2\]} \
{/test_top/Conv_top/top_CNN/W\[8\]\[0:2\]} \
{/test_top/Conv_top/top_CNN/W\[9\]\[0:2\]} \
{/test_top/Conv_top/top_CNN/W\[10\]\[0:2\]} \
{/test_top/Conv_top/top_CNN/W\[11\]\[0:2\]} \
{/test_top/Conv_top/top_CNN/W\[12\]\[0:2\]} \
{/test_top/Conv_top/top_CNN/W\[13\]\[0:2\]} \
{/test_top/Conv_top/top_CNN/W\[14\]\[0:2\]} \
{/test_top/Conv_top/top_CNN/W\[15\]\[0:2\]} \
{/test_top/Conv_top/addr/sram_raddr_weight\[10:0\]} \
{/test_top/Conv_top/top_CNN/sram_rdata_weight\[35:0\]} \
{/test_top/Conv_top/top_CNN/read_weight_finish} \
{/test_top/Conv_top/top_CNN/load_weight_finish} \
}
wvAddSignal -win $_nWave1 -group {"G2" \
}
wvSelectSignal -win $_nWave1 {( "G1" 39 )} 
wvSetPosition -win $_nWave1 {("G1" 39)}
wvSetPosition -win $_nWave1 {("G1" 39)}
wvSetPosition -win $_nWave1 {("G1" 39)}
wvAddSignal -win $_nWave1 -clear
wvAddSignal -win $_nWave1 -group {"G1" \
{/test_top/Conv_top/clk} \
{/test_top/Conv_top/cnn_state\[4:0\]} \
{/test_top/Conv_top/read_weight_finish} \
{/test_top/Conv_top/rst_n} \
{/test_top/Conv_top/sram_raddr_weight\[10:0\]} \
{/test_top/Conv_top/x_cnt\[4:0\]} \
{/test_top/Conv_top/x_cnt_pp\[4:0\]} \
{/test_top/Conv_top/y_cnt\[4:0\]} \
{/test_top/Conv_top/y_cnt_pp\[4:0\]} \
{/test_top/Conv_top/top_CNN/W\[0:15\]} \
{/test_top/Conv_top/top_CNN/temp_conv_out\[0:15\]} \
{/test_top/Conv_top/top_CNN/Y\[0:63\]} \
{/test_top/Conv_top/top_CNN/bias\[0:3\]} \
{/test_top/Conv_top/addr/sram_raddr_bias\[6:0\]} \
{/test_top/Conv_top/read_cnt\[10:0\]} \
{/test_top/Conv_top/top_CNN/sram_rdata_bias\[3:0\]} \
{/test_top/Conv_top/top_CNN/Y\[0:63\]} \
{/test_top/Conv_top/state\[5:0\]} \
{/test_top/Conv_top/top_CNN/W\[0:15\]} \
{/test_top/Conv_top/top_CNN/W\[0\]\[0:2\]} \
{/test_top/Conv_top/top_CNN/W\[1\]\[0:2\]} \
{/test_top/Conv_top/top_CNN/W\[2\]\[0:2\]} \
{/test_top/Conv_top/top_CNN/W\[3\]\[0:2\]} \
{/test_top/Conv_top/top_CNN/W\[4\]\[0:2\]} \
{/test_top/Conv_top/top_CNN/W\[5\]\[0:2\]} \
{/test_top/Conv_top/top_CNN/W\[6\]\[0:2\]} \
{/test_top/Conv_top/top_CNN/W\[7\]\[0:2\]} \
{/test_top/Conv_top/top_CNN/W\[8\]\[0:2\]} \
{/test_top/Conv_top/top_CNN/W\[9\]\[0:2\]} \
{/test_top/Conv_top/top_CNN/W\[10\]\[0:2\]} \
{/test_top/Conv_top/top_CNN/W\[11\]\[0:2\]} \
{/test_top/Conv_top/top_CNN/W\[12\]\[0:2\]} \
{/test_top/Conv_top/top_CNN/W\[13\]\[0:2\]} \
{/test_top/Conv_top/top_CNN/W\[14\]\[0:2\]} \
{/test_top/Conv_top/top_CNN/W\[15\]\[0:2\]} \
{/test_top/Conv_top/addr/sram_raddr_weight\[10:0\]} \
{/test_top/Conv_top/top_CNN/sram_rdata_weight\[35:0\]} \
{/test_top/Conv_top/top_CNN/read_weight_finish} \
{/test_top/Conv_top/top_CNN/load_weight_finish} \
}
wvAddSignal -win $_nWave1 -group {"G2" \
}
wvSelectSignal -win $_nWave1 {( "G1" 39 )} 
wvSetPosition -win $_nWave1 {("G1" 39)}
wvGetSignalClose -win $_nWave1
wvScrollDown -win $_nWave1 0
wvScrollDown -win $_nWave1 0
wvSetCursor -win $_nWave1 80475.802675 -snap {("G1" 39)}
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
wvZoomOut -win $_nWave1
wvZoomOut -win $_nWave1
wvZoomOut -win $_nWave1
wvZoomIn -win $_nWave1
wvZoomIn -win $_nWave1
wvZoomIn -win $_nWave1
wvZoomIn -win $_nWave1
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
wvDisplayGridCount -win $_nWave1 -off
wvGetSignalClose -win $_nWave1
wvReloadFile -win $_nWave1
wvSetCursor -win $_nWave1 86050.667139 -snap {("G1" 35)}
wvSetCursor -win $_nWave1 99011.024604 -snap {("G2" 0)}
wvResizeWindow -win $_nWave1 0 23 1217 697
wvSelectSignal -win $_nWave1 {( "G1" 19 )} 
wvSelectSignal -win $_nWave1 {( "G1" 19 )} 
wvSelectSignal -win $_nWave1 {( "G1" 19 )} 
wvSelectSignal -win $_nWave1 {( "G1" 19 )} 
wvSetPosition -win $_nWave1 {("G1" 19)}
wvCollapseBus -win $_nWave1 {("G1" 19)}
wvSetPosition -win $_nWave1 {("G1" 19)}
wvSetPosition -win $_nWave1 {("G1" 23)}
wvGetSignalOpen -win $_nWave1
wvGetSignalSetScope -win $_nWave1 "/test_top/Conv_top/top_CNN"
wvSelectSignal -win $_nWave1 {( "G1" 13 )} 
wvSetCursor -win $_nWave1 67587.693403 -snap {("G1" 13)}
wvZoomOut -win $_nWave1
wvZoomOut -win $_nWave1
wvZoomOut -win $_nWave1
wvZoomOut -win $_nWave1
wvZoomOut -win $_nWave1
wvSetCursor -win $_nWave1 84270.921084 -snap {("G1" 13)}
wvZoomIn -win $_nWave1
wvZoomIn -win $_nWave1
wvResizeWindow -win $_nWave1 0 23 1217 697
wvZoomIn -win $_nWave1
wvZoomOut -win $_nWave1
wvZoomOut -win $_nWave1
wvZoomIn -win $_nWave1
wvSetCursor -win $_nWave1 101460.530587 -snap {("G1" 13)}
wvZoomIn -win $_nWave1
wvZoomIn -win $_nWave1
wvSetCursor -win $_nWave1 84361.434437 -snap {("G1" 6)}
wvSetCursor -win $_nWave1 84528.873025 -snap {("G1" 7)}
wvSetCursor -win $_nWave1 88532.741119 -snap {("G1" 6)}
wvDisplayGridCount -win $_nWave1 -off
wvGetSignalClose -win $_nWave1
wvReloadFile -win $_nWave1
wvGetSignalOpen -win $_nWave1
wvSetPosition -win $_nWave1 {("G1" 24)}
wvSetPosition -win $_nWave1 {("G1" 24)}
wvAddSignal -win $_nWave1 -clear
wvAddSignal -win $_nWave1 -group {"G1" \
{/test_top/Conv_top/clk} \
{/test_top/Conv_top/cnn_state\[4:0\]} \
{/test_top/Conv_top/read_weight_finish} \
{/test_top/Conv_top/rst_n} \
{/test_top/Conv_top/sram_raddr_weight\[10:0\]} \
{/test_top/Conv_top/x_cnt\[4:0\]} \
{/test_top/Conv_top/x_cnt_pp\[4:0\]} \
{/test_top/Conv_top/y_cnt\[4:0\]} \
{/test_top/Conv_top/y_cnt_pp\[4:0\]} \
{/test_top/Conv_top/top_CNN/W\[0:15\]} \
{/test_top/Conv_top/top_CNN/temp_conv_out\[0:15\]} \
{/test_top/Conv_top/top_CNN/Y\[0:63\]} \
{/test_top/Conv_top/top_CNN/bias\[0:3\]} \
{/test_top/Conv_top/addr/sram_raddr_bias\[6:0\]} \
{/test_top/Conv_top/read_cnt\[10:0\]} \
{/test_top/Conv_top/top_CNN/sram_rdata_bias\[3:0\]} \
{/test_top/Conv_top/top_CNN/Y\[0:63\]} \
{/test_top/Conv_top/state\[5:0\]} \
{/test_top/Conv_top/top_CNN/W\[0:15\]} \
{/test_top/Conv_top/addr/sram_raddr_weight\[10:0\]} \
{/test_top/Conv_top/top_CNN/sram_rdata_weight\[35:0\]} \
{/test_top/Conv_top/top_CNN/read_weight_finish} \
{/test_top/Conv_top/top_CNN/load_weight_finish} \
{/test_top/Conv_top/addr/sram_waddr_a\[5:0\]} \
}
wvAddSignal -win $_nWave1 -group {"G2" \
}
wvSelectSignal -win $_nWave1 {( "G1" 24 )} 
wvSetPosition -win $_nWave1 {("G1" 24)}
wvSetPosition -win $_nWave1 {("G1" 24)}
wvSetPosition -win $_nWave1 {("G1" 24)}
wvAddSignal -win $_nWave1 -clear
wvAddSignal -win $_nWave1 -group {"G1" \
{/test_top/Conv_top/clk} \
{/test_top/Conv_top/cnn_state\[4:0\]} \
{/test_top/Conv_top/read_weight_finish} \
{/test_top/Conv_top/rst_n} \
{/test_top/Conv_top/sram_raddr_weight\[10:0\]} \
{/test_top/Conv_top/x_cnt\[4:0\]} \
{/test_top/Conv_top/x_cnt_pp\[4:0\]} \
{/test_top/Conv_top/y_cnt\[4:0\]} \
{/test_top/Conv_top/y_cnt_pp\[4:0\]} \
{/test_top/Conv_top/top_CNN/W\[0:15\]} \
{/test_top/Conv_top/top_CNN/temp_conv_out\[0:15\]} \
{/test_top/Conv_top/top_CNN/Y\[0:63\]} \
{/test_top/Conv_top/top_CNN/bias\[0:3\]} \
{/test_top/Conv_top/addr/sram_raddr_bias\[6:0\]} \
{/test_top/Conv_top/read_cnt\[10:0\]} \
{/test_top/Conv_top/top_CNN/sram_rdata_bias\[3:0\]} \
{/test_top/Conv_top/top_CNN/Y\[0:63\]} \
{/test_top/Conv_top/state\[5:0\]} \
{/test_top/Conv_top/top_CNN/W\[0:15\]} \
{/test_top/Conv_top/addr/sram_raddr_weight\[10:0\]} \
{/test_top/Conv_top/top_CNN/sram_rdata_weight\[35:0\]} \
{/test_top/Conv_top/top_CNN/read_weight_finish} \
{/test_top/Conv_top/top_CNN/load_weight_finish} \
{/test_top/Conv_top/addr/sram_waddr_a\[5:0\]} \
}
wvAddSignal -win $_nWave1 -group {"G2" \
}
wvSelectSignal -win $_nWave1 {( "G1" 24 )} 
wvSetPosition -win $_nWave1 {("G1" 24)}
wvGetSignalClose -win $_nWave1
wvZoomOut -win $_nWave1
wvZoomOut -win $_nWave1
wvZoomOut -win $_nWave1
wvZoomOut -win $_nWave1
wvZoomOut -win $_nWave1
wvZoomOut -win $_nWave1
wvZoomOut -win $_nWave1
wvZoomOut -win $_nWave1
wvZoomIn -win $_nWave1
wvZoomIn -win $_nWave1
wvZoomIn -win $_nWave1
wvZoomOut -win $_nWave1
wvZoomOut -win $_nWave1
wvZoomOut -win $_nWave1
wvZoomOut -win $_nWave1
wvZoomOut -win $_nWave1
wvZoomOut -win $_nWave1
wvSetCursor -win $_nWave1 84491.969058 -snap {("G1" 18)}
wvDisplayGridCount -win $_nWave1 -off
wvGetSignalClose -win $_nWave1
wvReloadFile -win $_nWave1
wvZoomIn -win $_nWave1
wvZoomIn -win $_nWave1
wvZoomIn -win $_nWave1
wvZoomIn -win $_nWave1
wvZoomIn -win $_nWave1
wvSetCursor -win $_nWave1 81218.948132 -snap {("G1" 10)}
wvSetCursor -win $_nWave1 85092.480614 -snap {("G1" 11)}
wvZoomOut -win $_nWave1
wvZoomOut -win $_nWave1
wvZoomOut -win $_nWave1
wvZoomOut -win $_nWave1
wvZoomOut -win $_nWave1
wvZoomOut -win $_nWave1
wvZoomOut -win $_nWave1
wvZoomOut -win $_nWave1
wvZoomIn -win $_nWave1
wvZoomOut -win $_nWave1
wvSetCursor -win $_nWave1 79245.661041 -snap {("G1" 18)}
wvZoomIn -win $_nWave1
wvZoomIn -win $_nWave1
wvZoomIn -win $_nWave1
wvZoomIn -win $_nWave1
wvZoomIn -win $_nWave1
wvZoomIn -win $_nWave1
wvZoomIn -win $_nWave1
wvZoomOut -win $_nWave1
wvSetCursor -win $_nWave1 79262.172538 -snap {("G1" 11)}
wvSetCursor -win $_nWave1 79076.678076 -snap {("G1" 12)}
wvSetCursor -win $_nWave1 79251.131201 -snap {("G1" 12)}
wvSetCursor -win $_nWave1 79251.131201 -snap {("G1" 12)}
wvSetCursor -win $_nWave1 79357.128036 -snap {("G1" 12)}
wvZoomOut -win $_nWave1
wvGetSignalOpen -win $_nWave1
wvSetPosition -win $_nWave1 {("G1" 25)}
wvSetPosition -win $_nWave1 {("G1" 25)}
wvAddSignal -win $_nWave1 -clear
wvAddSignal -win $_nWave1 -group {"G1" \
{/test_top/Conv_top/clk} \
{/test_top/Conv_top/cnn_state\[4:0\]} \
{/test_top/Conv_top/read_weight_finish} \
{/test_top/Conv_top/rst_n} \
{/test_top/Conv_top/sram_raddr_weight\[10:0\]} \
{/test_top/Conv_top/x_cnt\[4:0\]} \
{/test_top/Conv_top/x_cnt_pp\[4:0\]} \
{/test_top/Conv_top/y_cnt\[4:0\]} \
{/test_top/Conv_top/y_cnt_pp\[4:0\]} \
{/test_top/Conv_top/top_CNN/W\[0:15\]} \
{/test_top/Conv_top/top_CNN/temp_conv_out\[0:15\]} \
{/test_top/Conv_top/top_CNN/Y\[0:63\]} \
{/test_top/Conv_top/top_CNN/bias\[0:3\]} \
{/test_top/Conv_top/addr/sram_raddr_bias\[6:0\]} \
{/test_top/Conv_top/read_cnt\[10:0\]} \
{/test_top/Conv_top/top_CNN/sram_rdata_bias\[3:0\]} \
{/test_top/Conv_top/top_CNN/Y\[0:63\]} \
{/test_top/Conv_top/state\[5:0\]} \
{/test_top/Conv_top/top_CNN/W\[0:15\]} \
{/test_top/Conv_top/addr/sram_raddr_weight\[10:0\]} \
{/test_top/Conv_top/top_CNN/sram_rdata_weight\[35:0\]} \
{/test_top/Conv_top/top_CNN/read_weight_finish} \
{/test_top/Conv_top/top_CNN/load_weight_finish} \
{/test_top/Conv_top/addr/sram_waddr_a\[5:0\]} \
{/test_top/Conv_top/addr/sram_waddr_b\[5:0\]} \
}
wvAddSignal -win $_nWave1 -group {"G2" \
}
wvSelectSignal -win $_nWave1 {( "G1" 25 )} 
wvSetPosition -win $_nWave1 {("G1" 25)}
wvSetPosition -win $_nWave1 {("G1" 25)}
wvSetPosition -win $_nWave1 {("G1" 25)}
wvAddSignal -win $_nWave1 -clear
wvAddSignal -win $_nWave1 -group {"G1" \
{/test_top/Conv_top/clk} \
{/test_top/Conv_top/cnn_state\[4:0\]} \
{/test_top/Conv_top/read_weight_finish} \
{/test_top/Conv_top/rst_n} \
{/test_top/Conv_top/sram_raddr_weight\[10:0\]} \
{/test_top/Conv_top/x_cnt\[4:0\]} \
{/test_top/Conv_top/x_cnt_pp\[4:0\]} \
{/test_top/Conv_top/y_cnt\[4:0\]} \
{/test_top/Conv_top/y_cnt_pp\[4:0\]} \
{/test_top/Conv_top/top_CNN/W\[0:15\]} \
{/test_top/Conv_top/top_CNN/temp_conv_out\[0:15\]} \
{/test_top/Conv_top/top_CNN/Y\[0:63\]} \
{/test_top/Conv_top/top_CNN/bias\[0:3\]} \
{/test_top/Conv_top/addr/sram_raddr_bias\[6:0\]} \
{/test_top/Conv_top/read_cnt\[10:0\]} \
{/test_top/Conv_top/top_CNN/sram_rdata_bias\[3:0\]} \
{/test_top/Conv_top/top_CNN/Y\[0:63\]} \
{/test_top/Conv_top/state\[5:0\]} \
{/test_top/Conv_top/top_CNN/W\[0:15\]} \
{/test_top/Conv_top/addr/sram_raddr_weight\[10:0\]} \
{/test_top/Conv_top/top_CNN/sram_rdata_weight\[35:0\]} \
{/test_top/Conv_top/top_CNN/read_weight_finish} \
{/test_top/Conv_top/top_CNN/load_weight_finish} \
{/test_top/Conv_top/addr/sram_waddr_a\[5:0\]} \
{/test_top/Conv_top/addr/sram_waddr_b\[5:0\]} \
}
wvAddSignal -win $_nWave1 -group {"G2" \
}
wvSelectSignal -win $_nWave1 {( "G1" 25 )} 
wvSetPosition -win $_nWave1 {("G1" 25)}
wvGetSignalClose -win $_nWave1
wvGetSignalOpen -win $_nWave1
wvGetSignalSetScope -win $_nWave1 "/test_top"
wvGetSignalSetScope -win $_nWave1 "/test_top/Conv_top"
wvGetSignalSetScope -win $_nWave1 "/test_top/Conv_top/top_CNN"
wvGetSignalSetScope -win $_nWave1 "/test_top/Conv_top/addr"
wvSetPosition -win $_nWave1 {("G1" 29)}
wvSetPosition -win $_nWave1 {("G1" 29)}
wvAddSignal -win $_nWave1 -clear
wvAddSignal -win $_nWave1 -group {"G1" \
{/test_top/Conv_top/clk} \
{/test_top/Conv_top/cnn_state\[4:0\]} \
{/test_top/Conv_top/read_weight_finish} \
{/test_top/Conv_top/rst_n} \
{/test_top/Conv_top/sram_raddr_weight\[10:0\]} \
{/test_top/Conv_top/x_cnt\[4:0\]} \
{/test_top/Conv_top/x_cnt_pp\[4:0\]} \
{/test_top/Conv_top/y_cnt\[4:0\]} \
{/test_top/Conv_top/y_cnt_pp\[4:0\]} \
{/test_top/Conv_top/top_CNN/W\[0:15\]} \
{/test_top/Conv_top/top_CNN/temp_conv_out\[0:15\]} \
{/test_top/Conv_top/top_CNN/Y\[0:63\]} \
{/test_top/Conv_top/top_CNN/bias\[0:3\]} \
{/test_top/Conv_top/addr/sram_raddr_bias\[6:0\]} \
{/test_top/Conv_top/read_cnt\[10:0\]} \
{/test_top/Conv_top/top_CNN/sram_rdata_bias\[3:0\]} \
{/test_top/Conv_top/top_CNN/Y\[0:63\]} \
{/test_top/Conv_top/state\[5:0\]} \
{/test_top/Conv_top/top_CNN/W\[0:15\]} \
{/test_top/Conv_top/addr/sram_raddr_weight\[10:0\]} \
{/test_top/Conv_top/top_CNN/sram_rdata_weight\[35:0\]} \
{/test_top/Conv_top/top_CNN/read_weight_finish} \
{/test_top/Conv_top/top_CNN/load_weight_finish} \
{/test_top/Conv_top/addr/sram_waddr_a\[5:0\]} \
{/test_top/Conv_top/addr/sram_waddr_b\[5:0\]} \
{/test_top/Conv_top/addr/sram_raddr_b0\[5:0\]} \
{/test_top/Conv_top/addr/sram_raddr_b1\[5:0\]} \
{/test_top/Conv_top/addr/sram_raddr_b2\[5:0\]} \
{/test_top/Conv_top/addr/sram_raddr_b3\[5:0\]} \
}
wvAddSignal -win $_nWave1 -group {"G2" \
}
wvSelectSignal -win $_nWave1 {( "G1" 26 27 28 29 )} 
wvSetPosition -win $_nWave1 {("G1" 29)}
wvGetSignalClose -win $_nWave1
wvZoomOut -win $_nWave1
wvDisplayGridCount -win $_nWave1 -off
wvGetSignalClose -win $_nWave1
wvReloadFile -win $_nWave1
wvScrollUp -win $_nWave1 1
wvScrollUp -win $_nWave1 1
wvScrollUp -win $_nWave1 1
wvScrollDown -win $_nWave1 0
wvScrollDown -win $_nWave1 0
wvScrollDown -win $_nWave1 0
wvScrollDown -win $_nWave1 0
wvScrollDown -win $_nWave1 0
wvZoomOut -win $_nWave1
wvZoomOut -win $_nWave1
wvSetCursor -win $_nWave1 80469.683203 -snap {("G1" 2)}
wvZoomIn -win $_nWave1
wvZoomIn -win $_nWave1
wvZoomIn -win $_nWave1
wvZoomOut -win $_nWave1
wvZoomOut -win $_nWave1
wvScrollDown -win $_nWave1 1
wvScrollDown -win $_nWave1 1
wvScrollDown -win $_nWave1 1
wvScrollDown -win $_nWave1 0
wvScrollDown -win $_nWave1 0
wvScrollDown -win $_nWave1 0
wvScrollDown -win $_nWave1 0
wvScrollUp -win $_nWave1 1
wvScrollUp -win $_nWave1 1
wvScrollUp -win $_nWave1 1
wvScrollDown -win $_nWave1 0
wvScrollDown -win $_nWave1 0
wvScrollDown -win $_nWave1 0
wvScrollDown -win $_nWave1 0
wvScrollDown -win $_nWave1 1
wvScrollDown -win $_nWave1 1
wvScrollDown -win $_nWave1 1
wvScrollDown -win $_nWave1 0
wvSetCursor -win $_nWave1 78753.543715 -snap {("G1" 18)}
wvSetCursor -win $_nWave1 78965.537386 -snap {("G1" 24)}
wvSetCursor -win $_nWave1 79495.521563 -snap {("G1" 24)}
wvSetCursor -win $_nWave1 78806.542133 -snap {("G1" 24)}
wvSelectSignal -win $_nWave1 {( "G1" 24 )} 
wvScrollDown -win $_nWave1 0
wvScrollDown -win $_nWave1 0
wvScrollDown -win $_nWave1 0
wvScrollDown -win $_nWave1 0
wvScrollUp -win $_nWave1 1
wvScrollUp -win $_nWave1 1
wvScrollUp -win $_nWave1 1
wvScrollDown -win $_nWave1 0
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
wvScrollDown -win $_nWave1 0
wvScrollDown -win $_nWave1 0
wvScrollDown -win $_nWave1 0
wvScrollDown -win $_nWave1 0
wvScrollDown -win $_nWave1 0
wvScrollDown -win $_nWave1 0
wvZoomIn -win $_nWave1
wvZoomIn -win $_nWave1
wvZoomIn -win $_nWave1
wvZoomIn -win $_nWave1
wvZoomOut -win $_nWave1
wvZoomOut -win $_nWave1
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
wvDisplayGridCount -win $_nWave1 -off
wvGetSignalClose -win $_nWave1
wvReloadFile -win $_nWave1
wvZoomIn -win $_nWave1
wvZoomIn -win $_nWave1
wvZoomOut -win $_nWave1
wvZoomOut -win $_nWave1
wvZoomOut -win $_nWave1
wvZoomOut -win $_nWave1
wvZoomOut -win $_nWave1
wvZoomOut -win $_nWave1
wvZoomOut -win $_nWave1
wvZoomOut -win $_nWave1
wvZoomOut -win $_nWave1
wvZoomOut -win $_nWave1
wvZoomOut -win $_nWave1
wvScrollDown -win $_nWave1 0
wvScrollDown -win $_nWave1 0
wvScrollDown -win $_nWave1 0
wvScrollDown -win $_nWave1 0
wvScrollDown -win $_nWave1 0
wvScrollDown -win $_nWave1 0
wvScrollDown -win $_nWave1 0
wvScrollDown -win $_nWave1 0
wvScrollDown -win $_nWave1 0
wvSetCursor -win $_nWave1 84203.600563 -snap {("G1" 18)}
wvZoomIn -win $_nWave1
wvZoomIn -win $_nWave1
wvZoomIn -win $_nWave1
wvZoomIn -win $_nWave1
wvZoomIn -win $_nWave1
wvZoomIn -win $_nWave1
wvSetCursor -win $_nWave1 84360.128348 -snap {("G1" 18)}
wvSetCursor -win $_nWave1 84449.351274 -snap {("G1" 24)}
wvZoomOut -win $_nWave1
wvZoomOut -win $_nWave1
wvScrollDown -win $_nWave1 0
wvScrollDown -win $_nWave1 0
wvSetCursor -win $_nWave1 86346.275295 -snap {("G1" 24)}
wvScrollDown -win $_nWave1 0
wvScrollDown -win $_nWave1 0
wvScrollDown -win $_nWave1 0
wvScrollDown -win $_nWave1 0
wvScrollDown -win $_nWave1 0
wvScrollDown -win $_nWave1 0
wvScrollDown -win $_nWave1 0
wvGetSignalOpen -win $_nWave1
wvGetSignalSetScope -win $_nWave1 "/test_top/Conv_top/top_CNN"
wvSetPosition -win $_nWave1 {("G1" 30)}
wvSetPosition -win $_nWave1 {("G1" 30)}
wvAddSignal -win $_nWave1 -clear
wvAddSignal -win $_nWave1 -group {"G1" \
{/test_top/Conv_top/clk} \
{/test_top/Conv_top/cnn_state\[4:0\]} \
{/test_top/Conv_top/read_weight_finish} \
{/test_top/Conv_top/rst_n} \
{/test_top/Conv_top/sram_raddr_weight\[10:0\]} \
{/test_top/Conv_top/x_cnt\[4:0\]} \
{/test_top/Conv_top/x_cnt_pp\[4:0\]} \
{/test_top/Conv_top/y_cnt\[4:0\]} \
{/test_top/Conv_top/y_cnt_pp\[4:0\]} \
{/test_top/Conv_top/top_CNN/W\[0:15\]} \
{/test_top/Conv_top/top_CNN/temp_conv_out\[0:15\]} \
{/test_top/Conv_top/top_CNN/Y\[0:63\]} \
{/test_top/Conv_top/top_CNN/bias\[0:3\]} \
{/test_top/Conv_top/addr/sram_raddr_bias\[6:0\]} \
{/test_top/Conv_top/read_cnt\[10:0\]} \
{/test_top/Conv_top/top_CNN/sram_rdata_bias\[3:0\]} \
{/test_top/Conv_top/top_CNN/Y\[0:63\]} \
{/test_top/Conv_top/state\[5:0\]} \
{/test_top/Conv_top/top_CNN/W\[0:15\]} \
{/test_top/Conv_top/addr/sram_raddr_weight\[10:0\]} \
{/test_top/Conv_top/top_CNN/sram_rdata_weight\[35:0\]} \
{/test_top/Conv_top/top_CNN/read_weight_finish} \
{/test_top/Conv_top/top_CNN/load_weight_finish} \
{/test_top/Conv_top/addr/sram_waddr_a\[5:0\]} \
{/test_top/Conv_top/addr/sram_waddr_b\[5:0\]} \
{/test_top/Conv_top/addr/sram_raddr_b0\[5:0\]} \
{/test_top/Conv_top/addr/sram_raddr_b1\[5:0\]} \
{/test_top/Conv_top/addr/sram_raddr_b2\[5:0\]} \
{/test_top/Conv_top/addr/sram_raddr_b3\[5:0\]} \
{/test_top/Conv_top/top_CNN/feature_maps_o\[0:15\]} \
}
wvAddSignal -win $_nWave1 -group {"G2" \
}
wvSelectSignal -win $_nWave1 {( "G1" 30 )} 
wvSetPosition -win $_nWave1 {("G1" 30)}
wvSetPosition -win $_nWave1 {("G1" 30)}
wvSetPosition -win $_nWave1 {("G1" 30)}
wvAddSignal -win $_nWave1 -clear
wvAddSignal -win $_nWave1 -group {"G1" \
{/test_top/Conv_top/clk} \
{/test_top/Conv_top/cnn_state\[4:0\]} \
{/test_top/Conv_top/read_weight_finish} \
{/test_top/Conv_top/rst_n} \
{/test_top/Conv_top/sram_raddr_weight\[10:0\]} \
{/test_top/Conv_top/x_cnt\[4:0\]} \
{/test_top/Conv_top/x_cnt_pp\[4:0\]} \
{/test_top/Conv_top/y_cnt\[4:0\]} \
{/test_top/Conv_top/y_cnt_pp\[4:0\]} \
{/test_top/Conv_top/top_CNN/W\[0:15\]} \
{/test_top/Conv_top/top_CNN/temp_conv_out\[0:15\]} \
{/test_top/Conv_top/top_CNN/Y\[0:63\]} \
{/test_top/Conv_top/top_CNN/bias\[0:3\]} \
{/test_top/Conv_top/addr/sram_raddr_bias\[6:0\]} \
{/test_top/Conv_top/read_cnt\[10:0\]} \
{/test_top/Conv_top/top_CNN/sram_rdata_bias\[3:0\]} \
{/test_top/Conv_top/top_CNN/Y\[0:63\]} \
{/test_top/Conv_top/state\[5:0\]} \
{/test_top/Conv_top/top_CNN/W\[0:15\]} \
{/test_top/Conv_top/addr/sram_raddr_weight\[10:0\]} \
{/test_top/Conv_top/top_CNN/sram_rdata_weight\[35:0\]} \
{/test_top/Conv_top/top_CNN/read_weight_finish} \
{/test_top/Conv_top/top_CNN/load_weight_finish} \
{/test_top/Conv_top/addr/sram_waddr_a\[5:0\]} \
{/test_top/Conv_top/addr/sram_waddr_b\[5:0\]} \
{/test_top/Conv_top/addr/sram_raddr_b0\[5:0\]} \
{/test_top/Conv_top/addr/sram_raddr_b1\[5:0\]} \
{/test_top/Conv_top/addr/sram_raddr_b2\[5:0\]} \
{/test_top/Conv_top/addr/sram_raddr_b3\[5:0\]} \
{/test_top/Conv_top/top_CNN/feature_maps_o\[0:15\]} \
}
wvAddSignal -win $_nWave1 -group {"G2" \
}
wvSelectSignal -win $_nWave1 {( "G1" 30 )} 
wvSetPosition -win $_nWave1 {("G1" 30)}
wvGetSignalClose -win $_nWave1
wvSelectSignal -win $_nWave1 {( "G1" 30 )} 
wvSelectSignal -win $_nWave1 {( "G1" 30 )} 
wvExpandBus -win $_nWave1 {("G1" 30)}
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
wvScrollDown -win $_nWave1 0
wvScrollDown -win $_nWave1 0
wvScrollDown -win $_nWave1 0
wvScrollDown -win $_nWave1 0
wvSetCursor -win $_nWave1 86025.072763 -snap {("G1" 2)}
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
wvSelectSignal -win $_nWave1 {( "G1" 31 )} 
wvSetPosition -win $_nWave1 {("G1" 31)}
wvExpandBus -win $_nWave1 {("G1" 31)}
wvSetPosition -win $_nWave1 {("G1" 62)}
wvSelectSignal -win $_nWave1 {( "G1" 31 )} 
wvSetPosition -win $_nWave1 {("G1" 31)}
wvCollapseBus -win $_nWave1 {("G1" 31)}
wvSetPosition -win $_nWave1 {("G1" 31)}
wvSetPosition -win $_nWave1 {("G1" 46)}
wvSelectSignal -win $_nWave1 {( "G1" 31 )} 
wvSetPosition -win $_nWave1 {("G1" 31)}
wvExpandBus -win $_nWave1 {("G1" 31)}
wvSetPosition -win $_nWave1 {("G1" 62)}
wvSelectSignal -win $_nWave1 {( "G1" 32 )} 
wvScrollDown -win $_nWave1 1
wvScrollDown -win $_nWave1 1
wvScrollDown -win $_nWave1 1
wvScrollUp -win $_nWave1 1
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
wvScrollDown -win $_nWave1 0
wvScrollDown -win $_nWave1 0
wvScrollDown -win $_nWave1 0
wvScrollDown -win $_nWave1 0
wvSetCursor -win $_nWave1 86149.984859 -snap {("G1" 3)}
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
wvScrollDown -win $_nWave1 1
wvScrollDown -win $_nWave1 1
wvScrollDown -win $_nWave1 0
wvScrollDown -win $_nWave1 0
wvScrollDown -win $_nWave1 0
wvScrollDown -win $_nWave1 0
wvScrollDown -win $_nWave1 0
wvScrollDown -win $_nWave1 0
wvScrollDown -win $_nWave1 0
wvScrollDown -win $_nWave1 0
wvScrollDown -win $_nWave1 0
wvScrollDown -win $_nWave1 0
wvScrollDown -win $_nWave1 0
wvScrollUp -win $_nWave1 5
wvSelectSignal -win $_nWave1 {( "G1" 48 )} 
wvSelectSignal -win $_nWave1 {( "G1" 48 )} 
wvSetPosition -win $_nWave1 {("G1" 48)}
wvExpandBus -win $_nWave1 {("G1" 48)}
wvSetPosition -win $_nWave1 {("G1" 78)}
wvScrollUp -win $_nWave1 3
wvSelectSignal -win $_nWave1 {( "G1" 48 )} 
wvSetPosition -win $_nWave1 {("G1" 48)}
wvCollapseBus -win $_nWave1 {("G1" 48)}
wvSetPosition -win $_nWave1 {("G1" 48)}
wvSetPosition -win $_nWave1 {("G1" 62)}
wvScrollUp -win $_nWave1 4
wvScrollUp -win $_nWave1 1
wvSelectSignal -win $_nWave1 {( "G1" 31 )} 
wvSelectSignal -win $_nWave1 {( "G1" 31 )} 
wvSelectSignal -win $_nWave1 {( "G1" 31 )} 
wvSetPosition -win $_nWave1 {("G1" 31)}
wvCollapseBus -win $_nWave1 {("G1" 31)}
wvSetPosition -win $_nWave1 {("G1" 31)}
wvSetPosition -win $_nWave1 {("G1" 46)}
wvSetCursor -win $_nWave1 86319.508417 -snap {("G1" 31)}
wvSetCursor -win $_nWave1 86480.109683 -snap {("G1" 31)}
wvSetCursor -win $_nWave1 86453.342805 -snap {("G1" 31)}
wvSetCursor -win $_nWave1 86381.964465 -snap {("G1" 31)}
wvSetCursor -win $_nWave1 86462.265098 -snap {("G1" 31)}
wvSetCursor -win $_nWave1 86453.342805 -snap {("G1" 31)}
wvSetCursor -win $_nWave1 86569.332608 -snap {("G1" 31)}
wvSetCursor -win $_nWave1 86462.265098 -snap {("G1" 31)}
wvZoomIn -win $_nWave1
wvSetCursor -win $_nWave1 86504.645987 -snap {("G1" 31)}
wvSetCursor -win $_nWave1 86460.034525 -snap {("G1" 31)}
wvSetCursor -win $_nWave1 86567.102035 -snap {("G1" 31)}
wvSetCursor -win $_nWave1 86446.651086 -snap {("G1" 31)}
wvSetCursor -win $_nWave1 86464.495671 -snap {("G1" 31)}
wvZoomIn -win $_nWave1
wvZoomIn -win $_nWave1
wvZoomOut -win $_nWave1
wvSetCursor -win $_nWave1 86456.688665 -snap {("G1" 32)}
wvScrollDown -win $_nWave1 0
wvScrollUp -win $_nWave1 1
wvScrollDown -win $_nWave1 1
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
wvSetCursor -win $_nWave1 86349.621154 -snap {("G1" 30)}
wvSetCursor -win $_nWave1 86194.841969 -snap {("G1" 36)}
wvSetCursor -win $_nWave1 86197.072542 -snap {("G1" 35)}
wvSetCursor -win $_nWave1 86257.298017 -snap {("G1" 35)}
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
wvScrollUp -win $_nWave1 1
wvScrollUp -win $_nWave1 1
wvScrollUp -win $_nWave1 1
wvScrollUp -win $_nWave1 1
wvScrollUp -win $_nWave1 1
wvScrollUp -win $_nWave1 1
wvScrollDown -win $_nWave1 0
wvSetCursor -win $_nWave1 86173.599690 -snap {("G1" 23)}
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
wvScrollDown -win $_nWave1 0
wvSelectSignal -win $_nWave1 {( "G1" 31 )} 
wvSetPosition -win $_nWave1 {("G1" 31)}
wvExpandBus -win $_nWave1 {("G1" 31)}
wvSetPosition -win $_nWave1 {("G1" 62)}
wvScrollUp -win $_nWave1 17
wvDisplayGridCount -win $_nWave1 -off
wvGetSignalClose -win $_nWave1
wvReloadFile -win $_nWave1
wvScrollDown -win $_nWave1 1
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
wvScrollDown -win $_nWave1 0
wvScrollDown -win $_nWave1 0
wvScrollDown -win $_nWave1 0
wvScrollDown -win $_nWave1 0
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
wvScrollDown -win $_nWave1 1
wvScrollDown -win $_nWave1 1
wvScrollDown -win $_nWave1 1
wvScrollDown -win $_nWave1 1
wvScrollDown -win $_nWave1 1
wvSelectSignal -win $_nWave1 {( "G1" 31 )} 
wvSelectSignal -win $_nWave1 {( "G1" 31 )} 
wvSetPosition -win $_nWave1 {("G1" 31)}
wvCollapseBus -win $_nWave1 {("G1" 31)}
wvSetPosition -win $_nWave1 {("G1" 31)}
wvSetPosition -win $_nWave1 {("G1" 46)}
wvSelectSignal -win $_nWave1 {( "G1" 31 )} 
wvSelectSignal -win $_nWave1 {( "G1" 30 )} 
wvSetPosition -win $_nWave1 {("G1" 30)}
wvCollapseBus -win $_nWave1 {("G1" 30)}
wvSetPosition -win $_nWave1 {("G1" 30)}
wvSelectSignal -win $_nWave1 {( "G1" 30 )} 
wvExpandBus -win $_nWave1 {("G1" 30)}
wvScrollUp -win $_nWave1 1
wvScrollUp -win $_nWave1 1
wvScrollUp -win $_nWave1 1
wvScrollUp -win $_nWave1 1
wvZoomOut -win $_nWave1
wvZoomOut -win $_nWave1
wvZoomOut -win $_nWave1
wvZoomOut -win $_nWave1
wvSetCursor -win $_nWave1 84741.793249 -snap {("G1" 18)}
wvZoomIn -win $_nWave1
wvZoomIn -win $_nWave1
wvSetCursor -win $_nWave1 85925.820428 -snap {("G1" 31)}
wvSetCursor -win $_nWave1 86153.160442 -snap {("G1" 36)}
wvSetCursor -win $_nWave1 86083.209669 -snap {("G1" 37)}
wvSetCursor -win $_nWave1 86240.598909 -snap {("G1" 37)}
wvScrollDown -win $_nWave1 1
wvScrollDown -win $_nWave1 1
wvScrollDown -win $_nWave1 1
wvScrollDown -win $_nWave1 1
wvScrollDown -win $_nWave1 1
wvScrollDown -win $_nWave1 0
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
wvScrollDown -win $_nWave1 1
wvScrollDown -win $_nWave1 0
wvScrollUp -win $_nWave1 1
wvScrollUp -win $_nWave1 1
wvScrollUp -win $_nWave1 1
wvScrollUp -win $_nWave1 1
wvScrollUp -win $_nWave1 1
wvScrollUp -win $_nWave1 1
wvSetCursor -win $_nWave1 84596.755731 -snap {("G1" 19)}
wvSetCursor -win $_nWave1 86170.648136 -snap {("G1" 19)}
wvSetCursor -win $_nWave1 86135.672749 -snap {("G1" 19)}
wvResizeWindow -win $_nWave1 0 23 1217 697
wvSelectSignal -win $_nWave1 {( "G1" 19 )} 
wvSetPosition -win $_nWave1 {("G1" 19)}
wvExpandBus -win $_nWave1 {("G1" 19)}
wvSetPosition -win $_nWave1 {("G1" 62)}
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
wvZoomIn -win $_nWave1
wvZoomIn -win $_nWave1
wvZoomOut -win $_nWave1
wvZoomOut -win $_nWave1
wvZoomOut -win $_nWave1
wvSetCursor -win $_nWave1 82180.057377 -snap {("G1" 2)}
wvSetCursor -win $_nWave1 84196.745902 -snap {("G1" 2)}
wvSetCursor -win $_nWave1 80835.598361 -snap {("G1" 2)}
wvSetCursor -win $_nWave1 84700.918033 -snap {("G1" 18)}
wvZoomIn -win $_nWave1
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
wvSetCursor -win $_nWave1 87079.921569 -snap {("G1" 35)}
wvScrollUp -win $_nWave1 7
wvSelectSignal -win $_nWave1 {( "G1" 13 )} 
wvScrollUp -win $_nWave1 1
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
wvSetCursor -win $_nWave1 84417.626487 -snap {("G1" 18)}
wvSetCursor -win $_nWave1 84916.806815 -snap {("G1" 13)}
wvScrollDown -win $_nWave1 1
wvScrollUp -win $_nWave1 1
wvScrollDown -win $_nWave1 0
wvDisplayGridCount -win $_nWave1 -off
wvGetSignalClose -win $_nWave1
wvReloadFile -win $_nWave1
wvSetCursor -win $_nWave1 79417.711528 -snap {("G1" 13)}
wvScrollDown -win $_nWave1 0
wvScrollDown -win $_nWave1 0
wvSetCursor -win $_nWave1 84617.506610 -snap {("G1" 18)}
wvSetCursor -win $_nWave1 86489.432840 -snap {("G1" 10)}
wvScrollDown -win $_nWave1 1
wvScrollDown -win $_nWave1 1
wvScrollDown -win $_nWave1 1
wvSelectSignal -win $_nWave1 {( "G1" 19 )} 
wvSelectSignal -win $_nWave1 {( "G1" 19 )} 
wvSetPosition -win $_nWave1 {("G1" 19)}
wvCollapseBus -win $_nWave1 {("G1" 19)}
wvSetPosition -win $_nWave1 {("G1" 19)}
wvSetPosition -win $_nWave1 {("G1" 46)}
wvScrollDown -win $_nWave1 6
wvScrollUp -win $_nWave1 1
wvScrollUp -win $_nWave1 1
wvScrollDown -win $_nWave1 6
wvSelectSignal -win $_nWave1 {( "G1" 30 )} 
wvSetPosition -win $_nWave1 {("G1" 30)}
wvCollapseBus -win $_nWave1 {("G1" 30)}
wvSetPosition -win $_nWave1 {("G1" 30)}
wvScrollUp -win $_nWave1 4
wvSelectSignal -win $_nWave1 {( "G1" 14 )} 
wvDisplayGridCount -win $_nWave1 -off
wvGetSignalClose -win $_nWave1
wvReloadFile -win $_nWave1
wvZoomOut -win $_nWave1
wvZoomOut -win $_nWave1
wvZoomOut -win $_nWave1
wvZoomOut -win $_nWave1
wvZoomOut -win $_nWave1
wvZoomOut -win $_nWave1
wvZoomOut -win $_nWave1
wvZoomOut -win $_nWave1
wvZoomOut -win $_nWave1
wvZoomOut -win $_nWave1
wvZoomOut -win $_nWave1
wvSelectSignal -win $_nWave1 {( "G1" 18 )} 
wvSetCursor -win $_nWave1 84532.860656 -snap {("G1" 18)}
wvZoomIn -win $_nWave1
wvZoomIn -win $_nWave1
wvZoomIn -win $_nWave1
wvZoomIn -win $_nWave1
wvSelectSignal -win $_nWave1 {( "G1" 13 )} 
wvSelectSignal -win $_nWave1 {( "G1" 14 )} 
wvDisplayGridCount -win $_nWave1 -off
wvGetSignalClose -win $_nWave1
wvReloadFile -win $_nWave1
wvSetCursor -win $_nWave1 90204.364294 -snap {("G1" 14)}
wvDisplayGridCount -win $_nWave1 -off
wvGetSignalClose -win $_nWave1
wvReloadFile -win $_nWave1
wvSetCursor -win $_nWave1 79781.778059 -snap {("G1" 14)}
wvSetCursor -win $_nWave1 78429.831338 -snap {("G1" 13)}
wvScrollDown -win $_nWave1 1
wvScrollDown -win $_nWave1 1
wvScrollDown -win $_nWave1 1
wvScrollDown -win $_nWave1 1
wvScrollDown -win $_nWave1 0
wvScrollDown -win $_nWave1 0
wvScrollDown -win $_nWave1 0
wvScrollDown -win $_nWave1 0
wvScrollDown -win $_nWave1 0
wvSetCursor -win $_nWave1 84381.520353 -snap {("G1" 30)}
wvZoomOut -win $_nWave1
wvZoomOut -win $_nWave1
wvZoomOut -win $_nWave1
wvZoomOut -win $_nWave1
wvZoomOut -win $_nWave1
wvZoomOut -win $_nWave1
wvZoomOut -win $_nWave1
wvZoomIn -win $_nWave1
wvZoomIn -win $_nWave1
wvZoomIn -win $_nWave1
wvZoomIn -win $_nWave1
wvZoomIn -win $_nWave1
wvZoomIn -win $_nWave1
wvZoomIn -win $_nWave1
wvScrollDown -win $_nWave1 0
wvScrollDown -win $_nWave1 0
wvSetCursor -win $_nWave1 92548.374509 -snap {("G1" 18)}
wvScrollDown -win $_nWave1 0
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
wvScrollDown -win $_nWave1 1
wvScrollDown -win $_nWave1 1
wvScrollDown -win $_nWave1 1
wvScrollDown -win $_nWave1 1
wvScrollDown -win $_nWave1 0
wvScrollDown -win $_nWave1 0
wvScrollDown -win $_nWave1 0
wvSetCursor -win $_nWave1 86157.032787 -snap {("G1" 23)}
wvSetCursor -win $_nWave1 86179.495902 -snap {("G1" 30)}
wvSetCursor -win $_nWave1 86179.495902 -snap {("G1" 30)}
wvSetCursor -win $_nWave1 86179.495902 -snap {("G1" 30)}
wvSelectSignal -win $_nWave1 {( "G1" 30 )} 
wvExpandBus -win $_nWave1 {("G1" 30)}
wvScrollDown -win $_nWave1 1
wvScrollDown -win $_nWave1 0
wvScrollDown -win $_nWave1 0
wvScrollDown -win $_nWave1 0
wvScrollDown -win $_nWave1 0
wvScrollDown -win $_nWave1 0
wvScrollDown -win $_nWave1 0
wvScrollDown -win $_nWave1 0
wvScrollDown -win $_nWave1 0
wvDisplayGridCount -win $_nWave1 -off
wvGetSignalClose -win $_nWave1
wvReloadFile -win $_nWave1
wvScrollDown -win $_nWave1 0
wvScrollDown -win $_nWave1 0
wvScrollDown -win $_nWave1 0
wvScrollDown -win $_nWave1 0
wvSelectSignal -win $_nWave1 {( "G1" 30 )} 
wvSelectSignal -win $_nWave1 {( "G1" 30 )} 
wvScrollUp -win $_nWave1 3
wvScrollUp -win $_nWave1 5
