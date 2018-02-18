pkill polybar
while pgrep -u $UID -x polybar > /dev/null; do sleep 1; done
pkill compton
xrandr --output HDMI-1 --auto --right-of eDP-1
bspc monitor $(bspc query -M | awk NR==2) -d 1 2 3 4 5 6 7 8 9
bspc monitor $(bspc query -M | awk NR==1) -d 1 2 3 4 5 6 7 8 9
MONITOR=eDP-1 polybar thinkpad &
MONITOR=HDMI-1 polybar thinkpad &
compton -b
