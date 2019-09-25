#!/bin/bash

vega_bqb_vtrc_config -device 0 ./config/1to1_1080p_8ch.conf

ffmpeg -c:v libvegabqbtrc_dec -vegabqbtrcdec-params device=0:channel=0:output-number=1 -i ~/Videos/bbb_sunflower_1080p_30fps_normal.mp4 -c:v libvegabqbtrc_h264 -vegabqbtrcenc-params device=0:channel=0:cpb-delay=3:profile=high:level-idc=41:input-res=1920x1080:fps=30:input-csp=i420:input-depth=8:rate-ctrl=vbr:bframes=1:keyint=248:crop-rect=0,0,0,8:sar=1,1:bitrate=4500:vbr=4500,3750,3000 -f mpegts -y output/bbb.ts
