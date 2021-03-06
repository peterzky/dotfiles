#!/usr/bin/env bash
declare -A dict

dict=(
    ["Cheat"]="$HOME/.bin/rofi-cheat.sh"
    ["Okular"]="okular"
    ["MindMap"]="XMind"
    ["Zeal"]="zeal"
    ["Calibre"]="calibre"
    ["Xournal"]="xournal"
)

choices=$(printf "%s\n" "${!dict[@]}")

chosen=$(echo -e "$choices" | rofi -dmenu -i -p DOC)

if [[ -n "${dict[$chosen]}" ]]; then
    eval "${dict[$chosen]}"
else
    exit 0
fi
