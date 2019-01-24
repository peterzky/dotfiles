#!/usr/bin/env bash
declare -A dict

dict=(
    ["steam"]="steam"
    ["swd3"]="$HOME/.bin/wine/swd3.sh"
)

choices=$(printf "%s\n" "${!dict[@]}")

chosen=$(echo -e "$choices" | rofi -dmenu -i -p GAME)

if [[ -n "${dict[$chosen]}" ]]; then
    eval "${dict[$chosen]}"
else
    exit 0
fi
