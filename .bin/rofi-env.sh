#!/usr/bin/env bash
choices="VirtualBox\nWireShark\nLxappearance\nQt5ct\nFcitx"

chosen=$(echo -e "$choices" | rofi -dmenu -i -p MSG)

case "$chosen" in
    VirtualBox) VirtualBox;;
    WireShark) sudo wireshark;;
    Lxappearance) lxappearance;;
    Qt5ct) qt5ct;;
    Fcitx) fcitx-config-gtk3;;
esac
