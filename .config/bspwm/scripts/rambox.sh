#!/bin/sh
win_class="rambox"
command="rambox"
xdotool search --onlyvisible --classname $win_class windowunmap \
    || xdotool search --classname $win_class windowmap \
    || $command
