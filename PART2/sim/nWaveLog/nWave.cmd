wvSetPosition -win $_nWave1 {("G1" 0)}
wvOpenFile -win $_nWave1 \
           {/home/u105/u105061255/ICLAB/HW5/PART2/sim/eCNN_micro.fsdb}
wvGetSignalOpen -win $_nWave1
wvGetSignalSetScope -win $_nWave1 "/test_top"
wvGetSignalSetScope -win $_nWave1 "/test_top/Conv_top"
wvSetPosition -win $_nWave1 {("G1" 4)}
wvSetPosition -win $_nWave1 {("G1" 4)}
wvAddSignal -win $_nWave1 -clear
wvAddSignal -win $_nWave1 -group {"G1" \
{/test_top/Conv_top/clk} \
{/test_top/Conv_top/cnn_state\[4:0\]} \
{/test_top/Conv_top/state\[5:0\]} \
{/test_top/Conv_top/weights\[0:3\]} \
}
wvAddSignal -win $_nWave1 -group {"G2" \
}
wvSelectSignal -win $_nWave1 {( "G1" 1 2 3 4 )} 
wvSetPosition -win $_nWave1 {("G1" 4)}
wvSetPosition -win $_nWave1 {("G1" 4)}
wvSetPosition -win $_nWave1 {("G1" 4)}
wvAddSignal -win $_nWave1 -clear
wvAddSignal -win $_nWave1 -group {"G1" \
{/test_top/Conv_top/clk} \
{/test_top/Conv_top/cnn_state\[4:0\]} \
{/test_top/Conv_top/state\[5:0\]} \
{/test_top/Conv_top/weights\[0:3\]} \
}
wvAddSignal -win $_nWave1 -group {"G2" \
}
wvSelectSignal -win $_nWave1 {( "G1" 1 2 3 4 )} 
wvSetPosition -win $_nWave1 {("G1" 4)}
wvGetSignalClose -win $_nWave1
wvSetCursor -win $_nWave1 96161.600571 -snap {("G1" 2)}
