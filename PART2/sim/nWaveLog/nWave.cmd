wvExit
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                      wvSetCursor -win $_nWave1 78919.629046 -snap {("G2" 8)}
wvSetCursor -win $_nWave1 96152.824905 -snap {("G2" 6)}
wvSetCursor -win $_nWave1 78754.676842 -snap {("G2" 13)}
wvSetCursor -win $_nWave1 78969.225688 -snap {("G2" 9)}
wvSetCursor -win $_nWave1 79070.540420 -snap {("G2" 9)}
wvSetCursor -win $_nWave1 79167.882026 -snap {("G2" 9)}
wvSetCursor -win $_nWave1 79251.317688 -snap {("G2" 9)}
wvSetCursor -win $_nWave1 79048.688223 -snap {("G2" 7)}
wvSetCursor -win $_nWave1 79153.976083 -snap {("G2" 2)}
wvSetCursor -win $_nWave1 78774.542476 -snap {("G2" 5)}
wvGetSignalOpen -win $_nWave1
wvSetPosition -win $_nWave1 {("G2" 14)}
wvSetPosition -win $_nWave1 {("G2" 14)}
wvAddSignal -win $_nWave1 -clear
wvAddSignal -win $_nWave1 -group {"G2" \
{/test_top/Conv_top/clk} \
{/test_top/Conv_top/cnn_state\[4:0\]} \
{/test_top/Conv_top/conv_cnt\[7:0\]} \
{/test_top/Conv_top/position_offset\[3:0\]} \
{/test_top/Conv_top/read_cnt\[10:0\]} \
{/test_top/Conv_top/sram_raddr_bias\[6:0\]} \
{/test_top/Conv_top/sram_raddr_weight\[10:0\]} \
{/test_top/Conv_top/sram_rdata_bias\[3:0\]} \
{/test_top/Conv_top/sram_rdata_weight\[35:0\]} \
{/test_top/Conv_top/weight_cnt\[7:0\]} \
{/test_top/Conv_top/x_cnt\[4:0\]} \
{/test_top/Conv_top/y_cnt\[4:0\]} \
{/test_top/Conv_top/state\[5:0\]} \
{/test_top/Conv_top/weights\[0:3\]} \
}
wvAddSignal -win $_nWave1 -group {"G3" \
}
wvSelectSignal -win $_nWave1 {( "G2" 14 )} 
wvSetPosition -win $_nWave1 {("G2" 14)}
wvSetPosition -win $_nWave1 {("G2" 14)}
wvSetPosition -win $_nWave1 {("G2" 14)}
wvAddSignal -win $_nWave1 -clear
wvAddSignal -win $_nWave1 -group {"G2" \
{/test_top/Conv_top/clk} \
{/test_top/Conv_top/cnn_state\[4:0\]} \
{/test_top/Conv_top/conv_cnt\[7:0\]} \
{/test_top/Conv_top/position_offset\[3:0\]} \
{/test_top/Conv_top/read_cnt\[10:0\]} \
{/test_top/Conv_top/sram_raddr_bias\[6:0\]} \
{/test_top/Conv_top/sram_raddr_weight\[10:0\]} \
{/test_top/Conv_top/sram_rdata_bias\[3:0\]} \
{/test_top/Conv_top/sram_rdata_weight\[35:0\]} \
{/test_top/Conv_top/weight_cnt\[7:0\]} \
{/test_top/Conv_top/x_cnt\[4:0\]} \
{/test_top/Conv_top/y_cnt\[4:0\]} \
{/test_top/Conv_top/state\[5:0\]} \
{/test_top/Conv_top/weights\[0:3\]} \
}
wvAddSignal -win $_nWave1 -group {"G3" \
}
wvSelectSignal -win $_nWave1 {( "G2" 14 )} 
wvSetPosition -win $_nWave1 {("G2" 14)}
wvGetSignalClose -win $_nWave1
wvSetCursor -win $_nWave1 79183.774533 -snap {("G2" 14)}
wvSetCursor -win $_nWave1 1368.742171 -snap {("G2" 14)}
wvSetCursor -win $_nWave1 30594.954700 -snap {("G2" 9)}
wvGetSignalOpen -win $_nWave1
wvGetSignalSetScope -win $_nWave1 "/test_top"
wvGetSignalSetScope -win $_nWave1 "/test_top/Conv_top"
wvGetSignalSetScope -win $_nWave1 "/test_top/Conv_top"
wvGetSignalClose -win $_nWave1
wvSetCursor -win $_nWave1 7163.348905 -snap {("G2" 6)}
wvSetCursor -win $_nWave1 78786.098096 -snap {("G2" 5)}
wvGetSignalOpen -win $_nWave1
wvGetSignalSetScope -win $_nWave1 "/test_top"
wvGetSignalSetScope -win $_nWave1 "/test_top/Conv_top"
wvGetSignalSetScope -win $_nWave1 "/test_top/Conv_top"
wvGetSignalClose -win $_nWave1
wvDisplayGridCount -win $_nWave1 -off
wvGetSignalClose -win $_nWave1
wvReloadFile -win $_nWave1
wvSelectSignal -win $_nWave1 {( "G2" 14 )} 
wvExpandBus -win $_nWave1 {("G2" 14)}
wvSetCursor -win $_nWave1 78862.580786 -snap {("G2" 4)}
wvSetCursor -win $_nWave1 78771.198870 -snap {("G2" 13)}
wvSetCursor -win $_nWave1 78856.621096 -snap {("G2" 7)}
wvSetCursor -win $_nWave1 78777.158561 -snap {("G2" 7)}
wvSetCursor -win $_nWave1 78777.158561 -snap {("G2" 7)}
wvSetCursor -win $_nWave1 78777.158561 -snap {("G2" 7)}
wvSetCursor -win $_nWave1 78761.266054 -snap {("G2" 13)}
wvSetCursor -win $_nWave1 78864.567349 -snap {("G2" 5)}
wvSetCursor -win $_nWave1 79150.632477 -snap {("G2" 17)}
wvSetCursor -win $_nWave1 78950.192790 -snap {("G2" 15)}
wvSetCursor -win $_nWave1 78882.649635 -snap {("G2" 9)}
wvSetCursor -win $_nWave1 78862.784001 -snap {("G2" 9)}
wvSetCursor -win $_nWave1 78840.931804 -snap {("G2" 8)}
wvSetCursor -win $_nWave1 96148.851779 -snap {("G2" 5)}
wvSetCursor -win $_nWave1 96063.429553 -snap {("G2" 4)}
wvSetCursor -win $_nWave1 96176.564338 -snap {("G2" 7)}
wvSelectSignal -win $_nWave1 {( "G2" 13 )} 
wvSearchPrev -win $_nWave1
wvSetCursor -win $_nWave1 78749.900672 -snap {("G2" 13)}
wvSetCursor -win $_nWave1 78842.474525 -snap {("G2" 7)}
wvSetCursor -win $_nWave1 78896.111737 -snap {("G2" 7)}
wvSetCursor -win $_nWave1 78981.533962 -snap {("G2" 15)}
wvSetCursor -win $_nWave1 78882.205793 -snap {("G2" 7)}
wvSetCursor -win $_nWave1 78772.944807 -snap {("G2" 7)}
wvSetCursor -win $_nWave1 78763.011990 -snap {("G2" 5)}
wvSetCursor -win $_nWave1 79130.526216 -snap {("G2" 7)}
wvSetCursor -win $_nWave1 78759.038863 -snap {("G2" 5)}
wvSetCursor -win $_nWave1 79733.050890 -snap {("G2" 15)}
wvSetCursor -win $_nWave1 79186.745960 -snap {("G2" 17)}
wvDisplayGridCount -win $_nWave1 -off
wvGetSignalClose -win $_nWave1
wvReloadFile -win $_nWave1
wvSetCursor -win $_nWave1 78958.291170 -snap {("G2" 14)}
wvSetCursor -win $_nWave1 79045.699959 -snap {("G2" 14)}
wvSetCursor -win $_nWave1 79149.001255 -snap {("G2" 14)}
wvSetCursor -win $_nWave1 79272.168185 -snap {("G2" 9)}
wvSelectSignal -win $_nWave1 {( "G2" 9 )} 
wvSelectSignal -win $_nWave1 {( "G2" 9 )} 
wvSetRadix -win $_nWave1 -format Bin
wvSetCursor -win $_nWave1 79174.826579 -snap {("G2" 9)}
wvSetCursor -win $_nWave1 79073.511847 -snap {("G2" 7)}
wvSetCursor -win $_nWave1 79145.028128 -snap {("G2" 7)}
wvSetCursor -win $_nWave1 79190.719086 -snap {("G2" 9)}
wvSetCursor -win $_nWave1 79141.055002 -snap {("G2" 7)}
wvSetCursor -win $_nWave1 79194.692213 -snap {("G2" 9)}
wvSetCursor -win $_nWave1 79152.974382 -snap {("G2" 7)}
wvSetCursor -win $_nWave1 79055.632776 -snap {("G2" 7)}
wvSetCursor -win $_nWave1 79182.772833 -snap {("G2" 9)}
wvResizeWindow -win $_nWave1 8 31 1474 841
wvZoomIn -win $_nWave1
wvZoomIn -win $_nWave1
wvSetCursor -win $_nWave1 79148.119883 -snap {("G2" 2)}
wvSetCursor -win $_nWave1 79163.547128 -snap {("G2" 9)}
wvSetCursor -win $_nWave1 79181.960291 -snap {("G2" 9)}
wvZoomOut -win $_nWave1
wvSetCursor -win $_nWave1 79163.298301 -snap {("G2" 9)}
wvSetCursor -win $_nWave1 79180.218506 -snap {("G2" 9)}
wvSetCursor -win $_nWave1 79246.904017 -snap {("G2" 9)}
wvSetCursor -win $_nWave1 79186.190342 -snap {("G2" 9)}
wvSetCursor -win $_nWave1 79151.354628 -snap {("G2" 2)}
wvDisplayGridCount -win $_nWave1 -off
wvGetSignalClose -win $_nWave1
wvReloadFile -win $_nWave1
wvSetCursor -win $_nWave1 78749.250950 -snap {("G2" 13)}
wvSetCursor -win $_nWave1 78853.857624 -snap {("G2" 4)}
wvSetCursor -win $_nWave1 78762.289460 -snap {("G2" 5)}
wvSetCursor -win $_nWave1 78849.876400 -snap {("G2" 5)}
wvSetCursor -win $_nWave1 78766.270685 -snap {("G2" 5)}
wvDisplayGridCount -win $_nWave1 -off
wvGetSignalClose -win $_nWave1
wvReloadFile -win $_nWave1
wvSetCursor -win $_nWave1 78851.468889 -snap {("G2" 7)}
wvSetCursor -win $_nWave1 79048.539504 -snap {("G2" 7)}
wvSetCursor -win $_nWave1 78758.905419 -snap {("G2" 5)}
wvSetCursor -win $_nWave1 79055.556412 -snap {("G2" 7)}
wvDisplayGridCount -win $_nWave1 -off
wvGetSignalClose -win $_nWave1
wvReloadFile -win $_nWave1
wvSetCursor -win $_nWave1 78749.997429 -snap {("G2" 13)}
wvSetCursor -win $_nWave1 78736.063143 -snap {("G3" 0)}
wvDisplayGridCount -win $_nWave1 -off
wvGetSignalClose -win $_nWave1
wvReloadFile -win $_nWave1
wvSetCursor -win $_nWave1 78858.485798 -snap {("G2" 5)}
wvSetCursor -win $_nWave1 78759.950490 -snap {("G2" 5)}
wvSetCursor -win $_nWave1 78853.509267 -snap {("G2" 3)}
wvGetSignalOpen -win $_nWave1
wvSetPosition -win $_nWave1 {("G2" 20)}
wvSetPosition -win $_nWave1 {("G2" 20)}
wvAddSignal -win $_nWave1 -clear
wvAddSignal -win $_nWave1 -group {"G2" \
{/test_top/Conv_top/clk} \
{/test_top/Conv_top/cnn_state\[4:0\]} \
{/test_top/Conv_top/conv_cnt\[7:0\]} \
{/test_top/Conv_top/position_offset\[3:0\]} \
{/test_top/Conv_top/read_cnt\[10:0\]} \
{/test_top/Conv_top/sram_raddr_bias\[6:0\]} \
{/test_top/Conv_top/sram_raddr_weight\[10:0\]} \
{/test_top/Conv_top/sram_rdata_bias\[3:0\]} \
{/test_top/Conv_top/sram_rdata_weight\[35:0\]} \
{/test_top/Conv_top/weight_cnt\[7:0\]} \
{/test_top/Conv_top/x_cnt\[4:0\]} \
{/test_top/Conv_top/y_cnt\[4:0\]} \
{/test_top/Conv_top/state\[5:0\]} \
{/test_top/Conv_top/weights\[0:3\]} \
{/test_top/Conv_top/weights\[0\]\[0:2\]} \
{/test_top/Conv_top/weights\[1\]\[0:2\]} \
{/test_top/Conv_top/weights\[2\]\[0:2\]} \
{/test_top/Conv_top/weights\[3\]\[0:2\]} \
{/test_top/Conv_top/load_weight_finish} \
{/test_top/Conv_top/read_weight_finish} \
}
wvAddSignal -win $_nWave1 -group {"G3" \
}
wvSelectSignal -win $_nWave1 {( "G2" 19 20 )} 
wvSetPosition -win $_nWave1 {("G2" 20)}
wvSetPosition -win $_nWave1 {("G2" 20)}
wvSetPosition -win $_nWave1 {("G2" 20)}
wvAddSignal -win $_nWave1 -clear
wvAddSignal -win $_nWave1 -group {"G2" \
{/test_top/Conv_top/clk} \
{/test_top/Conv_top/cnn_state\[4:0\]} \
{/test_top/Conv_top/conv_cnt\[7:0\]} \
{/test_top/Conv_top/position_offset\[3:0\]} \
{/test_top/Conv_top/read_cnt\[10:0\]} \
{/test_top/Conv_top/sram_raddr_bias\[6:0\]} \
{/test_top/Conv_top/sram_raddr_weight\[10:0\]} \
{/test_top/Conv_top/sram_rdata_bias\[3:0\]} \
{/test_top/Conv_top/sram_rdata_weight\[35:0\]} \
{/test_top/Conv_top/weight_cnt\[7:0\]} \
{/test_top/Conv_top/x_cnt\[4:0\]} \
{/test_top/Conv_top/y_cnt\[4:0\]} \
{/test_top/Conv_top/state\[5:0\]} \
{/test_top/Conv_top/weights\[0:3\]} \
{/test_top/Conv_top/weights\[0\]\[0:2\]} \
{/test_top/Conv_top/weights\[1\]\[0:2\]} \
{/test_top/Conv_top/weights\[2\]\[0:2\]} \
{/test_top/Conv_top/weights\[3\]\[0:2\]} \
{/test_top/Conv_top/load_weight_finish} \
{/test_top/Conv_top/read_weight_finish} \
}
wvAddSignal -win $_nWave1 -group {"G3" \
}
wvSelectSignal -win $_nWave1 {( "G2" 19 20 )} 
wvSetPosition -win $_nWave1 {("G2" 20)}
wvGetSignalClose -win $_nWave1
wvSetCursor -win $_nWave1 95940.771919 -snap {("G2" 20)}
wvSetCursor -win $_nWave1 92826.259968 -snap {("G2" 13)}
wvSetCursor -win $_nWave1 78848.883664 -snap {("G2" 7)}
wvSetCursor -win $_nWave1 78756.320194 -snap {("G2" 5)}
wvSetCursor -win $_nWave1 78846.893052 -snap {("G2" 5)}
wvSetCursor -win $_nWave1 78851.869583 -snap {("G2" 4)}
wvSetCursor -win $_nWave1 78945.428359 -snap {("G2" 4)}
wvSetCursor -win $_nWave1 78953.390808 -snap {("G2" 4)}
wvSetCursor -win $_nWave1 78842.911828 -snap {("G2" 4)}
wvSetCursor -win $_nWave1 78754.030990 -snap {("G2" 5)}
wvSetCursor -win $_nWave1 78854.556909 -snap {("G2" 5)}
wvDisplayGridCount -win $_nWave1 -off
wvGetSignalClose -win $_nWave1
wvReloadFile -win $_nWave1
wvDisplayGridCount -win $_nWave1 -off
wvGetSignalClose -win $_nWave1
wvReloadFile -win $_nWave1
wvSetCursor -win $_nWave1 78825.693032 -snap {("G2" 20)}
wvSetCursor -win $_nWave1 78750.878692 -snap {("G2" 13)}
wvDisplayGridCount -win $_nWave1 -off
wvGetSignalClose -win $_nWave1
wvReloadFile -win $_nWave1
wvZoomOut -win $_nWave1
wvSetCursor -win $_nWave1 79059.324064 -snap {("G2" 16)}
wvSetCursor -win $_nWave1 79140.939166 -snap {("G2" 16)}
wvSetCursor -win $_nWave1 79168.807738 -snap {("G2" 20)}
wvSetCursor -win $_nWave1 79164.826514 -snap {("G3" 0)}
wvSetCursor -win $_nWave1 78866.334204 -snap {("G2" 7)}
wvSetCursor -win $_nWave1 78975.817879 -snap {("G2" 7)}
wvSetCursor -win $_nWave1 79147.010534 -snap {("G2" 7)}
wvSetCursor -win $_nWave1 79254.503596 -snap {("G2" 19)}
wvDisplayGridCount -win $_nWave1 -off
wvGetSignalClose -win $_nWave1
wvReloadFile -win $_nWave1
wvSetCursor -win $_nWave1 79172.888493 -snap {("G2" 19)}
wvSetCursor -win $_nWave1 79145.019922 -snap {("G2" 15)}
wvSetCursor -win $_nWave1 79377.921557 -snap {("G2" 17)}
wvSetCursor -win $_nWave1 79383.893393 -snap {("G2" 18)}
wvSetCursor -win $_nWave1 961.465724 -snap {("G2" 13)}
wvSetCursor -win $_nWave1 961.465724 -snap {("G2" 13)}
wvSelectSignal -win $_nWave1 {( "G2" 13 )} 
wvSearchNext -win $_nWave1
wvSearchNext -win $_nWave1
wvSetCursor -win $_nWave1 79162.655569 -snap {("G2" 17)}
wvSetCursor -win $_nWave1 78870.035566 -snap {("G2" 7)}
wvSetCursor -win $_nWave1 78949.660057 -snap {("G2" 7)}
wvSetCursor -win $_nWave1 79055.162507 -snap {("G2" 7)}
wvSetCursor -win $_nWave1 78872.026178 -snap {("G2" 7)}
wvSetCursor -win $_nWave1 79140.758834 -snap {("G2" 7)}
wvSetCursor -win $_nWave1 79071.087405 -snap {("G2" 7)}
wvSetCursor -win $_nWave1 79102.937201 -snap {("G2" 7)}
wvSetCursor -win $_nWave1 79154.693120 -snap {("G2" 9)}
wvSetCursor -win $_nWave1 79146.730671 -snap {("G2" 9)}
wvSetCursor -win $_nWave1 79156.683732 -snap {("G2" 9)}
wvSetCursor -win $_nWave1 79144.740059 -snap {("G2" 5)}
wvDisplayGridCount -win $_nWave1 -off
wvGetSignalClose -win $_nWave1
wvReloadFile -win $_nWave1
wvDisplayGridCount -win $_nWave1 -off
wvGetSignalClose -win $_nWave1
wvReloadFile -win $_nWave1
wvSetCursor -win $_nWave1 79337.829449 -snap {("G2" 5)}
wvSetCursor -win $_nWave1 79250.242509 -snap {("G2" 19)}
wvSetCursor -win $_nWave1 79180.571080 -snap {("G2" 20)}
wvSetCursor -win $_nWave1 79266.167407 -snap {("G2" 18)}
wvSetCursor -win $_nWave1 79345.791898 -snap {("G2" 2)}
wvSetCursor -win $_nWave1 79238.298836 -snap {("G2" 2)}
wvSetCursor -win $_nWave1 79220.383325 -snap {("G2" 3)}
wvSetCursor -win $_nWave1 96653.198514 -snap {("G2" 20)}
wvSetCursor -win $_nWave1 96955.771579 -snap {("G2" 19)}
wvSetCursor -win $_nWave1 96669.123413 -snap {("G2" 20)}
wvSetCursor -win $_nWave1 96969.705865 -snap {("G2" 19)}
wvDisplayGridCount -win $_nWave1 -off
wvGetSignalClose -win $_nWave1
wvReloadFile -win $_nWave1
wvSetCursor -win $_nWave1 96567.602187 -snap {("G2" 20)}
wvDisplayGridCount -win $_nWave1 -off
wvGetSignalClose -win $_nWave1
wvReloadFile -win $_nWave1
wvSetCursor -win $_nWave1 94494.180450 -snap {("G2" 13)}
wvSetCursor -win $_nWave1 79248.349781 -snap {("G2" 19)}
wvSetCursor -win $_nWave1 79139.363759 -snap {("G2" 20)}
wvDisplayGridCount -win $_nWave1 -off
wvGetSignalClose -win $_nWave1
wvReloadFile -win $_nWave1
wvSetCursor -win $_nWave1 79250.838046 -snap {("G2" 19)}
wvSetCursor -win $_nWave1 79173.204167 -snap {("G2" 19)}
wvSetCursor -win $_nWave1 79153.298045 -snap {("G2" 19)}
wvSetCursor -win $_nWave1 79153.298045 -snap {("G2" 5)}
wvDisplayGridCount -win $_nWave1 -off
wvGetSignalClose -win $_nWave1
wvReloadFile -win $_nWave1
wvDisplayGridCount -win $_nWave1 -off
wvGetSignalClose -win $_nWave1
wvReloadFile -win $_nWave1
wvSetCursor -win $_nWave1 79240.884984 -snap {("G2" 19)}
wvSetCursor -win $_nWave1 79350.368659 -snap {("G2" 19)}
wvSetCursor -win $_nWave1 79274.725393 -snap {("G2" 19)}
wvSetCursor -win $_nWave1 96677.100527 -snap {("G2" 19)}
wvSetCursor -win $_nWave1 96746.771957 -snap {("G2" 19)}
wvSetCursor -win $_nWave1 96605.438486 -snap {("G2" 20)}
wvSetCursor -win $_nWave1 96710.940936 -snap {("G2" 20)}
wvSetCursor -win $_nWave1 96667.147466 -snap {("G2" 19)}
wvSetCursor -win $_nWave1 96177.456849 -snap {("G2" 5)}
wvSelectSignal -win $_nWave1 {( "G2" 15 )} 
wvSelectSignal -win $_nWave1 {( "G2" 15 )} 
wvSetRadix -win $_nWave1 -format Bin
wvSelectSignal -win $_nWave1 {( "G2" 16 )} 
wvSelectSignal -win $_nWave1 {( "G2" 16 )} 
wvSetRadix -win $_nWave1 -format Bin
wvSelectSignal -win $_nWave1 {( "G2" 17 )} 
wvSelectSignal -win $_nWave1 {( "G2" 17 )} 
wvSetRadix -win $_nWave1 -format Bin
wvSelectSignal -win $_nWave1 {( "G2" 18 )} 
wvSelectSignal -win $_nWave1 {( "G2" 18 )} 
wvSetRadix -win $_nWave1 -format Bin
wvSetCursor -win $_nWave1 131348.439986 -snap {("G2" 5)}
wvSetCursor -win $_nWave1 130998.092227 -snap {("G2" 6)}
wvSetCursor -win $_nWave1 131085.679167 -snap {("G2" 6)}
wvDisplayGridCount -win $_nWave1 -off
wvGetSignalClose -win $_nWave1
wvReloadFile -win $_nWave1
