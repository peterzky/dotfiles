#!/usr/bin/env bash
choices="PDF\nMindMap\nDocViewer\nCalibre"

chosen=$(echo -e "$choices" | rofi -dmenu -i -p DOC)

case "$chosen" in
    PDF) zathura;;
    MindMap) XMind;;
    DocViewer) zeal;;
    Calibre) calibre;;
esac
