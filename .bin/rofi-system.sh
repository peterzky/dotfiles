#!/usr/bin/env bash

declare -A dict

dict=(
    ["Shutdown"]="$HOME/.bin/shutdown.sh poweroff"
    ["Reboot"]="$HOME/.bin/shutdown.sh reboot"
    ["Reload"]="pkill xmobar; xmonad --recompile; xmonad --restart"
    ["Hibernate"]="sudo systemctl hibernate"
)

choices=$(printf "%s\n" "${!dict[@]}")

chosen=$(echo -e "$choices" | rofi -dmenu -i -p SYS)

if [[ -n "${dict[$chosen]}" ]]; then
    eval "${dict[$chosen]}"
else
    exit 0
fi
