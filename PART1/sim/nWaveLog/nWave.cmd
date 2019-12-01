wvSetPosition -win $_nWave1 {("G1" 0)}
wvOpenFile -win $_nWave1 \
           {/home/u105/u105061255/ICLAB/EE4292_HW2/EE4292_HW2/part2/sim/test_enigma.fsdb}
wvGetSignalOpen -win $_nWave1
wvGetSignalSetScope -win $_nWave1 "/enigma_part2_test"
wvGetSignalClose -win $_nWave1
wvCloseFile -win $_nWave1
wvDisplayGridCount -win $_nWave1 -off
wvTpfCloseForm -win $_nWave1
wvGetSignalClose -win $_nWave1
wvResizeWindow -win $_nWave1 7 31 1475 841
wvSetPosition -win $_nWave1 {("G1" 0)}
wvOpenFile -win $_nWave1 \
           {/home/u105/u105061255/ICLAB/HW5/PART1/sim/eCNN_micro_part1.fsdb}
wvGetSignalOpen -win $_nWave1
wvGetSignalSetScope -win $_nWave1 "/test_top"
wvGetSignalSetScope -win $_nWave1 "/test_top/sram_36x128b_a0"
wvGetSignalSetScope -win $_nWave1 "/test_top/sram_36x128b_a3"
wvSetPosition -win $_nWave1 {("G1" 6)}
wvSetPosition -win $_nWave1 {("G1" 6)}
wvAddSignal -win $_nWave1 -clear
wvAddSignal -win $_nWave1 -group {"G1" \
{/test_top/sram_36x128b_a3/clk} \
{/test_top/sram_36x128b_a3/mem\[0:36\]} \
{/test_top/sram_36x128b_a3/waddr\[5:0\]} \
{/test_top/sram_36x128b_a3/wdata\[127:0\]} \
{/test_top/sram_36x128b_a3/wsb} \
{/LOGIC_LOW} \
}
wvAddSignal -win $_nWave1 -group {"G2" \
}
wvSelectSignal -win $_nWave1 {( "G1" 1 2 3 4 5 6 )} 
wvSetPosition -win $_nWave1 {("G1" 6)}
wvSetPosition -win $_nWave1 {("G1" 6)}
wvSetPosition -win $_nWave1 {("G1" 6)}
wvAddSignal -win $_nWave1 -clear
wvAddSignal -win $_nWave1 -group {"G1" \
{/test_top/sram_36x128b_a3/clk} \
{/test_top/sram_36x128b_a3/mem\[0:36\]} \
{/test_top/sram_36x128b_a3/waddr\[5:0\]} \
{/test_top/sram_36x128b_a3/wdata\[127:0\]} \
{/test_top/sram_36x128b_a3/wsb} \
{/LOGIC_LOW} \
}
wvAddSignal -win $_nWave1 -group {"G2" \
}
wvSelectSignal -win $_nWave1 {( "G1" 1 2 3 4 5 6 )} 
wvSetPosition -win $_nWave1 {("G1" 6)}
wvGetSignalClose -win $_nWave1
wvGetSignalOpen -win $_nWave1
wvGetSignalSetScope -win $_nWave1 "/test_top"
wvGetSignalSetScope -win $_nWave1 "/test_top/sram_36x128b_a3"
wvDisplayGridCount -win $_nWave1 -off
wvGetSignalClose -win $_nWave1
wvReloadFile -win $_nWave1
wvGetSignalOpen -win $_nWave1
wvGetSignalSetScope -win $_nWave1 "/test_top/Conv_top"
wvSetPosition -win $_nWave1 {("G1" 19)}
wvSetPosition -win $_nWave1 {("G1" 19)}
wvAddSignal -win $_nWave1 -clear
wvAddSignal -win $_nWave1 -group {"G1" \
{/test_top/sram_36x128b_a3/clk} \
{/test_top/sram_36x128b_a3/mem\[0:36\]} \
{/test_top/sram_36x128b_a3/waddr\[5:0\]} \
{/test_top/sram_36x128b_a3/wdata\[127:0\]} \
{/test_top/sram_36x128b_a3/wsb} \
{/LOGIC_LOW} \
{/test_top/Conv_top/clk} \
{/test_top/Conv_top/enable} \
{/test_top/Conv_top/input_data\[7:0\]} \
{/test_top/Conv_top/offset\[3:0\]} \
{/test_top/Conv_top/read_cnt\[10:0\]} \
{/test_top/Conv_top/sram_bytemask_a\[15:0\]} \
{/test_top/Conv_top/sram_wen_a0} \
{/test_top/Conv_top/sram_wen_a1} \
{/test_top/Conv_top/sram_wen_a2} \
{/test_top/Conv_top/sram_wen_a3} \
{/test_top/Conv_top/valid} \
{/test_top/Conv_top/x_cnt\[4:0\]} \
{/test_top/Conv_top/y_cnt\[4:0\]} \
}
wvAddSignal -win $_nWave1 -group {"G2" \
}
wvSelectSignal -win $_nWave1 {( "G1" 7 8 9 10 11 12 13 14 15 16 17 18 19 )} 
wvSetPosition -win $_nWave1 {("G1" 19)}
wvSetPosition -win $_nWave1 {("G1" 19)}
wvSetPosition -win $_nWave1 {("G1" 19)}
wvAddSignal -win $_nWave1 -clear
wvAddSignal -win $_nWave1 -group {"G1" \
{/test_top/sram_36x128b_a3/clk} \
{/test_top/sram_36x128b_a3/mem\[0:36\]} \
{/test_top/sram_36x128b_a3/waddr\[5:0\]} \
{/test_top/sram_36x128b_a3/wdata\[127:0\]} \
{/test_top/sram_36x128b_a3/wsb} \
{/LOGIC_LOW} \
{/test_top/Conv_top/clk} \
{/test_top/Conv_top/enable} \
{/test_top/Conv_top/input_data\[7:0\]} \
{/test_top/Conv_top/offset\[3:0\]} \
{/test_top/Conv_top/read_cnt\[10:0\]} \
{/test_top/Conv_top/sram_bytemask_a\[15:0\]} \
{/test_top/Conv_top/sram_wen_a0} \
{/test_top/Conv_top/sram_wen_a1} \
{/test_top/Conv_top/sram_wen_a2} \
{/test_top/Conv_top/sram_wen_a3} \
{/test_top/Conv_top/valid} \
{/test_top/Conv_top/x_cnt\[4:0\]} \
{/test_top/Conv_top/y_cnt\[4:0\]} \
}
wvAddSignal -win $_nWave1 -group {"G2" \
}
wvSelectSignal -win $_nWave1 {( "G1" 7 8 9 10 11 12 13 14 15 16 17 18 19 )} 
wvSetPosition -win $_nWave1 {("G1" 19)}
wvGetSignalClose -win $_nWave1
wvSetCursor -win $_nWave1 321.840019 -snap {("G1" 9)}
wvSetCursor -win $_nWave1 187.116290 -snap {("G1" 8)}
wvZoomIn -win $_nWave1
wvZoomIn -win $_nWave1
wvZoomOut -win $_nWave1
wvZoomOut -win $_nWave1
wvZoomOut -win $_nWave1
wvZoomIn -win $_nWave1
wvZoomIn -win $_nWave1
wvZoomIn -win $_nWave1
wvZoomIn -win $_nWave1
wvZoomIn -win $_nWave1
wvZoomOut -win $_nWave1
wvSetCursor -win $_nWave1 294.708157 -snap {("G1" 8)}
wvSetCursor -win $_nWave1 299.386064 -snap {("G1" 10)}
wvSetCursor -win $_nWave1 249.800247 -snap {("G1" 10)}
wvSetCursor -win $_nWave1 241.380014 -snap {("G1" 10)}
wvSetCursor -win $_nWave1 195.536523 -snap {("G1" 8)}
wvSetCursor -win $_nWave1 157.177684 -snap {("G1" 13)}
wvSetCursor -win $_nWave1 249.800247 -snap {("G1" 13)}
wvSetCursor -win $_nWave1 143.143962 -snap {("G2" 0)}
wvSetCursor -win $_nWave1 166.533498 -snap {("G2" 0)}
wvSetCursor -win $_nWave1 201.150012 -snap {("G1" 8)}
wvDisplayGridCount -win $_nWave1 -off
wvGetSignalClose -win $_nWave1
wvReloadFile -win $_nWave1
wvSetCursor -win $_nWave1 254.478154 -snap {("G1" 11)}
wvDisplayGridCount -win $_nWave1 -off
wvGetSignalClose -win $_nWave1
wvReloadFile -win $_nWave1
wvSetCursor -win $_nWave1 351.778625 -snap {("G1" 11)}
wvSetCursor -win $_nWave1 308.741879 -snap {("G1" 10)}
wvSetCursor -win $_nWave1 22655.307297 -snap {("G1" 18)}
wvSetCursor -win $_nWave1 23303.571683 -snap {("G1" 9)}
wvSetCursor -win $_nWave1 304.999553 -snap {("G1" 9)}
wvSetCursor -win $_nWave1 7036.508086 -snap {("G1" 9)}
wvSearchNext -win $_nWave1
wvSearchNext -win $_nWave1
wvSearchNext -win $_nWave1
wvSearchNext -win $_nWave1
wvSearchNext -win $_nWave1
wvSearchNext -win $_nWave1
wvSearchNext -win $_nWave1
wvSearchNext -win $_nWave1
wvSearchNext -win $_nWave1
wvSearchNext -win $_nWave1
wvSelectSignal -win $_nWave1 {( "G1" 9 )} 
wvSetSearchMode -win $_nWave1 -anyChange
wvSetCursor -win $_nWave1 810.733914 -snap {("G1" 9)}
wvSearchNext -win $_nWave1
wvSelectSignal -win $_nWave1 {( "G1" 9 )} 
wvSetRadix -win $_nWave1 -format UDec
wvSearchNext -win $_nWave1
wvSearchPrev -win $_nWave1
wvGetSignalOpen -win $_nWave1
wvSetPosition -win $_nWave1 {("G1" 21)}
wvSetPosition -win $_nWave1 {("G1" 21)}
wvAddSignal -win $_nWave1 -clear
wvAddSignal -win $_nWave1 -group {"G1" \
{/test_top/sram_36x128b_a3/clk} \
{/test_top/sram_36x128b_a3/mem\[0:36\]} \
{/test_top/sram_36x128b_a3/waddr\[5:0\]} \
{/test_top/sram_36x128b_a3/wdata\[127:0\]} \
{/test_top/sram_36x128b_a3/wsb} \
{/LOGIC_LOW} \
{/test_top/Conv_top/clk} \
{/test_top/Conv_top/enable} \
{/test_top/Conv_top/input_data\[7:0\]} \
{/test_top/Conv_top/offset\[3:0\]} \
{/test_top/Conv_top/read_cnt\[10:0\]} \
{/test_top/Conv_top/sram_bytemask_a\[15:0\]} \
{/test_top/Conv_top/sram_wen_a0} \
{/test_top/Conv_top/sram_wen_a1} \
{/test_top/Conv_top/sram_wen_a2} \
{/test_top/Conv_top/sram_wen_a3} \
{/test_top/Conv_top/valid} \
{/test_top/Conv_top/x_cnt\[4:0\]} \
{/test_top/Conv_top/y_cnt\[4:0\]} \
{/test_top/Conv_top/x_r8\[2:0\]} \
{/test_top/Conv_top/y_r8\[2:0\]} \
}
wvAddSignal -win $_nWave1 -group {"G2" \
}
wvSelectSignal -win $_nWave1 {( "G1" 20 21 )} 
wvSetPosition -win $_nWave1 {("G1" 21)}
wvSetPosition -win $_nWave1 {("G1" 21)}
wvSetPosition -win $_nWave1 {("G1" 21)}
wvAddSignal -win $_nWave1 -clear
wvAddSignal -win $_nWave1 -group {"G1" \
{/test_top/sram_36x128b_a3/clk} \
{/test_top/sram_36x128b_a3/mem\[0:36\]} \
{/test_top/sram_36x128b_a3/waddr\[5:0\]} \
{/test_top/sram_36x128b_a3/wdata\[127:0\]} \
{/test_top/sram_36x128b_a3/wsb} \
{/LOGIC_LOW} \
{/test_top/Conv_top/clk} \
{/test_top/Conv_top/enable} \
{/test_top/Conv_top/input_data\[7:0\]} \
{/test_top/Conv_top/offset\[3:0\]} \
{/test_top/Conv_top/read_cnt\[10:0\]} \
{/test_top/Conv_top/sram_bytemask_a\[15:0\]} \
{/test_top/Conv_top/sram_wen_a0} \
{/test_top/Conv_top/sram_wen_a1} \
{/test_top/Conv_top/sram_wen_a2} \
{/test_top/Conv_top/sram_wen_a3} \
{/test_top/Conv_top/valid} \
{/test_top/Conv_top/x_cnt\[4:0\]} \
{/test_top/Conv_top/y_cnt\[4:0\]} \
{/test_top/Conv_top/x_r8\[2:0\]} \
{/test_top/Conv_top/y_r8\[2:0\]} \
}
wvAddSignal -win $_nWave1 -group {"G2" \
}
wvSelectSignal -win $_nWave1 {( "G1" 20 21 )} 
wvSetPosition -win $_nWave1 {("G1" 21)}
wvGetSignalClose -win $_nWave1
wvGetSignalOpen -win $_nWave1
wvGetSignalSetScope -win $_nWave1 "/test_top"
wvGetSignalSetScope -win $_nWave1 "/test_top/sram_36x128b_a3"
wvGetSignalSetScope -win $_nWave1 "/test_top/Conv_top"
wvSetPosition -win $_nWave1 {("G1" 22)}
wvSetPosition -win $_nWave1 {("G1" 22)}
wvAddSignal -win $_nWave1 -clear
wvAddSignal -win $_nWave1 -group {"G1" \
{/test_top/sram_36x128b_a3/clk} \
{/test_top/sram_36x128b_a3/mem\[0:36\]} \
{/test_top/sram_36x128b_a3/waddr\[5:0\]} \
{/test_top/sram_36x128b_a3/wdata\[127:0\]} \
{/test_top/sram_36x128b_a3/wsb} \
{/LOGIC_LOW} \
{/test_top/Conv_top/clk} \
{/test_top/Conv_top/enable} \
{/test_top/Conv_top/input_data\[7:0\]} \
{/test_top/Conv_top/offset\[3:0\]} \
{/test_top/Conv_top/read_cnt\[10:0\]} \
{/test_top/Conv_top/sram_bytemask_a\[15:0\]} \
{/test_top/Conv_top/sram_wen_a0} \
{/test_top/Conv_top/sram_wen_a1} \
{/test_top/Conv_top/sram_wen_a2} \
{/test_top/Conv_top/sram_wen_a3} \
{/test_top/Conv_top/valid} \
{/test_top/Conv_top/x_cnt\[4:0\]} \
{/test_top/Conv_top/y_cnt\[4:0\]} \
{/test_top/Conv_top/x_r8\[2:0\]} \
{/test_top/Conv_top/y_r8\[2:0\]} \
{/test_top/Conv_top/bank_num\[1:0\]} \
}
wvAddSignal -win $_nWave1 -group {"G2" \
}
wvSelectSignal -win $_nWave1 {( "G1" 22 )} 
wvSetPosition -win $_nWave1 {("G1" 22)}
wvSetPosition -win $_nWave1 {("G1" 22)}
wvSetPosition -win $_nWave1 {("G1" 22)}
wvAddSignal -win $_nWave1 -clear
wvAddSignal -win $_nWave1 -group {"G1" \
{/test_top/sram_36x128b_a3/clk} \
{/test_top/sram_36x128b_a3/mem\[0:36\]} \
{/test_top/sram_36x128b_a3/waddr\[5:0\]} \
{/test_top/sram_36x128b_a3/wdata\[127:0\]} \
{/test_top/sram_36x128b_a3/wsb} \
{/LOGIC_LOW} \
{/test_top/Conv_top/clk} \
{/test_top/Conv_top/enable} \
{/test_top/Conv_top/input_data\[7:0\]} \
{/test_top/Conv_top/offset\[3:0\]} \
{/test_top/Conv_top/read_cnt\[10:0\]} \
{/test_top/Conv_top/sram_bytemask_a\[15:0\]} \
{/test_top/Conv_top/sram_wen_a0} \
{/test_top/Conv_top/sram_wen_a1} \
{/test_top/Conv_top/sram_wen_a2} \
{/test_top/Conv_top/sram_wen_a3} \
{/test_top/Conv_top/valid} \
{/test_top/Conv_top/x_cnt\[4:0\]} \
{/test_top/Conv_top/y_cnt\[4:0\]} \
{/test_top/Conv_top/x_r8\[2:0\]} \
{/test_top/Conv_top/y_r8\[2:0\]} \
{/test_top/Conv_top/bank_num\[1:0\]} \
}
wvAddSignal -win $_nWave1 -group {"G2" \
}
wvSelectSignal -win $_nWave1 {( "G1" 22 )} 
wvSetPosition -win $_nWave1 {("G1" 22)}
wvGetSignalClose -win $_nWave1
wvSelectSignal -win $_nWave1 {( "G1" 22 )} 
wvSetRadix -win $_nWave1 -format UDec
wvSetCursor -win $_nWave1 20446.016950 -snap {("G1" 22)}
wvSetCursor -win $_nWave1 20502.151837 -snap {("G1" 9)}
wvSelectSignal -win $_nWave1 {( "G1" 12 )} 
wvSelectSignal -win $_nWave1 {( "G1" 12 )} 
wvSetRadix -win $_nWave1 -format Bin
wvZoomOut -win $_nWave1
wvZoomOut -win $_nWave1
wvZoomIn -win $_nWave1
wvZoomIn -win $_nWave1
wvZoomIn -win $_nWave1
wvZoomIn -win $_nWave1
wvSetCursor -win $_nWave1 20549.468869 -snap {("G1" 20)}
wvZoomOut -win $_nWave1
wvZoomOut -win $_nWave1
wvZoomOut -win $_nWave1
wvSetCursor -win $_nWave1 20509.706658 -snap {("G1" 9)}
wvSetCursor -win $_nWave1 20582.682011 -snap {("G1" 9)}
wvSetCursor -win $_nWave1 20485.381540 -snap {("G1" 21)}
wvSetCursor -win $_nWave1 20474.154562 -snap {("G1" 20)}
wvSetCursor -win $_nWave1 20511.577820 -snap {("G1" 9)}
wvSetCursor -win $_nWave1 20558.356893 -snap {("G1" 9)}
wvSetCursor -win $_nWave1 20543.387590 -snap {("G1" 9)}
wvSetCursor -win $_nWave1 20550.872241 -snap {("G1" 20)}
wvSetCursor -win $_nWave1 20496.608517 -snap {("G1" 20)}
wvSetCursor -win $_nWave1 20490.995029 -snap {("G1" 19)}
wvSetCursor -win $_nWave1 20543.387590 -snap {("G1" 20)}
wvSetCursor -win $_nWave1 20466.669911 -snap {("G1" 20)}
wvSetCursor -win $_nWave1 20547.129916 -snap {("G1" 20)}
wvSetCursor -win $_nWave1 20504.093169 -snap {("G1" 12)}
wvSetCursor -win $_nWave1 20470.412237 -snap {("G1" 12)}
wvSetCursor -win $_nWave1 20528.418287 -snap {("G1" 12)}
wvSetCursor -win $_nWave1 20509.706658 -snap {("G1" 12)}
wvSetCursor -win $_nWave1 20498.479680 -snap {("G1" 12)}
wvSetCursor -win $_nWave1 20515.320146 -snap {("G1" 9)}
wvZoomOut -win $_nWave1
wvZoomIn -win $_nWave1
wvZoomIn -win $_nWave1
wvZoomIn -win $_nWave1
wvSetCursor -win $_nWave1 20507.835495 -snap {("G1" 12)}
wvSetCursor -win $_nWave1 20511.110030 -snap {("G1" 12)}
wvSetCursor -win $_nWave1 20503.625378 -snap {("G1" 12)}
wvSetCursor -win $_nWave1 20499.883052 -snap {("G1" 9)}
wvGetSignalOpen -win $_nWave1
wvGetSignalSetScope -win $_nWave1 "/test_top"
wvGetSignalSetScope -win $_nWave1 "/test_top/Conv_top"
wvGetSignalSetScope -win $_nWave1 "/test_top/sram_36x128b_a3"
wvGetSignalSetScope -win $_nWave1 "/test_top/Conv_top"
wvGetSignalOpen -win $_nWave1
wvGetSignalSetScope -win $_nWave1 "/test_top"
wvGetSignalSetScope -win $_nWave1 "/test_top/Conv_top"
wvGetSignalSetScope -win $_nWave1 "/test_top/sram_36x128b_a3"
wvGetSignalSetScope -win $_nWave1 "/test_top/Conv_top"
wvSetPosition -win $_nWave1 {("G1" 23)}
wvSetPosition -win $_nWave1 {("G1" 23)}
wvAddSignal -win $_nWave1 -clear
wvAddSignal -win $_nWave1 -group {"G1" \
{/test_top/sram_36x128b_a3/clk} \
{/test_top/sram_36x128b_a3/mem\[0:36\]} \
{/test_top/sram_36x128b_a3/waddr\[5:0\]} \
{/test_top/sram_36x128b_a3/wdata\[127:0\]} \
{/test_top/sram_36x128b_a3/wsb} \
{/LOGIC_LOW} \
{/test_top/Conv_top/clk} \
{/test_top/Conv_top/enable} \
{/test_top/Conv_top/input_data\[7:0\]} \
{/test_top/Conv_top/offset\[3:0\]} \
{/test_top/Conv_top/read_cnt\[10:0\]} \
{/test_top/Conv_top/sram_bytemask_a\[15:0\]} \
{/test_top/Conv_top/sram_wen_a0} \
{/test_top/Conv_top/sram_wen_a1} \
{/test_top/Conv_top/sram_wen_a2} \
{/test_top/Conv_top/sram_wen_a3} \
{/test_top/Conv_top/valid} \
{/test_top/Conv_top/x_cnt\[4:0\]} \
{/test_top/Conv_top/y_cnt\[4:0\]} \
{/test_top/Conv_top/x_r8\[2:0\]} \
{/test_top/Conv_top/y_r8\[2:0\]} \
{/test_top/Conv_top/bank_num\[1:0\]} \
{/test_top/Conv_top/offset\[3:0\]} \
}
wvAddSignal -win $_nWave1 -group {"G2" \
}
wvSelectSignal -win $_nWave1 {( "G1" 23 )} 
wvSetPosition -win $_nWave1 {("G1" 23)}
wvSelectSignal -win $_nWave1 {( "G1" 23 )} 
wvSetRadix -win $_nWave1 -format UDec
wvSetCursor -win $_nWave1 20549.001078 -snap {("G1" 12)}
wvSetCursor -win $_nWave1 20515.787937 -snap {("G1" 12)}
wvSetCursor -win $_nWave1 20499.415262 -snap {("G1" 9)}
wvSetCursor -win $_nWave1 20546.662125 -snap {("G1" 12)}
wvDisplayGridCount -win $_nWave1 -off
wvGetSignalClose -win $_nWave1
wvReloadFile -win $_nWave1
wvSetCursor -win $_nWave1 20451.700608 -snap {("G1" 23)}
wvGetSignalOpen -win $_nWave1
wvGetSignalSetScope -win $_nWave1 "/test_top/sram_36x128b_a0"
wvExit
