#!/usr/bin/env bash

declare -A sink_names=(
    [headphone]=alsa_output.usb-Creative_Technology_Ltd_SB_X-Fi_Surround_5.1_Pro_000003XO-00.analog-stereo
    [speaker]=alsa_output.usb-Harman_Multimedia_JBL_Pebbles_1.0.0-00.analog-stereo
    [bluetooth]=bluez_sink.04_88_E2_7B_20_2A.a2dp_sink
)

# shift audio stream to new output
function shift_stream () {
    pactl set-default-sink "$1"
    pactl list short sink-inputs|while read stream; do
        streamId=$(echo $stream|cut '-d ' -f1)
        echo "moving stream $streamId"
        pactl move-sink-input "$streamId" "$1"
    done
}

if [ -z "$1" ]; then
    choices=$(pactl list short sinks | awk '{print $2}')
    chosen=$(echo -e "$choices" | rofi -dmenu -i -p Audio)

    if [ -z "$chosen" ]; then
        exit 0
    else
        shift_stream "$chosen"
        notify-send "Auido switch to $chosen"
    fi
else
    newSink=${sink_names[$1]:-$1}
    shift_stream $newSink
    notify-send "Auido switch to $1"
fi
