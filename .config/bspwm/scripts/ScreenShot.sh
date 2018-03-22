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
    --info 'echo "1:save  2:delete"' \
    --no-screen-clip \
    --action1 "cp %F /home/peterzky/Sync/screenshot/%V.png;rm %F; notify-send 'screenshot saved!'" \
    --action2 "rm %F; notify-send 'screenshot deleted!'" /tmp/screenshot.png \
    || notify-send "not screenshot available"
