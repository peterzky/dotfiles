#!/usr/bin/env bash
choices="Telegram\nHexChat\nMusicbox\nWeChat\nCmus"

chosen=$(echo -e "$choices" | rofi -dmenu -i -p MSG)

case "$chosen" in
    Telegram) telegram-desktop;;
    HexChat) hexchat;;
    Musicbox) ieaseMusic;;
    WeChat) wewechat ;;
    Cmus) urxvtc -geometry 130x26-500+200 -e cmus;;
esac
