#!/run/current-system/sw/bin/env sh

padding=20

xdotool search --onlyvisible --classname Polybar
if [ $? == 0 ]; then
    polybar-msg cmd hide && sleep 0 && bspc config top_padding 0 && notify-send "Status Bar Hided"
    bspc rule -a URxvt:dropdown state=floating follow=on rectangle=1920x530+0+0 border=off
    bspc config borderless_monocle true
else
    polybar-msg cmd show && sleep 0 && bspc config top_padding $padding && notify-send "Status Bar Shown"
    bspc rule -a URxvt:dropdown state=floating follow=on rectangle=1920x530+0+20 border=off
    bspc config borderless_monocle false
fi
