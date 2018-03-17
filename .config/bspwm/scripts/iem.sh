#!/run/current-system/sw/bin/env bash
state=`fcitx-remote`

if [ $state = "1" ]; then
    echo "%{F#4a69bd}EN%{F-}"
elif [ $state = "2" ]; then
    echo "%{F#fdcb6e}CH%{F-}"
elif [ $state = "0" ]; then
    echo "%{F#636e72}NA%{F-}"
fi
