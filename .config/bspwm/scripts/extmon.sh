extern=HDMI-1

if xrandr | grep "$extern connected"; then
    # xrandr --output $extern --off
    pkill compton
    pkill polybar
    while pgrep -u $UID -x polybar > /dev/null; do sleep 1; done
    xrandr --output $extern --auto --right-of eDP-1
    bspc monitor $(bspc query -M | awk NR==2) -d 1 2 3 4 5 6 7 8 9
    bspc monitor $(bspc query -M | awk NR==1) -d 1 2 3 4 5 6 7 8 9
    MONITOR=eDP-1 polybar thinkpad &
    MONITOR=$extern polybar thinkpad &
    compton -b
else
    notify-send "No External Monitor Connected."
fi
