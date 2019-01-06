#!/usr/bin/env bash

function map_output() {
    for id in `xsetwacom list | sed 's/.*id: \([0-9]*\)\b.*/\1/'`
    do
        xsetwacom set $id MapToOutput $1
    done
}

if [ -z "$(xsetwacom list)" ]; then
    notify-send "no wacom devices connected!"
    exit 0
else
    ratio=`xrandr | grep -w connected | sed 's/.*\(1920x1080.*\)(.*/\1/' | sort | rofi -dmenu -p wacom`
    map_output $ratio
fi
