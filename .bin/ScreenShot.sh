#!/run/current-system/sw/bin/env bash

maim -s | xclip -selection clipboard -t image/png
sleep 0.1
xclip -selection clipboard -t image/png -o > /tmp/screenshot.png
sleep 0.2

X=`file /tmp/screenshot.png | cut -d ',' -f2 | cut -d ' ' -f2`
Y=`file /tmp/screenshot.png | cut -d ',' -f2 | cut -d ' ' -f4`
Xp=500
Ypp=`echo $Y/$X*500 | bc -l | cut -d '.' -f1`
Yp=`echo $Ypp+1 | bc`

feh -g 500x$Yp+1350+50 \
    --info 'echo "1:save  2:delete  3:search"' \
    --scale-down \
    --auto-zoom \
    --no-screen-clip \
    --action1 "cp %F /home/peterzky/Sync/sync/screenshot/%V.png;rm %F; notify-send 'screenshot saved!'" \
    --action2 "rm %F; notify-send 'screenshot deleted!'" \
    --action3 "$HOME/.bin/imgsearch.py %F;rm %F; notify-send 'search image...'" \
    /tmp/screenshot.png \
    || notify-send "not screenshot available"
