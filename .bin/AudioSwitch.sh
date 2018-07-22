if [ -z "$1" ]; then
    echo "Usage: $0 <sinkId/sinkName>" >&2
    echo "Valid sinks:" >&2
    pactl list short sinks >&2
    exit 1
fi

declare -A sink_names=(
    [headphone]=alsa_output.usb-Creative_Technology_Ltd_SB_X-Fi_Surround_5.1_Pro_000003XO-00.analog-stereo
    [speaker]=alsa_output.usb-Harman_Multimedia_JBL_Pebbles_1.0.0-00.analog-stereo
)

newSink=${sink_names[$1]:-$1}

pactl set-default-sink $newSink

notify-send "Auido switch to $1"

pactl list short sink-inputs|while read stream; do
    streamId=$(echo $stream|cut '-d ' -f1)
    echo "moving stream $streamId"
    pactl move-sink-input "$streamId" "$newSink"
done
