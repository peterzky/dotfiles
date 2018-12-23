#!/usr/bin/env bash
declare -A dict

dict=(
    ["VirtualBox"]="VirtualBox"
    ["WireShark"]="sudo wireshark"
    ["Lxappearance"]="lxappearance"
    ["Qt5ct"]="qt5ct"
    ["Fcitx"]="fcitx-config-gtk3"
)

choices=$(printf "%s\n" "${!dict[@]}")

chosen=$(echo -e "$choices" | rofi -dmenu -i -p ENV)

if [[ -n "${dict[$chosen]}" ]]; then
    eval "${dict[$chosen]}"
else
    exit 0
fi
