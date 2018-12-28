#!/run/current-system/sw/bin/env bash

image=/tmp/screenshot.png

maim -s | xclip -selection clipboard -t image/png
sleep 0.1
xclip -selection clipboard -t image/png -o > $image
sleep 0.2

X=`identify $image | awk '{print $3}' | cut -dx -f1`
Y=`identify $image | awk '{print $3}' | cut -dx -f2`

Yp=500
Xp=`echo $X/$Y*$Yp | bc -l | cut -d '.' -f1`

echo $Xp $Yp
# Xp=500
# Ypp=`echo $Y/$X*500 | bc -l | cut -d '.' -f1`
# Yp=`echo $Ypp+1 | bc`

feh -g ${Xp}x${Yp} \
    --info 'echo "1:save  2:delete  3:search"' \
    --scale-down \
    --auto-zoom \
    --no-screen-clip \
    --action1 "cp %F /home/peterzky/Sync/sync/screenshot/%V.png;rm %F; notify-send 'screenshot saved!'" \
    --action2 "rm %F; notify-send 'screenshot deleted!'" \
    --action3 "$HOME/.bin/imgsearch.py %F;rm %F; notify-send 'search image...'" \
    /tmp/screenshot.png \
    || notify-send "not screenshot available"
