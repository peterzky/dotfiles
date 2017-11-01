#!/bin/sh
win_class=$1
command=$2
xdotool search --onlyvisible --classname $win_class windowunmap \
    || xdotool search --classname $win_class windowmap \
    || urxvt -name $win_class -e $command
