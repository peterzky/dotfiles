#!/usr/bin/env bash
choices="Telegram\nHexChat\nVirtualBox\nMusicbox"

chosen=$(echo -e "$choices" | rofi -dmenu -i -p MSG)

case "$chosen" in
    Telegram) telegram-desktop;;
    HexChat) hexchat;;
    VirtualBox) VirtualBox;;
    Musicbox) appimage-run ~/Sync/sync/appimg/ieaseMusic.AppImage ;;
esac
