#!/run/current-system/sw/bin/env bash
for win in $(wmctrl -l | awk '{print $1}'); do
    wmctrl -i -c $win
done
sudo systemctl $1
