#!/usr/bin/env bash
declare -A dict

dict=(
    ["Telegram"]="telegram-desktop"
    ["HexChat"]="hexchat"
    # ["IeaseMusic"]="ieaseMusic"
    ["Audacious"]="audacious"
    ["WeChat"]="chromium --app='https://wx.qq.com'"
    ["CMus"]="st -g 130x35-500+200 -e cmus"
    ["MusicBox"]="urxvtc -geometry 130x26-500+200 -e musicbox"
)

choices=$(printf "%s\n" "${!dict[@]}")

chosen=$(echo -e "$choices" | rofi -dmenu -i -p MSG)

if [[ -n "${dict[$chosen]}" ]]; then
    eval "${dict[$chosen]}"
else
    exit 0
fi
